local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("SCENARIO_UPDATE")
f:SetScript("OnEvent", function()
	if GetCVarBool("advancedCombatLogging") then
		LoggingCombat(IsInInstance())
	end
end)
