local f = CreateFrame("Frame")
f:RegisterEvent("LOOT_READY")
f:RegisterEvent("LOOT_OPENED")
f:SetScript("OnEvent", function(_, event, autoloot)
	if autoloot and event == "LOOT_READY" then
		for i = 1, GetNumLootItems() do
			LootSlot(i)
		end
	end

	if autoloot and event == "LOOT_OPENED" then
		LootFrame:Hide()
	end
end)
