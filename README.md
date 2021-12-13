# deedown
Automatic playlist updater, and deemix track downloader. Syncs Spotify playlists to Deezer, then downloads audio tracks via deemix to your local music folder - all in three easy to use scripts. 

**This is only a placeholder repo with the main scripts!** All the other code and full instructions can be found on [GitLab](https://gitlab.com/willtheorangeguy/deedown/). 

## Requirements
- Windows 10 (Version 1903 or higher, with Build 18362 or higher)
- A [text editor](https://code.visualstudio.com/)
- Windows Subsystem for Linux
- An [Ubuntu](https://www.microsoft.com/store/apps/9n6svws3rx71), [Kali](https://www.microsoft.com/store/apps/9PKR34TNCV07) or [Debian](https://www.microsoft.com/store/apps/9MSVKQC78PK6) image from the Microsoft Store (others may work, but are untested)
- [Python 3](https://www.python.org/downloads/) (and `pip`)
- The following Python Packages: (these do not need to be individually installed, instalation instructions can be found below)
```
urwid
deemix
deezer-py
deezer-python
certifi==2020.6.20
chardet==3.0.4
html5lib==1.1
idna==2.10
python-dateutil==2.8.1
pytz==2020.1
requests==2.24.0
six==1.15.0
urllib3==1.25.10
webencodings==0.5.1
```
- A [Spotify](https://www.spotify.com/us/signup/) account
- A [Deezer](https://www.deezer.com/en/register) account
- Some playlists
- The [_deedown_ code](https://gitlab.com/willtheorangeguy/deedown/-/archive/main/deedown-main.zip) from this repo

## Installation
1. Ensure you have downloaded the code from this repo, and installed Python 3, Windows 10 and the Windows Subsytem for Linux ([instructions here](https://docs.microsoft.com/en-us/windows/wsl/install-win10)).  
2. Extract the downloaded `.zip` file to the directory where you would like to access _deedown_. The best option is your user folder. 
3. Open a Command Prompt from this folder and run `pip install -r requirements.txt`, then run this command, `pip3 install -r requirements.txt `, from the WSL terminal. (Using the [Windows Terminal](https://github.com/microsoft/terminal) app may be helpful to keep WSL and Windows shell's sorted.)
4. Create a new Deezer Application from the [Deezer Developers](https://developers.deezer.com/) website. Use the following information for each blank:

| Name                  | Value                                                                 |
| ------                | ------                                                                |
| Name                  | deedown                                                               |
| Domain                | localhost                                                             |
| Redirect URL          | http://localhost:23412/authfinsh                                      |
| Link to Terms of Use  | https://docs.github.com/en/github/site-policy/github-terms-of-service |
| Description           | A basic app to convert playlists to Deezer                            |

5. Edit the `secrets.py` file in the `deedown` directory. Use a text editor such as Notepad or [VS Code](https://code.visualstudio.com/). Place the values from your app in between the single quotes (`' '`). If you cannot find your User ID, it is the 10-digit number at the end of your profile link on Deezer. 

| Deezer App Name       | `secrets.py` Name                                                     |
| ------                | ------                                                                |
| Application ID        | DEEZER_CLIENT_ID                                                      |
| Secret Key            | DEEZER_CLIENT_SECRET                                                  |
| Deezer User ID        | DEEZER_USER_ID                                                        |

6. This step is not mandatory, but if you would like all of your Liked Songs to also download, you need to move them all to a playlist. Do this by selecting groups of 50 songs in your Liked Songs list and adding them to a playlist titled Liked Songs (or anything else you feel like). Select songs the same way as files, by `shift` clicking. The playlist can be up to 10,000 songs, but you can only add 50 at a time otherwise Spotify starts to loose them. 
7. Open a new Command Prompt in the base folder where you extracted _deedown_ (the folder with all the scripts), and run `1_playlists.cmd`. This will delete all of the old playlist files as well as any cached Python code. Then it saves a copy of all your Spotify playlists in `.JSON` format, and finally uploads them to Deezer. As [@helpsterTree](https://github.com/helpsterTee) puts it: "this will take a long time, especially with a large number of playlists / large track count, so get a coffee [or tea], brew some more, establish a coffee plantation business with fair trade principles, make some money and come back to check, if the script is finished."
8. Open a [browser](https://www.microsoft.com/en-us/edge?r=1), and head to your Deezer account and click on playlists, which is on the left. Also open the `2_download.sh` script in a text editor. 
9. Find each of your playlists and right click on the playlist title. Select copy link and paste it where the placeholder playlist links (`https://www.deezer.com/en/playlist`) are in the script. Make sure you paste the link in between the double quotes, as those are crucial! After the links have all been copied, delete any extra placeholders.
10. This step is not mandatory, but if you would like to change the bitrate or the type of file downloaded, change the `128` on line 19 to `flac` or `320` depending on your needs. I find 128kbps gives a nice balance between sound quality and file size. 
11. Open a Linux shell in the main _deedown_ directory (the one with the scripts) and run `./2_download.sh` to let the tracks download. This may also take a long time, depending on the size of your library. If the script asks you to provide your `arl`, go back to [deezer.com](https://www.deezer.com/en/) and press `F12` on your keyboard. Click on Application, and then on the left side, click on Cookies. Select the `https://www.deezer.com` listing, and then in the Filter box, search for `arl`. Click on the `arl` listing and copy the long code, pasting it the terminal. 
12. Your audio files will be downloaded into `Downloads\deedwn`, sorted by playlist. If you would like to move them to your music folder, run `3_move.cmd` from a Command Prompt and all of your files will instantly move to your user Music folder. That's it - enjoy listening!

## Thanks!
This project uses many scripts from many different people. Thanks to them, as this project would not work without their help. 
- Thanks to [Casey Chu](https://github.com/caseychu) and the [Spotify Backup script](https://github.com/caseychu/spotify-backup), which allows you to export your Spotify playlists in easy to use `JSON` format.
- Thanks to [Thomas](https://github.com/helpsterTee) and the [Spotify Playlists 2 Deezer project](https://github.com/helpsterTee/spotify-playlists-2-deezer), which makes sure your playlists show up in Deezer. 
- Thnaks to [Stefan Dworschak](https://github.com/stefdworschak) and the [Spotify to Deezer project](https://github.com/stefdworschak/spotify-to-deezer), which allows you to compare the differences between your Spotify playlists when sending them to Deezer. 
- Thank to the [deemix project](https://www.reddit.com/r/deemix/) for allowing the download of audio files. 
- And thanks to [Spotify](https://open.spotify.com/playlist/37i9dQZF1DX0b1hHYQtJjp) and [Deezer](https://www.deezer.com/en/profile/4302242082/playlists) for making a easy to use API. 

## Contributing
- If you know a way to help, please file an [issue](https://github.com/willtheorangeguy/deedown/issues) or [pull request](https://github.com/willtheorangeguy/deedown/pulls).

The following are areas I could use help:
- [ ] Running all scripts from one script
- [ ] Making everything cross platform
- [ ] Sync with the Deezer API, so you don't have to paste the playlist link

## Licensing
This project is licensed under the [GNU General Public License v3.0](https://github.com/willtheorangeguy/deedown/blob/main/LICENSE).
### Spotify Backup
Unlicensed
### Spotify Playlists 2 Deezer
[MIT License](https://github.com/helpsterTee/spotify-playlists-2-deezer/blob/master/LICENSE)
### Spotify to Deezer
Unlicensed

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
