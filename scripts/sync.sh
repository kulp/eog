#!/bin/sh
S3DEST="s3://eog.kulp.ch"
S3OPTS="--acl-public --reduced-redundancy --guess-mime-type --no-preserve --recursive --exclude=.DS_Store --encoding=UTF-8 --add-encoding-exts=txt,js,css,html,ly,m3u"
before=refs/upload/began-$(date +%s)
git update-ref $before HEAD
for dir in scripts MP3 TXT PDF MIDI
do
    git ls-files -o --exclude-standard $dir/ | xargs rm # clean aborted builds
    s3cmd $S3OPTS sync $dir/ $S3DEST/$dir/ &
done
wait # upload all music files before we update index
# update index last, in case we fail
s3cmd $S3OPTS sync *.m3u *.html $S3DEST &
wait
after=refs/upload/finished-$(date +%s)
git update-ref $after HEAD
git update-ref refs/upload/finished-latest $after
git update-ref -d $before

