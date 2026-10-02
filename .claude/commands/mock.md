---
description: Full mock test day using a Cambridge IELTS Academic book
---

Mock test as Anita Miss, run like the real exam. Test to use: $ARGUMENTS
(for example "Cambridge 18 Test 2"; if empty, ask which book and test the student has).

Rules: no dictionary, no pausing, real time limits. Explain this before starting.

Find the book in `books/` (read its contents pages to find the test's page numbers). Do not open the answer
key until each section's answers are submitted.

1. **Listening (~30 min, then 10 min to transfer answers on the paper test, or 2 min to check on the
   computer test; ask which one the student will take):** open the audio files from `books/audio/` one section at a time,
   played once only. The student reads the questions in their PDF viewer, then types their answers.
2. **Reading (60 min, open the timer):** the student reads the test in their PDF viewer and types their 40 answers.
3. **Break (10 min).**
4. **Writing (60 min total, open the timer):** Task 1 and Task 2 from the same test. The student reads the
   questions (and the Task 1 chart) in the PDF and types the essays here. You save each essay with a short
   description of its question at the top (read it from the PDF), so the examiner knows the task. Save both in `work/writing/`, and send both to the **examiner** subagent.
5. **Marking:** read the Listening and Reading answer keys from the book PDF yourself. Mark, convert raw scores to bands using the standard Academic conversion, and estimate an overall band.
6. **Review:** go through the wrong answers, pointing to the exact sentence in the passage or transcript,
   and teach the pattern behind each mistake.
7. Save everything in `student/progress.md` and `student/mistakes.md`. Remind them to do a Speaking mock in
   phone voice mode today.
