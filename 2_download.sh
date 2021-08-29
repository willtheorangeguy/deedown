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