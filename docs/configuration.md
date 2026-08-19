# deedown — Configuration

Four things to set, in three different places, none of them a config file.

## `deedown/secrets.py` — Deezer application credentials

Create an application at [Deezer Developers](https://developers.deezer.com/) with:

| Field | Value |
|---|---|
| Name | deedown |
| Domain | localhost |
| Redirect URL | `http://localhost:23412/authfinsh` |
| Description | A basic app to convert playlists to Deezer |

Then put the values into `secrets.py`:

| Deezer field | `secrets.py` name |
|---|---|
| Application ID | `DEEZER_CLIENT_ID` |
| Secret Key | `DEEZER_CLIENT_SECRET` |
| Deezer User ID | `DEEZER_USER_ID` |

Your user ID is the ten-digit number at the end of your Deezer profile URL.

**`secrets.py` is not in this repository** — nor is the package it belongs to. It is on
[GitLab](https://gitlab.com/willtheorangeguy/deedown). Wherever you get it, it holds a client
secret, so keep it out of version control.

## `2_download.sh` — the playlist list

```bash
declare -a playlists=( "https://www.deezer.com/en/playlist/9416521802"
                      )
```

Replace the contents with your own playlist URLs, one per line, each in double quotes. Get them
by right-clicking a playlist title in Deezer and copying the link.

The file as shipped contains one live URL and eight more commented out above the array — all of
them the author's. They are not placeholders and following the instructions literally will
download someone else's playlists. Recorded in
[`internal/known-issues.md`](./internal/known-issues.md).

## `2_download.sh` — bitrate

```bash
deemix --bitrate 128 $i
```

`128`, `320`, or `flac`. The original documentation recommends 128 as a size-to-quality
compromise; that was written when storage was the constraint it no longer is, and `320` costs
little today.

## The download and destination paths

`3_move.cmd` moves from `%USERPROFILE%\Downloads\deedwn\music` to
`%USERPROFILE%\Music\Deemix Music`.

The source path is set by **deemix's own configuration**, not by anything here, so changing it
means changing deemix's settings and this script together. Note the spelling — `deedwn`, not
`deedown` — which is easy to reproduce incorrectly.

## Your Deezer `arl`

Not configuration exactly, but the credential the download step needs. deemix asks for it on
first run; you retrieve it from the browser:

1. Log into deezer.com, press F12.
2. Application → Cookies → `https://www.deezer.com`.
3. Filter for `arl`, copy the value.

**This is a session token, not an API key.** It grants full access to your Deezer account, does
not expire when you log out elsewhere, and is not scoped to downloading. Paste it into the
terminal that asks and nowhere else — never into a file in this directory.
