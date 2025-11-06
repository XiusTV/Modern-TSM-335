# Testing & GitHub Commit Guide

**Goal**: Test all 3 phases and commit to GitHub  
**Time**: 15-20 minutes  
**Date**: November 6, 2025

---

## 📋 Step 1: In-Game Testing (10 minutes)

### 1.1 Reload and Check for Errors
```lua
/console scriptErrors 1
/reload
```

**✅ Success**: No Lua errors appear

---

### 1.2 Test Phase 1 (Foundation)
```lua
/run TestPhase1()
```

**✅ Expected Output**:
```
=== Phase 1 Foundation Tests ===
Test 1: LibTSMClass...
  PASS - LibTSMClass working
Test 2: TempTable...
  PASS - TempTable working
Test 3: Table utilities...
  PASS - Table utils working
Test 4: SettingsHelper...
  PASS - SettingsHelper working
=== All Phase 1 Tests PASSED! ===
```

---

### 1.3 Test Phase 2 (Database)
```lua
/run TestPhase2()
```

**✅ Expected Output**:
```
=== Phase 2 Database System Tests ===
Test 1: Schema creation...
  PASS - Schema working
... (10 tests total)
=== All Phase 2 Tests PASSED! ===
```

**Optional**: Test auction example
```lua
/run TestPhase2Auction()
```

---

### 1.4 Test Phase 3 (UI Components)
```lua
/run TestPhase3()
```

**✅ Expected Output**:
```
=== Phase 3 UI Components Tests ===
Test 1: DividedContainer...
  PASS - DividedContainer working
... (4 tests total)
=== All Phase 3 Tests PASSED! ===
```

**⭐ VISUAL DEMO** (Recommended):
```lua
/run TestPhase3Visual()
```

This creates a window with:
- Draggable split panel (drag the divider!)
- Collapsible sections (click headers!)
- Price editor with validation
- Graph with sample data

---

### 1.5 Test TSM Still Works
```lua
/tsm
```

**✅ Success**: TSM opens normally, no errors

---

## 📤 Step 2: Copy Files to GitHub Folder (5 minutes)

Navigate to Interface folder:

```powershell
cd "E:\Games\Ascension\Live\Interface"
```

### 2.1 Create Directories (if needed)

```powershell
# Phase 1 directories
New-Item -ItemType Directory -Force -Path "Modern-TSM-335\TradeSkillMaster\Libs\LibTSMClass"
New-Item -ItemType Directory -Force -Path "Modern-TSM-335\TradeSkillMaster\Core\Util"
New-Item -ItemType Directory -Force -Path "Modern-TSM-335\TradeSkillMaster\Core\Settings"

# Phase 2 directories
New-Item -ItemType Directory -Force -Path "Modern-TSM-335\TradeSkillMaster\Core\Database"

# Phase 3 directories
New-Item -ItemType Directory -Force -Path "Modern-TSM-335\TradeSkillMaster\GUI\TSMComponents"

# Tests directory
New-Item -ItemType Directory -Force -Path "Modern-TSM-335\TradeSkillMaster\Tests"
```

### 2.2 Copy All Files

```powershell
# Phase 1 files
Copy-Item "AddOns\TradeSkillMaster\Libs\LibTSMClass\*" -Destination "Modern-TSM-335\TradeSkillMaster\Libs\LibTSMClass\" -Recurse -Force
Copy-Item "AddOns\TradeSkillMaster\Core\Util\*" -Destination "Modern-TSM-335\TradeSkillMaster\Core\Util\" -Force
Copy-Item "AddOns\TradeSkillMaster\Core\Settings\*" -Destination "Modern-TSM-335\TradeSkillMaster\Core\Settings\" -Force

# Phase 2 files
Copy-Item "AddOns\TradeSkillMaster\Core\Database\*" -Destination "Modern-TSM-335\TradeSkillMaster\Core\Database\" -Force

# Phase 3 files
Copy-Item "AddOns\TradeSkillMaster\GUI\TSMComponents\*" -Destination "Modern-TSM-335\TradeSkillMaster\GUI\TSMComponents\" -Force

# Test files
Copy-Item "AddOns\TradeSkillMaster\Tests\TestPhase*.lua" -Destination "Modern-TSM-335\TradeSkillMaster\Tests\" -Force

# TOC file
Copy-Item "AddOns\TradeSkillMaster\TradeSkillMaster.toc" -Destination "Modern-TSM-335\TradeSkillMaster\" -Force

# Documentation
Copy-Item "PHASE*" -Destination "Modern-TSM-335\" -Force
Copy-Item "TESTING_AND_COMMIT_GUIDE.md" -Destination "Modern-TSM-335\" -Force

Write-Host "All files copied successfully!" -ForegroundColor Green
```

---

## 🔍 Step 3: Verify Files Copied

