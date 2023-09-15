<!-- Logo -->
<h1 align="center">
  <img src="https://raw.githubusercontent.com/willtheorangeguy/deedown/main/docs/images/logo.png" height="250px" width="400px" alt="deedown">
  <br>
  deedown
  <br>
</h1>

<!-- Copy -->
<h4 align="center">Automatic Spotify to Deezer playlist updater, and deemix track downloader. <strong>This is only a placeholder repo, the full code and documentation can be found on <a href="https://gitlab.com/willtheorangeguy/deedown">GitLab</a>.</strong></h4>

<!-- Badges -->
<div align="center">
  <!-- Stability -->
  <img alt="GitHub Actions State" src="https://img.shields.io/gitlab/pipeline-status/willtheorangeguy/deedown?branch=main">
  <!-- Version -->
  <img alt="GitHub Version" src="https://img.shields.io/github/v/release/willtheorangeguy/deedown?include_prereleases">
  <!-- Issues -->
  <img alt="GitHub Issues" src="https://img.shields.io/github/issues/willtheorangeguy/deedown">
  <!-- Pull Requests -->
  <img alt="GitHub Pull Requests" src="https://img.shields.io/github/issues-pr/willtheorangeguy/deedown">
  <!-- Discord -->
  <img alt="Discord Server ID" src="https://img.shields.io/discord/964926833298657300">
  <!-- Downloads -->
  <img alt="Downloads" src="https://img.shields.io/github/downloads/willtheorangeguy/deedown/total">
  <!-- Language Count -->
  <img alt="GitHub Languages" src="https://img.shields.io/github/languages/count/willtheorangeguy/deedown">
</div>

<!-- Navigation -->
<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#download">Download</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#support">Support</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#changelog">Changelog</a> •
  <a href="#credits">Credits & Contributors</a>
</p>

## Key Features

* Easy to use CLI.
* Converts playlists from Spotify to Deezer.
* Updates playlists.
* Downloads songs using `deemix`.
* Downloads cover art.
* Automatically sorts music files.

## Download

