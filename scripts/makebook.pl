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

for my $pdf (@ARGV) {
    open my $pipe, qq(convert "$pdf" -trim info:-|);
    my $page = 0;
    while (<$pipe>) {
        $page++;
        my @dims = map /(\d+)/g, (split " ")[2,3];
        my ($height, $total, $offset) = @dims[1,3,5];
        my $crop_amount = $total - $height - $offset;
        my $clip = ($crop_amount > $crop_threshold) ? "true" : "false";
        (my $basename = $pdf) =~ s/\.[^.]*$//; # strip extension
        printf q(\includegraphics[clip=%-5s,trim=0 %3dpt 0 0,page=%d]{%s} \\\\)."\n",
               $clip, $crop_amount, $page, $basename;
    }
}

print <<'EOF';
\end{document}
EOF

