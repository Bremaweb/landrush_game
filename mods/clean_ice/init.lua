minetest.register_node("clean_ice:ice", {
	description = "Clean ice",
	tiles = {"clean_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "clean_ice:ice",
	recipe = {"default:ice", "moreblocks:sweeper"},

})