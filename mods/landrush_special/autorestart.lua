-- if the server has been up for more than 24 hours and there are no players online shutdown the server
-- and the launch script will automatically restart it
local function check_restart()
	local players = minetest.get_connected_players()
	if #players == 0 and minetest.get_server_uptime() > 86400 then
		-- restart the server
		minetest.log("action","Automatic server restart")
		minetest.request_shutdown("Automatic server restart",true)
	end
	minetest.after(60,check_restart)
end

minetest.after(60,check_restart)