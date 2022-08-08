#!/bin/sh
export AWS_PROFILE=eog
S3DEST="s3://eog.kulp.ch"
S3OPTS="--acl public-read --storage-class REDUCED_REDUNDANCY --exclude .DS_Store"
before=refs/upload/began-$(date +%s)
git update-ref $before HEAD
aws s3 sync $S3OPTS \
    --exclude "*" \
    --include "MIDI/*/*.midi" \
    --include "MP3/*/*.mp3" \
    --include "PDF/*/*.pdf" \
    --include "scripts/*.css" \
    --include "scripts/*.js" \
    --include "booklayout/*.pdf" \
    . $S3DEST/
aws s3 sync $S3OPTS --content-type "text/plain; charset=utf-8" \
    --exclude "*" \
    --include "TXT/default/*.txt" \
    --include "*.m3u" \
    . $S3DEST/
aws s3 sync $S3OPTS --content-type "text/plain; charset=iso-8859-1" \
    --exclude "*" \
    --include "TXT/latinized/*.txt" \
    --include "*.m3u" \
    . $S3DEST/
aws s3 sync $S3OPTS --content-type "text/html; charset=utf-8" \
    --exclude "*" \
    --include "index.html" \
    . $S3DEST/
aws s3 sync $S3OPTS --content-type "image/svg+xml" \
    --content-encoding gzip \
    --exclude "*" \
    --include "SVG/online/*.svg.gz" \
    . $S3DEST/
aws s3 cp $S3OPTS --content-type "application/xhtml+xml" \
    --content-encoding gzip \
    SVG/online/index.html.gz $S3DEST/SVG/online/index.html
aws s3 sync $S3OPTS --content-type "text/css" \
    --exclude "*" \
    --include "SVG/online/svg.css" \
    . $S3DEST/
aws s3 cp $S3OPTS --content-type "application/xhtml+xml" \
    --content-encoding gzip \
    SVG/offline/index.html.gz $S3DEST/SVG/offline/index.html
after=refs/upload/finished-$(date +%s)
git update-ref $after HEAD
git update-ref refs/upload/finished-latest $after
git update-ref -d $before

