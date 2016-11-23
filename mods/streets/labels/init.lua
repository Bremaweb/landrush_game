--[[
	StreetsMod: All kinds of asphalt with labels
]]
if streets.extendedBy.wool == false then return end
--
minetest.register_node(":streets:asphalt_sideline",{
	description = "Asphalt with sideline",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_side.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_side","streets:asphalt_sideline")
minetest.register_craft({
	output = "streets:asphalt_sideline 6",
	recipe = {
		{"wool:white","streets:asphalt","streets:asphalt"},
		{"wool:white","streets:asphalt","streets:asphalt"},
		{"wool:white","streets:asphalt","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_solid_line",{
	description = "Asphalt with solid line",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_solid_line.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_middle","streets:asphalt_solid_line")
minetest.register_craft({
	output = "streets:asphalt_solid_line 6",
	recipe = {
		{"streets:asphalt","wool:white","streets:asphalt"},
		{"streets:asphalt","wool:white","streets:asphalt"},
		{"streets:asphalt","wool:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_dashed_line",{
	description = "Asphalt with dashed line",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_dashed_line.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_middle_dashed","streets:asphalt_dashed_line")
minetest.register_craft({
	output = "streets:asphalt_dashed_line 6",
	recipe = {
		{"streets:asphalt","wool:white","streets:asphalt"},
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","wool:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_outer_edge",{
	description = "Asphalt with sideline (edge)",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_outer_edge.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_outer_edge 4",
	recipe = {
		{"wool:white","wool:white","wool:white"},
		{"wool:white","streets:asphalt","streets:asphalt"},
		{"wool:white","streets:asphalt","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_parking",{
	description = "Asphalt with parking label",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_parking.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_parking 4",
	recipe = {
		{"streets:asphalt","wool:white","wool:white"},
		{"streets:asphalt","wool:white","wool:white"},
		{"streets:asphalt","wool:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_straight",{
	description = "Asphalt with arrow",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_straight.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_straight 4",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","wool:white","streets:asphalt"},
		{"streets:asphalt","wool:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_left",{
	description = "Asphalt with arrow",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_left.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_left 4",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"wool:white","wool:white","streets:asphalt"},
		{"streets:asphalt","wool:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_right",{
	description = "Asphalt with arrow",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_right.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_right 4",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","wool:white","wool:white"},
		{"streets:asphalt","wool:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_straight_left",{
	description = "Asphalt with arrow",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_straight_left.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_straight_left 4",
	recipe = {
		{"streets:asphalt","wool:white","streets:asphalt"},
		{"wool:white","wool:white","streets:asphalt"},
		{"streets:asphalt","wool:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_straight_right",{
	description = "Asphalt with arrow",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_straight_right.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_straight_right 4",
	recipe = {
		{"streets:asphalt","wool:white","streets:asphalt"},
		{"streets:asphalt","wool:white","wool:white"},
		{"streets:asphalt","wool:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_alldirs",{
	description = "Asphalt with arrow",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_alldirs.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_alldirs 4",
	recipe = {
		{"streets:asphalt","wool:white","streets:asphalt"},
		{"wool:white","wool:white","wool:white"},
		{"streets:asphalt","wool:white","streets:asphalt"}
	}
})
