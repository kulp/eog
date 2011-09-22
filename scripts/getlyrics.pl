#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use feature 'say';

use Array::Group qw(ngroup);
use Lingua::Stem qw(stem);
use Perl6::Slurp;
use Regexp::Common;
use Data::Dumper;

binmode(STDOUT, ":utf8");

use XXX;

my @dict = map glob($_), map "/usr/share/dict/$_", qw(words connectives propernames);
my $dictwords;
if (-e "words.dump") {
    $dictwords = do "words.dump";
} else {
    my @dictwords = map { slurp $_, { chomp => 1 } } @dict;
    $dictwords = +{ map { lc $_ => $_ } @dictwords };
    open my $fh, ">", "words.dump";
    print $fh Dumper($dictwords);
}

my $transforms;
if (-e "transforms.map") {
    $transforms = +{ map { my @a = split "\t"; $a[0] => $a[1] } slurp "transforms.map", { utf8 => 1, chomp => 1 } };
}

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

my $compound_wordpat = qr<
\b($wordelt+ (?:\s+ -- \s+ $wordelt+)+)\b
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
my @unknown;

# TODO handle "’s" automatically
sub _check
{
    my $word = shift;
    if ($word =~ /$compound_wordpat/o) {
        (my $test = $word) =~ s/\s+ -- \s+//goxi;
        my @variants = map { (my $x = $test) =~ s/$_//; $x } qr(’s);
        if (exists $dictwords->{lc $test}) {
            return $test;
        } elsif ($transforms->{$word}) {
            return $transforms->{$word};
        } elsif (@$dictwords{map lc, @variants}) {
            return $test;
        } elsif (@$dictwords{@{ stem lc $test }}) {
            return $test;
        } else {
            push @unknown, $word;
        }
    }

    return $word;
}

print map {
    ((map {
        (join("", map _check($_), @$_), "\n")
    } @$_), "\n")
} @words;

warn "$_\n" for sort keys %{+{ map { $_ => 1 } @unknown }};

#XXX \@words;

