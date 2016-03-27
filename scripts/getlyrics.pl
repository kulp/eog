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
use Text::Aspell;

binmode(STDOUT, ":utf8");

my $transforms;
if (-e "transforms.map") {
    $transforms = +{ map { my @a = split "\t"; $a[0] => $a[1] } slurp "transforms.map", { utf8 => 1, chomp => 1 } };
}

my $braces = $RE{balanced}{-parens=>'{}'};

my $lyricpat = qr<
    \b((words|refrain)(\w*))\s*
    =\s*
    (?:\\lyricmode|\\markuplist)\s*
    ($braces)
>xoi;

my $markuppat = qr<
    \\line\s*($braces)
>xoi;

my $versepat = qr<
    \A\{\s*
        (?:\\set.*?$)?
        \s*
        (.*?)
    \s*\}\z
>xoism;

my $apos = '’';
my $wordelt = qr<[\w$apos]>o;

my $wordpat = qr<
\b($wordelt+ (?:\s+ [-_]{2} (?:\s+ _)? \s+ $wordelt+)*)(\b|(?=\s|$))
>xoism;

my $compound_wordpat = qr<
\b($wordelt+ (?:\s+ [-_]{2} (?:\s+ _)? \s+ $wordelt+)+)(\b|(?=\s|$))
>xoism;

my $strips = qr<
(\n?)\s*(?:
    \\bar\s*".*?"
 | \\break
 | \\noBreak
 | \\m(on|off)
 | %.*?(?=\n|$)
 | \\Refrain\w*
 | \\italic
 #| \p{IsPunct}
 | $braces
)
>xoism;

my $file = shift;
my $contents = slurp '<:utf8' => $file;
my @verses = $contents =~ /$lyricpat/g;
my @groups = ngroup 5 => \@verses;
my %groups = map { ("$_->[1]$_->[2]" => $_->[3]) } @groups;
# TODO indent refrain(s)
my @order = ("wordsA", "Refrain", "RefrainA", map { ("words$_", "Refrain$_") } 'B'..'Z');
my @segments = grep defined, @groups{@order};
my @bare = map /$versepat/, @segments;
my @unmarkup = map { s/$markuppat/$1/g; $_ } @bare;
my @trimmed = map { s/^\{\s*(.*?)\s*\}\s*(%.*)?$/$1/gm; $_ } @unmarkup;
my @rescued = map { s/\\markup\s*($braces)/substr($1,1,-1)/ge; $_ } @trimmed;
my @lines = map { s/$strips/$1/g; [ grep !/^$/, map trim, split /\n/ ] } @rescued;
my @words = map [ map [ split /$wordpat/ ], @$_ ], @lines;
my @unknown;

my $spell = Text::Aspell->new;

sub _check
{
    my $word = shift;
    if ($word =~ /$compound_wordpat/o or $word =~ /_/) {
        (my $test = $word) =~ s/\s+ [-_]{2} (?:\s+ _)? \s+//goxi;
        $test =~ s/$apos/'/go;
        if ($test =~ /^_+$/) {
            return "";
        } elsif ($spell->check($test)) {
            return $test;
        } elsif ($transforms->{$word}) {
            return $transforms->{$word};
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

print for map { s/ +/ /g; $_ } @outs;

warn "$_\n" for sort keys %{+{ map { $_ => 1 } @unknown }};

exit 1 if @unknown;
exit 2 if (join "", @outs) =~ /[{}\\]/;

