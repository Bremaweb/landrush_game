-- BobBlocks mod by RabbiBob
-- State Changes

-- changed by fuinur (greyblock fixed, moved registering into loop)

local bobblockslist = {
-- {  Block prefix,  Color name,  recipe for basic block: {count, CraftIngred1,  CraftIngred2,  CraftIngred3 }, }
	{"red",    "Red",     {2, 'default:glass',       'default:torch',         'default:brick'}, },
	{"yellow", "Yellow",  {2, 'default:glass',       'default:torch',         'default:sand'}, },
	{"blue",   "Blue",    {2, 'default:glass',       'default:torch',         'default:gravel'}, },
	{"white",  "White",   {2, 'default:glass',       'default:torch',         'default:dirt'},  },
	{"grey",   "Grey",    {2, 'default:glass',       'default:torch',         'default:cobble'}, },
	{"orange", "Orange",  {2, 'bobblocks:redblock',  'bobblocks:yellowblock', ''}, },
	{"green",  "Green",   {2, 'bobblocks:blueblock', 'bobblocks:yellowblock', ''}, },
	{"violet", "Violet",  {2, 'bobblocks:redblock',  'bobblocks:blueblock',   ''}, },
	{"indigo", "Indigo",  {3, 'bobblocks:redblock',  'bobblocks:blueblock',    'bobblocks:whiteblock'}, },
}

-- register blocks and poles
for i in ipairs(bobblockslist) do
	local color=bobblockslist[i][1]
	local desc=bobblockslist[i][2]

	-- block enabled:
	minetest.register_node("bobblocks:"..color.."block", {
		description = desc.." Block",
		drawtype = "glasslike",
		tiles = {"bobblocks_"..color.."block.png"},
		inventory_image = minetest.inventorycube("bobblocks_"..color.."block.png"),
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = true,
		sounds = default.node_sound_glass_defaults(),
		light_source = LIGHT_MAX-0,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		mesecons = {conductor={
			state = mesecon.state.on,
			offstate = "bobblocks:"..color.."block_off"
		}},
--		on_construct = function(pos)
--			if mesecon then
--				mesecon.receptor_on(pos, mesecon.rules.alldirs)
--			end
--		end,
		on_punch = function(pos, node, puncher)
			local player_name = puncher:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			--minetest.log("action", (player_name or "") .. " punched onbob at " .. minetest.pos_to_string(pos))
			minetest.add_node(pos, {name = "bobblocks:"..color.."block_off"})
			minetest.sound_play("bobblocks_glassblock", {pos = pos, gain = 1.0, max_hear_distance = 32,})
		end,

	})

	-- block disabled:
	minetest.register_node("bobblocks:"..color.."block_off", {
		description = desc.." Block",
		tiles = {"bobblocks_"..color.."block.png"},
		is_ground_content = true,
		alpha = WATER_ALPHA,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
		drop = 'bobblocks:'..color..'block',
		mesecons = {conductor={
			state = mesecon.state.off,
			onstate = "bobblocks:"..color.."block"
		}},
--		on_construct = function(pos)
--			if mesecon then
--				mesecon.receptor_off(pos, mesecon.rules.alldirs)
--			end
--		end,
		on_punch = function(pos, node, puncher)
			local player_name = puncher:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			--minetest.log("action", (player_name or "") .. " punched offbob at " .. minetest.pos_to_string(pos))
			minetest.add_node(pos, {name = "bobblocks:"..color.."block"})
			minetest.sound_play("bobblocks_glassblock", {pos = pos, gain = 1.0, max_hear_distance = 32,})
		end,
	})

	-- pole enabled:
	minetest.register_node("bobblocks:"..color.."pole", {
		description = desc.." Pole",
		drawtype = "fencelike",
		tiles = {"bobblocks_"..color.."block.png"},
		inventory_image = ("bobblocks_inv"..color.."pole.png"),
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = true,
		sounds = default.node_sound_glass_defaults(),
		light_source = LIGHT_MAX-0,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		mesecons = {conductor={
			state = mesecon.state.on,
			offstate = "bobblocks:"..color.."pole_off"
		}},
--		on_construct = function(pos)
--			if mesecon then
--				mesecon.receptor_on(pos, mesecon.rules.alldirs)
--			end
--		end,
		on_punch = function(pos, node, puncher)
			local player_name = puncher:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			--minetest.log("action", (player_name or "") .. " punched onbob at " .. minetest.pos_to_string(pos))
			minetest.add_node(pos, {name = "bobblocks:"..color.."pole_off"})
			minetest.sound_play("bobblocks_glassblock", {pos = pos, gain = 1.0, max_hear_distance = 32,})
		end,
	})

	-- pole disabled:
	minetest.register_node("bobblocks:"..color.."pole_off", {
		description = desc.." Pole",
		drawtype = "fencelike",
		tiles = {"bobblocks_"..color.."block.png"},
		inventory_image = ("bobblocks_inv"..color.."pole.png"),
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = true,
		sounds = default.node_sound_glass_defaults(),
		light_source = LIGHT_MAX-10,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
		drop = 'bobblocks:'..color..'pole',
		mesecons = {conductor={
			state = mesecon.state.off,
			onstate = "bobblocks:"..color.."pole"
		}},
--		on_construct = function(pos)
--			if mesecon then
--				mesecon.receptor_off(pos, mesecon.rules.alldirs)
--			end
--		end,
		on_punch = function(pos, node, puncher)
			local player_name = puncher:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			--minetest.log("action", (player_name or "") .. " punched offbob at " .. minetest.pos_to_string(pos))
			minetest.add_node(pos, {name = "bobblocks:"..color.."pole"})
			minetest.sound_play("bobblocks_glassblock", {pos = pos, gain = 1.0, max_hear_distance = 32,})
		end,
	})

end


-- register recipies
for i in ipairs(bobblockslist) do
	local color=bobblockslist[i][1]
	local recipe=bobblockslist[i][3]
	local rcnt=recipe[1]
	local ri1=recipe[2]
	local ri2=recipe[3]
	local ri3=recipe[4]

	-- block:
	minetest.register_craft({
		output = "bobblocks:"..color.."block "..rcnt, 
		recipe = { {ri1, ri2, ri3}, },
	})

	-- pole:
	minetest.register_craft({
		output = "bobblocks:"..color.."pole",
		recipe = { {"bobblocks:"..color.."block", "default:stick", } }
	})
end


-- ???
minetest.register_node("bobblocks:btm", {
	description = "Bobs TransMorgifier v5",
    tiles = {"bobblocks_btm_sides.png", "bobblocks_btm_sides.png", "bobblocks_btm_sides.png",
		"bobblocks_btm_sides.png", "bobblocks_btm_sides.png", "bobblocks_btm.png"},
    inventory_image = "bobblocks_btm.png",
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
})


minetest.register_craft({
	output = 'NodeItem "bobblocks:btm" 1',
	recipe = {
		{'node "default:glass" 1', 'node "default:torch" 1', 'node "default:leaves" 1',
        'node "default:mese" 1','node "default:rat" 1'},

	},
})


