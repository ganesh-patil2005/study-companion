================================================================================
  STUDY COMPANION V2  —  JEE / NEET Study Tracking App
  A complete offline HTML-based personal study management system
================================================================================

WHY THIS APP?
─────────────────────────────────────────────────────────────────────────────
JEE and NEET preparation spans 2+ years, covering hundreds of concepts,
thousands of practice problems, and dozens of revision cycles. Without a
structured tracking system, students lose sight of weak areas, forget
mistakes they've made before, and miss scheduled revisions.

Study Companion V2 solves this by giving you ONE PLACE to record, track,
review and analyse everything — completely offline, no internet required,
no login, no data sent anywhere. All data stays in your browser's local
storage (IndexedDB).

================================================================================
  HOW TO USE
================================================================================

GETTING STARTED
───────────────
1. Open index.html in any modern browser (Chrome, Edge, Firefox).
2. The Dashboard shows counts for all sections.
3. Navigate to any section using the top navigation bar.
4. All data is saved automatically in your browser — no internet needed.

IMPORTANT: Always use the SAME browser on the SAME device. Data is stored
locally per browser. Use Export (on the Dashboard) to create backups.

--------------------------------------------------------------------------------
  LEARNING BOOK  (learning_book.html)
--------------------------------------------------------------------------------
PURPOSE: Record what you learn — concepts, theories, and key formulas.

HOW TO USE:
• Select Subject from dropdown (Physics / Chemistry / Mathematics / Biology)
• Select Chapter — list filters automatically based on subject
• Select or type Topic — filters by subject + chapter
• Write "My Understanding" in your own words (the best way to learn!)
• Add key formulas for that topic
• Click Save

OUTCOME: A searchable personal textbook of everything you've studied.
Review these notes before exams instead of re-reading entire textbooks.

--------------------------------------------------------------------------------
  PRACTICE BOOK  (practice_book.html)
--------------------------------------------------------------------------------
PURPOSE: Log every practice session — questions attempted, accuracy, time.

HOW TO USE:
• Select Subject and Chapter
• Set Difficulty (Easy / Medium / Hard)
• Enter questions attempted, correct, wrong, and time taken
• Add remarks about the session
• Click Save

OUTCOME: Track accuracy trends per subject and chapter. The summary bar
shows total sessions, questions attempted, correct answers, and overall
accuracy. Use this to identify which chapters need more practice.

--------------------------------------------------------------------------------
  MISTAKE BOOK  (mistake_book.html)
--------------------------------------------------------------------------------
PURPOSE: The MOST IMPORTANT section. Record every mistake you make.

