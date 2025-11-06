**Other WotLK 3.3.5 Addons by XiusTV:**

* [ElvUI VibeUI](https://github.com/XiusTV/Elvui-VibeUI) - Modern ElvUI configuration
* [Modern TSM](https://github.com/XiusTV/Modern-TSM-335) - Performance-optimized TradeSkillMaster
* [PFQuest-WotLK](https://github.com/XiusTV/PFQuest-Wotlk) - Rework Coming Soon

Support: [Buy Me A Coffee](https://buymeacoffee.com/xius)

Interact with me on discord @ https://discord.gg/neEqeFFUsE for help related to all my addons!

# Modern TSM for WotLK 3.3.5

**Performance-optimized and visually modernized TradeSkillMaster suite for World of Warcraft 3.3.5 (Wrath of the Lich King).**

## About This Project

This is a **heavily optimized and modernized version** of TradeSkillMaster (TSM) for WotLK 3.3.5, featuring significant performance improvements and a complete visual overhaul inspired by retail TSM.

**⚠️ This is an independent optimization project.** The original TSM developers (Sapu94 and team) are not involved with this fork. Based on TSM 2.8+ with optimizations by Gnomezilla and XiusTV.

---

## 🚀 Key Features

### Phase 1: Foundation - Object-Oriented Architecture

* **LibTSMClass** - Full OOP framework with class inheritance
* **TempTable** - Memory-efficient object pooling to reduce garbage collection
* **Table Utilities** - Rich helper functions for data manipulation
* **SettingsHelper** - Enhanced settings validation and management

### Phase 2: Database System - SQL-like Queries

* **Schema System** - Define table structures with validation
* **Query Builder** - SQL-like interface for data queries
* **Indexed Lookups** - Dramatically faster searches with O(1) complexity
* **Type-Safe Data** - Validated data access with Row objects
* **Cleaner Code** - Replace manual loops with elegant queries

### Phase 3: UI Components - Modern Interface

* **DividedContainer** - Resizable split panels with draggable divider
* **CollapsibleContainer** - Expandable/collapsible sections for organization
* **CustomStringInput** - Price string editor with validation
* **Graph** - Data visualization for gold tracking and analytics

### Phase 4: Dashboard & Gold Tracking ⭐NEW

* **GoldTracker** - Time-series gold tracking across all characters
* **Dashboard UI** - Interactive dashboard with graphs and statistics
* **Time Range Filters** - 1D, 1W, 1M, 3M, 6M, 1Y, All Time
* **Character Filtering** - View all or select specific characters
* **Historical Data** - Query gold at any point in time
* **Auto-Cleanup** - Removes data older than 1 year

### Phase 5: Analytics & Accounting Integration ⭐NEW

* **AccountingTracker** - Bridge TSM_Accounting data to Dashboard
* **Sales/Expense Analytics** - Full transaction tracking with profit analysis
* **Multi-Series Graphs** - Visualize gold, sales, expenses simultaneously
* **Graph Modes** - Gold Only | Gold + Sales | Gold + Expenses | All
* **Analytics Tab** - Embedded directly in TSM options panel
* **Top Items** - Top 5 sellers and top 5 expenses
* **Transaction History** - Recent transaction details
* **Slash Commands** - `/tsm analytics`, `/tsm dashboard`, `/tsm dash`

### Performance Optimizations

* **Much faster auction scans** - Optimized threading and caching
* **Reduced memory usage** - Smart object pooling and cleanup
* **Faster error recovery** - Improved retry logic
* **Efficient calculations** - Single-pass algorithms
* **Smart caching** - LRU cache with auto-cleanup
* **Event-driven updates** - Only processes when needed
* **Hash-based detection** - Quick duplicate checking

### Modern UI Overhaul (Retail-Inspired)

* **Clean text-only menu bar** - No bulky icons, just like retail TSM
* **Modern dark theme** - Deep black backgrounds (15,15,15 RGB)
* **Gold highlights** - Selected tabs and headers (255,209,0 - retail-style)
* **Pure white text** - Maximum readability on dark backgrounds
* **Dynamic button widths** - Buttons size to fit text content
* **Multi-row support** - Automatically wraps menu items as needed
* **Smooth animations** - Blue hover glows and fade effects
* **3 theme options** - Modern Dark, Classic, High Contrast

### Additional Enhancements

* **Theme selector in GUI** - Easy switching via dropdown
* **Slash command theming** - `/tsm theme modern`
* **Enhanced buttons** - Better hover feedback and visibility
* **Responsive layout** - Adapts to window resizing
* **Backward compatible** - Works with all existing TSM data

---

## 🎯 What You Get

### Modern Architecture
- **Object-Oriented Design** - Classes, inheritance, clean code structure
- **Database System** - SQL-like queries replacing manual loops
- **Advanced UI Components** - Retail TSM-style interface elements
- **Type Safety** - Validated data access throughout
- **Memory Efficient** - Object pooling and smart caching

### Performance Improvements
- **Faster Scans** - Significantly improved auction scanning
- **Lower Memory** - Reduced memory footprint and garbage collection
- **Quick Queries** - Indexed lookups for instant results
- **Efficient Processing** - Optimized algorithms throughout

---

## 💾 Installation

### Method 1: Direct Download

1. **Download** this repository (Code → Download ZIP)
2. **Extract** the contents
3. **Copy** all `TradeSkillMaster*` folders to:
   ```
   World of Warcraft\Interface\AddOns\
   ```
4. **Restart** World of Warcraft
5. **Login** and type `/tsm`

### Method 2: Git Clone

```bash
cd "World of Warcraft\Interface\AddOns"
git clone https://github.com/XiusTV/Modern-TSM-335.git
# Copy TradeSkillMaster* folders from Modern-TSM-335 to AddOns
```

### First Launch

1. **Reload UI**: `/reload`
2. **Open TSM**: `/tsm`
3. **Modern theme** is applied automatically
4. **Enjoy** faster scans and cleaner interface!

---

## 🎨 Visual Themes

### Modern Dark (Default) ⭐

* Deep black backgrounds for reduced eye strain
* Gold headers and highlights (retail-style)
* Pure white text for maximum readability
* Thin 1px borders for contemporary look

**Apply**: Already default, or `/tsm theme modern`

### Classic

* Original TSM appearance
* Green headers and highlights
* Warmer color palette
* Traditional TSM feel

**Apply**: `/tsm theme classic`

### High Contrast

* Pure black backgrounds
* Maximum visibility
* Thick borders
* Perfect for bright monitors

**Apply**: `/tsm theme highcontrast`

---

## 🎯 Usage

### Opening TSM

```
/tsm                 - Open TSM window
```

### Changing Themes

**Via GUI** (Recommended):
1. `/tsm` → Click "TSM Status / Options"
2. Click "Options" tab
3. "TSM Appearance Options" section
4. Select theme from dropdown

**Via Command**:
```
/tsm theme           - List available themes
/tsm theme modern    - Modern dark theme
/tsm theme classic   - Classic green theme
```

### Analytics & Dashboard (Phases 4-5)

**Via GUI** (Recommended):
1. `/tsm` → Click "TSM Status / Options"
2. Click "Analytics" tab
3. View gold tracking, sales, expenses, and profit
4. Filter by time range (1D, 1W, 1M, 3M, 6M, 1Y, All)
5. Filter by character (All or select specific ones)
6. Switch graph modes (Gold Only, Gold + Sales, Gold + Expenses, All)

**Via Command**:
```
/tsm analytics       - Open analytics dashboard
/tsm dashboard       - Same as analytics
/tsm dash            - Short alias
```

### Testing Phase 1-5 Components

```lua
-- Test Foundation (OOP, Utilities)
/run TestPhase1()

-- Test Database System
/run TestPhase2()

-- Test UI Components
/run TestPhase3()

-- Visual Demo (Collapsible Sections + Graph)
/run TestPhase3Visual()

-- Test Dashboard & Gold Tracking
/run TestPhase4()

-- Test Analytics & Accounting Integration
/run TestPhase5()

-- Visual Demo (Live Dashboard)
/run TestPhase4Live()
/run TestPhase5Live()
```

### Performance Features (Automatic)

* Scans are **automatically faster** - no configuration needed
* Memory usage **automatically reduced**
* Database queries use indexed lookups
* Cache **auto-cleans** after 5 minutes
* All optimizations **work in background**

---

## 🔧 Technical Details

### Architecture Improvements

**Phase 1: Foundation**
1. **LibTSMClass** - OOP framework with inheritance
2. **TempTable** - Object pooling for memory efficiency
3. **Table Utilities** - Rich helper functions
4. **SettingsHelper** - Settings validation

**Phase 2: Database System**
5. **Schema** - Table structure definition
6. **Row Objects** - Type-safe records
7. **Query Builder** - SQL-like interface
8. **Indexed Tables** - Fast O(1) lookups
9. **Database Management** - Multi-table support

**Phase 3: UI Components**
10. **DividedContainer** - Resizable split panels
11. **CollapsibleContainer** - Expandable sections
12. **CustomStringInput** - Price editor with validation
13. **Graph** - Data visualization

### Performance Optimizations

14. **Threading Quantum** - Increased processing per frame
15. **Retry Logic** - Faster error recovery
16. **Hash Duplicate Detection** - Quick page comparison
17. **LRU Cache Management** - Size-limited with auto-cleanup
18. **Welford's Algorithm** - Single-pass calculations
19. **Event-Driven Updates** - Only when needed
20. **Hash Map Lookups** - O(1) item finding

### New Files Created

**Phase 1** (5 files):
* `Libs/LibTSMClass/` - OOP framework
* `Core/Util/TempTable.lua` - Object pooling
* `Core/Util/Table.lua` - Utilities
* `Core/Settings/SettingsHelper.lua` - Settings

**Phase 2** (6 files):
* `Core/Database/Schema.lua`
* `Core/Database/Row.lua`
* `Core/Database/QueryClause.lua`
* `Core/Database/Query.lua`
* `Core/Database/Table.lua`
* `Core/Database/Database.lua`

**Phase 3** (4 files):
* `GUI/TSMComponents/TSMDividedContainer.lua`
* `GUI/TSMComponents/TSMCollapsibleContainer.lua`
* `GUI/TSMComponents/TSMCustomStringInput.lua`
* `GUI/TSMComponents/TSMGraph.lua`

**Tests** (3 files):
* `Tests/TestPhase1.lua`
* `Tests/TestPhase2.lua`
* `Tests/TestPhase3.lua`

**Previously Added**:
* `Core/ModernTheme.lua` - Theme management

---

## 📖 Documentation

### Phase Documentation
* **PHASES_1_2_3_COMPLETE_README.md** - Complete overview
* **PHASE1_COMPLETION_SUMMARY.md** - Foundation details
* **PHASE2_COMPLETION_SUMMARY.md** - Database system
* **PHASE3_COMPLETION_SUMMARY.md** - UI components
* **TESTING_AND_COMMIT_GUIDE.md** - Testing instructions

### Implementation Guides
* **TSM_IMPLEMENTATION_GUIDE.md** - Master implementation guide
* **TSM_BACKPORT_ANALYSIS.md** - Feature analysis
* **TSM_PHASE2_DATABASE.md** - Database details
* **TSM_PHASE3_UI_COMPONENTS.md** - UI component details

### Additional Documentation
* **TSM_Performance_Analysis.md** - Technical deep dive
* **TSM_MODERN_THEME_README.md** - Theme guide
* **ALL_FIXES_COMPLETE.md** - Bug fix summary
* **VERSION_AND_STYLING_UPDATE.md** - Version changes

---

## ✅ Compatibility

* **WoW Version**: 3.3.5a (WotLK) - Tested on Warmane, Ascension
* **TSM Version**: Based on TSM 2.8+ (Revived for WotLK)
* **Backward Compatible**: 100% compatible with existing TSM data
* **Module Support**: All TSM modules fully supported
* **No Breaking Changes**: Drop-in replacement

---

## 🐛 Troubleshooting

### Scans Still Slow?

* Check server population (more auctions = longer scans)
* Try GetAll scan if available
* Verify optimized files are installed correctly

### Theme Not Applied?

* Run `/reload` to reload UI
* Check `/tsm theme` to verify current theme
* Select theme from GUI dropdown

### Memory Usage High?

* Reload UI after major scans (`/reload`)
* Cache auto-cleans after 5 minutes
* Clear TSM cache via options if needed

### Lua Errors?

* Restore backup of original TSM
* Verify all files copied correctly
* Check for conflicting addons

---

## 🙏 Credits

**This Modern TSM Fork:**

* **Optimizations and Modern UI by XiusTV**
* Performance analysis and implementation
* Retail-inspired visual overhaul
* Dynamic menu system

**Original TSM Development:**

* **Sapu94** - Original TSM creator
* **TSM Team** - Continued development
* **Gnomezilla** - Compact record algorithm and initial optimizations
* **Community** - Testing and feedback

**Based on**: TradeSkillMaster 2.8+ for WotLK (Revived)

---

## 📜 License

This addon follows the same license as the original TradeSkillMaster project.

**All Rights Reserved** - See original TSM license for details.

---

### Feature Requests

Suggestions for additional optimizations or features are welcome!

---

## 📈 Project Statistics

* **Architecture**: Object-oriented with full class system
* **Database**: SQL-like queries with indexed lookups
* **UI Components**: 4 modern retail-style components
* **Dashboard & Analytics**: Full gold tracking + sales/expense analytics ⭐NEW
* **New Files**: 23 files created (Foundation, Database, UI, Dashboard, Analytics)
* **Tests**: 68 comprehensive tests (18 Phase 1-3, 40 Phase 4, 14 Phase 5) ⭐UPDATED
* **Code Quality**: 0 linting errors
* **Compatibility**: 100% backward compatible

---

## 🚀 What's Next

### Phase 4: Dashboard & Gold Tracking ✅ COMPLETE
- ✅ Gold tracker service with time-series database
- ✅ Dashboard UI using DividedContainer + Graph
- ✅ Time range filtering (1D, 1W, 1M, 3M, 6M, 1Y, All)
- ✅ Character selection and filtering
- ✅ Historical gold queries

### Phase 5: Analytics & Accounting Integration ✅ COMPLETE
- ✅ AccountingTracker module bridging TSM_Accounting
- ✅ Sales and expense tracking with profit analysis
- ✅ Multi-series graphs (gold, sales, expenses)
- ✅ Analytics tab embedded in TSM options
- ✅ Top items and transaction history
- ✅ Full interactive UI with real-time updates

### Phase 6+: Advanced Features (Planned)
- Enhanced Ledger system with advanced filtering
- TaskList automation and queue management
- Advanced Crafting improvements
- Shopping list enhancements
- Mailing automation upgrades
- And more retail TSM4 features!

---

**Enjoy your modernized, lightning-fast TSM with full analytics!** 🚀

---

*Last Updated: November 6, 2025*  
*Version: Rev700-Modernized (Phases 1-5 Complete)*  
*Maintainer: XiusTV*

