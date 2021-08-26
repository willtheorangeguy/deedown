# deedown
Automatic playlist updater, and deemix track downloader. Can be run as a Windows service to always keep your playlists up to date.

The full code is available here on Gitlab: https://gitlab.com/willtheorangeguy/deedown. 
This repository only contains the scripts to run the Python programs. It assumes that you already have the neccesary prerequisites/code installed/downloaded. 

`1_playlists.cmd` and `3_move.cmd` are run from Command Prompt or PowerShell.
`2_download.sh` needs to be run from a Linux install on [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10). 

Finally, the downloaded files can be imported into [MusicBee](https://www.getmusicbee.com/) and synced between devices. 

## Resource Links
- https://stackoverflow.com/questions/3439954/looping-through-string-values-from-a-windows-command-line-bat-file
- https://stackoverflow.com/questions/9228950/what-is-the-alternative-for-users-home-directory-on-windows-command-prompt
- https://janakiev.com/blog/python-shell-commands/
- https://www.andrewcbancroft.com/blog/musings/make-bash-script-executable/
- https://stackoverflow.com/questions/57693460/using-wsl-bash-from-within-python
- https://unix.stackexchange.com/questions/82991/bash-is-not-finding-a-program-even-though-its-on-my-path
- https://stackoverflow.com/questions/122327/how-do-i-find-the-location-of-my-python-site-packages-directory?rq=1
- https://gist.github.com/nex3/c395b2f8fd4b02068be37c961301caa7
- https://stackoverflow.com/questions/8880603/loop-through-an-array-of-strings-in-bash
