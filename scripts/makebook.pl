#!/usr/bin/env perl
use strict;
use warnings;

use POSIX qw(ceil);

use File::Basename qw(fileparse);

our $crop_threshold = 72; # points of smallest reasonable croppable thing

my $prev_height =  0; # points
my $prev_clip   = undef; # stringified boolean
my $prev_name   = "";
my $scale       = 1.083; # ideally this value would be computed, but for now it is empirical
my $pre_fudge   = 0.25; # compensate for rounding error in ImageMagick
my $fudge       = 1 + ($pre_fudge * $scale); # empirical adjustment for scaling
my $max_height  = 9*72-30-30-$fudge; # post-scaled maximum point height (9 inch page minus top and bottom borders)

print q(\centering), "\n";

for my $pdf (@ARGV) {
    my ($name,$path,$suffix) = fileparse($pdf,".pdf");
    open my $metrics, qq($path../../metrics/$name.metrics)
        or die "Cannot open metrics file: $!";
    my $page = 0;
    while (<$metrics>) {
        my $addl = $name =~ /EOGa/;
        $page++;
        my @dims = /(\d+)/g;
        my ($total_width, $total_height, $width, $height, $crop_amount_left, $crop_amount_top) = @dims;
        my $crop_amount_bottom = $total_height - $height - $crop_amount_top - $pre_fudge;
        my $crop_amount_right  = $total_width  - $width  - $crop_amount_left - $pre_fudge;
        my $clip = ($crop_amount_bottom > $crop_threshold) ? "true" : "false";
        # Additional Tunes start on their own page now
        $prev_clip = "false" if $pdf =~ /EOGa0\d/;
        (my $basename = $pdf) =~ s/\.[^.]*$//; # strip extension
        # symmetrically crop left and right by empirically-determined amount
        $crop_amount_left = $crop_amount_right = 8;

        if ($clip eq "true" and $prev_clip eq $clip) {
            print "\\\\\\vfill\n";
            my $points = ceil($height * $scale + 1) + ceil($prev_height * $scale + 1) - $max_height;
            if ($points > 0) {
                die sprintf "Can't fit %s onto page with preceding file -- over by %4.2f pts", $pdf, $points;
            }
            # reset state so that we don't try to "chain" fits -- we only fit two per page, ever
            $prev_height = 0;
            $prev_clip = "false"; # lie about previous clipping
        } else {
            if ($addl) {
                print "\\vfill\n";
            } elsif (defined $prev_clip) {
                print "\\vfil\\pagebreak\n";
            }
            $prev_clip = $clip;
            $prev_height = $height;
        }

        my $hyper = $page > 1 ? "" : "\\hypertarget{$name}";
        print qq(\\newpage\\Large{\\textsc{Additional Tunes}}\\vfill\n) if $addl and $prev_name !~ /EOGa/;
        printf q(%-20s{\\includegraphics[scale=%4.3f,clip=%5s,trim=%2dpt %6.2fpt %2dpt %2dpt,page=%d]{%s}}),
               $hyper, $scale, $clip, $crop_amount_left, $crop_amount_bottom, $crop_amount_right, $crop_amount_top, $page, $basename;
        $prev_name = $name;
    }
}

