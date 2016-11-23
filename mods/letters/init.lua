local letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
local basenode = "lightsplus:light"

for i, v in ipairs(letters) do
	minetest.register_node("letters:letter_"..letters[i], {
		description = "Letter "..string.upper(letters[i]),
		tile_images = {"letterblock.png", "letterblock.png", "letterblock.png^letter_"..tostring(i)..".png", "letterblock.png^letter_"..tostring(i)..".png", "letterblock.png^letter_"..tostring(i)..".png", "letterblock.png^letter_"..tostring(i)..".png"},
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=0,letter=i},
	})
	minetest.register_node("letters:letter_"..letters[i].."_on", {
		description = "Letter "..string.upper(letters[i]).." on",
		tile_images = {"letterblock.png", "letterblock.png", "letterblock.png^letter_"..tostring(i)..".png", "letterblock.png^letter_"..tostring(i)..".png", "letterblock.png^letter_"..tostring(i)..".png", "letterblock.png^letter_"..tostring(i)..".png"},
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		light_source = 14,
		drop = "letters:letter_"..letters[i],
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1,letter=i,turnedon=1},
	})
	minetest.register_node("letters:letter_low_"..letters[i], {
		description = "Lowercase letter "..string.upper(letters[i]),
		tile_images = {"letterblock.png", "letterblock.png", "letterblock.png^letter_low_"..tostring(i)..".png", "letterblock.png^letter_low_"..tostring(i)..".png", "letterblock.png^letter_low_"..tostring(i)..".png", "letterblock.png^letter_low_"..tostring(i)..".png"},
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=0,letterlow=i},
	})
	minetest.register_node("letters:letter_low_"..letters[i].."_on", {
		description = "Lowercase letter "..string.upper(letters[i]).." on",
		tile_images = {"letterblock.png", "letterblock.png", "letterblock.png^letter_low_"..tostring(i)..".png", "letterblock.png^letter_low_"..tostring(i)..".png", "letterblock.png^letter_low_"..tostring(i)..".png", "letterblock.png^letter_low_"..tostring(i)..".png"},
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		light_source = 14,
		drop = "letters:letter_low_"..letters[i],
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1,letterlow=i,turnedon=1},
	})

end
for i=0,9 do
	minetest.register_node("letters:number_"..tostring(i), {
		description = "Number "..tostring(i),
		tile_images = {"letterblock.png", "letterblock.png", "letterblock.png^number_"..tostring(i)..".png", "letterblock.png^number_"..tostring(i)..".png", "letterblock.png^number_"..tostring(i)..".png", "letterblock.png^number_"..tostring(i)..".png"},
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=0,number=i+1},
	})

	minetest.register_node("letters:number_"..tostring(i).."_on", {
		description = "Number "..tostring(i),
		tile_images = {"letterblock.png", "letterblock.png", "letterblock.png^number_"..tostring(i)..".png", "letterblock.png^number_"..tostring(i)..".png", "letterblock.png^number_"..tostring(i)..".png", "letterblock.png^number_"..tostring(i)..".png"},
		paramtype2 = "facedir",
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		light_source = 14,
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1,number=i+1,turnedon=1},
	})
end

-- if softdep on lightsplus is not met

if minetest.registered_nodes["lightsplus:light"] == nil or minetest.registered_nodes["lightsplus:light"] == false then
	minetest.register_node("letters:space", {
		description = "Letter space",
		tiles = {"letterblock.png"},
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
	})

	minetest.register_node("letters:space_on", {
		description = "letter space on",
		tile_images = {"letterblock.png"},
		drop = 'letters:space',
		light_source = 14,
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
	})
	minetest.register_craft({
		output = 'letters:space 10',
		recipe = {
			{'default:glass', 'default:glass', 'default:glass'},
			{'default:torch', 'default:torch', 'default:torch'},
			{'default:glass', 'default:glass', 'default:glass'},
		}
	})
	basenode = "letters:space"
end


-- recipes

