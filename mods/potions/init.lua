potions = {}

potions.path = minetest.get_modpath("potions")
 
local fly_potion1 = {
		affectid = "fly1",
		name = "Level 1 Fly Potion",
		stages = {
					{
						time = 120,
						custom = { chance=100, func = function(name, player, affectid)
								local pPrivs = minetest.get_player_privs(name)									
								pPrivs["fly"] = true
								minetest.set_player_privs(name,pPrivs)
								minetest.chat_send_player(name,"You feel lite as the clouds, you can fly!",false)
							end, runonce=true }
					}
		},
		onremove = function(name, player, affectid)
				local pPrivs = minetest.get_player_privs(name)					
				pPrivs["fly"] = nil
				minetest.set_player_privs(name,pPrivs)
				minetest.chat_send_player(name,"You feel gravity take hold, you can no longer fly!",false)
			end
}

affects.registerAffect(fly_potion1)
 
local fly_potion2 = {
		affectid = "fly2",
		name = "Level 2 Fly Potion",
		stages = {
					{
						time = 300,
						custom = { chance=100, func = function(name, player, affectid)
								local pPrivs = minetest.get_player_privs(name)									
								pPrivs["fly"] = true
								minetest.set_player_privs(name,pPrivs)
								minetest.chat_send_player(name,"You feel lite as the clouds, you can fly!",false)
							end, runonce=true }
					}
		},
		onremove = function(name, player, affectid)
				local pPrivs = minetest.get_player_privs(name)					
				pPrivs["fly"] = nil
				minetest.set_player_privs(name,pPrivs)
				minetest.chat_send_player(name,"You feel gravity take hold, you can no longer fly!",false)
			end
}

affects.registerAffect(fly_potion2)

local fly_potion3 = {
		affectid = "fly3",
		name = "Level 3 Fly Potion",
		stages = {
					{
						time = 600,
						custom = { chance=100, func = function(name, player, affectid)
								local pPrivs = minetest.get_player_privs(name)									
								pPrivs["fly"] = true
								minetest.set_player_privs(name,pPrivs)
								minetest.chat_send_player(name,"You feel lite as the clouds, you can fly!",false)
							end, runonce=true }
					}
		},
		onremove = function(name, player, affectid)
				local pPrivs = minetest.get_player_privs(name)					
				pPrivs["fly"] = nil
				minetest.set_player_privs(name,pPrivs)
				minetest.chat_send_player(name,"You feel gravity take hold, you can no longer fly!",false)
			end
}

affects.registerAffect(fly_potion3)

local gravity_potion1 = {
	affectid = "gravity1",
	name = "Level 1 Anti Gravity Potion",
	stages = {
				{
					time = 120,
					physics = { gravity = .5 },
					custom = { chance=100, func = function(name, player, affectid)
						minetest.chat_send_player(name,"Gravity releases it's grasp on you")
					end,runonce=true}
				},
				{
					time = 240,
					custom = { chance=50, func = function(name, player, affectid)
						math.randomseed(os.time())
						local randgravity = (math.random() * 6)
						player:set_physics_override({gravity=randgravity})
						minetest.chat_send_player(name,"You feel funny...") 
					end
					}
				}
			},
	onremove = function(name, player, affectid)
		player:set_physics_override({gravity=1})
		minetest.chat_send_player(name,"You feel gravity's firm grasp take hold once again!",false)
	end
}
affects.registerAffect(gravity_potion1)

dofile(potions.path.."/items.lua")