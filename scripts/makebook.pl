#!/usr/bin/env perl
use strict;
use warnings;

use File::Basename qw(fileparse);

our $crop_threshold = 72; # points of smallest reasonable croppable thing

# TODO first page ("title page" ?) gets undesired extra whitespace at top

my $prev_height =  0; # points
my $prev_clip   = ""; # stringified boolean
my $max_height  = 546; # points (199mm, 7.833in)

for my $pdf (@ARGV) {
    my ($name,$path,$suffix) = fileparse($pdf,".pdf");
    open my $metrics, qq($path../../metrics/$name.metrics)
        or die "Cannot open metrics file: $!";
    my $page = 0;
    while (<$metrics>) {
        $page++;
        my @dims = map /(\d+)/g, (split " ")[2,3];
        my ($width, $height, $total_width, $total_height, $crop_amount_left, $crop_amount_top) = @dims;
        my $crop_amount_bottom = $total_height - $height - $crop_amount_top;
        my $crop_amount_right  = $total_width  - $width  - $crop_amount_left;
        my $clip = ($crop_amount_bottom > $crop_threshold) ? "true" : "false";
        (my $basename = $pdf) =~ s/\.[^.]*$//; # strip extension
        # disable cropping left and right, as this causes markup-only hymns to have misaligned titles
        $crop_amount_left = $crop_amount_right = 0;
        # crop top minimally, as we want a consistent height for the title,
        # regardless of how high an ascending stroke (especially inverted
        # commas) might rise
        $crop_amount_top = 8;
        my $scale = 1.11; # TODO compute this

        if ($clip eq "true" and $prev_clip eq $clip) {
            print q(\vfill), "\n";
            my $points = $height + $prev_height - $max_height;
            if ($points > 0) {
                die "Can't fit $pdf onto page with preceding file -- over by $points pts";
            }
            # reset state so that we don't try to "chain" fits -- we only fit two per page, ever
            $prev_height = 0;
            $prev_clip = "false"; # lie about previous clipping
        } else {
            $prev_clip = $clip;
            $prev_height = $height;
        }

        printf q(\centering\includegraphics[scale=%4.2f,clip=%-5s,trim=%2dpt %3dpt %2dpt %2dpt,page=%d]{%s} \\\\)."\n",
               $scale, $clip, $crop_amount_left, $crop_amount_bottom, $crop_amount_right, $crop_amount_top, $page, $basename;
    }
}

