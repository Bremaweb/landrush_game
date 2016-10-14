minetest.register_craft({
	output = "technic:uranium35_block",
	recipe = {
		{"technic:uranium35_ingot", "technic:uranium35_ingot", "technic:uranium35_ingot"},
		{"technic:uranium35_ingot", "technic:uranium35_ingot", "technic:uranium35_ingot"},
		{"technic:uranium35_ingot", "technic:uranium35_ingot", "technic:uranium35_ingot"},
	},
})
for p = 1, 35 do
	if p == 7 then
		technic.register_compressor_recipe({input = {"technic:uranium" .. p-1 .. "_ingot 5"}, output = "technic:uranium_ingot"})
	elseif p == 8 then
		technic.register_compressor_recipe({input = {"technic:uranium_ingot 5"}, output = "technic:uranium" .. p .. "_ingot"})
	else
		technic.register_compressor_recipe({input = {"technic:uranium" .. p-1 .. "_ingot 5"}, output = "technic:uranium" .. p .. "_ingot"})
	end
end
technic.register_compressor_recipe({input = {"technic:uranium35_ingot 4"}, output = "technic:uranium_fuel"})

technic.register_extractor_recipe({input = {"technic:uranium_lump 5"}, output = "technic:uranium35_ingot"})
