#!/usr/bin/env perl
use strict;
use warnings;

use CGI qw(:standard); # just for HTML shortcuts
use File::Basename qw(basename dirname);
use File::Slurp qw(slurp);

my $should_embed = int($ENV{EMBED_SVG} // 0);
my @svgs = @ARGV;
my @ids = map int, map /EOG(\d{3})/, @svgs;

sub exist { grep /^$_[0]/, @ids }
sub eog ($) { sprintf "EOG%03d", shift }

sub make_pad
{
    my ($num) = @_;

    div({ -id => "k$num" },
            div({ -class => "pad" },
                a({ -href => "#" }, "&times;"),
                (map {
                 my $whole = 10 * int($num || 0) + $_;
                 a(exist($whole) ? { -href => "#k$whole" } : { -class => "disabled" }, $_)
                 } 1..9, 0),
                a(exist("$num\$") ? { -href => "#" . eog $num } : { -class => "disabled" }, "&crarr;"),
               ),
            div({ -class => "keyed" }, $num),
       )
}

my $stylefile = dirname($0) . "/svg.css";
my $styles = slurp $stylefile;
my @linked_style = $ENV{EMBED_CSS}
    ? ()
    : (-style => { src => "svg.css" });
my @embedded_style = $ENV{EMBED_CSS}
    ? style($styles)
    : ();

print
    start_html(-title  => "Echoes of Grace",
        @linked_style,
        -head   => [
            @embedded_style,
            meta({ -http_equiv => "Content-Type", -content => "text/html; charset=UTF-8" }),
            meta({ -name => "viewport", -content => "width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" }),
            meta({ -name => "apple-mobile-web-app-capable", -content => "yes" }),
        ],
    ),
    (map make_pad($_), @ids),
    (map {
        my ($id) = /EOG(\d{3})/;
        div({ -id => eog $id, -class => "upon-request" },
            div(
                div({ -class => "pad" },
                    a(exist($id-1) ? { -href => "#".eog($id-1) } : { -class => "disabled" }, "&larr;"),
                    (map a(exist($_) ? { -href => "#k$_" } : { -class => "disabled" }, $_), 1..9, 0),
                    a(exist($id+1) ? { -href => "#".eog($id+1) } : { -class => "disabled" }, "&rarr;"),
                   ),
               ),
            div({ -class => "presentation", },
                $should_embed ? slurp($_) : object({ -type => "image/svg+xml", -data => basename($_) }, ""),
               ),
           )
    } @svgs),
    div({ -id => "empty" },
            div({ -class => "pad" },
                a({ -class => "disabled" }, "&times;"),
                (map a(exist($_) ? { -href => "#k$_" } : { -class => "disabled" }, $_), 1..9, 0),
                a({ -class => "disabled" }, "&crarr;"),
               ),
       ),
    end_html;

