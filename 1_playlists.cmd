rem deedown - Automatic Spotify to Deezer playlist updater, and deemix track downloader. 
rem Copyright (C) 2020-2024 @willtheorangeguy

rem This program is free software: you can redistribute it and/or modify
rem it under the terms of the GNU General Public License as published by
rem the Free Software Foundation, version 3 of the License.

rem This program is distributed in the hope that it will be useful,
rem but WITHOUT ANY WARRANTY; without even the implied warranty of
rem MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
rem GNU General Public License for more details.

rem You should have received a copy of the GNU General Public License
rem along with this program.  If not, see <https://www.gnu.org/licenses/>.

@echo off

rem Remove playlist files
del /f deedown\error_log.log
del /f deedown\new_playlists.txt
del /f deedown\last_playlists.txt
del /f deedown\playlists.txt

rem Move to program files
cd deedown

rem Add playlists to Deezer
wsl.exe -d Ubuntu python3 get_playlists.py

rem Remove pycache files
rmdir /s /q __pycache__

rem Deemix instructions
cd ..
echo Now copy playlist URLs to the second script.
echo Then run the second script from Ubuntu to download the music.  