#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

use File::Slurp;

my $prev_file = "";

my %meter_map = (
    # TODO
);

my %eog_meter_overrides = (
    # TODO
);

my %eog_indent_overrides = (
    # TODO
    # TODO handle particularly: EOG030
);

my $staged;
my $fh;
while (<ARGV>) {
    if ($ARGV ne $prev_file) {
        $prev_file = $ARGV;

        print $fh $staged, "\n" if defined $staged && defined $fh;

        my ($eog) = $ARGV =~ /(EOG\d+)/;
        my $meter = $eog_meter_overrides{$eog} || read_file "PDF/eogsized/$eog.meter"
            or die "No meter found for $eog";

        open $fh, ">", "booklayout/lyricsonly/fragments/$eog.tex";

        $meter =~ s/\s*with\s*Refrain//gi;
        $meter =~ s/ Iambic/_Iambic/;
        $meter =~ s/ //g;
        $meter =~ s/_/ /g;
        # Normalize dashes to hyphens for lookup purposes:
        (my $lookup = $meter) =~ s/—/-/g;

        my $indents = $eog_indent_overrides{$eog} // $meter_map{$lookup}
            // die "Indents indeterminate for $eog";

        undef $staged;
        say q(\vfill);
        say q(\input{booklayout/lyricsonly/fragments/) . $eog . q(});
        say $fh q(\renewcommand\thepoemmeter{) . $meter . "}";
        say $fh q(\titlepoem{\poemblanktitle});
        if (ref $indents) {
            say $fh q(\def\poemvsindentlines{});
            say $fh q(\setcounter{poemindentevery}{) . $$indents . "}";
        } else {
            say $fh q(\def\poemvsindentlines{) . $indents . "}";
            say $fh q(\setcounter{poemindentevery}{0});
        }
        say $fh q(\poem);
    }

    my $prev;
    if (/^$/) {
        $staged = qq( \\\\!\n);
    } else {
        print $fh $staged, "\n" if defined $staged;
        chomp;
        print $fh $_;
        $staged = q( \\\\);
    }
    $staged = qq( \\\\-\n) if eof;
    $prev = $_;

}

print $fh $staged, "\n" if defined $staged;
