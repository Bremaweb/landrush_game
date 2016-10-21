-- Papyrus growing

local PAPYRUS_GROW_CHANCE = 10

minetest.register_abm({
    nodenames = { "default:papyrus" },
    interval = 1200,
    chance = PAPYRUS_GROW_CHANCE,

    action = function(pos, node, active_object_count, active_object_count_wider)
        if (minetest.get_node_light(pos, nil) < 6) then
            return
        end

        local under = {
            x = pos.x,
            y = pos.y - 1,
            z = pos.z
        }
        
	-- Grow up
        local above = {
            x = pos.x,
            y = pos.y + 1,
            z = pos.z
        }
        if(minetest.get_node(above).name == "air") then
	    nature:grow_node(above, "default:papyrus")
        end
    end
})
