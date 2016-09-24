-- Nature (Minetest 0.4 mod)
-- Nature is slowly capturing the world!

local current_mod_name = minetest.get_current_modname()

dofile(minetest.get_modpath(current_mod_name) .. "/config.lua")
dofile(minetest.get_modpath(current_mod_name) .. "/global_function.lua")
--dofile(minetest.get_modpath(current_mod_name) .. "/cactus.lua")
--dofile(minetest.get_modpath(current_mod_name) .. "/papyrus.lua")
--dofile(minetest.get_modpath(current_mod_name) .. "/moss.lua")
dofile(minetest.get_modpath(current_mod_name) .. "/blossom.lua")
--dofile(minetest.get_modpath(current_mod_name) .. "/tree_growth.lua")

minetest.log("info", "Nature mod loaded!")
