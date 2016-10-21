local NODE_YOUNG = "young"

nature = {}

local function set_young_node(pos)
    local meta = minetest.get_meta(pos)

    meta:set_string(NODE_YOUNG, "true")
    minetest.after(5,
	function(pos)
	    local meta = minetest.get_meta(pos)
	    meta:set_string(NODE_YOUNG, "false")
	end,
    pos)
end

local function is_not_young(pos)
if ( pos ~= nil ) then
    local meta = minetest.get_meta(pos)

    local young = meta:get_string(NODE_YOUNG)
    return young ~= "true"
end

end

function nature:grow_node(pos, nodename)
    if is_not_young(pos) then
	minetest.remove_node(pos)
	minetest.add_node(pos, { name = nodename })
	set_young_node(pos)

	minetest.log("info", nodename .. "has grown at " .. pos.x .. ","
	    .. pos.y .. "," .. pos.z)
    end
end
