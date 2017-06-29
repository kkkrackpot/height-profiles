--[[

Automatically apply profiles depending on height of video frame.
Should work with mpv 0.25.0 and later.
This script is in public domain.

--]]



local utils = require 'mp.utils'

local profile = {
	fhd = "FHD profile",
	uhd = "UHD profile"
}

local function set_profile()
	if  mp.get_property_number("height") > 1080 then
		mp.commandv("apply-profile", profile.uhd)
		else
		mp.commandv("apply-profile", profile.fhd)
	end
end

mp.register_event("file-loaded", set_profile)
