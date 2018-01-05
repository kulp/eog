#!/bin/sh
# put spaces around dashes when they become hyphens
sed 's/[–—]/ - /g' $1 |
# convert smart quotes to regular ones
tr '‘’“”' "''"'""' |
# change encoding to latin-1
iconv -c --from-code=UTF-8 --to-code=latin1
