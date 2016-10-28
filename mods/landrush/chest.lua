-- add a special chest that is shared among the land-possesors

local function get_chest_formspec(pos)
local spos = pos.x .. "," .. pos.y .. "," .. pos.z
	local formspec =
		"size[8,9]" ..
		default.gui_bg ..
		default.gui_bg_img ..
		default.gui_slots ..
		"list[nodemeta:" .. spos .. ";main;0,0.3;8,4;]" ..
		"list[current_player;main;0,4.85;8,1;]" ..
		"list[current_player;main;0,6.08;8,3;8]" ..
		"listring[nodemeta:" .. spos .. ";main]" ..
		"listring[current_player;main]" ..
		default.get_hotbar_bg(0,4.85)
 return formspec
end

minetest.register_node("landrush:shared_chest", {
		description = "Land Rush Shared Chest",
		tiles = {"landrush_shared_chest_top.png", "landrush_shared_chest_top.png", "landrush_shared_chest_side.png", "landrush_shared_chest_side.png", "landrush_shared_chest_side.png", "landrush_shared_chest_front.png"},
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,tubedevice=1,tubedevice_receiver=1},
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		
		can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			return inv:is_empty("main")
		end,
		
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", "Shared Chest")
			local inv = meta:get_inventory()
			inv:set_size("main", 8*4)
		end,
		
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			if landrush.can_interact(pos, clicker:get_player_name()) then
				minetest.show_formspec(
					clicker:get_player_name(),
					"default:chest_locked",
					get_chest_formspec(pos)
				)
			end
			return itemstack
		end,
		
		allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
			local meta = minetest.get_meta(pos)
			if not landrush.can_interact(pos,player:get_player_name()) then
				minetest.log("action", player:get_player_name() .. " tried to access a shared chest at ".. minetest.pos_to_string(pos))
				return 0
			end
			return count
		end,
				
	    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			local meta = minetest.get_meta(pos)
			if not landrush.can_interact(pos,player:get_player_name()) then
				minetest.log("action", player:get_player_name() .. " tried to access a shared chest at ".. minetest.pos_to_string(pos))
				return 0
			end
			return stack:get_count()
		end,
		
	    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
			local meta = minetest.get_meta(pos)
			if not landrush.can_interact(pos,player:get_player_name()) then
				minetest.log("action", player:get_player_name()..
						" tried to access a shared chest at "..
						minetest.pos_to_string(pos))
				return 0
			end
			return stack:get_count()
		end,
		
		on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
			minetest.log("action", player:get_player_name()..
					" moves stuff in shared chest at "..minetest.pos_to_string(pos))
		end,
		
	    on_metadata_inventory_put = function(pos, listname, index, stack, player)
			minetest.log("action", player:get_player_name()..
					" puts stuff into shared chest at "..minetest.pos_to_string(pos))
		end,
		
	    on_metadata_inventory_take = function(pos, listname, index, stack, player)
			minetest.log("action", player:get_player_name()..
					" takes stuff from shared chest at "..minetest.pos_to_string(pos))
		end,
		
		tube = {
				insert_object = function(pos, node, stack, direction)
					local meta = minetest.get_meta(pos)
					local inventory = meta:get_inventory()
					return inventory:add_item("main",stack)
				end,
				
				can_insert = function(pos, node, stack, direction)
					local meta=minetest.get_meta(pos)
					local inventory = meta:get_inventory()
					return inventory:room_for_item("main",stack)
				end,
				input_inventory="main",
				connect_sides = {left=1, right=1, back=1, top=1, bottom=1},
		}
})

minetest.register_craft({
	output = 'landrush:shared_chest',
	recipe = {
		{'group:wood','group:wood','group:wood'},
		{'group:wood','landrush:landclaim','group:wood'},
		{'group:wood','group:wood','group:wood'}
	}
})

minetest.register_craft({
	output = 'landrush:shared_chest',
	recipe = {
		{'landrush:landclaim'},
		{'default:chest'}
	}
})

minetest.register_craft({
	output = 'landrush:shared_chest',
	recipe = {
		{'landrush:landclaim'},
		{'default:chest_locked'}
	}
})