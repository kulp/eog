#!/usr/bin/env perl
use strict;
use warnings;

use List::MoreUtils qw(uniq);
use Perl6::Slurp qw(slurp);

sub get_key ($$)
{
    my ($file, $key) = @_;
    my ($what) = map /\b$key = "(.*?)"/, slurp $file;
    return $what;
}

my @files = @ARGV;

my %dirs     = qw(pdf PDF midi MIDI);
my %exts     = reverse %dirs;
#my @types    = keys %dirs;
my @dirs     = values %dirs;
my @stems    = uniq sort map m#([^/]+)\.(?:pdf|midi)$#, @files;
my %variants = map { my $dir = $_; $dir => [ uniq sort map m#$dir/([^/]+)/.*$#, @files ] } @dirs;
my %vcount   = map { $_ => scalar @{ $variants{$_} } } keys %variants;

print <<HEAD;
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Echoes of Grace layout project</title>
<script src="scripts/sorttable.js"></script>
<style type="text/css">
table#main td {
    padding-left:  0.5ex;
    padding-right: 0.5ex;
}
th.wide {
    border-bottom: 1px solid grey;
}
.index {
    text-align: right;
}
td.title {
    font-style: italic;
    padding-left:  1em;
    padding-right: 1em;
}
table.sortable thead {
    color:#666666;
    font-weight: bold;
    cursor: default;
}
</style>
</head>
<body>
<table class="sortable" id="main">
HEAD

print qq(<thead>);
print qq(<tr>);
print qq( <th class="sorttable_nosort" colspan="4"></th>);
for my $dir (@dirs) {
    print qq( <th class="sorttable_nosort wide" colspan="$vcount{$dir}">$dir</th>);
}
print qq(</tr>);

print qq(<tr>);
print qq( <th>Index</th><th>Title</th><th>Poet</th><th>Composer</th>);
for my $dir (@dirs) {
    for my $v (@{ $variants{$dir} }) {
        print qq( <th class="sorttable_nosort">$v</th>);
    }
}
print qq(</tr>);
print qq(</thead>);

print qq(<tbody>);
for my $stem (@stems) {
    my $src      = "src/$stem.ly";
    my $title    = get_key($src, "title");
    my $poet     = get_key($src, "poet");
    my $composer = get_key($src, "composer");
    my $index    = int(($stem =~ /EOG(\d+)/)[0]);
    (my $safetitle = $title) =~ s/[^\s\w]//g;
    print qq( <tr><th class="index">$index</th><td class="title" sorttable_customkey="$safetitle">$title</td><td class="poet">$poet</td><td class="composer">$composer</td>);
    for my $dir (@dirs) {
        for my $v (@{ $variants{$dir} }) {
            print qq(  <td><a href="$dir/$v/$stem.$exts{$dir}">$stem.$exts{$dir}</a></td>);
        }
    }
    print qq( </tr>\n);
}
print qq(</tbody>);

print <<FOOT;
</table>
</body>
</html>
FOOT

