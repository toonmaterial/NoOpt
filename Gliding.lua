local fs = UIParent:CreateFontString(nil, "OVERLAY", "GameTooltipText")
fs:SetPoint("BOTTOM", EncounterBar, "TOP", 0, 20)

local ticker

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_IS_GLIDING_CHANGED")
f:SetScript("OnEvent", function()
	if ticker then
		ticker:Cancel()
		ticker = nil
	end

	local isGliding = C_PlayerInfo.GetGlidingInfo()

	fs:SetShown(isGliding)

	if isGliding then
		local delay = .1
		local prevForwardSpeed = 0

		ticker = C_Timer.NewTicker(delay, function()
			local _, _, forwardSpeed = C_PlayerInfo.GetGlidingInfo()

			local acceleration = (forwardSpeed - prevForwardSpeed) / delay
			prevForwardSpeed = forwardSpeed

			fs:SetFormattedText("%.1f", acceleration)
			fs:SetShown(.1 <= abs(acceleration))
		end)
	end
end)
