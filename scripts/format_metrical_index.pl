#!/usr/bin/perl
use strict;

my $open = 0;

print qq(\\interlinepenalty=10000\n);
while (<>) {
    chomp;
    next if /^$/;
    if (/^(?! )/) {
        # meter
        print qq(\\end{flushright}\n) if $open;
        print qq(\n);
        #print qq(\\needspace{\\baselineskip}\n);
        print qq({\\centering\\textbf{$_}\\par}\n);
        print qq(\\begin{flushright}\n);
        $open = 1;
    } else {
        my ($name, $nums) = split /\t/;
        if (length $name > 20) {
            my @words = split " ", $name;
            my @first = @words[0 .. $#words / 2];
            my @last  = @words[$#words / 2 + 1 .. $#words];
            print qq({\\flushleft @first \\\\ ~~~@last\\dotfill }$nums\n);
        } else {
            print qq({\\flushleft $name \\dotfill }$nums\n);
        }
    }
}

print qq(\\end{flushright}\n) if $open;

