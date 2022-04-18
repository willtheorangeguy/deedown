# deedown Usage

Follow these steps to set up _deedown_ and ensure it does what it is supposed to.

1. Ensure you have downloaded the code from this repo, and installed Python 3, Windows 10 and the Windows Subsystem for Linux ([instructions here](https://docs.microsoft.com/en-us/windows/wsl/install-win10)).  
2. Extract the downloaded `.zip` file to the directory where you would like to access _deedown_. The best option is your user folder.
3. Open a Command Prompt from this folder and run `pip install -r requirements.txt`, then run this command, `pip3 install -r requirements.txt `, from the Windows Subsystem for Linux terminal. (Using the [Windows Terminal](https://github.com/microsoft/terminal) app may be helpful to keep WSL and Windows shell's sorted.)
4. Create a new Deezer Application from the [Deezer Developers](https://developers.deezer.com/) website. Use the following information for each blank:

| Name                  | Value                                                                 |
| ------                | ------                                                                |
| Name                  | deedown                                                               |
| Domain                | localhost                                                             |
| Redirect URL          | `http://localhost:23412/authfinsh`                                      |
| Link to Terms of Use  | `https://docs.github.com/en/github/site-policy/github-terms-of-service` |
| Description           | A basic app to convert playlists to Deezer                            |

5. Edit the `secrets.py` file in the `deedown` directory. Use a text editor such as Notepad or [VS Code](https://code.visualstudio.com/). Place the values from your app in between the single quotes (`'...'`). If you cannot find your User ID, it is the 10-digit number at the end of your profile link on Deezer.

| Deezer App Name       | `secrets.py` Name                                                     |
| ------                | ------                                                                |
| Application ID        | DEEZER_CLIENT_ID                                                      |
| Secret Key            | DEEZER_CLIENT_SECRET                                                  |
| Deezer User ID        | DEEZER_USER_ID                                                        |

6. This step is _not mandatory_, but if you would like all of your Liked Songs to also download, you need to move them all to a playlist. Do this by selecting groups of 50 songs in your Liked Songs list and adding them to a playlist titled Liked Songs (or anything else you feel like). Select songs the same way as files, by `shift` clicking. The playlist can be up to 10,000 songs, but you can only add 50 at a time otherwise Spotify starts to loose them. 
7. Open a new Command Prompt in the base folder where you extracted _deedown_ (the folder with all the scripts), and run `1_playlists.cmd`. This will delete all of the old playlist files as well as any cached Python code. Then it saves a copy of all your Spotify playlists in `.JSON` format, and finally uploads them to Deezer. As [@helpsterTree](https://github.com/helpsterTee) puts it: "this will take a long time, especially with a large number of playlists / large track count, so get a coffee [or tea], brew some more, establish a coffee plantation business with fair trade principles, make some money and come back to check, if the script is finished."
8. Open a [browser](https://www.microsoft.com/en-us/edge?r=1), and head to your Deezer account and click on playlists, which is on the left. Also open the `2_download.sh` script in a text editor.
9. Find each of your playlists and right click on the playlist title. Select copy link and paste it where the placeholder playlist links (`https://www.deezer.com/en/playlist`) are in the script. Make sure you paste the link in between the double quotes, as those are crucial! After the links have all been copied, delete any extra placeholders.
10. This step is not mandatory, but if you would like to change the bitrate or the type of file downloaded, change the `128` on line 19 to `flac` or `320` depending on your needs. **I find 128kbps gives a nice balance between sound quality and file size.**
11. Open a Linux shell in the main _deedown_ directory (the one with the scripts) and run `./2_download.sh` to let the tracks download. This may also take a long time, depending on the size of your library. If the script asks you to provide your `arl`, go back to [deezer.com](https://www.deezer.com/en/) and press `F12` on your keyboard. Click on Application, and then on the left side, click on Cookies. Select the `https://www.deezer.com` listing, and then in the Filter box, search for `arl`. Click on the `arl` listing and copy the long code, pasting it the terminal. 
12. Your audio files will be downloaded into `Downloads\deedwn`, sorted by playlist. If you would like to move them to your music folder, run `3_move.cmd` from a Command Prompt and all of your files will instantly move to your user Music folder. That's it - enjoy listening!