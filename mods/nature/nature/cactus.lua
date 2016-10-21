-- Cactus growing

local CACTUS_GROW_CHANCE = 15
local CACTUS_GROW_INDIV_CHANCE = 4
local CACTUS_MAX_DENSITY = 3
local NODE_TO_GROW = "default:cactus"

local function get_nearby_cactus_count(pos)
    local found_nodes = minetest.find_nodes_in_area(
	{ x = pos.x - 1, y = pos.y - 1, z = pos.z - 1 },
	{ x = pos.x + 1, y = pos.y + 1, z = pos.z + 1 },
	{ NODE_TO_GROW }
    )

    return table.getn(found_nodes)
end

local function grow_cactus(pos)
    for i = -1, 1 do
    for j = 0, 1 do
    for k = -1, 1 do
	if(math.abs(i) + math.abs(j) + math.abs(k) == 1) then
	    if(math.random(1, 100) <= CACTUS_GROW_INDIV_CHANCE) then
		local new_pos = {
		    x = pos.x + i,
		    y = pos.y + j,
		    z = pos.z + k
		}
		if(minetest.get_node(new_pos).name == "air") then
		    nature:grow_node(new_pos, NODE_TO_GROW)
		end
	    end
	end
    end
    end
    end
end

minetest.register_abm({
    nodenames = { NODE_TO_GROW },
    interval = 3600,
    chance = CACTUS_GROW_CHANCE,
    
    action = function(pos, node, active_object_count, active_object_count_wider)
	if get_nearby_cactus_count(pos) < CACTUS_MAX_DENSITY then
	    grow_cactus(pos)
	end
    end
})
