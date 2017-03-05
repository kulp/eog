#!/bin/sh
for dir in MP3 TXT PDF MIDI
do
    git ls-files -o --exclude-standard $dir/ | xargs rm # clean aborted builds
done
