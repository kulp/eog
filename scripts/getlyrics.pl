#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use feature 'say';

use Array::Group qw(ngroup);
use Lingua::Stem qw(stem);
use Perl6::Slurp;
use Regexp::Common;
use Text::Trim qw(trim);
use Data::Dumper;

binmode(STDOUT, ":utf8");

my @dict = map glob($_), map "/usr/share/dict/$_", qw(words connectives propernames);
my $dictwords;
if (-e "words.dump") {
    $dictwords = do "words.dump";
} else {
    my @dictwords = map { (-f $_) ? (slurp $_, { chomp => 1 }) : () } @dict;
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
    \b((words|refrain)(\w*))\s*
    =\s*
    (?:\\lyricmode|\\markuplines)\s*
    ($braces)
>xoi;

my $markuppat = qr<
    \\line\s*($braces)
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
\b($wordelt+ (?:\s+ [-_]{2} (?:\s+ _)? \s+ $wordelt+)*)\b
>xoism;

my $compound_wordpat = qr<
\b($wordelt+ (?:\s+ [-_]{2} (?:\s+ _)? \s+ $wordelt+)+)\b
>xoism;

my $strips = qr<
(\n?)\s*(?:
    \\bar\s*".*?"
 | \\break
 | \\noBreak
 | \\m(on|off)
 | %.*?(?=\n|$)
 | \\Refrain\w*
 #| \p{IsPunct}
 | $braces
)
>xoism;

# TODO handle more than one file at a time to amortise cost of loading dicts
my $file = shift;
my $contents = slurp '<:utf8' => $file;
my @verses = $contents =~ /$lyricpat/g;
my @groups = ngroup 4 => \@verses;
my %groups = map { ("$_->[1]$_->[2]" => $_->[3]) } @groups;
# TODO indent refrain(s)
my @order = ("wordsA", "Refrain", "RefrainA", map { ("words$_", "Refrain$_") } 'B'..'Z');
my @segments = grep defined, @groups{@order};
my @bare = map /$versepat/, @segments;
my @unmarkup = map { s/$markuppat/$1/g; $_ } @bare;
my @trimmed = map { s/(^\{\s*)|(\s*\}\s*$)//gm; $_ } @unmarkup;
my @lines = map { s/$strips/$1/g; [ grep !/^$/, map trim, split /\n/ ] } @trimmed;
my @words = map [ map [ split /$wordpat/ ], @$_ ], @lines;
my @unknown;

sub _check
{
    my $word = shift;
    if ($word =~ /$compound_wordpat/o or $word =~ /_/) {
        (my $test = $word) =~ s/\s+ [-_]{2} (?:\s+ _)? \s+//goxi;
        my @variants = map { (my $x = $test) =~ s/$_//; $x } qr(’s$);
        if ($test =~ /^_+$/) {
            return "";
        } elsif (exists $dictwords->{lc $test}) {
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

my @outs = map {
    ((map {
        (join("", map _check($_), @$_), "\n")
    } @$_), "\n")
} @words;

print @outs;

warn "$_\n" for sort keys %{+{ map { $_ => 1 } @unknown }};

exit 1 if @unknown;
exit 2 if (join "", @outs) =~ /[{}\\]/;

