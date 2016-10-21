minetest.register_node(":farming_plus:cocoa_leaves", {
	description = "Cocoa leaves",
	drawtype = "allfaces_optional",
	tiles = {"farming_banana_leaves.png"},
	paramtype = "light",
	groups = {snappy=3, leafdecay=3, flammable=2, leaves = 1, not_in_creative_inventory=1},
 	drop = {
		max_items = 1,
		items = {
			{
				items = {'farming_plus:cocoa_sapling'},
				rarity = 20,
			},
			{
				items = {'farming_plus:cocoa_leaves'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node(":farming_plus:banana_leaves", {
	description = "Banana leaves",
	drawtype = "allfaces_optional",
	tiles = {"farming_banana_leaves.png"},
	paramtype = "light",
	groups = {snappy=3, leafdecay=3, flammable=2, leaves = 1, not_in_creative_inventory=1},
 	drop = {
		max_items = 1,
		items = {
			{
				items = {'farming_plus:banana_sapling'},
				rarity = 20,
			},
			{
				items = {'farming_plus:banana_leaves'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})



-- scarecrow fix:

local box2 = {
	{-1, -8, -1, 1, 8, 1},
	{-12, -8, -1, 12, -7, 1},
	{-5, -2, -5, 5, 8, 5}
}

for j,list in ipairs(box2) do
	for i,int in ipairs(list) do
		list[i] = int/16
	end
	box2[j] = list
end

minetest.register_node(":farming:scarecrow", {
	description = "Scarecrow",
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "facedir",
	tiles = {"farming_scarecrow_top.png", "farming_scarecrow_top.png", "farming_scarecrow_side.png", "farming_scarecrow_side.png", "farming_scarecrow_side.png", "farming_scarecrow_front.png"},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = box2
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-12/16, -1.5, -0.5, 12/16, 0.5, 0.5}
		}
	},
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=2},
	
	after_place_node = function(pos, placer)
		local node = minetest.get_node(pos)
		local param2 = node.param2
		pos.y = pos.y+1
		if minetest.get_node(pos).name ~= "air" then
			pos.y = pos.y-1
			minetest.remove_node(pos)
			minetest.after(0.1, function(placer)
				local inv = placer:get_inventory()
				--local index = placer:get_wield_index()
				inv:add_item("main", ItemStack("farming:scarecrow"))
			end, placer)
			return
		end
		minetest.set_node(pos, node)
		pos.y = pos.y-1
		node.name = "farming:scarecrow_bottom"
		minetest.set_node(pos, node)
	end,
	
	after_destruct = function(pos, oldnode)
		pos.y = pos.y-1
		if minetest.get_node(pos).name == "farming:scarecrow_bottom" then
			minetest.remove_node(pos)
		end
	end
})

minetest.register_node(":farming:scarecrow_light", {
	description = "Scarecrow",
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "facedir",
	light_source = LIGHT_MAX-2,
	tiles = {"farming_scarecrow_top.png", "farming_scarecrow_top.png", "farming_scarecrow_side.png", "farming_scarecrow_side.png", "farming_scarecrow_side.png", "farming_scarecrow_front_light.png"},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = box2
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-12/16, -1.5, -0.5, 12/16, 0.5, 0.5}
		}
	},
	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=2},
	
	after_place_node = function(pos, placer)
		local node = minetest.get_node(pos)
		local param2 = node.param2
		pos.y = pos.y+1
		if minetest.get_node(pos).name ~= "air" then
			pos.y = pos.y-1
			minetest.remove_node(pos)
			minetest.after(0.1, function(placer)
				local inv = placer:get_inventory()
				-- local index = placer:get_wield_index()
				inv:add_item("main", ItemStack("farming:scarecrow_light"))
			end, placer)
			return
		end
		minetest.set_node(pos, node)
		pos.y = pos.y-1
		node.name = "farming:scarecrow_bottom"
		minetest.set_node(pos, node)
	end,
	
	after_destruct = function(pos, oldnode)
		pos.y = pos.y-1
		if minetest.get_node(pos).name == "farming:scarecrow_bottom" then
			minetest.remove_node(pos)
		end
	end
})


