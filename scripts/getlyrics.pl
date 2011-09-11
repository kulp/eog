#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use utf8;

use Array::Group qw(ngroup);
use Perl6::Slurp;
use Regexp::Common;

use XXX;

my $braces = $RE{balanced}{-parens=>'{}'};

# TODO refrain
my $lyricpat = qr<
    ((words|refrain)(\w+))\s*
    =\s*
    \\lyricmode\s*
    ($braces)
>xoi;

my $versepat = qr<
    \A{\s*
        (?:\\set.*?$)?
        \s*
        (.*?)
    \s*}\z
>xoism;

my $wordelt = qr<[\w’]>;

my $wordpat = qr<
\b($wordelt+ (?:\s+ -- \s+ ($wordelt+))*)\b
>xoism;

my $strips = qr<
\s*(?:
    \\bar\s*"."
 | \\break
 | \\noBreak
 #| \p{IsPunct}
)
>xoism;

my $file = shift;
my $contents = slurp '<:utf8' => $file;
my @verses = $contents =~ /$lyricpat/g;
my @groups = ngroup 4 => \@verses;
my @segments = map $_->[3], @groups;
my @bare = map /$versepat/, @segments;
my @lines = map { s/$strips//g; [ split /\n/ ] } @bare;
# TODO what about the lost punctuation
my @words = map [ map [ /$wordpat/g ], @$_ ], @lines;

XXX \@words;