--Uppercase
-- A
minetest.register_craft({
	output = "letters:letter_a",
	recipe = {
		{"dye:black", "", basenode}


	},
})
-- B
minetest.register_craft({
	output = "letters:letter_b",
	recipe = {
		{"dye:black", "", basenode},
		{"dye:black", "", ""}

	},
})
-- C
minetest.register_craft({
	output = "letters:letter_c",
	recipe = {
		{"dye:black", "dye:black", basenode}

	}
})
--D
minetest.register_craft({
	output = "letters:letter_d",
	recipe = {
		{"dye:black", "dye:black", basenode},
		{"", "dye:black", ""}
	}
})
--E
minetest.register_craft({
	output = "letters:letter_e",
	recipe = {
		{"dye:black", "", basenode},
		{"", "dye:black", ""}
	}
})
--F
minetest.register_craft({
	output = "letters:letter_f",
	recipe = {
		{"dye:black", "dye:black", basenode},
		{"dye:black", "", ""}
	}
})
--G
minetest.register_craft({
	output = "letters:letter_g",
	recipe = {
		{"dye:black", "dye:black", basenode},
		{"dye:black", "dye:black", ""}
	}
})
--H
minetest.register_craft({
	output = "letters:letter_h",
	recipe = {
		{"dye:black", "", basenode},
		{"dye:black", "dye:black", ""}
	}
})
--I
minetest.register_craft({
	output = "letters:letter_i",
	recipe = {
		{"", "dye:black", basenode},
		{"dye:black", "", ""}
	}
})
--J
minetest.register_craft({
	output = "letters:letter_j",
	recipe = {
		{"", "dye:black", basenode},
		{"dye:black", "dye:black", ""}
	}
})
--K
minetest.register_craft({
	output = "letters:letter_k",
	recipe = {
		{"dye:black", "", basenode},
		{"", "", ""},
		{"dye:black", "", ""}
	}
})
--L
minetest.register_craft({
	output = "letters:letter_l",
	recipe = {
		{"dye:black", "", basenode},
		{"dye:black", "", ""},
		{"dye:black", "", ""}
	}
})
--M
minetest.register_craft({
	output = "letters:letter_m",
	recipe = {
		{"dye:black", "dye:black", basenode},
		{"", "", ""},
		{"dye:black", "", ""}
	}
})
--N
minetest.register_craft({
	output = "letters:letter_n",
	recipe = {
		{"dye:black", "dye:black", basenode},
		{"", "dye:black", ""},
		{"dye:black", "", ""}
	}
})
--O
minetest.register_craft({
	output = "letters:letter_o",
	recipe = {
		{"dye:black", "", basenode},
		{"", "dye:black", ""},
		{"dye:black", "", ""}
	}
})
--P
minetest.register_craft({
	output = "letters:letter_p",
	recipe = {
		{"dye:black", "dye:black", basenode},
		{"dye:black", "", ""},
		{"dye:black", "", ""}
	}
})
--Q
minetest.register_craft({
	output = "letters:letter_q",
	recipe = {
		{"dye:black", "dye:black", basenode},
		{"dye:black", "dye:black", ""},
		{"dye:black", "", ""}
	}
})
--R
minetest.register_craft({
	output = "letters:letter_r",
	recipe = {
		{"dye:black", "", basenode},
		{"dye:black", "dye:black", ""},
		{"dye:black", "", ""}
	}
})
--S
minetest.register_craft({
	output = "letters:letter_s",
	recipe = {
		{"", "dye:black", basenode},
		{"dye:black", "", ""},
		{"dye:black", "", ""}
	}
})
--T
minetest.register_craft({
	output = "letters:letter_t",
	recipe = {

		{"", "dye:black", basenode},
		{"dye:black", "dye:black", ""},
		{"dye:black", "", ""}
	}
})
--U
minetest.register_craft({
	output = "letters:letter_u",
	recipe = {
		{"dye:black", "", basenode},
		{"", "", ""},
		{"dye:black", "dye:black", ""}
	}
})
--V
minetest.register_craft({
	output = "letters:letter_v",
	recipe = {
		{"dye:black", "", basenode},
		{"dye:black", "", ""},
		{"dye:black", "dye:black", ""}
	}
})
--W
minetest.register_craft({
	output = "letters:letter_w",
	recipe = {
		{"", "dye:black", basenode},
		{"dye:black", "dye:black", ""},
		{"", "dye:black", ""}
	}
})
--X
minetest.register_craft({
	output = "letters:letter_x",
	recipe = {
		{"dye:black", "dye:black", basenode},
		{"", "", ""},
		{"dye:black", "dye:black", ""}
	}
})
--y
minetest.register_craft({
	output = "letters:letter_y",
	recipe = {
		{"dye:black", "dye:black", basenode},
		{"", "dye:black", ""},
		{"dye:black", "dye:black", ""}
	}
})
--Z
minetest.register_craft({
	output = "letters:letter_z",
	recipe = {
		{"dye:black", "", basenode},
		{"", "dye:black", ""},
		{"dye:black", "dye:black", ""}
	}
})

