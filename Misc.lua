SetCVar("alwaysCompareItems", true)
SetCVar("overrideArchive", false)

do
	local group = BagsBar

	local function show()
		UIFrameFadeIn(group, .075, group:GetAlpha())
	end

	local function hide()
		UIFrameFadeOut(group, .150, group:GetAlpha())
	end

	for _, f in ipairs { group:GetChildren() } do
		f:HookScript("OnEnter", show)
		f:HookScript("OnLeave", hide)
	end

	hide()
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.UnitAura, function(tooltip, data)
	local mountID = data.id and C_MountJournal.GetMountFromSpell(data.id)
	if not mountID then return end

	local source = select(3, C_MountJournal.GetMountInfoExtraByID(mountID))
	tooltip:AddLine(" ")
	tooltip:AddLine(WHITE_FONT_COLOR:WrapTextInColorCode(source))
end)

for name, type in pairs(Enum.TooltipDataType) do
	TooltipDataProcessor.AddTooltipPostCall(type, function(tooltip, data)
		if not data.id or not IsShiftKeyDown() then
			return
		end

		tooltip:AddLine(" ")
		tooltip:AddDoubleLine(
			WHITE_FONT_COLOR:WrapTextInColorCode(name .. " ID"),
			WHITE_FONT_COLOR:WrapTextInColorCode(data.id))
	end)
end
