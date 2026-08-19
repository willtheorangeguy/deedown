# deedown — Architecture

Three scripts, run by hand in order, with a manual step between the first and the second. Two run
in Windows `cmd`, one in a WSL shell — the split exists because `deemix` is a Linux tool and the
file handling is easier in Windows.

```
1_playlists.cmd  (cmd)   clears old state, runs the Python package under WSL,
                         which reads Spotify and creates the playlists on Deezer
        |
        |  you copy the new Deezer playlist URLs into the next script by hand
        v
2_download.sh    (WSL)   deemix downloads each playlist to ~/Downloads/deedwn
        |
        v
3_move.cmd       (cmd)   robocopy /move into %USERPROFILE%\Music\Deemix Music
```

## `1_playlists.cmd`

Deletes `error_log.log`, `new_playlists.txt`, `last_playlists.txt`, and `playlists.txt` from
`deedown\`, changes into that directory, and runs:

```
wsl.exe -d Ubuntu python3 get_playlists.py
```

Then removes `__pycache__` and prints instructions for the next step.

**`deedown/get_playlists.py` is not in this repository.** Neither is `secrets.py`, which the
setup instructions tell you to edit. The script will `cd` into a directory that does not exist
and invoke a file that is not there. This is the concrete form of the "placeholder repo" note in
the README — [`internal/known-issues.md`](./internal/known-issues.md).

## `2_download.sh`

A bash array of Deezer playlist URLs, iterated:

```bash
for i in "${playlists[@]}"
do
   deemix --bitrate 128 $i
done
```

Editing this array is the manual step. The file ships with eight of the author's own playlist URLs
commented out above the array and one live in it — see [Configuration](./configuration.md).

The shebang is on line 16, after the licence header, where it has no effect: `#!` is only a
shebang on the first line. The script is documented to be run as `./2_download.sh`, which relies
on it. Recorded in [`internal/known-issues.md`](./internal/known-issues.md).

## `3_move.cmd`

```
robocopy /move /e /nfl /njh "%USERPROFILE%\Downloads\deedwn\music" "%USERPROFILE%\Music\Deemix Music"
rmdir /s /q "%USERPROFILE%\Downloads\deedwn"
```

Moves the downloads into the music folder, then deletes the download directory — unconditionally,
whether or not the move succeeded. The path is `deedwn`, not `deedown`, and it is set in deemix's
own configuration, which is not in this repository, so nothing here makes the two agree. See
[`internal/known-issues.md`](./internal/known-issues.md).

## Why it is three scripts and not one

The playlist conversion is slow and rate-limited, the download is slower still, and the URLs of
the newly created Deezer playlists are only known after the first script has run. Splitting them
means a failure in the middle does not cost you the whole run — and the manual copy step in
between is the price of not having the first script hand its output to the second.

Automating that hand-off is the obvious improvement; see [Roadmap](./roadmap.md).

## Licence headers

All three scripts carry a GPL-3.0 header naming the program and the copyright years. They are
comments in `rem` and `#` form respectively, which is why `2_download.sh` has its shebang in the
wrong place.
