-- ------------------------------------------------------------------------------ --
--                           TradeSkillMaster: Modern                           --
--          https://github.com/XiusTV/Modern-TSM-335                            --
--               All Rights Reserved - Backport to 3.3.5                        --
-- ------------------------------------------------------------------------------ --

local TSM = select(2, ...) or _G.TSM
if not TSM then error("TSM not found!") return end

local Dashboard = {}
local private = {
	mainFrame = nil,
	characterGuilds = {},
	unselectedCharacters = {},
	selectedTimeRange = nil,
	graphData = {},
}

local SECONDS_PER_DAY = 60 * 60 * 24
local TIME_RANGES = {
	{key = "1d", label = "1D", seconds = SECONDS_PER_DAY},
	{key = "1w", label = "1W", seconds = SECONDS_PER_DAY * 7},
	{key = "1m", label = "1M", seconds = SECONDS_PER_DAY * 30},
	{key = "3m", label = "3M", seconds = SECONDS_PER_DAY * 91},
	{key = "6m", label = "6M", seconds = SECONDS_PER_DAY * 183},
	{key = "1y", label = "1Y", seconds = SECONDS_PER_DAY * 365},
	{key = "all", label = "All", seconds = -1},
}

-- ============================================================================
-- Initialization
-- ============================================================================

function Dashboard.Initialize()
	-- Initialize GoldTracker
	TSM.GoldTracker.Initialize()
end

-- ============================================================================
-- UI Creation
-- ============================================================================

function Dashboard.Show()
	if private.mainFrame and private.mainFrame:IsShown() then
		private.mainFrame:Hide()
		return
	end
	
	if not private.mainFrame then
		private.CreateMainFrame()
	end
	
	private.RefreshData()
	private.mainFrame:Show()
end

function private.CreateMainFrame()
	-- Create main frame
	local frame = CreateFrame("Frame", "TSMDashboardFrame", UIParent)
	frame:SetSize(900, 600)
	frame:SetPoint("CENTER")
	frame:SetFrameStrata("DIALOG")
	frame:EnableMouse(true)
	frame:SetMovable(true)
	frame:RegisterForDrag("LeftButton")
	frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
	frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	
	-- Background
	local bg = frame:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(0.05, 0.05, 0.05, 0.95)
	frame.bg = bg
	
	-- Title
	local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	title:SetPoint("TOP", 0, -10)
	title:SetText("|cffffd700TSM Dashboard - Gold Tracking|r")
	frame.title = title
	
	-- Close button
	local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
	closeBtn:SetPoint("TOPRIGHT", -5, -5)
	frame.closeBtn = closeBtn
	
	-- Header frame for controls
	local header = CreateFrame("Frame", nil, frame)
	header:SetPoint("TOPLEFT", 10, -40)
	header:SetPoint("TOPRIGHT", -10, -40)
	header:SetHeight(30)
	frame.header = header
	
	-- Time range buttons
	private.CreateTimeRangeButtons(header)
	
	-- Graph frame
	local graphFrame = CreateFrame("Frame", nil, frame)
	graphFrame:SetPoint("TOPLEFT", 10, -80)
	graphFrame:SetPoint("BOTTOMRIGHT", -10, 60)
	frame.graphFrame = graphFrame
	
	-- Create graph using our TSMGraph component
	local AceGUI = LibStub("AceGUI-3.0")
	local graph = AceGUI:Create("TSMGraph")
	graph.frame:SetParent(graphFrame)
	graph.frame:SetAllPoints()
	-- Note: TSMGraph doesn't have SetHeading, it's just a graph widget
	frame.graph = graph
	
	-- Stats frame
	local statsFrame = CreateFrame("Frame", nil, frame)
	statsFrame:SetPoint("BOTTOMLEFT", 10, 10)
	statsFrame:SetPoint("BOTTOMRIGHT", -10, 10)
	statsFrame:SetHeight(40)
	
	local statsBg = statsFrame:CreateTexture(nil, "BACKGROUND")
	statsBg:SetAllPoints()
	statsBg:SetColorTexture(0.15, 0.15, 0.15, 0.8)
	
	-- Stats text
	local statsText = statsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	statsText:SetPoint("CENTER")
	statsText:SetText("Loading...")
	statsFrame.text = statsText
	frame.statsFrame = statsFrame
	
	private.mainFrame = frame
end

