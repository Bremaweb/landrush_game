local defaultbookshelf = table.copy(minetest.registered_nodes["default:bookshelf"])

local newbookshelf = defaultbookshelf
newbookshelf.description = "New bookshelf"
minetest.register_node(":default:bookshelf_new", newbookshelf)

minetest.register_node(":default:bookshelf", {
	description = "Bookshelf",
	tiles = {"default_wood.png", "default_wood.png", "default_bookshelf.png"},
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "default:bookshelf_new",
	recipe = {"default:bookshelf"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:bookshelf",
	recipe = {"default:bookshelf_new"}
})

if minetest.get_modpath("moreblocks") then
	emptybookshelf = table.copy(minetest.registered_nodes["moreblocks:empty_bookshelf"])
	local newemptybookshelf = emptybookshelf
	newemptybookshelf.description = ("New empty bookshelf")
	minetest.register_node(":moreblocks:empty_bookshelf_new", newemptybookshelf)

	emptybookshelf.tiles = {"default_wood.png", "default_wood.png", "moreblocks_empty_bookshelf_old.png"}

	minetest.register_node(":moreblocks:empty_bookshelf", {
		description = "Empty Bookshelf",
		tiles = {"default_wood.png", "default_wood.png",
			"moreblocks_empty_bookshelf.png"},
		groups = {snappy = 2, choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = sound_wood,
		no_stairs = true,
	})

	minetest.register_craft({
		type = "shapeless",
		output = "moreblocks:empty_bookshelf_new",
		recipe = {"moreblocks:empty_bookshelf"}
	})

	minetest.register_craft({
		type = "shapeless",
		output = "moreblocks:empty_bookshelf",
		recipe = {"moreblocks:empty_bookshelf_new"}
	})	
end
-- emptybookshelf = table.copy(minetest.registered_nodes["moreblocks:empty_bookshelf"])
-- newemptybookshelf = emptybookshelf.drops[#drops+1] = "moreblocks:empty_bookshelf_new"
-- 
-- 
-- tiles = {"default_wood.png", "default_wood.png", "moreblocks_empty_bookshelf_old.png"}




