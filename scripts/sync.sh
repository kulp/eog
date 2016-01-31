#!/bin/sh
S3DEST="s3://eog.kulp.ch"
S3OPTS="--acl-public --reduced-redundancy --guess-mime-type --no-preserve --recursive --exclude=.DS_Store"
s3cmd $S3OPTS sync *.html *.zip $S3DEST
for dir in scripts MP3 TXT PDF MIDI
do
    s3cmd $S3OPTS sync $dir/ $S3DEST/$dir/ &
done
wait

