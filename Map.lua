local f = CreateFrame("Frame")
f:RegisterEvent("USER_WAYPOINT_UPDATED")
f:SetScript("OnEvent", function()
	local point = C_Map.GetUserWaypoint()
	if not point then return end

	local map = C_Map.GetMapInfo(point.uiMapID)
	print(format("%s %.2f %.2f", map.name, point.position.x * 100, point.position.y * 100))
end)
