# deedown — Roadmap

Defects are in [`internal/known-issues.md`](./internal/known-issues.md); this page is what nobody
has built.

## Where it is

Three numbered scripts that work if you have the Python package they call, which is on GitLab
rather than here. Windows plus WSL only. Last touched in 2024.

## The standing limitation: this mirror is incomplete

The scripts `cd deedown` and run `get_playlists.py`; that directory is not in this repository.
The README says the full code is on GitLab, and the twelve-step guide here describes the complete
program regardless. Anyone following it against this copy gets as far as step 7.

Either bring the package across or make the README's first paragraph the loudest thing on the
page. The current arrangement — a complete-looking guide over an incomplete repository — is the
worst of both.

## Considered

**Removing the manual step.** The first script creates playlists on Deezer and knows their URLs;
the second needs them pasted in by hand. Writing them to a file the second script reads would
collapse steps 8 and 9 and remove the reason this is three scripts rather than one.

**Making `3_move.cmd` safe.** It deletes the download directory whether or not the move
succeeded. A conditional on robocopy's exit code is one line.

**A configuration file.** Playlist URLs, bitrate, and paths are edited in place in the scripts,
which means every update conflicts with local changes.

**Reporting unmatched tracks.** Track matching between Spotify and Deezer fails silently for
anything Deezer does not carry. `error_log.log` exists but is deleted at the start of every run,
so there is nothing to look at afterwards.

**Not being Windows-only.** The two `cmd` scripts do very little that bash could not, and the
WSL round-trip exists mainly because of them.

## Non-goals

**Bundling deemix.** deemix is a separate project with its own licence, distribution, and
relationship to Deezer. This wraps it; it does not ship it.

**Hosting anything.** The credentials involved are the user's own Deezer application secret and
their `arl` session token. Neither belongs on a server, which is why this is scripts on a
machine.

**Circumventing anything.** deemix does what it does; this project only sequences it. What that
means legally is in [`legal/deezer.md`](./legal/deezer.md), and it is the user's account and the
user's decision.

## Status

Copyright headers say 2020–2024 and nothing has moved since. Development, such as it is, happens
on [GitLab](https://gitlab.com/willtheorangeguy/deedown) — contributions to the program itself
belong there, not here.
