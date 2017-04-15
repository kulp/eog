#!/usr/bin/env perl
use strict;
use warnings;

our $crop_threshold = 72; # points of smallest reasonable croppable thing

print <<'EOF';
\documentclass{letter}
\usepackage[margin=0pt,paperwidth=127mm,paperheight=199mm]{geometry}
\usepackage{graphicx}
\setlength{\parindent}{0pt}

\begin{document}
EOF

# TODO first page ("title page" ?) gets undesired extra whitespace at top

for my $pdf (@ARGV) {
    open my $pipe, qq(convert "$pdf" -trim info:-|);
    my $page = 0;
    while (<$pipe>) {
        $page++;
        my @dims = map /(\d+)/g, (split " ")[2,3];
        my ($width, $height, $total_width, $total_height, $crop_amount_left, $crop_amount_top) = @dims;
        my $crop_amount_bottom = $total_height - $height - $crop_amount_top;
        my $crop_amount_right  = $total_width  - $width  - $crop_amount_left;
        my $clip = ($crop_amount_bottom > $crop_threshold) ? "true" : "false";
        (my $basename = $pdf) =~ s/\.[^.]*$//; # strip extension
        printf q(\centering\includegraphics[clip=%-5s,trim=%2dpt %3dpt %2dpt %2dpt,page=%d]{%s} \\\\)."\n",
               $clip, $crop_amount_left, $crop_amount_bottom, $crop_amount_right, $crop_amount_top, $page, $basename;
    }
}

print <<'EOF';
\end{document}
EOF

