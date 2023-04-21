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
} glob "PDF/eogsized/EOG*.tunename";

my %meters;

while (<>) {
    my ($meter) = /^([^\t]+)\t/;
    my @nums = /EOG(a?\d+)\s*/g;
    push @{ $meters{$meter}{ $names{$_} } }, $_ for @nums;
}

sub dictionary {
    (my $aa = $a) =~ s/[[:punct:]]//g;
    (my $bb = $b) =~ s/[[:punct:]]//g;
    s/\bSt\b/Saint/g for $aa, $bb;
    $aa cmp $bb
}

sub numeric { $a <=> $b }

sub munge {
    my @in = @_;
    s/\ba/Add. Tune / for @in;
    s/\b0+// for @in;
    return @in;
}

# Translate explicit (UTF-8) quotes into ascii symbols that TeX understands,
# and do similarly for dashes. This is a workaround for tectonic with TeX Gyre
# Schola (lualatex with that font works; tectonic with the default font works).
sub fix_chars {
    local $_ = shift;
    s/^“/\\lllap{``}/;
    s/“/``/g;
    s/”/''/g;
    s/‘/`/g;
    s/’/'/g;
    s/–/\\textendash{}/g;
    s/—/\\textemdash{}/g;
    $_
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
        $song = fix_chars($song);
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
    print $header, @lines;
    @lines = ();
    $meter = fix_chars($meter);
    $header = "$meter\n";
    my $have = 0;
    handle($rec, \@lines, \$have);
    $last = $rec;
}

print $header, @lines;
