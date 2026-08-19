# deedown — Troubleshooting

## `1_playlists.cmd` fails immediately, or does nothing

The script does `cd deedown` and runs `get_playlists.py` from that directory. Neither the
directory nor the file is in this repository — it is a partial mirror. Get the full code from
[GitLab](https://gitlab.com/willtheorangeguy/deedown).

The same applies to the `secrets.py` the setup steps tell you to edit.

## `wsl.exe -d Ubuntu` is not recognised, or the distribution is missing

The script names Ubuntu specifically. If your WSL distribution is Debian or Kali, edit the `-d`
argument. `wsl.exe -l -v` lists what you have.

## `./2_download.sh: cannot execute`

Two possibilities. The file may not be executable — `chmod +x 2_download.sh`. Or the shebang: it
sits on line 16, below the licence header, where it is an ordinary comment rather than a shebang.
Running it as `bash 2_download.sh` sidesteps both.

## deemix asks for an `arl` every time

That is deemix's own credential storage, not this project's. It caches the value once accepted;
if it keeps asking, the value was rejected — re-copy it from the browser cookie, taking the whole
string.

Do not put it in a file in this directory.

## The downloads went somewhere unexpected

deemix decides the download location from its own configuration. `3_move.cmd` expects
`%USERPROFILE%\Downloads\deedwn\music` — note the spelling. If deemix is writing elsewhere,
either point deemix at that path or edit the script; nothing keeps them in step automatically.

## `3_move.cmd` moved nothing and then deleted the folder

The `rmdir /s /q` at the end runs whether or not the `robocopy` succeeded. If the source path was
wrong, the copy is a no-op and the delete still executes — recursively, with no prompt. Check the
source path before running it. Recorded in
[`internal/known-issues.md`](./internal/known-issues.md).

## Only some playlists downloaded

Check `2_download.sh` — the array holds only what you pasted into it, and the commented-out URLs
above it are not read. Each URL must be inside double quotes.

## The conversion takes hours

Expected. Both Spotify and Deezer rate-limit, and the work is per-track. The original
documentation puts it well: brew coffee, establish a plantation, come back later.

## Playlists exist on Deezer but are empty or partial

Track matching between services is imperfect — a track that Deezer does not have, or has under a
different release, will not match. There is no report of what failed to match beyond
`error_log.log`, which `1_playlists.cmd` deletes at the start of every run.

## Liked Songs did not come across

They are not a playlist. The documented workaround is to copy them into one, 50 at a time, before
running anything.
