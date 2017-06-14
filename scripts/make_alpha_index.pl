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
    my @F = split " ";
    pop @F while length("@F") > 34;
    $_ = "@F";
    s/[,:;–—]$//g;
    push @list, [ $_, $i ];
}

sub dictionary_order {
    (my $aa = $a->[0]) =~ s/\p{IsPunct}//g;
    (my $bb = $b->[0]) =~ s/\p{IsPunct}//g;
    return $aa cmp $bb;
}

my $last = '';
for (sort dictionary_order @list) {
    my ($letter) = $_->[0] =~ /(\w)/;
    print qq({\\centering\\textbf{—\u$letter—}\\par}\n\n) if $letter ne $last;
    print qq($_->[0]\\dotfill{}$_->[1]\n\n);
    $last = $letter;
}

