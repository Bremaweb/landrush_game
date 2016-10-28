local old_nodes = {"trail:dirt_with_grass_walked",
					"trail:dirt_walked",
					"trail:sand_walked",
					"trail:desert_sand_walked",
					"trail:snow_walked",
					"trail:snow_block_walked",
					"trail:water_source_swam",
					"fire:basic_flame", }
local old_entities = {}

for _,node_name in ipairs(old_nodes) do
	minetest.register_node(":"..node_name, {
		groups = {old=1,not_in_creative_inventory=1},
	})
end

minetest.register_abm({
	nodenames = {"group:old"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.remove_node(pos)
	end,
})

for _,entity_name in ipairs(old_entities) do
	minetest.register_entity(":"..entity_name, {
		on_activate = function(self, staticdata)
				self.object:remove()
		end,
	})
end
