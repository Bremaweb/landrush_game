ARROW_DAMAGE = 3
ARROW_VELOCITY = 2
minetest.register_node("turrets:turret", {
	description = "Laser Turret",
	tiles = {"turrets_turret.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1},
	drop = 'turrets:turret',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "turrets:turret",
	recipe = {
				{"default:steel_ingot","technic:laser_mk1","default:steel_ingot"},
				{"default:steel_ingot","technic:motor","default:steel_ingot"},
				{"default:steel_ingot","default:copper_ingot","default:steel_ingot"}
	}
})

minetest.register_abm({
	nodenames = {"turrets:turret"},
	interval = 2,
	chance = 1,
	action = function(pos, node)	
	local turret_owner = landrush.get_owner(pos)
	local objects = minetest.get_objects_inside_radius(pos,8)
		for _,obj in ipairs(objects) do
			if obj:is_player() then
				local name = obj:get_player_name()
				local obj_p = obj:getpos()		
				local claim_owner = landrush.get_owner(obj_p)
				if ( claim_owner == turret_owner ) then
					if ( landrush.can_interact(obj_p,name) ~= true ) then
						local los, blocking_pos = minetest.line_of_sight({x=obj_p.x,y=(obj_p.y+1),z=obj_p.z}, pos, 1)
						if ( blocking_pos.x == pos.x and blocking_pos.y == pos.y and blocking_pos.z == pos.z ) then
							local calc = {x=obj_p.x - pos.x,y=obj_p.y+1 - pos.y,z=obj_p.z - pos.z}	
							local bullet=minetest.add_entity({x=pos.x,y=pos.y,z=pos.z}, "turrets:arrow_entity")
							bullet:setvelocity({x=calc.x * ARROW_VELOCITY,y=calc.y * ARROW_VELOCITY,z=calc.z * ARROW_VELOCITY})
							music_handle=minetest.sound_play("turrets_laser",
							{pos = pos, gain = 0.6, max_hear_distance = 14,})
						end 
					end
				end
			end
		end
	end
})

-- The Arrow Entity

THROWING_ARROW_ENTITY={
	physical = false,
	timer=0,
	visual_size = {x=0.5, y=0.5},
	textures = {"turrets_bullet.png"},
	lastpos={},
	collisionbox = {-0.17,-0.17,-0.17,0.17,0.17,0.17},
}
-- Arrow_entity.on_step()--> called when arrow is moving
THROWING_ARROW_ENTITY.on_step = function(self, dtime)
	self.timer=self.timer+dtime
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)
	if self.timer > 2 then
		self.object:remove()
	end
	-- When arrow is away from player (after 0.2 seconds): Cause damage to mobs and players
	if self.timer>0.2 then
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1.5)
		for k, obj in pairs(objs) do
			if obj:is_player() then
				obj:set_hp(obj:get_hp()-ARROW_DAMAGE)				
				self.object:remove()
			end
		end
	end

	--Become item when hitting a node
	if self.lastpos.x~=nil then --If there is no lastpos for some reason
		if node.name ~= "air" and node.name ~= "turrets:turret" then
			minetest.add_item(self.lastpos, 'throwing:arrow')
			self.object:remove()
		end
	end
		
	self.lastpos={x=pos.x, y=pos.y, z=pos.z} -- Set lastpos-->Item will be added at last pos outside the node
end

minetest.register_entity("turrets:arrow_entity", THROWING_ARROW_ENTITY)