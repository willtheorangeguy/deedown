# Known Issues — deedown

Concrete defects and gaps found while writing this repository's documentation in
August 2026. **Nothing here was changed** — each one needs a code, configuration, or
licensing decision rather than a documentation one.

Ordered by severity. See [`docs/roadmap.md`](../roadmap.md) for the narrative version,
which also covers deliberate non-goals.


**7 open:** 1 high, 4 medium, 2 low.

## 1. The repository documents a twelve-step setup for code it does not contain

**Severity:** High  
**Where:** `1_playlists.cmd`; `README.md` and `docs/usage.md` steps 5 and 7

**What:** `1_playlists.cmd` deletes four files from `deedown/`, does `cd deedown`, and runs `wsl.exe -d Ubuntu python3 get_playlists.py`. There is no `deedown/` directory in this repository and no `get_playlists.py`. Step 5 of the setup instructions tells the reader to edit `secrets.py` in that directory; that file is not here either. What is here is three wrapper scripts, `requirements.txt`, and the docs. The README tagline does say the full code is on GitLab.

**Why it matters:** The disclaimer is one clause at the end of a tagline; the twelve-step guide that follows it is complete, confident, and describes a working program. A reader installs Windows prerequisites, sets up WSL, installs Python packages on both sides, registers a Deezer application, and gets to step 7 before discovering the program is not here. Every step before that is real work, and none of it is wasted only if they knew to go to GitLab first.

A partial mirror is a reasonable thing to want -- GitHub for visibility, GitLab for the code -- but this one is shaped like a complete repository. The three scripts present are exactly the ones that make it look runnable.

**Suggested fix:** Either bring `deedown/` across, or make the incompleteness the first thing on the page and cut the setup guide down to a pointer. This pass does the second: the README carries a blockquote above Key Features, and `docs/usage.md` and `docs/installation.md` each open with the same warning. The underlying decision -- mirror or move -- is still open.

## 2. 3_move.cmd deletes the download directory whether or not the move succeeded

**Severity:** Medium  
**Where:** `3_move.cmd`

**What:**     robocopy /move /e /nfl /njh "%USERPROFILE%\Downloads\deedwn\music" ...
    rmdir /s /q "%USERPROFILE%\Downloads\deedwn"

The `rmdir` is unconditional -- no check on robocopy exit code, and `/s /q` means recursive and silent. The source path is `deedwn`, not `deedown`, and it comes from deemix own configuration, which is not in this repository, so nothing here keeps the two in step.

**Why it matters:** The failure mode is data loss of exactly the thing the user just spent hours downloading. If deemix is configured to write anywhere other than `Downloads/deedwn/music` -- a different deemix version, a changed setting, or simply the `deedwn` spelling being reproduced as `deedown` -- the move copies nothing and the delete then removes the directory that actually holds the files, if it happens to be the one named. Silently, because `/q` suppresses the prompt and `/nfl /njh` suppress robocopy own output.

The `deedwn` spelling is used consistently in both lines, so it is not a typo in the script -- it is a value that has to match a setting living somewhere else, with nothing checking that it does.

**Suggested fix:** Gate the delete on robocopy exit code -- anything below 8 is success -- and fail loudly if the source path does not exist rather than proceeding to the delete. Documenting that the path is set in deemix configuration, which `docs/configuration.md` now does, is the minimum.

## 3. The shebang in 2_download.sh is on line 16

**Severity:** Medium  
**Where:** `2_download.sh`

**What:** The file opens with a fifteen-line GPL comment header, and `#!/bin/bash` appears after it. A shebang is only a shebang on line 1; anywhere else it is an ordinary comment. The documentation tells the reader to run the script as `./2_download.sh`.

**Why it matters:** Executed directly, the script runs under whatever the calling shell decides -- usually `sh` on a Debian-family WSL image, where `declare -a` and the array iteration are not portable. The failure is not obvious: it is a syntax error partway in, on a file whose first fifteen lines are a licence header, so the reported line number points into the middle of the script.

The same header is at the top of both `.cmd` files, where `rem` comments are harmless, which is presumably how it ended up above the shebang here -- the header was applied uniformly across all three scripts without noticing that one of them has a first-line requirement.

**Suggested fix:** Move `#!/bin/bash` to line 1 and put the licence header below it. `bash 2_download.sh` is the workaround, and `docs/troubleshooting.md` now says so.

## 4. Nothing warns that the arl is a full-account session token

