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
        my ($height, $total, $offset) = @dims[1,3,5];
        my $crop_amount_bot = $total - $height - $offset;
        my $crop_amount_top = $offset;
        my $clip = ($crop_amount_bot > $crop_threshold) ? "true" : "false";
        (my $basename = $pdf) =~ s/\.[^.]*$//; # strip extension
        printf q(\centering\includegraphics[clip=%-5s,trim=0 %3dpt 0 %3dpt,page=%d]{%s} \\\\)."\n",
               $clip, $crop_amount_bot, $crop_amount_top, $page, $basename;
    }
}

print <<'EOF';
\end{document}
EOF

