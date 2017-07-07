#!/bin/sh
tr '–—‘’“”' "--''"'""' < $1 | iconv -c --from-code=UTF-8 --to-code=latin1