HOW TO USE:
• Select Subject and Chapter
• Choose Mistake Type: Concept / Formula / Calculation / Careless / etc.
• Write the Question you got wrong
• Write your Wrong Thinking (what you thought incorrectly)
• Write the Correct Concept (the right approach)
• Write Lesson Learned (one sentence you'll remember)
• Set Status: Pending / Revised
• Set a Revision Date to revisit this mistake
• Click Save

OUTCOME: Students who track and review mistakes consistently score 15-20%
higher. The summary shows breakdown by type — if Calculation errors are
high, focus on slow, careful working. If Concept errors dominate, go back
to theory.

IMPORTANT: Mark mistakes as "Revised" only after you can solve a similar
problem correctly without any help.

--------------------------------------------------------------------------------
  FORMULA BOOK  (formula_book.html)
--------------------------------------------------------------------------------
PURPOSE: A quick-reference formula sheet you build yourself.

HOW TO USE:
• Select Subject and Chapter
• Write the Formula exactly as it should be memorised
• Add a Shortcut / Memory Trick (mnemonics, patterns, derivation hints)
• Mark as Favourite: Yes (for most important formulas)
• Click Save

OUTCOME: Your personal formula quick-reference for last-minute revision.
Filter by subject to get a focused formula sheet per subject. The
"Shortcut / Trick" column helps you recall the formula faster.

--------------------------------------------------------------------------------
  SUCCESS JOURNAL  (success_journal.html)
--------------------------------------------------------------------------------
PURPOSE: Daily reflection — track progress, challenges, and goals.

HOW TO USE:
• Set today's date
• Answer all 5 prompts honestly:
  1. What did I learn today?
  2. Biggest Challenge
  3. My Best Achievement
  4. What am I grateful for?
  5. Tomorrow's Goal
• Click Save Journal

OUTCOME: Students who reflect daily are significantly more motivated and
consistent. Reading old entries during tough phases reminds you how far
you've come. Use tomorrow's goal to start each day with clear intent.

--------------------------------------------------------------------------------
  REVISION PLANNER  (revision_planner.html)
--------------------------------------------------------------------------------
PURPOSE: Schedule and track revision sessions to prevent forgetting.

HOW TO USE:
• Set a Revision Date
• Select Subject and Chapter to revise
• List the specific topics to cover
• Set Status: Pending / In Progress / Completed
• Click Save

STATUS COLOURS:
  Pending    = Not started  (orange badge)
  In Progress = Partially done  (blue badge)
  Completed  = Fully revised  (green badge)

DASHBOARD ALERT: The Dashboard Revision card shows a red badge and list
of today's revisions (non-completed only) so you never miss a session.

OUTCOME: The forgetting curve shows 80% of information is lost in 24 hours
without revision. Schedule sessions at Day 1, Day 7, Day 30, and Day 90
intervals for long-term retention.

--------------------------------------------------------------------------------
  PARENT DASHBOARD  (parent_dashboard.html)
--------------------------------------------------------------------------------
PURPOSE: A space for parents to record observations and daily support.

HOW TO USE:
• Set the date
• Write a positive observation about the student's effort
• Record appreciation given that day
• Note if a 10-minute meaningful study discussion happened
• Add general notes or encouragement
• Click Save

OUTCOME: Parental involvement is a proven factor in student performance.
A simple daily check-in builds trust, accountability, and motivation.

================================================================================
  SUBJECT DROPDOWN & CATALOG SYSTEM
================================================================================

All Subject and Chapter dropdowns are pre-loaded with the full JEE/NEET
syllabus:

  PHYSICS:     Mechanics, Thermodynamics, Electrostatics, Current Electricity,
               Magnetism, Optics, Modern Physics, Waves, Experimental Physics

  CHEMISTRY:   Physical Chemistry, Organic Chemistry, Inorganic Chemistry

  MATHEMATICS: Algebra, Calculus, Coordinate Geometry, Trigonometry,
               Vectors & 3D Geometry, Statistics & Reasoning

  BIOLOGY:     Botany, Zoology (with all NCERT chapters and topics)

ADDING CUSTOM ENTRIES:
• Select "+ Add New Subject..." → type the name when prompted
• Select "+ Add New Chapter..." → type the chapter name
• Topic field supports free typing with autocomplete suggestions
• All new entries are permanently saved in the catalog for future use

================================================================================
  EXPORT & IMPORT (Backup / Restore)
================================================================================

EXPORT ALL DATA  (Dashboard — "Export All Data" button)
• Downloads a single JSON backup: StudyCompanion_YYYY-MM-DD.json
• Contains ALL records from all sections
• Recommended: export weekly as a backup

EXPORT CSV  (on each page — "Export CSV" button)
• Downloads a CSV for that section only
• Opens in Excel / Google Sheets for analysis or printing

IMPORT DATA  (Dashboard — "Import Data" button)
• Select a previously exported JSON backup file
• Records are ADDED (not overwritten) to existing data
• Use to migrate data to a different browser or device

================================================================================
  IMPORTANT NOTES
================================================================================

DATA STORAGE:
• All data is in your browser's IndexedDB (local storage).
• It is NOT synced to the cloud or sent anywhere.
• If you clear browser data / site data, ALL records will be deleted.
  Export regularly as a backup!

BROWSER:
• Always use the SAME browser on the SAME device.
• Compatible with Chrome 80+, Edge 80+, Firefox 75+, Safari 14+.
• Recommended: Chrome or Edge.

PRIVACY:
• No data leaves your device. No server, no login, no internet required.

TECHNICAL:
• Uses IndexedDB v5 with 8 stores:
  learning, practice, mistakes, formula, journal, revision, parent, catalog

================================================================================
  EXPECTED OUTCOMES
================================================================================

Students who use this system consistently for 6+ months typically see:

  - Clear picture of strong vs. weak chapters across all subjects
  - Zero repeat mistakes (every mistake recorded and revisited)
  - Higher formula recall due to personal formula book + memory tricks
  - Better time management by tracking practice session efficiency
  - Consistent daily revision with no missed scheduled sessions
  - Improved confidence from reading their own success journal entries
  - Parent-student alignment on progress and goals

The most successful JEE/NEET students don't just study more — they study
SMARTER with a structured feedback loop. This app is that feedback loop.

================================================================================
  FILE STRUCTURE
================================================================================

  index.html            - Dashboard (counts + today's revisions + backup)
  learning_book.html    - Learning notes by subject/chapter/topic
  practice_book.html    - Practice session log with accuracy tracking
  mistake_book.html     - Mistake tracker with revision workflow
  formula_book.html     - Formula quick reference with memory tricks
  success_journal.html  - Daily reflection journal
  revision_planner.html - Revision schedule with status tracking
  parent_dashboard.html - Parent observation and encouragement log
  README.txt            - This file

================================================================================
  VERSION HISTORY
================================================================================

  V2.0  - Full rewrite with improved UI/UX
  V2.1  - Fixed IndexedDB version conflicts across all pages
  V2.2  - Added Export (JSON + CSV) and Import functionality
  V2.3  - Applied card layout, navigation bar, motivational quotes
  V2.4  - Fixed emoji/icon encoding (HTML entities throughout)
  V2.5  - Added JEE subject/chapter/topic catalog with seed data
  V2.6  - Added Revision status badges (Pending/In Progress/Completed)
  V2.7  - Added today's revision alert on Dashboard (red badge)
  V2.8  - Replaced datalist inputs with proper SELECT dropdowns
          Subject and Chapter now show real clickable dropdown lists
          Self-learning catalog: new entries saved for future use
          Formula book: Shortcut/Memory Trick column added

================================================================================
  Study Smart. Track Everything. Revise Consistently.
================================================================================