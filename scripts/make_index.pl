#!/usr/bin/env perl
use strict;
use warnings;

use CGI qw(:standard); # just for HTML shortcuts
use List::MoreUtils qw(uniq);
use Perl6::Slurp qw(slurp);

{
    my %cache;

    sub get_key ($$)
    {
        my ($file, $key) = @_;
        my ($what) = map /\b$key\s*=\s*"(.*?)"/, $cache{$file} ||= slurp $file;
        return $what;
    }
}

my @files = @ARGV;

my %dirs     = qw(pdf PDF midi MIDI mp3 MP3);
my %exts     = reverse %dirs;
my @dirs     = values %dirs;
my @stems    = uniq sort map m#([^/]+)\.(?:pdf|midi)$#, @files;
my %variants = map { my $dir = $_; $dir => [ uniq sort map m#$dir/([^/]+)/.*$#, @files ] } @dirs;
my %vcount   = map { $_ => scalar @{ $variants{$_} } } keys %variants;

print
    start_html(-title  => "Echoes of Grace layout project",
           -style  => { -src => "scripts/main.css" },
           -head   => [ meta({ -http_equiv => "Content-Type",
                             -content => "text/html; charset=UTF-8" }),
                        eval { slurp("scripts/kulpheadcontent") } ],
           -script => [ { -src => "scripts/sorttable.js" },
                        { -src => "scripts/kulpstuff.js" },
                        { -src => "scripts/table.js"     }, ],
           -onLoad => "document.getElementById('searchbox').focus()",
       ),

    p("Download a",
        a({ -href => "EOG_midi_pdf.zip" }, "zip file of all PDFs and MIDIs"),
        "listed."),
    table({ -class => "sortable", -id => "main" },
        thead(
            Tr(
                th({ -class => "corner" }, "Filter:"),
                th({ -class => "sortbox", -colspan => 4 },
                    start_form({ -onSubmit => "return false;", -action => "" }),
                        input({ -id      => "searchbox",
                                -name    => "filter",
                                -onkeyup => "filter2(this, 'main')",
                                -type    => "text",
                                -size    => 35 }),
                        button({ -onclick => "return do_reset();",
                                 -value   => "Reset" }, "Reset"),
                    end_form,
                ),

             (map th({ -class => "wide", -colspan => $vcount{$_} }, $_), @dirs),
            ),
            Tr({ -class => "realhead" },
                th("Index"), th("Title"), th("Poet"), th("Composer"), th("Meter"),
                (map th({ -class => "nosort" }, $_), map @{ $variants{$_} }, @dirs),
            ),
        ),
        tbody(
            (map {
                my $stem = $_;
                my $src      = "src/$stem.ly";

                my $title    = get_key $src => "title";
                my $poet     = get_key $src => "poet";
                my $composer = get_key $src => "composer";
                my $meter    = get_key $src => "meter";

                my $index    = int(($stem =~ /EOG(\d+)/)[0]);
                (my $safetitle = $title) =~ s/[^\s\w]//g;

                Tr(
                    th({ -class => "index"                            } , $index),
                    td({ -class => "title", 'customkey' => $safetitle } , $title),
                    td({ -class => "poet"                             } , $poet),
                    td({ -class => "composer"                         } , $composer),
                    td({ -class => "meter"                            } , $meter),
                    (map { my $dir = $_; map {
                        td([ a({ -href => "$dir/$_/$stem.$exts{$dir}" }, "$stem.$exts{$dir}") ]),
                    } @{ $variants{$dir} } } @dirs),
                );
            } @stems),
        ),
    ),
    end_html;

