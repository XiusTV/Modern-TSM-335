-- TSMGraph - Simple line graph for data visualization
-- Simplified version for gold tracking and price history

local TSM = select(2, ...)
local AceGUI = LibStub("AceGUI-3.0")

do
	local Type = "TSMGraph"
	local Version = 1
	
	local function Constructor()
		local frame = CreateFrame("Frame", nil, UIParent)
		frame:SetSize(400, 200)
		-- Note: SetClipsChildren doesn't exist in 3.3.5, rely on proper positioning
		
		local widget = {
			frame = frame,
			type = Type,
			dataPoints = {},
			minValue = 0,
			maxValue = 100,
			lines = {},
			linePool = {},
		}
		
		-- Background
		local bg = frame:CreateTexture(nil, "BACKGROUND")
		bg:SetAllPoints()
		bg:SetColorTexture(0.1, 0.1, 0.1, 0.8)
		widget.bg = bg
		
		-- Grid lines (horizontal)
		local gridLines = {}
		for i = 1, 5 do
			local line = frame:CreateTexture(nil, "ARTWORK")
			line:SetColorTexture(0.3, 0.3, 0.3, 0.3)
			line:SetHeight(1)
			tinsert(gridLines, line)
		end
		widget.gridLines = gridLines
		
		-- Methods
		function widget:OnAcquire()
			wipe(self.dataPoints)
			self:UpdateGraph()
		end
		
		function widget:OnRelease()
			-- Clean up lines
			for _, line in ipairs(self.lines) do
				line:Hide()
				line:ClearAllPoints()
			end
			wipe(self.lines)
			wipe(self.dataPoints)
			wipe(self.linePool)
		end
		
		function widget:SetData(dataPoints)
			-- dataPoints = { {x=timestamp, y=value}, ... }
			wipe(self.dataPoints)
			for _, point in ipairs(dataPoints) do
				tinsert(self.dataPoints, {x = point.x, y = point.y})
			end
			
			-- Calculate min/max
			if #self.dataPoints > 0 then
				self.minValue = self.dataPoints[1].y
				self.maxValue = self.dataPoints[1].y
				for _, point in ipairs(self.dataPoints) do
					self.minValue = math.min(self.minValue, point.y)
					self.maxValue = math.max(self.maxValue, point.y)
				end
				
				-- Add 10% padding
				local range = self.maxValue - self.minValue
				if range > 0 then
					self.minValue = self.minValue - range * 0.1
					self.maxValue = self.maxValue + range * 0.1
				else
					-- Flat line, add arbitrary range
					self.minValue = self.minValue - 10
					self.maxValue = self.maxValue + 10
				end
			end
			
			self:UpdateGraph()
		end
		
		function widget:UpdateGraph()
			-- Clear old lines (hide and return to pool)
			for _, line in ipairs(self.lines) do
				line:Hide()
				line:ClearAllPoints()
				tinsert(self.linePool, line)
			end
			wipe(self.lines)
			
			if #self.dataPoints < 2 then
				return
			end
			
			local width = self.frame:GetWidth()
			local height = self.frame:GetHeight()
			
			-- Ensure valid dimensions
			if width <= 0 or height <= 0 then
				return
			end
			
			-- Update grid lines
			for i, line in ipairs(self.gridLines) do
				local y = (height / 6) * i
				line:ClearAllPoints()
				line:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 0, -y)
				line:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", 0, -y)
			end
			
			-- Draw data line using points
			local minX = self.dataPoints[1].x
			local maxX = self.dataPoints[#self.dataPoints].x
			local rangeX = maxX - minX
			local rangeY = self.maxValue - self.minValue
			
			-- Prevent division by zero
			if rangeX == 0 then rangeX = 1 end
			if rangeY == 0 then rangeY = 1 end
			
			-- Draw vertical lines between points (more reliable rendering)
			for i = 1, #self.dataPoints - 1 do
				local p1 = self.dataPoints[i]
				local p2 = self.dataPoints[i + 1]
				
				-- Calculate normalized positions (0-1)
				local normX1 = (p1.x - minX) / rangeX
				local normY1 = (p1.y - self.minValue) / rangeY
				local normX2 = (p2.x - minX) / rangeX
				local normY2 = (p2.y - self.minValue) / rangeY
				
				-- Clamp to valid range
				normX1 = math.max(0, math.min(1, normX1))
				normY1 = math.max(0, math.min(1, normY1))
				normX2 = math.max(0, math.min(1, normX2))
				normY2 = math.max(0, math.min(1, normY2))
				
				-- Convert to pixel positions
				local x1 = normX1 * width
				local y1 = normY1 * height
				local x2 = normX2 * width
				local y2 = normY2 * height
				
				-- Get or create line from pool
				local line = tremove(self.linePool)
				if not line then
					line = self.frame:CreateTexture(nil, "OVERLAY")
					line:SetColorTexture(0, 1, 0, 1)  -- Green line
				end
				
				-- Draw simple vertical line segment (more reliable than angled)
				local dx = x2 - x1
				local dy = y2 - y1
				local length = math.sqrt(dx*dx + dy*dy)
				
				-- Ensure valid length
				if length > 0 and length < 10000 then
					line:SetSize(math.max(1, length), 2)
					line:ClearAllPoints()
					line:SetPoint("BOTTOMLEFT", self.frame, "BOTTOMLEFT", x1, y1)
					line:Show()
					tinsert(self.lines, line)
				end
			end
		end
		
		function widget:OnWidthSet(width)
			self:UpdateGraph()
		end
		
		function widget:OnHeightSet(height)
			self:UpdateGraph()
		end
		
		return AceGUI:RegisterAsWidget(widget)
	end
	
	AceGUI:RegisterWidgetType(Type, Constructor, Version)
end

