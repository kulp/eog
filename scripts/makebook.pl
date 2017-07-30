#!/usr/bin/env perl
use strict;
use warnings;

use POSIX qw(ceil);

use File::Basename qw(fileparse);

our $crop_threshold = 72; # points of smallest reasonable croppable thing

# TODO first page ("title page" ?) gets undesired extra whitespace at top

my $prev_height =  0; # points
my $prev_clip   = undef; # stringified boolean
my $prev_name   = "";
my $scale       = 1.062; # TODO compute this
my $fudge       = 1; # XXX unexplained fudge factor (rounding error ?)
my $max_height  = 9*72-36-36-$fudge; # post-scaled maximum point height (9 inch page minus half-inch borders)

print q(\centering), "\n";

for my $pdf (@ARGV) {
    my ($name,$path,$suffix) = fileparse($pdf,".pdf");
    open my $metrics, qq($path../../metrics/$name.metrics)
        or die "Cannot open metrics file: $!";
    my $page = 0;
    while (<$metrics>) {
        my $addl = $name =~ /EOGa/;
        $page++;
        my @dims = map /(\d+)/g, (split " ")[2,3];
        my ($width, $height, $total_width, $total_height, $crop_amount_left, $crop_amount_top) = @dims;
        my $crop_amount_bottom = $total_height - $height - $crop_amount_top;
        my $crop_amount_right  = $total_width  - $width  - $crop_amount_left;
        my $clip = ($crop_amount_bottom > $crop_threshold) ? "true" : "false";
        (my $basename = $pdf) =~ s/\.[^.]*$//; # strip extension
        # symmetrically crop left and right by empirically-determined amount
        $crop_amount_left = $crop_amount_right = 8;

        if ($clip eq "true" and $prev_clip eq $clip) {
            print "\\\\\\vfill\n";
            my $points = ceil($height * $scale + 1) + ceil($prev_height * $scale + 1) - $max_height;
            if ($points > 0) {
                die "Can't fit $pdf onto page with preceding file -- over by $points pts";
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
        printf q(%-20s{\\includegraphics[scale=%4.3f,clip=%5s,trim=%2dpt %3dpt %2dpt %2dpt,page=%d]{%s}}),
               $hyper, $scale, $clip, $crop_amount_left, $crop_amount_bottom, $crop_amount_right, $crop_amount_top, $page, $basename;
        $prev_name = $name;
    }
}

