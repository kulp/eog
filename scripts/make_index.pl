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
<!DOCTYPE HTML SYSTEM>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Echoes of Grace layout project</title>
<script type="text/javascript" src="scripts/sorttable.js"></script>
<script type="text/javascript">

// Adapted from http://www.vonloesch.de/node/23
// I use table.tBodies[0].rows instead of table.rows
function filter2(phrase, _id){
    var words = phrase.value.toLowerCase().split(" ");
    var table = document.getElementById(_id);
    var tbody = table.tBodies[0];
    var ele;
    for (var r = 0; r < tbody.rows.length; r++){
        ele = tbody.rows[r].innerHTML.replace(/<[^>]+>/g,"");
        var displayStyle = 'none';
        for (var i = 0; i < words.length; i++) {
            if (ele.toLowerCase().indexOf(words[i])>=0)
                displayStyle = '';
            else {
                displayStyle = 'none';
                break;
            }
        }
        tbody.rows[r].style.display = displayStyle;
    }
}

</script>
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
tr.realhead th, tr td:first-child {
    /* keep the table from jumping around when arrows are inserted during sorts */
    min-width: 10ex;
}
form {
    display: inline;
}
th.corner {
    text-align: right;
}
th.sortbox {
    text-align: left;
}
</style>
</head>
<body onLoad="document.getElementById('searchbox').focus()">
<table class="sortable" id="main">
HEAD

print qq(<thead>);
print qq(<tr>);
print qq(
<th class="sorttable_nosort corner">Filter:</th>
<th class="sorttable_nosort sortbox" colspan="3">
<form><input id="searchbox" name="filter" onkeyup="filter2(this, 'main')" type="text" size="35"></form>
</th>);
for my $dir (@dirs) {
    print qq( <th class="sorttable_nosort wide" colspan="$vcount{$dir}">$dir</th>);
}
print qq(</tr>);

print qq(<tr class="realhead">);
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

