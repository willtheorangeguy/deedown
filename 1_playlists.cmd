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