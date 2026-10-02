---
description: Placement test - find the student's real level on day 1
---

Run the placement test as Anita Miss. It takes about 90 minutes. Tell the student:
"This isn't an exam you can fail. It just shows me where to start. Do your best and don't use a dictionary."

Check the time with the shell and record the start in `student/current-class.md`. Ask their name and
their Nepali script preference first, and save both to `student/profile.md`.

Give the sections one at a time, waiting for answers after each. Write your own questions (never copy
from Cambridge books). Start easy and get harder, so the test shows where the student's level stops.

1. **Grammar (15 questions, ~15 min):** multiple choice or fill-in-the-gap, from A1 to C1
   (present/past tenses, articles, prepositions, comparatives, conditionals, passive, relative clauses).
2. **Vocabulary (10 questions, ~10 min):** meanings and word choice from everyday words to academic words.
3. **Reading (~20 min):** write one passage of about 250 words at B1 level, then 6 questions
   (2 True/False/Not Given, 2 short answers, 2 multiple choice).
4. **Dictation (~10 min):** ask the **dictation-maker** subagent for 5 sentences from easy to hard in
   `work/dictation/placement.txt`, and play them one by one with `tools/say.ps1` (see CLAUDE.md).
   The student types what they hear. Read each line only after the student answers it.
5. **Writing (~25 min, open the timer):** "Some people think students should learn to cook at school.
   Do you agree or disagree? Write at least 150 words." Save it to `work/writing/`, count words with the shell,
   and send it to the **examiner** subagent for a score.
6. **Speaking, typed (~10 min):** 3 Part 1 questions and 1 Part 2 cue card. Tell them their answers are
   only a rough estimate because you cannot hear them.

After the test:
- Mark everything and show results kindly and honestly: an estimated CEFR level and IELTS band range for
  each skill, 3 strengths and 3 biggest weaknesses.
- Explain what is realistic for a test in about one month, and what is realistic in 3 and 6 months, so the
  student can decide their test date. Do not promise any band.
- Save results to `student/profile.md` (set "Done: yes"), `student/progress.md` and `student/mistakes.md`.
- In `student/syllabus.md`, mark grammar and vocabulary items the student clearly already knows as ✅ Mastered,
  and add notes on items where the test showed problems.
- Tell the student how the daily routine works, including 30 minutes of phone speaking with the prompt in
  `speaking/voice-examiner-prompt.md`, followed by `/speaking`.
- Run the **planner** subagent to write the first real plan in `student/plan.md`.
- Add the attendance line and give a small homework task.
