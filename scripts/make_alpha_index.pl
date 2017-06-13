#!/usr/bin/perl
use strict;
use utf8;

binmode \*STDIN , ":utf8";
binmode \*STDOUT, ":utf8";

my $count = shift;
my @list;

for my $i (1 .. $count) {
    my $txt = sprintf "TXT/default/EOG%03d.txt", $i;
    open my $fh, "<:utf8", $txt;

    local $_ = <$fh>;
    s/è/e/g;
    s/[,:;–—]$//g;
    my @F = split " ";
    pop @F while length("@F") > 34;
    push @list, [ "@F", $i ];
}

sub dictionary_order {
    (my $aa = $a->[0]) =~ s/\p{IsPunct}//g;
    (my $bb = $b->[0]) =~ s/\p{IsPunct}//g;
    return $aa cmp $bb;
}

print map "$_->[0]\\dotfill{}$_->[1]\n\n",
    sort dictionary_order @list;
