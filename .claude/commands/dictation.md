---
description: Dictation drill - listen to English sentences and type them
---

Dictation drill as Anita Miss (about 15 minutes). Level/topic: $ARGUMENTS (if empty, use the student's level
and this week's vocabulary).

1. Ask the **dictation-maker** subagent to write 8 sentences to `work/dictation/YYYY-MM-DD.txt` (use today's
   date), at the student's level, using some words from `student/vocabulary.md`. Do not write or read the
   sentences yourself before the student answers.
2. Tell the student: "Listen carefully and type exactly what you hear."
3. Play each line with:
   `powershell -NoProfile -ExecutionPolicy Bypass -File tools/say.ps1 -File work/dictation/YYYY-MM-DD.txt -Line N`
   Play it twice if the student asks (`-Repeat 2`), and slower (`-Rate -3`) for beginners.
4. After each answer, read that line from the file, compare word by word and show the mistakes clearly.
5. At the end give a score out of 8, and add spelling mistakes to `student/mistakes.md`
   and new words to `student/vocabulary.md`.