--Lower case
-- a
minetest.register_craft({
	output = "letters:letter_low_a",
	recipe = {
		{"dye:black", "", ""},
		{"", "", basenode}

	},
})
-- b
minetest.register_craft({
	output = "letters:letter_low_b",
	recipe = {
		{"dye:black", "", ""},
		{"dye:black", "", basenode}
	}
})
-- c
minetest.register_craft({
	output = "letters:letter_low_c",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"", "", basenode}

	}
})
--d
minetest.register_craft({
	output = "letters:letter_low_d",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"", "dye:black", basenode}
	}
})
--e
minetest.register_craft({
	output = "letters:letter_low_e",
	recipe = {
		{"dye:black", "", ""},
		{"", "dye:black", basenode}
	}
})
--f
minetest.register_craft({
	output = "letters:letter_low_f",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"dye:black", "", basenode}
	}
})
--g
minetest.register_craft({
	output = "letters:letter_low_g",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"dye:black", "dye:black", basenode}
	}
})
--h
minetest.register_craft({
	output = "letters:letter_low_h",
	recipe = {
		{"dye:black", "", ""},
		{"dye:black", "dye:black", basenode}
	}
})
--i
minetest.register_craft({
	output = "letters:letter_low_i",
	recipe = {
		{"", "dye:black", ""},
		{"dye:black", "", basenode}
	}
})
--j
minetest.register_craft({
	output = "letters:letter_low_j",
	recipe = {
		{"", "dye:black", ""},
		{"dye:black", "dye:black", basenode}
	}
})
--k
minetest.register_craft({
	output = "letters:letter_low_k",
	recipe = {
		{"dye:black", "", ""},
		{"", "", basenode},
		{"dye:black", "", ""}
	}
})
--l
minetest.register_craft({
	output = "letters:letter_low_l",
	recipe = {
		{"dye:black", "", ""},
		{"dye:black", "", basenode},
		{"dye:black", "", ""}
	}
})
--m
minetest.register_craft({
	output = "letters:letter_low_m",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"", "", basenode},
		{"dye:black", "", ""}
	}
})
--n
minetest.register_craft({
	output = "letters:letter_low_n",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"", "dye:black", basenode},
		{"dye:black", "", ""}
	}
})
--o
minetest.register_craft({
	output = "letters:letter_low_o",
	recipe = {
		{"dye:black", "", ""},
		{"", "dye:black", basenode},
		{"dye:black", "", ""}
	}
})
--p
minetest.register_craft({
	output = "letters:letter_low_p",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"dye:black", "", basenode},
		{"dye:black", "", ""}
	}
})
--q
minetest.register_craft({
	output = "letters:letter_low_q",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"dye:black", "dye:black", basenode},
		{"dye:black", "", ""}
	}
})
--r
minetest.register_craft({
	output = "letters:letter_low_r",
	recipe = {
		{"dye:black", "", ""},
		{"dye:black", "dye:black", basenode},
		{"dye:black", "", ""}
	}
})
--s
minetest.register_craft({
	output = "letters:letter_low_s",
	recipe = {
		{"", "dye:black", ""},
		{"dye:black", "", basenode},
		{"dye:black", "", ""}
	}
})
--t
minetest.register_craft({
	output = "letters:letter_low_t",
	recipe = {
		{"", "dye:black", ""},
		{"dye:black", "dye:black", basenode},
		{"dye:black", "", ""}
	}
})
--u
minetest.register_craft({
	output = "letters:letter_low_u",
	recipe = {
		{"dye:black", "", ""},
		{"", "", basenode},
		{"dye:black", "dye:black", ""}
	}
})
--v
minetest.register_craft({
	output = "letters:letter_low_v",
	recipe = {
		{"dye:black", "", ""},
		{"dye:black", "", basenode},
		{"dye:black", "dye:black", ""}
	}
})
--w
minetest.register_craft({
	output = "letters:letter_low_w",
	recipe = {
		{"", "dye:black", ""},
		{"dye:black", "dye:black", basenode},
		{"", "dye:black", ""}
	}
})
--x
minetest.register_craft({
	output = "letters:letter_low_x",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"", "", basenode},
		{"dye:black", "dye:black", ""}
	}
})
--y
minetest.register_craft({
	output = "letters:letter_low_y",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"", "dye:black", basenode},
		{"dye:black", "dye:black", ""}
	}
})
--z
minetest.register_craft({
	output = "letters:letter_low_z",
	recipe = {
		{"dye:black", "", ""},
		{"", "dye:black", basenode},
		{"dye:black", "dye:black", ""}
	}
})

