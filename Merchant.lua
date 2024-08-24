local f = CreateFrame("Frame")
f:RegisterEvent("MERCHANT_SHOW")
f:SetScript("OnEvent", function()
	if IsShiftKeyDown() then
		return
	end

	if C_MerchantFrame.IsSellAllJunkEnabled() then
		C_MerchantFrame.SellAllJunkItems()
	end

	if CanMerchantRepair() then
		RepairAllItems()
	end
end)
