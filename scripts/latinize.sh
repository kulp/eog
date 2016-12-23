#!/bin/sh
tr '–—‘’“”' "--''"'""' < $1 | iconv -c --from-code=utf8 --to-code=latin1
