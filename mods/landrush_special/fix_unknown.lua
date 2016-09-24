minetest.register_lbm({
	name = "landrush_special:homedecor_lamps",
	nodenames = {"homedecor:table_lamp_max","homedecor:table_lamp_off","homedecor:table_lamp_min","homedecor:table_lamp_med","homedecor:table_lamp_low","homedeocr:table_lamp_hi"},
	action = function (pos, node)
		minetest.set_node(pos,{name="homedecor:table_lamp_white_max"})
	end
})

minetest.register_alias("homedecor:refrigerator","homedecor:refrigerator_white")
minetest.register_alias("homedecor:refrigerator_locked","homedecor:refrigerator_white_locked")