# Phase 1 Files - Quick Reference Checklist

## ✅ Files to Copy to Modern-TSM-335 Folder

When you're ready to commit to GitHub, copy these files from `AddOns/` to `Modern-TSM-335/`:

### Core TSM Files
```
AddOns/TradeSkillMaster/
├── Libs/
│   └── LibTSMClass/
│       ├── LibTSMClass.lua          ✅ NEW
│       └── README.md                ✅ NEW
├── Core/
│   ├── Util/
│   │   ├── TempTable.lua            ✅ NEW
│   │   └── Table.lua                ✅ NEW
│   └── Settings/
│       └── SettingsHelper.lua       ✅ NEW
├── Tests/
│   └── TestPhase1.lua               ✅ NEW
└── TradeSkillMaster.toc             ✅ MODIFIED
```

### Documentation Files
```
Interface/
├── PHASE1_COMPLETION_SUMMARY.md     ✅ NEW
└── PHASE1_FILES_CHECKLIST.md        ✅ NEW (this file)
```

---

## 📋 Copy Commands (PowerShell)

```powershell
# Navigate to Interface directory
cd "E:\Games\Ascension\Live\Interface"

# Create directories in Modern-TSM-335 if needed
New-Item -ItemType Directory -Force -Path "Modern-TSM-335\TradeSkillMaster\Libs\LibTSMClass"
New-Item -ItemType Directory -Force -Path "Modern-TSM-335\TradeSkillMaster\Core\Util"
New-Item -ItemType Directory -Force -Path "Modern-TSM-335\TradeSkillMaster\Core\Settings"
New-Item -ItemType Directory -Force -Path "Modern-TSM-335\TradeSkillMaster\Tests"

# Copy new files
Copy-Item "AddOns\TradeSkillMaster\Libs\LibTSMClass\*" -Destination "Modern-TSM-335\TradeSkillMaster\Libs\LibTSMClass\" -Recurse -Force
Copy-Item "AddOns\TradeSkillMaster\Core\Util\*" -Destination "Modern-TSM-335\TradeSkillMaster\Core\Util\" -Force
Copy-Item "AddOns\TradeSkillMaster\Core\Settings\*" -Destination "Modern-TSM-335\TradeSkillMaster\Core\Settings\" -Force
Copy-Item "AddOns\TradeSkillMaster\Tests\TestPhase1.lua" -Destination "Modern-TSM-335\TradeSkillMaster\Tests\" -Force

# Copy modified TOC
Copy-Item "AddOns\TradeSkillMaster\TradeSkillMaster.toc" -Destination "Modern-TSM-335\TradeSkillMaster\" -Force

# Copy documentation
Copy-Item "PHASE1_COMPLETION_SUMMARY.md" -Destination "Modern-TSM-335\" -Force
Copy-Item "PHASE1_FILES_CHECKLIST.md" -Destination "Modern-TSM-335\" -Force

Write-Host "Phase 1 files copied successfully!" -ForegroundColor Green
```

---

## 🔍 Verification

After copying, verify these files exist in Modern-TSM-335:

```bash
cd Modern-TSM-335
ls TradeSkillMaster/Libs/LibTSMClass/LibTSMClass.lua      # Should exist
ls TradeSkillMaster/Core/Util/TempTable.lua               # Should exist
ls TradeSkillMaster/Core/Util/Table.lua                   # Should exist
ls TradeSkillMaster/Core/Settings/SettingsHelper.lua      # Should exist
ls TradeSkillMaster/Tests/TestPhase1.lua                  # Should exist
```

---

## 📤 Git Commit Commands

```bash
cd "E:\Games\Ascension\Live\Interface\Modern-TSM-335"

# Check status
git status

# Add new files
git add TradeSkillMaster/Libs/LibTSMClass/
git add TradeSkillMaster/Core/Util/
git add TradeSkillMaster/Core/Settings/
git add TradeSkillMaster/Tests/TestPhase1.lua
git add TradeSkillMaster/TradeSkillMaster.toc
git add PHASE1_COMPLETION_SUMMARY.md
git add PHASE1_FILES_CHECKLIST.md

# Commit
git commit -m "Phase 1 Complete: Foundation (OOP, Utilities, Settings)

- Added LibTSMClass: OOP framework with inheritance
- Added TempTable: Object pooling for memory efficiency  
- Added Table utilities: Helper functions for table operations
- Added SettingsHelper: Enhanced settings management
- Updated TOC with new files
- Added comprehensive test suite

All tests passing. Ready for Phase 2 (Database System)."

# Push to GitHub
git push origin main
```

---

## ✅ Final Checklist

Before committing:

- [ ] Tested in-game (`/run TestPhase1()`)
- [ ] All tests pass (green output)
- [ ] No Lua errors on `/reload`
- [ ] TSM still works normally
- [ ] Files copied to Modern-TSM-335
- [ ] Git status shows new files
- [ ] Commit message ready
- [ ] Ready to push to GitHub

---

**Last Updated**: November 6, 2025  
**Status**: Ready for Git Commit  
**Next**: Test in-game, then commit to GitHub

