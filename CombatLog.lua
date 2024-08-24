local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function()
	if GetCVarBool("advancedCombatLogging") then
		LoggingCombat(IsInInstance())
	end
end)
