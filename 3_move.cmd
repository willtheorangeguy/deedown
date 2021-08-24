@echo off

rem Move songs
cd ..
robocopy /move /e /nfl /ndl /njh /njs deedwn\music "%USERPROFILE%\Music\Deemix Music"

rem Finished!
echo All playlists have been moved!
rmdir /s /q deedwn
cd "Deemix Music"