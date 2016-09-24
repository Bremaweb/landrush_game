spawn_file = minetest.get_worldpath() .. "/spawn_points"

spawn_points = {}
default_points = {  {name="The Origin",pos={x=0,y=4,z=0},code="origin"}, 
						{name="The Hotel",pos={x=236,y=3,z=321},code="hotel"}, 
						{name="Stonewall",pos={x=353,y=23,z=1141},code="stonewall"}, 
						{name="Stonewall Arena",pos={x=367,y=14,z=1233},code="arena"} 
					}

death_messages = {"Everybody point and laugh, #n# just died!",
				  "Death has knocked at #n#'s door yet again",
				  "#n#, respawning at a spawn point near you!",
				  "#n# just met their maker",
				  "#n# died",
				  "'Farewell, cruel world' - #n#",
				  "#n# didn't want to live anyway",
				  "#n# went toward the light",
				  "'Parting is such sweet sorrow...' - #n#",
				  "#n#'s mother always told them not to play around lava pits"}

minetest.register_chatcommand("spawn",{
	params = "none",
	func = function (name, param)
		local player = minetest.get_player_by_name(name)
		if ( param == "" ) then
			goto_nearest_spawn(player)
		else
			goto_spawn(player,param)
		end
	end
})


minetest.register_chatcommand("addspawn",{
	params = "<name>",
	privs = {server=true},
	func = function (name, param)
		if ( param ~= nil ) then
			local code, desc = string.match(param, "([%a%d_]+) (.+)")
			local player = minetest.get_player_by_name(name)
			local pos = player:getpos()
			pos = {x=math.floor(pos.x),y=math.ceil(pos.y),z=math.floor(pos.z)}
			table.insert(spawn_points, {name=desc,pos=pos,code=code})
			savespawns()
			minetest.chat_send_player(name,"Spawn point "..desc.." added at "..minetest.pos_to_string(pos))
		end
	end,
})

minetest.register_chatcommand("delspawn",{
	params = "<spawn id>",
	privs = {server=true},
	func = function (name, param)
		if ( tonumber(param) ~= nil ) then
			param = tonumber(param)
			if ( spawn_points[param] ~= nil ) then
				spawn_points[param] = nil
				minetest.chat_send_player(name,"Spawn point deleted!")
			else
				minetest.chat_send_player(name,"That spawn point doesn't exist")
			end
		end
	end,
})

minetest.register_chatcommand("spawnlist",{
	params = "<spawn code || spawn id>",
	desc = "Lists all spawn points",
	func = function (name, param)
		for k,spos in pairs(spawn_points) do
			if ( spos ~= nil ) then
				local spawnstring = tostring(k)..") "..spos.name
				if ( spos.code ~= nil ) then
					spawnstring = spawnstring.." ( "..tostring(spos.code).." )"
				end
				minetest.chat_send_player(name,spawnstring)
			end
		end	
	end,
})

function goto_spawn(player,spawn)
	if tonumber(spawn) ~= nil then
		spawn = tonumber(spawn)
		if ( spawn_points[spawn] ~= nil ) then
			player:moveto(spawn_points[spawn].pos)
			return true
		end
	else
		for k,spos in pairs(spawn_points) do
			if ( spos.code == spawn ) then
				player:moveto(spos.pos)
				return true
			end
		end
	end
	minetest.chat_send_player(player:get_player_name(),"That spawn point doesn't exist")
end

function loadspawns ()
minetest.log("action","Loading spawn points")
local f = io.open(spawn_file, "r")
	if f==nil then 
		minetest.log("action","File not found, using default points")
		spawn_points = default_points
		savespawns()
		return
	end
    	local t = f:read("*all")
    	f:close()
	if t=="" or t==nil then 
		minetest.log("action","File blank, using default points")
		spawn_points = default_points
		savespawns()
		return
	end
	spawn_points = minetest.deserialize(t)
end

function savespawns ()
minetest.log("action","Saving spawn points")
	local f = io.open(spawn_file, "w")
    	f:write(minetest.serialize(spawn_points))
    	f:close()
end

function goto_nearest_spawn(player)	
	local pos = player:getpos()
	local nearest = {distance=nil,key=nil}
	
	for k,spos in pairs(spawn_points) do
		local d = landrush.get_distance(pos,spos.pos)
		if ( nearest.distance == nil or d < nearest.distance ) then
			nearest = {distance = d, key=k}			
		end
	end
	player:moveto(spawn_points[nearest.key].pos)
	minetest.chat_send_player(player:get_player_name(),"You are at "..spawn_points[nearest.key].name)
end

minetest.register_on_respawnplayer(function ( player )
	local name = player:get_player_name()
	math.randomseed(os.time())
	local dm_key = math.random(1,10)	
	local message = string.gsub(death_messages[dm_key],"#n#",name)
	minetest.chat_send_all(message)
	goto_nearest_spawn(player)
	return true
end)

function string:split(sep)
        local sep, fields = sep or ":", {}
        local pattern = string.format("([^%s]+)", sep)
        self:gsub(pattern, function(c) fields[#fields+1] = c end)
        return fields
end

minetest.after(0,loadspawns)