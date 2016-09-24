function affects.registerAffect( aDef )
	-- Here we validate some values and add it to the affects._affects table
	minetest.log("action","Registering affect: "..aDef.name)
	
	if ( aDef.affectid == nil ) then
		return false
	end

	if ( #aDef.stages < 1 ) then
		return false
	end
		
	-- TODO add more checks here to ensure the affect definition won't crash the server	
	
	affects._affects[aDef.affectid] = aDef
	
end

function affects.removeAffect(name, affectid)
	if ( affects._affectedPlayers[name] ~= nil ) then
		if ( affectid == nil ) then
			return false
		else
			affects._affectedPlayers[name][affectid] = nil;
			if ( affects._affects[affectid].onremove ~= nil ) then
				player = minetest.get_player_by_name(name)
				player:set_physics_override({ speed=1, jump=1,gravity=1,sneak=true })	-- reset their physics
				affects._affects[affectid].onremove(name,player,affectid)
			end
			return true
		end
	end
	return false
end

function affects.affectPlayer(name, affectid)
	if ( affects._affectedPlayers[name] == nil ) then
		affects._affectedPlayers[name] = {}
	end
	
	if ( affects._affectedPlayers[name][affectid] == nil ) then
		if ( affects._affects[affectid] ~= nil ) then
			whoison.updateStats(name)
			local ns = ( whoison.getTimeOnline(name) + affects._affects[affectid].stages[1].time )
			affects._affectedPlayers[name][affectid] = { stage = 1, nextStage = ns, ran=false }
			applyAffect(name,affectid)
			return true
		else
			return false
		end
	end
end
 