--Numbers
--1
minetest.register_craft({
	output = "letters:number_1",
	recipe = {
		{"dye:black", "", ""},
		{"", "", ""},
		{"", "", basenode}

	},
})
-- 2
minetest.register_craft({
	output = "letters:number_2",
	recipe = {
		{"dye:black", "", ""},
		{"dye:black", "", ""},
		{"", "", basenode}
	}
})
-- 3
minetest.register_craft({
	output = "letters:number_3",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"", "", ""},
		{"", "", basenode}

	}
})
--4
minetest.register_craft({
	output = "letters:number_4",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"", "dye:black", ""},
		{"", "", basenode}
	}
})
--5
minetest.register_craft({
	output = "letters:number_5",
	recipe = {
		{"dye:black", "", ""},
		{"", "dye:black", ""},
		{"", "", basenode}
	}
})
--6
minetest.register_craft({
	output = "letters:number_6",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"dye:black", "", ""},
		{"", "", basenode}
	}
})
--7
minetest.register_craft({
	output = "letters:number_7",
	recipe = {
		{"dye:black", "dye:black", ""},
		{"dye:black", "dye:black", ""},
		{"", "", basenode}
	}
})
--8
minetest.register_craft({
	output = "letters:number_8",
	recipe = {
		{"dye:black", "", ""},
		{"dye:black", "dye:black", ""},
		{"", "", basenode}
	}
})
--9
minetest.register_craft({
	output = "letters:number_9",
	recipe = {
		{"", "dye:black", ""},
		{"dye:black", "", ""},
		{"", "", basenode}
	}
})
--0
minetest.register_craft({
	output = "letters:number_0",
	recipe = {
		{"", "dye:black", ""},
		{"dye:black", "dye:black", ""},
		{"", "", basenode}
	}
})

-- punching

local on_letter_puncher = function (pos, node, puncher)
	if	minetest.get_item_group(node.name, "letter") > 0 and minetest.get_item_group(node.name, "letter") < 27 then
		local letter = minetest.get_item_group(node.name, "letter")
		local letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
		local nparam1 = node.param1
		local nparam2 = node.param2
		if minetest.get_item_group(node.name, "turnedon") == 1 then
			minetest.add_node(pos, {name="letters:letter_"..letters[letter], param1 = nparam1, param2 = nparam2})
		else
			minetest.add_node(pos, {name="letters:letter_"..letters[letter].."_on", param1 = nparam1, param2 = nparam2})
		end
	elseif minetest.get_item_group(node.name, "letterlow") > 0 and minetest.get_item_group(node.name, "letterlow") < 27 then
		local letterlow = minetest.get_item_group(node.name, "letterlow")
		local letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
		local nparam1 = node.param1
		local nparam2 = node.param2
		if minetest.get_item_group(node.name, "turnedon") == 1 then
			minetest.add_node(pos, {name="letters:letter_low_"..letters[letterlow], param1 = nparam1, param2 = nparam2})
		else
			minetest.add_node(pos, {name="letters:letter_low_"..letters[letterlow].."_on", param1 = nparam1, param2 = nparam2})
		end
	elseif minetest.get_item_group(node.name, "number") > 0 and minetest.get_item_group(node.name, "number") < 11 then
		local number = minetest.get_item_group(node.name, "number")-1
		local nparam1 = node.param1
		local nparam2 = node.param2
		if minetest.get_item_group(node.name, "turnedon") == 1 then
			minetest.add_node(pos, {name="letters:number_"..number, param1 = nparam1, param2 = nparam2})
		else
			minetest.add_node(pos, {name="letters:number_"..number.."_on", param1 = nparam1, param2 = nparam2})
		end
	end
end
minetest.register_on_punchnode(on_letter_puncher)
if minetest.registered_nodes["letters:space"] then
	local on_light_puncher = function (pos, node, puncher)
		if node.name == 'letters:space' then
			minetest.env:add_node(pos, {name="letters:space_on"})
			nodeupdate(pos)
		elseif node.name == 'letters:space_on' then
			minetest.env:add_node(pos, {name="letters:space",})
			nodeupdate(pos)
		end
	end
	minetest.register_on_punchnode(on_light_puncher)
end
