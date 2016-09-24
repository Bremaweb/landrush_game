minetest.register_tool("landrush_special:jump_boots", {
	description = "Jumping Boots",
	inventory_image = "landrush_special_inv_jump_boots.png",
	groups = {armor_feet=10, armor_heal=0, armor_use=100, physics_jump=.58},
	wear = 0,
}) 

minetest.register_tool("landrush_special:speed_leggings", {
	description = "Speed Leggings",
	inventory_image = "landrush_special_inv_speed_leggings.png",
	groups = {armor_legs=15, armor_heal=0, armor_use=100, physics_speed=.8},
	wear = 0,
})

-- redefine cobble with new stack max
minetest.register_node(":default:cobble", {
	description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 299,
})
