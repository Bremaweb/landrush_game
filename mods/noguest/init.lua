minetest.register_on_prejoinplayer(function(name, ip)
  if ( name:match("Guest[0-9]+") and name ~= "Guest8192" and name ~= "Guest7075" ) or name:match("[aA][dD][mM][iI][nN].+") then
      return "Please choose a proper username and try again."
  end
end)