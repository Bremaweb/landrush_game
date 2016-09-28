minetest.register_node(":default:ice", {
	description = "Ice",
	tiles = {"opaque_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
})