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
