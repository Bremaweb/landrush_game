-- minetest.register_node("clean_ice:ice", {
-- 	description = "Clean ice",
-- 	tiles = {"clean_ice.png"},
-- 	is_ground_content = false,
-- 	paramtype = "light",
-- 	groups = {cracky = 3, puts_out_fire = 1},
-- 	sounds = default.node_sound_glass_defaults(),
-- })


minetest.register_node("clean_ice:ice", {
	description = "Clean ice",
	tiles = {"clean_ice.png"},
	is_ground_content = false,
	use_texture_alpha = true,
	paramtype = "light",
	param2 = 0,
	sunlight_propagates = true,
	is_ground_content = false,
	drawtype = "glasslike",
	inventory_image  = minetest.inventorycube("clean_ice.png").."^[brighten",
	liquidtype = "none",
	groups = {cracky = 3, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
	on_construct = snow_onto_dirt,
	liquids_pointable = true,
})


minetest.register_craft({
	type = "shapeless",
	output = "clean_ice:ice",
	recipe = {"default:ice", "moreblocks:sweeper"},

})