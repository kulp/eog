#!/usr/bin/perl
use strict;

my $open = 0;

while (<>) {
    chomp;
    next if /^$/;
    if (/^(?! )/) {
        # meter
        print qq(\\end{flushright}\n) if $open;
        print qq(\\needspace{2\\baselineskip}\n);
        print qq(\\center\\textbf{$_}\n);
        print qq(\\begin{flushright}\n);
        $open = 1;
    } else {
        my ($name, $nums) = split /\t/;
        print qq($name\\dotfill $nums \\\\\n);
    }
}

print qq(\\end{flushright}\n) if $open;

