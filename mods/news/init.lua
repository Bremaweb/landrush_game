local news = {}
local news_player_stamps = {}

local file = io.open(minetest.get_worldpath().."/player_stamps.txt", "r")
if file then
	news_player_stamps = minetest.deserialize(file:read("*all"))
	file:close()
	if not news_player_stamps then
		news_player_stamps = {}
	end
end
local function update_hash()
	local file = io.open(minetest.get_worldpath().."/news.txt.md5", "r")
	local news_h
	if file then
		local news_hfile_content = file:read("*all")
		news_h = string.match(news_hfile_content, "(%w+)")
		file:close()
	end
	return news_h
end

local news_hash = update_hash()

local function compare_hashes(data, hash)
	if data ~= nil then
		if data == hash then
			return false
		else
			return true
		end
	else
		return nil
	end
end

local function save_file()
	local file = io.open(minetest.get_worldpath().."/player_stamps.txt", "w")
	if file then
		file:write(minetest.serialize(news_player_stamps))
		file:close()
	end
end


news.path = minetest.get_worldpath()

function news.formspec(player,article)

	if ( article == "" or article == nil ) then
		article = "news.txt"
	else
		article = "news_"..article..".txt"
	end

	local newsfile = io.open(news.path.."/"..article,"r")

	local formspec = "size[12,10]"

	if newsfile ~= nil then
		local newscontent = newsfile:read("*a")
		formspec = formspec.."textarea[.25,.25;12,10;news;;"..newscontent.."]"
	else
		formspec = formspec.."label[.25,.25;Article does not exist]"
	end
	formspec = formspec.."button_exit[.25,9;2,1;exit;Close"
	if ( newsfile ~= nil ) then
		newsfile:close()
	end
	return formspec
end

function news.show_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name,"news",news.formspec(player))
	minetest.log('action','Showing formspec to '..name)
end


minetest.register_chatcommand("news",{
	params = "<article>",
	description="Shows the server news",
	func = function (name,params)
		local player = minetest.get_player_by_name(name)
		minetest.show_formspec(name,"news",news.formspec(player,params))
	end,
})

minetest.register_on_joinplayer(function (player)
	local name = player:get_player_name()
	if news_player_stamps[name] == nil then
		news_hash = update_hash()
		news_player_stamps[name] = news_hash
		minetest.after(5,news.show_formspec,player)
		save_file()
	else
		news_hash = update_hash()
		if compare_hashes(news_player_stamps[name], news_hash) ~= nil and compare_hashes(news_player_stamps[name], news_hash) then
			news_player_stamps[name] = news_hash
			minetest.after(5,news.show_formspec,player)
			save_file()
		end
	end
end)

