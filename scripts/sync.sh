#!/bin/sh
S3DEST="s3://eog.kulp.ch"
S3OPTS="--acl-public --reduced-redundancy --guess-mime-type --no-preserve --recursive --exclude=.DS_Store --encoding=UTF-8 --add-encoding-exts=txt,js,css,html,ly,m3u"
s3cmd $S3OPTS sync *.m3u *.zip $S3DEST &
for dir in scripts MP3 TXT PDF MIDI
do
    s3cmd $S3OPTS sync $dir/ $S3DEST/$dir/ &
done
wait # upload all music files before we update index
# update index last, in case we fail
s3cmd $S3OPTS sync *.html $S3DEST &
wait

