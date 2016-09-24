local tape_measures = {}

minetest.register_tool("tape_measure:measure", {
	description = "Tape measure tool",
	groups = {},
	inventory_image = "tape_measure.png",
	wield_image = "",
	wield_scale = {x=1,y=1,z=1},
	stack_max = 1,
	liquids_pointable = true, -- it is ok to mark water
	node_placement_prediction = nil,

-- RIGHTCLICK
	on_place = function(itemstack, placer, pointed_thing)
		if (placer == nil or pointed_thing == nil) then
			return itemstack  -- nothing consumed
		end

		local name = placer:get_player_name()
		local keys=placer:get_player_control()

		-- WITH SHIFT PRESSED - set POS2
		if (keys["sneak"]) then
			if (pointed_thing.type ~= "node") then
				minetest.chat_send_player(name, "You need to punch node to set pos 2.")
				return nil
			else
				local pos  = minetest.get_pointed_thing_position(pointed_thing, under)
				local node = minetest.get_node_or_nil(pos)
				if tape_measures[name] == nil then
					tape_measures[name] = {}
				end
				tape_measures[name].pos2 = pos
				tape_measures[name].name2 = node.name
				tape_measures[name].request_reset = false
				minetest.chat_send_player(name, "Pos 2 set to: "..minetest.pos_to_string(pos)..": "..node.name)
			end
			return itemstack
		end

		-- WITHOUT SHIFT - on double click reset measure
		if tape_measures[name] ~= nil and tape_measures[name].request_reset == false then
			tape_measures[name].request_reset = true
		elseif  tape_measures[name] ~= nil and tape_measures[name].request_reset == true then
			tape_measures[name].request_reset = false
			tape_measures[name] = nil
			minetest.chat_send_player(name, "Tape measure resetted.")
		end
		return itemstack
	end,

-- LEFTCLICK
	on_use = function(itemstack, user, pointed_thing)
		if (user == nil) then
			return
		end
		local name = user:get_player_name()
		local keys=user:get_player_control()
		local playerpos = user:getpos()

		-- WITH SHIFT PRESSED - set POS 1
		if (keys["sneak"]) then
			if (pointed_thing.type ~= "node") then
				minetest.chat_send_player(name, "You need to punch node to set pos 1.")
				return nil
			else
				local pos  = minetest.get_pointed_thing_position(pointed_thing, under)
				local node = minetest.get_node_or_nil(pos)
				if tape_measures[name] == nil then
					tape_measures[name] = {}
				end
				tape_measures[name].pos1 = pos
				tape_measures[name].name1 = node.name
				tape_measures[name].request_reset = false
				minetest.chat_send_player(name, "Pos 1 set to: "..minetest.pos_to_string(pos)..": "..node.name)
			end
			return itemstack
		end

		-- WITHOUT SHIFT - display values
		if tape_measures[name] == nil then
			minetest.chat_send_player(name, "You need to set at least one postition.")
			return itemstack
		elseif tape_measures[name].name1 == nil or tape_measures[name].name2 == nil then
			if tape_measures[name].name1 == nil then
-- 				minetest.chat_send_player(name, "Pos 1 not set.")
			else
				local distance = tonumber(vector.distance(tape_measures[name].pos1, playerpos))
				minetest.chat_send_player(name, "Pos 1: "..minetest.pos_to_string(tape_measures[name].pos1)..": "..tape_measures[name].name1)
				minetest.chat_send_player(name, "Distance between you and pos 1: "..string.format("%.1f",distance).." nodes.")
			end
			if tape_measures[name].name2 == nil then
-- 				minetest.chat_send_player(name, "Pos 2 not set.")
			else
				local distance = tonumber(vector.distance(tape_measures[name].pos2, playerpos))
				minetest.chat_send_player(name, "Pos 2: "..minetest.pos_to_string(tape_measures[name].pos2)..": "..tape_measures[name].name2)
				minetest.chat_send_player(name, "Distance between you and pos 2: "..string.format("%.1f",distance).." nodes.")
			end
			return itemstack
		else
			local distance = tonumber(vector.distance(tape_measures[name].pos1, tape_measures[name].pos2))
			local distance1 = tonumber(vector.distance(tape_measures[name].pos1, playerpos))
			local distance2 = tonumber(vector.distance(tape_measures[name].pos2, playerpos))
			minetest.chat_send_player(name, "Pos 1: "..minetest.pos_to_string(tape_measures[name].pos1)..": "..tape_measures[name].name1.."\nPos 2: "..minetest.pos_to_string(tape_measures[name].pos2)..": "..tape_measures[name].name2.."\nDistance between pos 1 and pos2: "..string.format("%.1f", distance).." nodes.\nDistance between you and pos 1: "..string.format("%.1f",distance1).." nodes.\nDistance between you and pos 2: "..string.format("%.1f",distance2).." nodes.")
		end
		tape_measures[name].request_reset = false
		return itemstack
	end,
})

minetest.register_craft({
	output = "tape_measure:measure",
	recipe = {
		{"default:mese_crystal_fragment", "default:coal_lump", "default:mese_crystal_fragment"},
	}
})