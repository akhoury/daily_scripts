#!/bin/bash
shopt -s expand_aliases
source $HOME/.bashrc
echo "closing the used apps if opened"
# osascript -e 'tell application "Soundflowerbed" to quit'
osascript -e 'tell application "Nicecast" to quit'
osascript -e 'tell application "Pandorajam" to quit'
# killall pianobar
stop_icecast
echo " ... now starting all over again ..."
echo "starting icecast.."
start_icecast
# echo "starting soundflowerbed.."
# open -jga Soundflowerbed
echo "starting nicecast.. (will automatically launch music source if App (Pandorajam etc.) but not console app (pianobar etc.))"
open -jga Nicecast
echo "broadcasting in on, we're live, let's turn on pandora.."
# echo "setting volume to 50%"
# sudo osascript -e "set Volume 5"
# echo "starting pianobar..."
# pianobar
# echo "starting pandorajam"
# open -jga Pandorajam
open -jga Itunes
