#!/bin/sh
S3DEST="s3://eog.kulp.ch"
S3OPTS="--acl public-read --storage-class REDUCED_REDUNDANCY --exclude .DS_Store"
before=refs/upload/began-$(date +%s)
git update-ref $before HEAD
aws s3 sync $S3OPTS \
    --exclude "*" \
    --include "MIDI/*/*.midi" \
    --include "MP3/*/*.mp3" \
    --include "PDF/*/*.pdf" \
    --include "scripts/*" \
    . $S3DEST/
aws s3 sync $S3OPTS --content-type "text/plain; charset=utf-8" \
    --exclude "*" \
    --include "TXT/*/*.txt" \
    --include "*.m3u" \
    . $S3DEST/
aws s3 sync $S3OPTS --content-type "text/html; charset=utf-8" \
    --exclude "*" \
    --include "index.html" \
    . $S3DEST/
after=refs/upload/finished-$(date +%s)
git update-ref $after HEAD
git update-ref refs/upload/finished-latest $after
git update-ref -d $before

