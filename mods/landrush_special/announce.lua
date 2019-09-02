--[[function check_announce()
	local players = minetest.get_connected_players()
	
	if ( #players < 12 ) then
		minetest.settings:set("server_announce","1")
	else
		minetest.settings:set("server_announce","0")
	end
	
	minetest.after(60,check_announce)
end

minetest.after(60,check_announce)]]