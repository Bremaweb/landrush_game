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