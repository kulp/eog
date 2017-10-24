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
my $records;
while (<>) {
    chomp;
    next if /^$/;
    if (/^(?! )/) {
        # meter
        print qq(}\n) if $records == 1;
        print qq(\\end{flushright}\\medbreak\n) if $open;
        print qq(\n);
        print qq(\\noindent\\begin{flushright}\n);
        print qq(\\vbox{{\\centering\\textbf{$_}\\par\\vspace{-\\partopsep}}\n);
        $open = 1;
        $meter = $_;
        $records = 0;
    } else {
        print qq(}\\vspace{-\\partopsep}\n) if $records++ == 1;
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

