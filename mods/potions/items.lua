minetest.register_craftitem("potions:fly1",{
	description = "Level 1 Fly Potion",
	stack_max = 1,
	liquids_pointable = false,
	inventory_image = "potions_fly1.png",
	on_use = function(itemstack,player,pointed_thing)
		local name = player:get_player_name()
		if ( affects.affectPlayer(name,"fly1") ) then
			itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_craftitem("potions:fly2",{
	description = "Level 2 Fly Potion",
	stack_max = 1,
	liquids_pointable = false,
	inventory_image = "potions_fly2.png",
	on_use = function(itemstack,player,pointed_thing)
		local name = player:get_player_name()
		if ( affects.affectPlayer(name,"fly2") ) then
			itemstack:take_item()
		end
		return itemstack
	end	
})

minetest.register_craftitem("potions:fly3",{
	description = "Level 3 Fly Potion",
	stack_max = 1,
	liquids_pointable = false,
	inventory_image = "potions_fly3.png",
	on_use = function(itemstack,player,pointed_thing)
		local name = player:get_player_name()
		if ( affects.affectPlayer(name,"fly3") ) then
			itemstack:take_item()
		end
		return itemstack
	end	
})

minetest.register_craftitem("potions:gravity1",{
	description = "Level 1 Anti Gravity Potion",
	stack_max = 1,
	liquids_pointable = false,
	inventory_image = "potions_gravity1.png",
	on_use = function(itemstack,player,pointed_thing)
		local name = player:get_player_name()
		if ( affects.affectPlayer(name,"gravity1") ) then
			itemstack:take_item()
		end
		return itemstack
	end	
})


minetest.register_craftitem("potions:fly1_raw",{
	description = "Level 1 Raw Fly Potion",
	stack_max = 1,
	liquids_pointable = false,
	inventory_image = "potions_fly1_raw.png"
})

minetest.register_craftitem("potions:fly2_raw",{
	description = "Level 2 Raw Fly Potion",
	stack_max = 1,
	liquids_pointable = false,
	inventory_image = "potions_fly2_raw.png"
})

minetest.register_craftitem("potions:fly3_raw",{
	description = "Level 2 Raw Fly Potion",
	stack_max = 1,
	liquids_pointable = false
})

minetest.register_craftitem("potions:gravity1_raw", {
	description = "Level 1 Raw Anti Gravity Potion",
	stack_max = 1,
	liquids_pointable = false,
	inventory_image = "potions_gravity1_raw.png",
})


local ground_items = {
	{ "flowers:dandelion_white", "ground_dandelion_white", "Ground White Dandelion" },
	{ "flowers:dandelion_yellow", "ground_dandelion_yellow", "Ground Yellow Dandelion" },
	{ "flowers:rose", "ground_rose", "Ground Rose" },
	{ "flowers:geranium", "ground_geranium", "Ground Geranium" },
	{ "flowers:tulip", "ground_tulip", "Ground Tulip" },
	{ "flowers:viola", "ground_viola", "Ground Viola" },
	{ "flowers:seaweed", "ground_seaweed", "Ground Seaweed" },
	{ "flowers:waterlily", "ground_waterlily", "Ground Waterlily" },
	{ "bones:bones","ground_bones","Ground Bones" }	
}

for _, data in pairs(ground_items) do
	technic.register_grinder_recipe({input={data[1]}, output="potions:"..data[2]})	
	minetest.register_craftitem("potions:"..data[2],{
		description = data[3],
		stack_max = 99,
		liquids_pointable = false,
		inventory_image = "potions_"..data[2]..".png"
	})	
end

minetest.register_craft({
	type = "shapeless",
	output = "potions:fly1_raw",
	recipe = {"bushes:sugar","potions:ground_rose","potions:ground_seaweed","default:mese_crystal_fragment","vessels:glass_bottle","bucket:bucket_water","technic:mithril_dust"},
	replacements = { { "bucket:bucket_water","bucket:bucket_empty" } }	
})

minetest.register_craft({
		type="cooking",
		recipe="potions:fly1_raw",
		output = "potions:fly1"
})

minetest.register_craft({
	type = "shapeless",
	output = "potions:fly2_raw",
	recipe = {"bushes:sugar","technic:mithril_dust","potions:ground_rose","potions:ground_seaweed","potions:ground_seaweed","default:mese_crystal","vessels:glass_bottle","bucket:bucket_water","technic:mithril_dust"},
	replacements = { { "bucket:bucket_water","bucket:bucket_empty" } }	
})

minetest.register_craft({
		type="cooking",
		recipe="potions:fly2_raw",
		output = "potions:fly2"
})

minetest.register_craft({
	type="shapeless",
	output="potions:gravity1_raw",
	recipe = {"dye:green","farming:wheat","potions:ground_seaweed","potions:ground_bones","default:mese_crystal_fragment","vessels:glass_bottle","bucket:bucket_water"},
	replacements = { { "bucket:bucket_water","bucket:bucket_empty" } }
})

minetest.register_craft({
		type="cooking",
		recipe="potions:gravity1_raw",
		output = "potions:gravity1"
})
