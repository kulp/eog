#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use feature 'say';

use Array::Group qw(ngroup);
use Perl6::Slurp;
use Regexp::Common;
use YAML qw(LoadFile);

binmode(STDOUT, ":utf8");

use XXX;

my $dict = "/usr/share/dict/words";
my @dictwords = slurp $dict, { chomp => 1 };
my $dictwords = +{ map { lc $_ => $_ } @dictwords };

my $braces = $RE{balanced}{-parens=>'{}'};

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
\b($wordelt+ (?:\s+ -- \s+ $wordelt+)*)\b
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
my @words = map [ map [ split /$wordpat/ ], @$_ ], @lines;

# TODO handle "’s" automatically
sub _check
{
    my $word = shift;
    if ($word =~ /$wordpat/o) {
        (my $test = $word) =~ s/\s+ -- \s+//goxi;
        if (exists $dictwords->{lc $test}) {
            return $test;
        } else {
            warn "$word\n";
        }
    }

    return $word;
}

print map {
    ((map {
        (join("", map _check($_), @$_), "\n")
    } @$_), "\n")
} @words;

#XXX \@words;

