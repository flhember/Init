#!/bin/bash

SEARCH=$(zenity --entry --text "Qu'est-ce que vous voulez ecouter?")
xdg-open "http://www.youtube.com/results?search_query=$SEARCH" 2>dev/null
exit 0
