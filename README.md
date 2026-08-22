<!-- Logo -->
<h1 align="center">
  <img src="https://raw.githubusercontent.com/willtheorangeguy/.github/main/icons/deedown/logo.png" height="250px" width="400px" alt="deedown">
  <br>
  deedown
  <br>
</h1>

<!-- Copy -->
<h4 align="center">Automatic Spotify to Deezer playlist updater, and deemix track downloader.</h4>

<!-- Badges -->
<div align="center">
  <!-- Issues -->
  <img alt="GitHub Issues" src="https://img.shields.io/github/issues/willtheorangeguy/deedown">
  <!-- Pull Requests -->
  <img alt="GitHub Pull Requests" src="https://img.shields.io/github/issues-pr/willtheorangeguy/deedown">
  <!-- License -->
  <img alt="License" src="https://img.shields.io/github/license/willtheorangeguy/deedown">
</div>

<!-- Nav -->
<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#documentation">Documentation</a> •
  <a href="#support">Support</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>

> **This repository is a mirror, and an incomplete one.** The Python package the scripts call —
> `deedown/get_playlists.py` and `deedown/secrets.py` — is not here. The full code and its
> development live on [GitLab](https://gitlab.com/willtheorangeguy/deedown).

## Key Features

* Converts Spotify playlists to Deezer, and keeps them updated on later runs.
* Downloads the resulting playlists with `deemix`, at your choice of 128, 320, or FLAC.
* Fetches cover art alongside the audio.
* Sorts the finished files into your Music folder in one step.
* Three numbered scripts run in order — nothing to install beyond the Python packages and WSL.

## Installation

Windows 10 with WSL and a Linux image, Python 3 with `pip` on both sides, and Spotify and Deezer accounts. Then:

```bash
pip install -r requirements.txt      # from Windows
pip3 install -r requirements.txt     # from WSL
```

You also need the `deedown/` Python package, which is on [GitLab](https://gitlab.com/willtheorangeguy/deedown) rather than here, and a Deezer application for the credentials in `secrets.py`.

Full prerequisites are in [`docs/installation.md`](docs/installation.md); the credentials are in [`docs/configuration.md`](docs/configuration.md).

## Usage

Three scripts, in order, with one manual step between the first and second:

```
1_playlists.cmd     cmd    converts your Spotify playlists to Deezer
   -> copy the new Deezer playlist URLs into 2_download.sh
2_download.sh       WSL    deemix downloads them
3_move.cmd          cmd    moves the files into your Music folder
```

The twelve-step walkthrough is in [`docs/usage.md`](docs/usage.md).

> **Step 11 asks for your Deezer `arl` cookie.** That is a long-lived session token granting full access to your account, not a scoped API key. Paste it into the terminal that asks for it and nowhere else.

> **Downloading tracks this way is contrary to Deezer's terms of use**, which you agreed to when you created the account, and the files it produces are copyrighted recordings. See [`docs/legal/deezer.md`](docs/legal/deezer.md).

## Documentation

Full documentation lives in [`docs/`](docs/index.md):
[Installation](docs/installation.md) · [Usage](docs/usage.md) · [Configuration](docs/configuration.md) · [Architecture](docs/architecture.md) · [Troubleshooting](docs/troubleshooting.md) · [Roadmap](docs/roadmap.md)

Legal notices are in [`docs/legal/`](docs/legal/): [Deezer](docs/legal/deezer.md) · [Spotify](docs/legal/spotify.md) · [Privacy Policy](docs/legal/privacy.md) · [Terms](docs/legal/terms.md)

## Support

Open a [GitHub Discussion](https://github.com/willtheorangeguy/deedown/discussions/new) or file an [issue](https://github.com/willtheorangeguy/deedown/issues/new/choose).

## Contributing

Contributions to the program itself belong on [GitLab](https://gitlab.com/willtheorangeguy/deedown/-/merge_requests/new), where the full code lives. Documentation fixes are welcome here.

See the org-wide [Contributing Guide](https://github.com/willtheorangeguy/.github/blob/main/CONTRIBUTING.md) and [Code of Conduct](https://github.com/willtheorangeguy/.github/blob/main/CODE_OF_CONDUCT.md).

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

## License

GPL-3.0 — see [`LICENSE.md`](LICENSE.md). See the [Privacy Policy](docs/legal/privacy.md) and [Terms and Conditions](docs/legal/terms.md) for legal information.

Any connections with Spotify and/or Deezer are governed by their own privacy policies and terms. This application is not related to and/or endorsed by either of the respective companies.
