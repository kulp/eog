#!/usr/bin/env perl
use strict;
use warnings;

use CGI qw(:standard); # just for HTML shortcuts
use DateTime;
use DateTime::Format::RFC3339;
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

my %dirs     = qw(pdf PDF midi MIDI mp3 MP3 txt TXT);
my %exts     = reverse %dirs;
my @dirs     = sort values %dirs;
my @stems    = uniq sort map m#([^/]+)\.(?:pdf|midi)$#, @files;
my @lists    = grep /\.m3u$/, @files;
my %variants = map { my $dir = $_; $dir => [ uniq sort map m#$dir/([^/]+)/.*$#, @files ] } @dirs;
my %vcount   = map { $_ => scalar @{ $variants{$_} } } keys %variants;
my %have     = map { (m#^([^/]+)#)[0] => 1 } @files;

sub when
{
    my ($dt) = @_;
    return $dt->format_cldr('d MMM YYYY');
}

sub deparse8601
{
    # why can't DateTime::Format::RFC3339 or DateTime::Format::RFC3339 parse a
    # git timestamp in the form '2011-07-23 09:20:09 -0500' ?
    my ($d) = @_;
    chomp $d;
    $d =~ s/ /T/;
    $d =~ s/\s*([-+]\d{2})(\d{2})/$1:$2/;
    return DateTime::Format::RFC3339->parse_datetime($d);
}

my @existing = qx(find src -name EOG???.ly);
my $total = 376 + 8;

print
    start_html(-title  => "Echoes of Grace layout project",
        -style  => { -src => "scripts/main.css" },
        -head   => [ meta({ -http_equiv => "Content-Type",
                            -content => "text/html; charset=UTF-8" }), ],
        -script => [ { -src => "scripts/sorttable.js" },
                     { -src => "scripts/table.js"     }, ],
        -onLoad => "document.getElementById('searchbox').focus()",
    ),
    h1({ -style => "text-align: center" },
        "Hymns from the", i("Echoes of Grace")),
    p("This site hosts printable PDFs, text files, and computer-generated music files",
        "for many of the hymns in the",
        a({ -href => "http://bibletruthpublishers.com/echoes-of-grace-hymn-book-large-music-edition-plastic-coil-binding/pd2535" },
            "Echoes of Grace hymn book"),
        "published by",
        a({ -href => "http://bibletruthpublishers.com/" }, "Bible Truth Publishers") . ".",
        "These hymns are being laid out by",
        a({ -href => "http://kulp.ch" }, "Darren Kulp"),
        "using the",
        a({ -href => "http://www.lilypond.org/" }, "LilyPond"),
        "software package. The source files for the hymns below are found at the",
        a({ -href => "https://github.com/kulp/eog" }, "Github project") . ",",
        "which aims eventually to complete the list below with all 379 hymns",
        "from the music edition of the Echoes of Grace hymn book."),
    p("Playlists for all available MP3s:", map { a({ -href => "$_" }, $_), " " } @lists),
    p(sprintf "Progress: %d/%d files = %4.2f%% complete",
            scalar(@existing), $total, 100.0 * scalar(@existing)/$total),
    table({ -class => "sortable", -id => "main" },
        thead(
            Tr(
                th({ -class => "corner" }, "Filter:"),
                th({ -class => "sortbox", -colspan => 3 }, # title poet composer
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

             (map th({ -class => "wide", -colspan => $vcount{$_} }, $_), grep $have{$_}, @dirs),
            ),
            Tr({ -class => "realhead" },
                (map th($_), qw(No. Title Poet Composer)),
                (map th({ -class => "nosort" }, $_), map @{ $variants{$_} }, @dirs),
                th("Added"),
            ),
        ),
        tbody(
            (map {
                my $stem = $_;
                my $src      = "src/$stem.ly";

                my $title    = get_key $src => "title";
                my $poet     = get_key $src => "poet";
                my $composer = get_key $src => "composer";

                my $index    = int(($stem =~ /EOG(\d+)/)[0]);
                (my $safetitle = $title) =~ s/[^\s\w]//g;

                Tr(
                    th({ -class => "index"                          } , $index),
                    td({ -class => "title", customkey => $safetitle } , $title),
                    td({ -class => "poet"                           } , $poet),
                    td({ -class => "composer"                       } , $composer),
                    (map { my $dir = $_; map {
                        my $where = "$dir/$_/$stem.$exts{$dir}";
                        td({ -class => "link" }, (-e $where) ? a({ -href => $where }, $dir) : ""),
                    } @{ $variants{$dir} } } @dirs),
                    (do {
                        my @dates = map deparse8601($_),
                                    qx(git log --reverse --format=format:%ai src/$stem.ly | head -n1);
                        td({ -class => "date_added", customkey => "$dates[-1]" }, when($dates[-1]))
                    }),
                );
            } @stems),
        ),
    ),
    end_html;