function private.CreateTimeRangeButtons(parent)
	local buttons = {}
	local xOffset = 0
	
	for i, range in ipairs(TIME_RANGES) do
		local btn = CreateFrame("Button", nil, parent)
		btn:SetSize(35, 22)
		btn:SetPoint("LEFT", xOffset, 0)
		
		local btnBg = btn:CreateTexture(nil, "BACKGROUND")
		btnBg:SetAllPoints()
		btnBg:SetColorTexture(0.2, 0.2, 0.2, 1)
		btn.bg = btnBg
		
		local btnText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		btnText:SetPoint("CENTER")
		btnText:SetText(range.label)
		btn.text = btnText
		
		btn.range = range
		btn:SetScript("OnClick", function(self)
			private.OnTimeRangeClicked(self.range)
		end)
		
		btn:SetScript("OnEnter", function(self)
			self.bg:SetColorTexture(0.3, 0.3, 0.3, 1)
		end)
		
		btn:SetScript("OnLeave", function(self)
			if private.selectedTimeRange == self.range.key then
				self.bg:SetColorTexture(0.4, 0.35, 0, 1) -- Gold for selected
			else
				self.bg:SetColorTexture(0.2, 0.2, 0.2, 1)
			end
		end)
		
		buttons[range.key] = btn
		xOffset = xOffset + 40
	end
	
	parent.timeButtons = buttons
	private.selectedTimeRange = "all"
	buttons["all"].bg:SetColorTexture(0.4, 0.35, 0, 1)
end

function private.OnTimeRangeClicked(range)
	private.selectedTimeRange = range.key
	
	-- Update button colors
	for key, btn in pairs(private.mainFrame.header.timeButtons) do
		if key == range.key then
			btn.bg:SetColorTexture(0.4, 0.35, 0, 1) -- Gold
		else
			btn.bg:SetColorTexture(0.2, 0.2, 0.2, 1)
		end
	end
	
	private.RefreshGraph()
end

-- ============================================================================
-- Data Functions
-- ============================================================================

function private.RefreshData()
	-- Get list of characters/guilds
	wipe(private.characterGuilds)
	TSM.GoldTracker.GetCharacterGuilds(private.characterGuilds)
	
	private.RefreshGraph()
end

function private.RefreshGraph()
	if not private.mainFrame or not private.mainFrame.graph then
		return
	end
	
	-- Get time range
	local minTime, maxTime = TSM.GoldTracker.GetGraphTimeRange(private.unselectedCharacters)
	local currentTime = time()
	
	-- Apply selected time range
	if private.selectedTimeRange and private.selectedTimeRange ~= "all" then
		for _, range in ipairs(TIME_RANGES) do
			if range.key == private.selectedTimeRange and range.seconds > 0 then
				minTime = currentTime - range.seconds
				maxTime = currentTime
				break
			end
		end
	end
	
	-- Generate graph data points (sample every hour)
	wipe(private.graphData)
	local step = 3600 -- 1 hour
	local numPoints = math.min(100, math.floor((maxTime - minTime) / step))
	step = math.max(step, math.floor((maxTime - minTime) / numPoints))
	
	for t = minTime, maxTime, step do
		local gold = TSM.GoldTracker.GetGoldAtTime(t, private.unselectedCharacters)
		table.insert(private.graphData, {
			x = t,
			y = gold / 10000, -- Convert copper to gold
		})
	end
	
	-- Add current time point
	local currentGold = TSM.GoldTracker.GetGoldAtTime(currentTime, private.unselectedCharacters)
	table.insert(private.graphData, {
		x = currentTime,
		y = currentGold / 10000,
	})
	
	-- Update graph
	if #private.graphData > 0 then
		private.mainFrame.graph:SetData(private.graphData)
	end
	
	-- Update stats
	private.UpdateStats()
end

function private.UpdateStats()
	if not private.mainFrame or not private.mainFrame.statsFrame then
		return
	end
	
	local currentGold = TSM.GoldTracker.GetGoldAtTime(time(), private.unselectedCharacters)
	
	-- Find high/low in current view
	local high, low = 0, math.huge
	for _, point in ipairs(private.graphData) do
		local copper = point.y * 10000
		if copper > high then high = copper end
		if copper < low then low = copper end
	end
	
	if low == math.huge then low = 0 end
	
	local statsText = string.format(
		"|cffffd700Current:|r %s  |cff00ff00High:|r %s  |cffff0000Low:|r %s  |cffaaaaaa(%d characters/guilds tracked)|r",
		private.FormatGold(currentGold),
		private.FormatGold(high),
		private.FormatGold(low),
		#private.characterGuilds
	)
	
	private.mainFrame.statsFrame.text:SetText(statsText)
end

function private.FormatGold(copper)
	-- Use TSMAPI for money formatting (not TSM)
	return TSMAPI:FormatTextMoney(copper, "|cffffd700", true)
end

-- ============================================================================
-- Module Registration
-- ============================================================================

TSM.Dashboard = Dashboard

