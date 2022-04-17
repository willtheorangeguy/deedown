# deedown - Automatic Spotify to Deezer playlist updater, and deemix track downloader. 
# Copyright (C) 2020-2022 @willtheorangeguy

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3 of the License.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

#!/bin/bash

# List of Playlists:
#"https://www.deezer.com/en/playlist/9410154282" 
#"https://www.deezer.com/en/playlist/9410156002" 
#"https://www.deezer.com/en/playlist/9410145502"
#"https://www.deezer.com/en/playlist/9410148262"            
#"https://www.deezer.com/en/playlist/9410150302"
#"https://www.deezer.com/en/playlist/9410146342"
#"https://www.deezer.com/en/playlist/9410152902" 
#"https://www.deezer.com/en/playlist/9416521802"

# Iterate through Deezer playlists
declare -a playlists=( "https://www.deezer.com/en/playlist/9416521802"                                   
                      )
for i in "${playlists[@]}"
do
   deemix --bitrate 128 $i
done