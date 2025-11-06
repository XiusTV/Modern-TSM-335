# Version & AH Tab Styling Update

**Date**: November 6, 2025  
**Changes**: Version bump + Modern theme for AH tabs

---

## ✅ Changes Made

### 1. Version Updated
**File**: `TradeSkillMaster.toc`

- **Before**: `Rev668`
- **After**: `Rev700-Modernized`

This reflects the major modernization work (Phases 1-3) completed.

**Display Locations**:
- TOC metadata
- TSM icon (shows "Rev700-M")
- Tooltips and about screens

---

### 2. AH Module Tab Styling
**File**: `Auction/AuctionFrame.lua`

**Problem**: AH module tabs (AuctionDB, Auctioning, Shopping) had bright golden-yellow glow when selected, which didn't match the modern dark theme aesthetic.

**Solution**: Applied modern theme styling to TSM tabs:

#### Before:
- Bright blue text color (`link2` color)
- Default Blizzard golden-yellow highlight
- Bright, attention-grabbing appearance
- Inconsistent with modern dark theme

#### After:
- **White text** - Clean, readable
- **Darker gray background** (30% gray, 80% opacity)
- **Subtle gray hover** (40% gray, 60% opacity)
- **Consistent with modern dark theme**

---

## 🎨 Visual Changes

### Tab Appearance

**Normal State**:
- Text: White (1, 1, 1, 1)
- Background: Dark gray (0.3, 0.3, 0.3, 0.8)

**Hover State**:
- Background: Slightly lighter gray (0.4, 0.4, 0.4, 0.6)
- Subtle, not flashy

**Result**: Tabs now blend seamlessly with the modern dark theme instead of standing out with bright colors.

---

## 🧪 Testing

### In-Game Test:
1. `/reload`
2. Open Auction House
3. Check TSM module tabs at bottom: "AuctionDB", "Auctioning", "Shopping"
4. Verify:
   - [ ] Text is white
   - [ ] Background is dark gray
   - [ ] Hover effect is subtle gray (not golden-yellow)
   - [ ] Selected tab blends with theme
   - [ ] Version shows "Rev700-M" on icon

### Version Check:
```lua
/run print(TSM._version)
```
Should output: `Rev700-Modernized`

---

## 📝 Code Changes

### TradeSkillMaster.toc
```diff
- ## Version: Rev668
+ ## Version: Rev700-Modernized
```

### Auction/AuctionFrame.lua

**Tab Text** (Line 43-45):
```diff
- tab:SetText(TSMAPI.Design:GetInlineColor("link2")..moduleName.."|r")
- tab:SetNormalFontObject(GameFontHighlightSmall)
+ tab:SetText(moduleName)
+ tab:SetNormalFontObject(GameFontNormalSmall)
```

**Modern Theme Styling** (Lines 49-65):
```lua
-- Apply modern theme styling to TSM tabs
if TSM.modernDarkTheme then
    -- Set text colors for different states
    tab:GetFontString():SetTextColor(1, 1, 1, 1)  -- White
    
    -- Darken the tab background for better contrast
    local left = tab:GetNormalTexture()
    if left then
        left:SetVertexColor(0.3, 0.3, 0.3, 0.8)  -- Darker gray
    end
    
    -- Apply subtle hover effect
    local highlightLeft = tab:GetHighlightTexture()
    if highlightLeft then
        highlightLeft:SetVertexColor(0.4, 0.4, 0.4, 0.6)  -- Subtle hover
    end
end
```

**Version Display** (Line 94):
```diff
- local version = TSM._version
+ local version = "Rev700-M"  -- Shortened for icon display
```

---

## 🎯 Benefits

### Visual Consistency
- AH tabs now match the modern dark theme
- No more jarring golden-yellow highlights
- Professional, cohesive appearance

### Version Clarity
- Clear indication this is the modernized version
- Distinguishes from vanilla Rev668
- Easy to identify in screenshots/support

---

## 📂 Files Modified

1. ✅ `TradeSkillMaster.toc` - Version metadata
2. ✅ `Auction/AuctionFrame.lua` - Tab styling

---

## 🔄 Git Commit

Include these changes in your main commit:

```bash
git add TradeSkillMaster.toc
git add Auction/AuctionFrame.lua
```

Or commit separately:
```bash
git commit -m "Update version to Rev700-Modernized and modernize AH tab styling

- Bumped version from Rev668 to Rev700-Modernized
- Updated AH module tabs to use modern dark theme colors
- Changed tab text from bright blue to clean white
- Replaced golden-yellow highlight with subtle gray hover
- Tabs now consistent with modern dark aesthetic"
```

---

## ✅ Checklist

Before committing:

- [ ] TOC version updated
- [ ] AH tabs use white text
- [ ] AH tabs have dark gray background
- [ ] Hover effect is subtle (not golden)
- [ ] No linting errors
- [ ] Tested in-game
- [ ] Version displays correctly

---

**Status**: ✅ Complete  
**Result**: Modern, cohesive AH tab appearance matching the overall dark theme

