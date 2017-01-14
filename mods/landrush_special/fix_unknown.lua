minetest.register_lbm({
	name = "landrush_special:homedecor_lamps",
	nodenames = {"homedecor:table_lamp_max","homedecor:table_lamp_off","homedecor:table_lamp_min","homedecor:table_lamp_med","homedecor:table_lamp_low","homedeocr:table_lamp_hi"},
	action = function (pos, node)
		minetest.set_node(pos,{name="homedecor:table_lamp_white_max"})
	end
})

minetest.register_alias("homedecor:refrigerator","homedecor:refrigerator_white")
minetest.register_alias("homedecor:refrigerator_locked","homedecor:refrigerator_white_locked")


-- convert old PA beds to new homedecor:
local pabeds = { "red", "orange", "yellow", "green", "blue", "violet", "black", "grey", "white", }
local pabedsrm = {}
for i,v in ipairs(pabeds) do
	-- replace bottoms
	minetest.register_alias("beds:bed_bottom_"..v,"homedecor:bed_"..v.."_regular")
	table.insert(pabedsrm,"beds:bed_top_"..v);
end

-- remove tops
minetest.register_lbm({
	name = "landrush_special:old_pa_beds",
	nodenames = pabedsrm,
	action = function (pos, node)
		minetest.set_node(pos,{name="air"})
	end
})


