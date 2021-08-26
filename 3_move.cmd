@echo off

rem Move songs
cd ..
robocopy /move /e /nfl /njh "%USERPROFILE%\Downloads\deedwn\music" "%USERPROFILE%\Music\Deemix Music"

rem Finished!
echo All playlists have been moved!
rmdir /s /q "%USERPROFILE%\Downloads\deedwn"
cd "Deemix Music"