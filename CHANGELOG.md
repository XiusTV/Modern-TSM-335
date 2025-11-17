# TradeSkillMaster Changelog

All notable changes to TradeSkillMaster will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased] - Bug Fixes Release

### Date: [Current Date]

This release addresses critical errors and functional issues reported by users, improving stability and reliability of the TradeSkillMaster addon suite.

### Fixed

- **SetColorTexture Error in Analytics Dashboard**: Fixed `attempt to call method 'SetColorTexture' (a nil value)` error at `Core/Dashboard.lua:939` that prevented Analytics Dashboard from displaying on 3.3.5 clients. Enhanced TextureShim and added SafeSetColorTexture() helper function, replacing all 29 direct calls with safe wrapper.

- **NewModule Errors in Auctioning Sub-Modules**: Fixed `attempt to call method 'NewModule' (a nil value)` errors in 8 Auctioning module files. Changed all sub-modules to use `LibStub("AceAddon-3.0"):NewAddon()` directly with unique names, ensuring proper module initialization.

- **Missing AceAddon-3.0 Library in ItemTracker**: Fixed `Cannot find a library instance of "AceAddon-3.0"` error at `TradeSkillMaster_ItemTracker.lua:11`. Added safety checks and clear error messages, fixed 3 sub-modules to use AceAddon-3.0 directly.

- **SelectTab Error in TSMTabGroup**: Fixed error in SelectTab function at `GUI/TSMWidgets/TSMTabGroup.lua:178` that prevented tab switching. Added safety checks for events table and Fire method with fallback mechanisms.

- **Minimap Icon Not Showing**: Fixed minimap icon registration with proper error checking for LibDataBroker-1.1 and LibDBIcon-1.0, initialization of settings, and graceful handling of missing optional libraries.

- **/tsm Command Not Working**: Fixed slash command registration with multiple fallback mechanisms (Modules → TSM → SlashCmdList) to ensure commands work regardless of initialization order.

- **Quick Posting dbminmarket Cache Issue**: Fixed "its not finding a match for the current dbminmarket" error. Auto-fixes common typo "dbminmarket" → "dbminbuyout", added fallback to DBMarket, and improved error handling in price lookup functions.

### Changed

- Removed test/debug messages that appeared on login (Phase 4/5 test messages, Analytics Dashboard loaded message) for cleaner user experience. Test functions remain available but don't spam chat.

### Technical Improvements

- Enhanced error handling throughout the codebase with comprehensive checks and fallback mechanisms
- Improved code quality with better structure, safety checks, and backwards compatibility
- Better handling of optional dependencies and initialization timing issues

---

## Previous Versions

For the complete changelog history including all previous releases, please refer to:
**https://github.com/XiusTV/Modern-TSM-335/blob/main/CHANGELOG.md**

The original repository contains the full history of changes, features, and fixes from previous versions of Modern-TSM-335.

---

## Summary

This release fixes 7 critical and functional issues that were preventing TSM from working correctly for some users. All fixes include proper error handling and fallback mechanisms to ensure the addon works reliably even when optional dependencies are missing or initialization order varies.

**Total Files Modified**: 23 files  
**Critical Fixes**: 4  
**Functional Fixes**: 3  
**User Experience Improvements**: 1

---

## Testing Recommendations

After applying these fixes, please verify:
- [ ] Analytics Dashboard opens without errors (`/tsm analytics`)
- [ ] All Auctioning sub-modules load correctly
- [ ] ItemTracker loads without errors
- [ ] Tab switching works in TSM UI
- [ ] Minimap icon appears and is clickable
- [ ] `/tsm` command opens TSM window
- [ ] Quick Posting shows correct prices
- [ ] No test messages appear on login
- [ ] No errors in BugSack related to these fixes

---

## Known Issues

None at this time. If you encounter any issues, please report them with:
- Error messages (from BugSack if available)
- Steps to reproduce
- Your TSM version and module versions
- Any relevant screenshots

---

## Credits

Bug fixes and improvements by: [Your Name/Team]  
Based on user reports and error analysis

Original project: https://github.com/XiusTV/Modern-TSM-335
