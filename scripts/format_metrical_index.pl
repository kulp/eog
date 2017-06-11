#!/usr/bin/perl
use strict;

my $open = 0;
my $closeright = 0;

while (<>) {
    chomp;
    next if /^$/;
    if (/^(?! )/) {
        # meter
        print qq(\\end{flushright}\n) if $open and $closeright;
        print qq(\\needspace{\\baselineskip}\n);
        print qq({\\centering\\textbf{$_}\\par}\n);
        $open = 1;
        $closeright = 0;
    } else {
        if (/^ (Also )?Tunes?/) {
            print qq(\\begin{flushright});
            $closeright = 1;
        }
        my ($name, $nums) = split /\t/;
        if (length $name > 20) {
            my @words = split " ", $name;
            my @first = @words[0 .. $#words / 2];
            my @last  = @words[$#words / 2 + 1 .. $#words];
            print qq({\\flushleft @first \\\\ ~~~@last\\dotfill }$nums\n);
        } else {
            print qq(\n$name\\dotfill $nums\n);
        }
    }
}

print qq(\\end{flushright}\n) if $open and $closeright;