**Severity:** Medium  
**Where:** `README.md` and `docs/usage.md` step 11 (both amended in this pass)

**What:** Step 11 instructs the reader to open devtools on deezer.com, find the `arl` cookie, copy it, and paste it into the terminal. It is described only as a long code the script may ask for. Nothing said what it is, how long it lasts, or what someone else could do with it.

**Why it matters:** The `arl` is a session token: it authenticates as the account holder, is not scoped to downloading, and does not expire when the user logs out elsewhere. Someone following a twelve-step guide with devtools open is being walked through extracting a credential equivalent to their password, and the guide gives it the same weight as the bitrate setting two steps earlier. The predictable next step is pasting it into a file next to the scripts, which is a directory under version control.

This is a documentation defect rather than a code one -- the script does the right thing by letting deemix prompt for it and store it -- but the omission is the part that causes harm.

**Suggested fix:** Amended in this pass: the README, `docs/README.md`, `docs/usage.md`, and `docs/configuration.md` all now say what the `arl` is and that it belongs only in the terminal prompt. A line in `.gitignore` covering the file deemix stores it in would be worth adding.

## 5. The terms the workflow breaks are linked but never stated

**Severity:** Medium  
**Where:** `README.md` (amended in this pass); `docs/legal/deezer.md`

**What:** `docs/legal/deezer.md` links Deezer terms of use and privacy policy under the heading "By using this service, you agree to also adhere to the following documents". Nothing anywhere said that the documented workflow -- extracting a session token and using deemix to pull the audio for entire playlists -- is contrary to those terms, or that the output is copyrighted recordings.

**Why it matters:** A link to a terms page is a formality; a sentence saying which term this breaks is information. The repository is public, the guide is complete and beginner-friendly down to which browser to use, and a reader could reasonably finish it without ever realising the activity is not permitted by the account they are using. That gap is worth closing whether or not the tool continues to exist -- the tool works either way; the reader deciding whether to use it does not have what they need.

**Suggested fix:** Amended in this pass: the README and `docs/README.md` now say plainly that downloading this way is contrary to Deezer terms and that the files are copyrighted recordings, alongside the existing links. Whether to keep the repository public is a separate decision and yours -- compare `Chavo-del-Ocho-Scaper`, which was stopped for the same class of question.

## 6. The download script ships the author own playlists rather than placeholders

**Severity:** Low  
**Where:** `2_download.sh`

**What:** Eight Deezer playlist URLs are commented out above the array, and one is live inside it. All nine are real playlist IDs. The instructions describe them as placeholders and say to replace them, referring to `https://www.deezer.com/en/playlist` as the placeholder form.

**Why it matters:** Running the script as shipped downloads someone else playlist rather than doing nothing, which is a surprising default for a step that takes hours. Calling them placeholders when they are live URLs also means a reader who deletes only the ones that look like the documented placeholder pattern leaves the real one behind.

Minor, and nothing is exposed -- Deezer playlist IDs are public -- but it is a small inconsistency in the one file every user has to edit.

**Suggested fix:** Replace them with an obviously fake example, or leave the array empty and have the script say so. An empty array currently produces a silent no-op, which would also be worth a message.

## 7. The legal documents linked their contact address without a scheme

**Severity:** Low  
**Where:** `docs/legal/privacy.md` and `docs/legal/terms.md` (both corrected in this pass)

**What:** Both ended with "By visiting our GitHub page: [github.com/willtheorangeguy/deedown](github.com/willtheorangeguy/deedown)". With no scheme, Markdown treats the target as a relative path, so it resolves to `docs/legal/github.com/willtheorangeguy/deedown` and 404s.

**Why it matters:** It is the contact route in a privacy policy -- the link a reader follows to ask what is held about them -- and it goes nowhere. Identical wording appears in `willtheorangeguy.github.io`, which suggests both were copied from the same template and the defect is wherever that template lives. A schemeless Markdown link is also invisible to review: it looks correct in source and fails only when rendered.

**Suggested fix:** Corrected in this pass in both files. Worth grepping every repository for `](github.com/` and fixing the template these came from -- two repositories have now been found with it.


---

## Also, across every repository

**`.bandit` is present on disk but untracked in git.** Verified in PyWorkout, treklogger,
skyscanner-cli, booking-cli, piggy, and aibot — the config file exists locally in each but
`git ls-files` does not know about it, so none of it reached GitHub.

The August 2026 security sweep therefore looks complete locally and landed nowhere. Worth
checking across all 44 repositories it covered.
