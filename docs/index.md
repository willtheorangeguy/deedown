# deedown — Documentation

deedown converts Spotify playlists to Deezer, then downloads the tracks with
[deemix](https://gitlab.com/deemix) and sorts the files into your music folder. Three numbered
scripts, run in order, on Windows with WSL.

**This repository is a mirror, and an incomplete one.** The Python package the scripts call —
`deedown/get_playlists.py` and `deedown/secrets.py` — is not here. The full code lives on
[GitLab](https://gitlab.com/willtheorangeguy/deedown). Everything below describes the complete
program; following it against this repository alone will fail at step one. See
[`internal/known-issues.md`](./internal/known-issues.md).

```text
docs/
├── README.md            this index
├── installation.md      operating system, WSL, Python packages, accounts
├── usage.md             the twelve-step run-through
├── configuration.md     secrets.py, the playlist list, bitrate, paths
├── architecture.md      what each of the three scripts does
├── troubleshooting.md   concrete failures and what they mean
├── roadmap.md           gaps and deliberate non-goals
├── legal/
│   ├── deezer.md        Deezer's terms and privacy policy
│   ├── spotify.md       Spotify's terms and privacy policy
│   ├── privacy.md       this project's privacy notice
│   └── terms.md         this project's terms
└── internal/
    └── known-issues.md  defects found while documenting (not fixed)
```

## Before you use it

Two things the previous documentation did not say plainly.

**Step 11 asks for your `arl` cookie.** That is a long-lived Deezer session token. Anyone holding
it has your account — it is not an API key scoped to downloading, and it does not expire when you
log out elsewhere. Treat it like a password: paste it only into the terminal that is asking,
never into a file you might commit.

**Downloading tracks this way is against Deezer's terms of use**, which you agreed to when you
made the account, and the files it produces are copyrighted recordings. `legal/deezer.md` links
the terms; this project is not endorsed by or affiliated with Deezer or Spotify.

## Start here

- Setting it up — [Installation](./installation.md), then [Usage](./usage.md)
- What each script does before you run it — [Architecture](./architecture.md)
- Something failed — [Troubleshooting](./troubleshooting.md)
