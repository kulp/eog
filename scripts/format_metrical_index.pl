#!/usr/bin/perl
use strict;

my $open = 0;

binmode \*STDIN, ":utf8";
binmode \*STDOUT, ":utf8";

sub expand {
    my ($add, $num) = @_;
    return $add ? (sprintf "a%02d", $num) : (sprintf "%03d", $num);
}

sub letter_length ($) {
    local $_ = $_[0];
    s/[^a-z ]//ig;
    return length;
}

print qq(\\interlinepenalty=10000\n);
my $meter;
while (<>) {
    chomp;
    next if /^$/;
    if (/^(?! )/) {
        # meter
        print qq(\\end{flushright}\\medbreak\n) if $open;
        print qq(\n);
        print qq({\\centering\\textbf{$_}\\par}\n);
        print qq(\\noindent\\begin{flushright}\n);
        $open = 1;
        $meter = $_;
    } else {
        next if /Also Tune/ and $meter =~ /P\. M\./; # special case
        s/^ //; # chop leading space
        my ($name, $nums) = split /\t/;
        my $split = letter_length $name > 19
            || ($nums =~ /Add\. Tune/ && letter_length "$name $nums" > 22 && $nums !~ /,/);
        $nums =~ s#(Add\. Tune )?\b(\d+)\b#"\\hyperlink{EOG" . expand($1, $2) . "}{$1$2}"#ge;
        if ($split) {
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

