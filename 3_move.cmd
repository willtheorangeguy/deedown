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

rem Move songs
cd ..
robocopy /move /e /nfl /njh "%USERPROFILE%\Downloads\deedwn\music" "%USERPROFILE%\Music\Deemix Music"

rem Finished!
echo All playlists have been moved!
rmdir /s /q "%USERPROFILE%\Downloads\deedwn"
cd "Deemix Music"