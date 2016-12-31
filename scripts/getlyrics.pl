#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use feature 'say';

use Array::Group qw(ngroup);
use Lingua::Stem qw(stem);
use List::Util qw(pairmap);
use Perl6::Slurp;
use Regexp::Common;
use Text::Trim qw(trim);
use Text::Aspell;

binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

my $transforms;
if (-e "transforms.map") {
    $transforms = +{ map { my @a = split "\t"; $a[0] => $a[1] } slurp "transforms.map", { utf8 => 1, chomp => 1 } };
}

my $braces = $RE{balanced}{-parens=>'{}'};
my $hidden = $RE{balanced}{-begin=>'%{HIDE>%}'}{-end=>'%{<HIDE%}'};

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
   \\bar\s*".*?"
 | \\break
 | \\pageBreak
 | \\noBreak
 | \\markup
 | \\m(on|off)
 | %.*?(?=\n|$)
 | \\Refrain\w*
 | \\italic(sO(n|ff))?
 #| \p{IsPunct}
 | $braces
>xoism;

my $file = shift;
my $contents = slurp '<:utf8' => $file;
my @verses = $contents =~ /$lyricpat/g;
my @groups = ngroup 5 => \@verses;
my %groups = map { ("$_->[1]$_->[2]" => $_->[3]) } @groups;
my @order = ("wordsA", "Refrain", "RefrainA", map { ("words$_", "Refrain$_") } 'B'..'Z');
my %segments = pairmap { defined($b) ? ($a => $b) : () } %groups;
my %bare = pairmap { $b =~ s/$versepat/$1/; $a => $b } %segments;
my %unmarkup = pairmap { $b =~ s/$markuppat/$1/g; $a => $b } %bare;
my %hidden = pairmap { $b =~ s/$hidden//; $a => $b } %unmarkup;
my %lyrics = pairmap { $b =~ s/%LYRICS//; $a => $b } %hidden;
my %trimmed = pairmap { $b =~ s/$braces/substr($1,1,-1)/gem; $a => $b } %lyrics;
my %rescued = pairmap { $b =~ s/\\markup\s*($braces)/substr($1,1,-1)/ge; $a => $b } %trimmed;
my %lines = pairmap { $b =~ s/$strips//g; $a => [ grep !/^$/, map trim, split /\n/, $b ] } %rescued;
my %words = pairmap { $a => [ map [ split /$wordpat/ ], @$b ] } %lines;
my @unknown;

my $spell = Text::Aspell->new;

sub _check
{
    my $word = shift;
    $word =~ s/\s+/ /g; # collapse whitespace
    if ($word =~ /$compound_wordpat/o or $word =~ /_/) {
        (my $test = $word) =~ s/\s+ [-_]{2} (?:\s+ _)? \s+//goxi;
        (my $ap = $test) =~ s/$apos/'/go;
        if ($test =~ /^_+$/) {
            return "";
        } elsif ($spell->check($ap)) {
            return $test;
        } elsif ($transforms->{$word}) {
            return $transforms->{$word};
        } else {
            push @unknown, $word;
        }
    }

    return $word;
}

my %outs = pairmap {
    my $indent = ($a =~ /Refrain/) ? "  " : "";
    $a => join "\n", map { $indent . join "", map _check($_), @$_ } @$b
} %words;

my @defined = grep defined, @outs{@order};
print join "\n\n", @defined;
print "\n\n";

warn "$_\n" for sort keys %{+{ map { $_ => 1 } @unknown }};

exit 1 if @unknown;
exit 2 if (join "", @defined) =~ /[{}\\]/;

