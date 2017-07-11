#!/usr/bin/env perl
use strict;

use utf8;
binmode \*STDIN, ":utf8";
binmode \*STDOUT, ":utf8";

require './scripts/sort_meters.pl';

use File::Slurp qw(read_file);

my %names = map {
    if (my ($num) = /.*EOG(a?\d+).tune/) {
        $num => read_file($_, binmode => ':utf8') || 'zzzTune'
    } else { () } # additional tunes
} glob "headers/EOG*.tunename";

my %meters;

while (<>) {
    my ($meter) = /^([^\t]+)\t/;
    my @nums = /EOG(a?\d+)\s*/g;
    push @{ $meters{$meter}{ $names{$_} } }, $_ for @nums;
}

sub dictionary {
    (my $aa = $a) =~ s/[[:punct:]]//g;
    (my $bb = $b) =~ s/[[:punct:]]//g;
    $aa cmp $bb
}

sub numeric { $a <=> $b }

sub munge {
    my @in = @_;
    s/\ba/Add. Tune / for @in;
    s/\b0+// for @in;
    return @in;
}

sub handle {
    my ($rec, $lines, $have) = @_;
    for my $song (sort dictionary keys %$rec) {
        my @nums = @{ $rec->{$song} };
        if ($song =~ /zzz/) {
            $song = "Tune";
            $song .= "s" if @nums > 1;
            $song = "Also $song" if $$have;
        }
        push @$lines, " $song\t" . (join ", ", munge(@nums)) . "\n";
        $$have++;
    }
}

my $header;
my @lines;
my %assorted;
my $last;
for my $meter (sort by_meter keys %meters) {
    my $rec = $meters{$meter};
    print $header, @lines if @lines > 1;
    if (@lines == 1) {
        push @{ $assorted{$_} }, @{ $last->{$_} } for keys %$last;
    }
    @lines = ();
    $header = "$meter\n";
    my $have = 0;
    handle($rec, \@lines, \$have);
    $last = $rec;
}

print $header, @lines if @lines > 2;
@lines = ();
my $have = 0;
handle({ $_ => [ sort numeric @{ $assorted{$_} } ] }, \@lines, \$have) for sort keys %assorted;
print "Uncategorized\n", @lines;

