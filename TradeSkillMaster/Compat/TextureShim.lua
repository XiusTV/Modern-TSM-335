-- Backport Texture:SetColorTexture for 3.3.5 clients.
local texture = CreateFrame("Frame"):CreateTexture()
local meta = getmetatable(texture)

if meta and meta.__index and not meta.__index.SetColorTexture then
	function meta.__index:SetColorTexture(r, g, b, a)
		if type(r) == "table" then
			return self:SetTexture(r[1], r[2], r[3], r[4])
		end
		return self:SetTexture(r, g, b, a)
	end
end

texture:Hide()
texture:SetTexture(nil)
texture = nil

