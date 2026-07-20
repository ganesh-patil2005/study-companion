# 📚 Study Companion V2 — JEE / NEET Study Tracking App

> **A complete offline HTML-based personal study management system**

[![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/HTML)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![IndexedDB](https://img.shields.io/badge/Storage-IndexedDB-2f6fed?style=flat)](https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API)
[![No Server](https://img.shields.io/badge/No%20Server-100%25%20Offline-28a745?style=flat)](.)

---

## Why This App?

JEE and NEET preparation spans 2+ years, covering hundreds of concepts, thousands of practice problems, and dozens of revision cycles. Without a structured tracking system, students lose sight of weak areas, forget mistakes they've made before, and miss scheduled revisions.

**Study Companion V2** solves this by giving you **one place** to record, track, review and analyse everything — completely offline, no internet required, no login, no data sent anywhere. All data stays in your browser's local storage (IndexedDB).

---

## Getting Started

1. Open `index.html` in any modern browser (Chrome, Edge, Firefox)
2. The Dashboard shows live counts for all sections
3. Navigate to any section using the top navigation bar
4. All data is saved automatically — no internet needed

> **Important:** Always use the **same browser on the same device**. Data is stored locally per browser. Use **Export** on the Dashboard to create regular backups.

---

## Pages

### 📘 Learning Book — `learning_book.html`

**Purpose:** Record what you learn — concepts, theories, and key formulas.

| Step | Action |
|------|--------|
| 1 | Select **Subject** from dropdown (Physics / Chemistry / Mathematics / Biology) |
| 2 | Select **Chapter** — list filters automatically based on subject |
| 3 | Select or type **Topic** — autocomplete from subject + chapter |
| 4 | Write **My Understanding** in your own words |
| 5 | Add key **Formulas** for that topic |
| 6 | Click **Save** |

**Outcome:** A searchable personal textbook. Review these notes before exams instead of re-reading entire textbooks.

---

### ✏ Practice Book — `practice_book.html`

**Purpose:** Log every practice session — questions attempted, accuracy, time.

| Field | Description |
|-------|-------------|
| Subject / Chapter | What you practised |
| Difficulty | Easy / Medium / Hard |
| Questions | Total attempted |
| Correct / Wrong | Score breakdown |
| Time (min) | Session duration |
| Remarks | What to improve |

**Outcome:** The summary bar tracks total sessions, questions, correct answers and overall accuracy %. Identify which chapters need more practice.

---

### ⭐ Mistake Book — `mistake_book.html`

**Purpose:** The **most important** section. Record every mistake you make.

| Field | Description |
|-------|-------------|
| Mistake Type | Concept / Formula / Calculation / Careless / Other |
| Question | The question you got wrong |
| Wrong Thinking | What you thought incorrectly |
| Correct Concept | The right approach |
| Lesson Learned | One sentence to remember |
| Status | Pending → Revised |
| Revision Date | When to revisit this mistake |

**Outcome:** Students who track and review mistakes consistently score 15–20% higher.

> **Rule:** Mark a mistake as *Revised* only after you can solve a similar question correctly without any help.

---

### 📗 Formula Book — `formula_book.html`

**Purpose:** A quick-reference formula sheet you build yourself.

- Select Subject and Chapter
- Write the Formula — use the **symbol toolbar** to insert math symbols
- Add a **Shortcut / Memory Trick** (mnemonic, derivation hint, pattern)
- Mark as **Favourite: Yes** for critical formulas
- Click **Save**

#### Symbol Toolbar Tabs

| Tab | Symbols |
|-----|---------|
| **Greek** | α β γ δ ε θ λ μ π σ ω + uppercase Γ Δ Θ Λ Ξ Π Σ Ω |
| **Operators** | − ± × ÷ · √ ∛ ≠ ≈ ≡ ≤ ≥ ∝ ∞ ∴ ∵ ∈ |
| **Calculus** | ∫ ∬ ∮ ∂ ∇ Σ ∏ lim d/dx Δ |
| **Arrows** | → ← ↑ ↓ ⇒ ⇐ ⇔ ⇌ ⟹ |
| **Sup / Sub** | ⁰¹²³⁴⁵⁶⁷⁸⁹ (superscripts) · ₀₁₂₃₄₅₆₇₈₉ (subscripts) |

---

### 📙 Success Journal — `success_journal.html`

**Purpose:** Daily reflection — track progress, challenges, and goals.

Answer 5 prompts each day:
1. What did I learn today?
2. Biggest Challenge
3. My Best Achievement
4. What am I grateful for?
5. Tomorrow's Goal

**Outcome:** Daily reflection builds motivation and consistency. Reading old entries during tough phases reminds you how far you've come.

---

### 🔁 Revision Planner — `revision_planner.html`

**Purpose:** Schedule and track revision sessions to prevent forgetting.

#### Status Badges

| Badge | Meaning |
|-------|---------|
| 🟠 **Pending** | Not yet started |
| 🔵 **In Progress** | Partially revised |
| 🟢 **Completed** | Fully revised |

**Dashboard Alert:** The Revision Plans card shows a **red badge** with today's non-completed sessions listed — so you never miss a planned revision.

> **Tip:** Schedule revision at Day 1, Day 7, Day 30, and Day 90 after first studying a topic for maximum long-term retention.

---

### 👨 Parent Dashboard — `parent_dashboard.html`

**Purpose:** Parents log daily observations, encouragement and study discussion notes.

- Positive observation about the student's effort
- Appreciation given that day
- Whether a 10-minute study discussion happened
- General notes or encouragement

**Outcome:** Parental involvement is a proven factor in student performance.

---

## Subject Dropdown & Catalog System

All Subject and Chapter dropdowns are **pre-loaded with the full JEE/NEET syllabus**:

| Subject | Chapters |
|---------|----------|
| **Physics** | Mechanics, Thermodynamics, Electrostatics, Current Electricity, Magnetism, Optics, Modern Physics, Waves, Experimental Physics |
| **Chemistry** | Physical Chemistry, Organic Chemistry, Inorganic Chemistry |
| **Mathematics** | Algebra, Calculus, Coordinate Geometry, Trigonometry, Vectors & 3D Geometry, Statistics & Reasoning |
| **Biology** | Botany, Zoology |

### Adding Custom Entries

- Select **"+ Add New Subject..."** → type the name when prompted
- Select **"+ Add New Chapter..."** → type the chapter name
- Topic field supports free typing with autocomplete suggestions
- All new entries are **permanently saved** in the catalog for future use

---

## Export & Import (Backup / Restore)

| Feature | How | What |
|---------|-----|------|
| **Export All Data** | Dashboard → "Export All Data" | Full JSON backup of all sections |
| **Export CSV** | Each page → "Export CSV" | That page's data as a spreadsheet |
| **Import Data** | Dashboard → "Import Data" | Restores from JSON (adds, does not overwrite) |

### Backup Reminder

The Dashboard shows a **backup status banner** that tracks your last export:

- 🟢 **Green** — Backed up within 2 days
- 🟡 **Yellow** — 3–6 days since last export  
- 🔴 **Red** — 7+ days or never backed up

> **Best practice:** Export weekly and save the JSON to Google Drive or OneDrive.

---

## Important Notes

> ⚠️ **Data Safety:** All data is in your browser's IndexedDB. It is **not synced to the cloud**. If you clear browser data / site data, all records will be deleted. **Export regularly as a backup!**

| | |
|---|---|
| **Browser** | Always use the same browser on the same device |
| **Compatible** | Chrome 80+, Edge 80+, Firefox 75+, Safari 14+ |
| **Recommended** | Chrome or Edge |
| **Privacy** | No data leaves your device. No server, no login, no internet required |
| **Storage** | IndexedDB v5 · 8 stores: `learning` `practice` `mistakes` `formula` `journal` `revision` `parent` `catalog` |

---

## Using on Mobile (Android / iPhone)

### Option 1 — GitHub Pages (Recommended)

1. Upload all 8 HTML files to a free [GitHub](https://github.com) repository
2. Enable **Settings → Pages → Branch: main → Save**
3. Open your live URL in Chrome on Android
4. Tap **⋮ → Add to Home Screen** — works like an installed app

### Option 2 — Local file on Android

1. Copy HTML files to your phone
2. Open with **Kiwi Browser** or **Firefox for Android** (not Chrome — Chrome restricts IndexedDB for local files)
3. Bookmark the `index.html` file

> **Note:** Data is per-browser. Use Export/Import to transfer data between devices.

---

## Expected Outcomes

Students who use this system consistently for 6+ months typically see:

- ✅ Clear picture of strong vs. weak chapters across all subjects
- ✅ Zero repeat mistakes (every mistake recorded and revisited)
- ✅ Higher formula recall due to personal formula book + memory tricks
- ✅ Better time management by tracking practice session efficiency
- ✅ Consistent daily revision with no missed scheduled sessions
- ✅ Improved confidence from reading their own success journal entries
- ✅ Parent–student alignment on progress and goals

> The most successful JEE/NEET students don't just study more — they study **SMARTER** with a structured feedback loop. This app is that feedback loop.

---

## File Structure

```
StudyCompanion_V2/
├── index.html              # Dashboard (counts + today's revisions + backup reminder)
├── learning_book.html      # Learning notes by subject/chapter/topic
├── practice_book.html      # Practice session log with accuracy tracking
├── mistake_book.html       # Mistake tracker with revision workflow
├── formula_book.html       # Formula quick reference with symbol toolbar
├── success_journal.html    # Daily reflection journal
├── revision_planner.html   # Revision schedule with status badges
├── parent_dashboard.html   # Parent observation and encouragement log
├── README.md               # This file
└── README.txt              # Plain text version
```

---

## Version History

| Version | Changes |
|---------|---------|
| V2.0 | Full rewrite with improved UI/UX |
| V2.1 | Fixed IndexedDB version conflicts across all pages |
| V2.2 | Added Export (JSON + CSV) and Import functionality |
| V2.3 | Applied card layout, navigation bar, motivational quotes |
| V2.4 | Fixed emoji/icon encoding (HTML entities throughout) |
| V2.5 | Added JEE subject/chapter/topic catalog with seed data |
| V2.6 | Added Revision status badges (Pending / In Progress / Completed) |
| V2.7 | Added today's revision alert on Dashboard (red badge) |
| V2.8 | Replaced datalist inputs with proper SELECT dropdowns; self-learning catalog; Formula book symbol toolbar; Shortcut/Memory Trick column |
| V2.9 | Added Help modal (page-specific + full app guide) on all 8 pages |
| V2.10 | Added backup reminder banner with last-export tracking |

---

*Study Smart. Track Everything. Revise Consistently.*