You can **[download](https://gitlab.com/willtheorangeguy/deedown/-/releases) the source code** to run the CLI scripts from the command line on Windows. **This will require [Windows 10](https://www.microsoft.com/en-ca/software-download/windows10), [Python](https://www.python.org/downloads/), the Windows Subsystem for Linux and [a Linux Image](https://www.microsoft.com/en-ca/store/top-free/apps/pc?category=Developer+tools)**.

## How To Use

Before running _deedown_, **the following must be installed or downloaded**:

* [Windows 10](https://www.microsoft.com/en-ca/software-download/windows10) (Version 1903 or higher, with Build 18362 or higher)
* A [text editor](https://code.visualstudio.com/)
* Windows Subsystem for Linux
* An [Ubuntu](https://www.microsoft.com/store/apps/9n6svws3rx71), [Kali](https://www.microsoft.com/store/apps/9PKR34TNCV07) or [Debian](https://www.microsoft.com/store/apps/9MSVKQC78PK6) image from the Microsoft Store (others may work, but are untested)
* [Python 3](https://www.python.org/downloads/) (and `pip`)
* The following Python Packages: (these do not need to be individually installed, installation instructions can be found below)

```text
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
urllib3>=1.26.5
webencodings==0.5.1
```

* A [Spotify](https://www.spotify.com/us/signup/) account
* A [Deezer](https://www.deezer.com/en/register) account
* Some Spotify or Deezer playlists
* The [_deedown_ code](https://gitlab.com/willtheorangeguy/deedown/-/archive/main/deedown-main.zip) from this repo

**To install _deedown_ and get the program running, follow these steps:**

1. Ensure you have downloaded the code from this repo, and installed Python 3, Windows 10 and the Windows Subsystem for Linux ([instructions here](https://docs.microsoft.com/en-us/windows/wsl/install-win10)).  
2. Extract the downloaded `.zip` file to the directory where you would like to access _deedown_. The best option is your user folder.
3. Open a Command Prompt from this folder and run `pip install -r requirements.txt`, then run this command, `pip3 install -r requirements.txt`, from the Windows Subsystem for Linux terminal. (Using the [Windows Terminal](https://github.com/microsoft/terminal) app may be helpful to keep WSL and Windows shell's sorted.)
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

## Support

More documentation is available in the **[Documentation](https://github.com/willtheorangeguy/deedown/tree/main/docs)** and on the **[Wiki](https://github.com/willtheorangeguy/deedown/wiki)**. If more support is required, please open a **[GitHub Discussion](https://github.com/willtheorangeguy/deedown/discussions/new)** or join our **[Discord](https://discord.gg/Q5QkC4ZWVa)**.

## Contributing

Please contribute using [GitHub Flow](https://guides.github.com/introduction/flow). Create a branch, add commits, and [open a pull request](https://github.com/willtheorangeguy/deedown/compare). **If the contribution relates to the full program code, submit [a merge request on Gitlab](https://gitlab.com/willtheorangeguy/deedown/-/merge_requests/new).**

Please read [`CONTRIBUTING`](CONTRIBUTING.md) for details on our [`CODE OF CONDUCT`](CODE_OF_CONDUCT.md), and the process for submitting pull requests to us.

## Changelog

See the [`CHANGELOG`](CHANGELOG.md) file for details.

## Credits

This software uses the following open source packages, projects, services or websites:

<!-- Credits Table -->
<table>
  <tr>
    <th align="center"><img src="https://applets.imgix.net/https%3A%2F%2Fassets.ifttt.com%2Fimages%2Fchannels%2F2107379463%2Ficons%2Fmonochrome_large.png?w=240&h=240&s=8a19bbc158996d098e2fb18310ba7f33" width="150" height="150" alt="GitHub"/></th>
    <th align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/182px-Python-logo-notext.svg.png" width="150" height="150" alt="PSF"/></th>
    <th align="center"><img src="https://pyinstaller.readthedocs.io/en/v4.2/_static/pyinstaller-draft1a.ico" width="150" height="150" alt="PyInstaller"/></th>
    <th align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Spotify_logo_without_text.svg/800px-Spotify_logo_without_text.svg.png" width="150" height="150" alt="Spotify"/></th>
    <th align="center"><img src="https://play-lh.googleusercontent.com/r55K1eQcji3QMHRKERq6zE1-csoh_MTOHiKyHTuTOblhFi_rIz06_8GN5-DHUGJOpn79=w240-h480-rw" width="150" height="150" alt="Deezer"/></th>
  </tr>
  <tr>
    <td align="center">GitHub</td>
    <td align="center">Python Software Foundation</td>
    <td align="center">PyInstaller</td>
    <td align="center">Spotify</td>
    <td align="center">Deezer</td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/">Web</a> - <a href="https://github.com/pricing">Plans</a></td>
    <td align="center"><a href="https://www.python.org/">Web</a> - <a href="https://psfmember.org/civicrm/contribute/transact?reset=1&id=2">Donate</a></td>
    <td align="center"><a href="https://pyinstaller.readthedocs.io/en/stable/">Web</a> - <a href="https://www.pyinstaller.org/funding.html#funding-by-individuals">Donate</a></td>
    <td align="center"><a href="https://www.spotify.com/">Web</a> - <a href="https://www.spotify.com/ca-en/premium/">Plans</a></td>
    <td align="center"><a href="https://www.deezer.com/en/">Web</a> - <a href="https://www.deezer.com/en/offers">Plans</a></td>
  </tr>
</table>

This project uses many scripts from many different people. Thanks to them, as this project would not work without their help.

* Thanks to [Casey Chu](https://github.com/caseychu) and the [Spotify Backup script](https://github.com/caseychu/spotify-backup), which allows you to export your Spotify playlists in easy to use `JSON` format.
* Thanks to [Thomas](https://github.com/helpsterTee) and the [Spotify Playlists 2 Deezer project](https://github.com/helpsterTee/spotify-playlists-2-deezer), which makes sure your playlists show up in Deezer.
* Thanks to [Stefan Dworschak](https://github.com/stefdworschak) and the [Spotify to Deezer project](https://github.com/stefdworschak/spotify-to-deezer), which allows you to compare the differences between your Spotify playlists when sending them to Deezer.
* Thank to the [deemix project](https://www.reddit.com/r/deemix/) for allowing the download of audio files.

## Contributors

* [@willtheorangeguy](https://github.com/willtheorangeguy) - Sponsor on [PayPal](https://paypal.me/wvdg44?country.x=CA&locale.x=en_US)

## You may also like...

* [Running Calculator](https://github.com/willtheorangeguy/Running-Calculator) - A running distance and speed command line interface.
* [Snoopy Landing Page](https://github.com/willtheorangeguy/Snoopy-Landing-Page) - A simple under construction landing page that features Charles M. Schulz's iconic Snoopy Beagle.
* [Python Logo Widgets](https://github.com/willtheorangeguy/Python-Logo-Widgets) - Python Powered Logo widgets that can be added to any GUI project.

## License

This project is licensed under the [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.en.html) - see the [`LICENSE`](LICENSE.md) file for details. See the [Privacy Policy](https://github.com/willtheorangeguy/deedown/blob/main/docs/legal/PRIVACY.md) and [Terms and Conditions](https://github.com/willtheorangeguy/deedown/blob/main/docs/legal/TERMS.md) for legal information.

Any connections with Spotify and/or Deezer are governed by their own privacy policies and terms. This application is not related to and/or endorsed by either of the respective companies.
