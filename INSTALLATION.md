# Installation Guide - Modern TSM

## 📦 Quick Install

### Step 1: Download

**Option A - GitHub Download**:
1. Go to: https://github.com/XiusTV/Modern-TSM-335
2. Click green "Code" button
3. Select "Download ZIP"
4. Extract the ZIP file

**Option B - Git Clone**:
```bash
git clone https://github.com/XiusTV/Modern-TSM-335.git
```

### Step 2: Backup Current TSM (Important!)

Before installing, backup your current TSM:

```
Copy your current folders to a safe location:
- TradeSkillMaster
- TradeSkillMaster_Accounting  
- TradeSkillMaster_AuctionDB
- TradeSkillMaster_Auctioning
- TradeSkillMaster_Crafting
- TradeSkillMaster_Destroying
- TradeSkillMaster_ItemTracker
- TradeSkillMaster_Mailing
- TradeSkillMaster_Shopping
- TradeSkillMaster_Warehousing
```

### Step 3: Install Modern TSM

1. **Navigate** to your WoW directory:
   ```
   World of Warcraft\Interface\AddOns\
   ```

2. **Copy** all `TradeSkillMaster*` folders from the download to `AddOns\`

3. **Overwrite** existing files when prompted

### Step 4: Launch

1. **Start** World of Warcraft
2. **Login** to your character
3. **Reload UI**: `/reload`
4. **Open TSM**: `/tsm`

You should now see the modern dark theme with clean text menu bar! ✨

---

## ✅ Verification

After installation, verify it's working:

```
/tsm              - Opens TSM (should see modern UI)
/tsm theme        - Shows current theme (should be "modern")
```

**You should see:**
- ✨ Dark black interface
- 📝 Text-only menu bar at top
- 🌟 Gold "TSM" in top-left corner
- ✅ No big logo in center
- ⚡ Faster scan performance

---

## 🔄 Reverting to Original

If you need to go back:

1. **Close** World of Warcraft
2. **Delete** Modern TSM folders
3. **Restore** from your backup
4. **Restart** WoW

---

## 🐛 Troubleshooting

**Lua Errors on Load?**
- Verify all TradeSkillMaster* folders were copied
- Check file permissions
- Try clean install (delete old TSM first)

**Theme Not Applied?**
- Run `/reload`
- Check `/tsm theme` shows "modern"
- Manually select theme in TSM options

**Still See Icons?**
- Verify `TSMMainFrame.lua` was updated
- Check `MainFrame.lua` was updated
- Force `/reload`

---

**For more help, see README.md or open an issue on GitHub**