```powershell
cd Modern-TSM-335

# Check Phase 1
ls TradeSkillMaster/Libs/LibTSMClass/LibTSMClass.lua
ls TradeSkillMaster/Core/Util/TempTable.lua
ls TradeSkillMaster/Core/Settings/SettingsHelper.lua

# Check Phase 2
ls TradeSkillMaster/Core/Database/Database.lua
ls TradeSkillMaster/Core/Database/Query.lua

# Check Phase 3
ls TradeSkillMaster/GUI/TSMComponents/TSMDividedContainer.lua
ls TradeSkillMaster/GUI/TSMComponents/TSMGraph.lua

# Check tests
ls TradeSkillMaster/Tests/TestPhase1.lua
ls TradeSkillMaster/Tests/TestPhase2.lua
ls TradeSkillMaster/Tests/TestPhase3.lua
```

**✅ Success**: All files exist

---

## 📝 Step 4: Git Commit

### 4.1 Check Status

```bash
git status
```

You should see new files in:
- `TradeSkillMaster/Libs/LibTSMClass/`
- `TradeSkillMaster/Core/Util/`
- `TradeSkillMaster/Core/Settings/`
- `TradeSkillMaster/Core/Database/`
- `TradeSkillMaster/GUI/TSMComponents/`
- `TradeSkillMaster/Tests/`
- Documentation files

---

### 4.2 Add Files

```bash
# Add all new Phase 1-3 files
git add TradeSkillMaster/Libs/LibTSMClass/
git add TradeSkillMaster/Core/Util/
git add TradeSkillMaster/Core/Settings/
git add TradeSkillMaster/Core/Database/
git add TradeSkillMaster/GUI/TSMComponents/
git add TradeSkillMaster/Tests/
git add TradeSkillMaster/TradeSkillMaster.toc

# Add documentation
git add PHASE1_COMPLETION_SUMMARY.md
git add PHASE1_FILES_CHECKLIST.md
git add PHASE2_COMPLETION_SUMMARY.md
git add PHASE2_FILES_CHECKLIST.md
git add PHASE3_COMPLETION_SUMMARY.md
git add PHASE3_FILES_CHECKLIST.md
git add PHASES_1_2_3_COMPLETE_README.md
git add TESTING_AND_COMMIT_GUIDE.md
```

---

### 4.3 Commit

```bash
git commit -m "Phases 1-3 Complete: Foundation, Database, UI Components

PHASE 1: Foundation (OOP Framework)
- Added LibTSMClass: Object-oriented programming with inheritance
- Added TempTable: Memory-efficient object pooling
- Added Table utilities: Helper functions for table operations
- Added SettingsHelper: Enhanced settings validation

PHASE 2: Database System (SQL-like Queries)
- Added Schema: Table structure definition with validation
- Added Row: Type-safe database records
- Added QueryClause: WHERE condition evaluation
- Added Query: SQL-like query builder with fluent API
- Added Table: Indexed data storage for improved performance
- Added Database: Multi-table database management

PHASE 3: UI Components (Modern Interface)
- Added DividedContainer: Resizable split panels with draggable divider
- Added CollapsibleContainer: Expandable/collapsible sections
- Added CustomStringInput: Price string editor with validation
- Added Graph: Line graph for data visualization

Features:
- Object-oriented architecture using classes
- SQL-like database queries with indexed lookups
- Modern retail-style UI components
- Memory-efficient object pooling
- Type-safe data validation
- Comprehensive test suite

All tests passing. Production ready.
Next: Phase 4 - Dashboard & Gold Tracking"
```

---

### 4.4 Push to GitHub

```bash
git push origin main
```

**✅ Success**: Files pushed to GitHub

---

## ✅ Final Verification Checklist

After pushing to GitHub, verify:

- [ ] All in-game tests passed
- [ ] No Lua errors on `/reload`
- [ ] TSM still works: `/tsm`
- [ ] Files copied to Modern-TSM-335
- [ ] Git commit successful
- [ ] Git push successful
- [ ] Check GitHub website - files visible
- [ ] README updated
- [ ] Documentation complete

---

## 🎉 Success!

You've successfully:

✅ **Implemented** 3 major phases (Foundation, Database, UI)  
✅ **Tested** all components in-game  
✅ **Committed** to GitHub  
✅ **Documented** everything  

**Your TSM is now modernized with**:
- Object-oriented architecture
- Advanced database system
- Modern UI components
- Production-ready code

---

## 🚀 What's Next?

### Phase 4: Dashboard & Gold Tracking

**Build**:
- Gold tracker service (time-series data)
- Dashboard UI (using your new components!)
- Time range filtering
- Character selection
- Visual gold tracking graphs

**Time**: 2-3 weeks

---

## 📞 Troubleshooting

### Issue: Git conflict
```bash
git pull origin main
# Resolve conflicts
git add .
git commit
git push origin main
```

### Issue: Files not copied
- Check paths are correct
- Verify AddOns/TradeSkillMaster has the files
- Try copying individual files

### Issue: Tests fail
- Check for Lua errors: `/console scriptErrors 1`
- Re-read the error message
- Verify all files loaded in TOC

---

**Last Updated**: November 6, 2025  
**Status**: Ready to Commit  
**Next**: Push to GitHub!

