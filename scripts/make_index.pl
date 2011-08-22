#!/usr/bin/env perl
use strict;
use warnings;

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

my $headcontent = eval { slurp("scripts/kulpheadcontent") } || "";

print qq(
<!DOCTYPE HTML SYSTEM>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Echoes of Grace layout project</title>
<script type="text/javascript" src="scripts/sorttable.js"></script>
<script type="text/javascript" src="scripts/kulpstuff.js"></script>
<script type="text/javascript" src="scripts/table.js"> </script>
<link rel="stylesheet" type="text/css" href="scripts/main.css" />
$headcontent
</head>
<body onLoad="document.getElementById('searchbox').focus()">
<p>Download a <a href="EOG_midi_pdf.zip">zip file of all PDF and MIDI files</a> listed.</p>
<table class="sortable" id="main">
  <thead>
    <tr>
      <th class="corner">Filter:</th>
      <th class="sortbox" colspan="4">
        <form onsubmit="return false;">
          <input id="searchbox" name="filter" onkeyup="filter2(this, 'main')" type="text" size="35">
          <button onclick="return do_reset();" value="Reset">Reset</button>
        </form>
      </th>),
 (map qq(
      <th class="wide" colspan="$vcount{$_}">$_</th>), @dirs),
      qq(
    </tr>
    <tr class="realhead">
      <th>Index</th><th>Title</th><th>Poet</th><th>Composer</th><th>Meter</th>),
 (map qq(
      <th class="sorttable_nosort">$_</th>), map @{ $variants{$_} }, @dirs),
      qq(
    </tr>
  </thead>
  <tbody>);

for my $stem (@stems) {
    my $src      = "src/$stem.ly";

    my $title    = get_key $src => "title";
    my $poet     = get_key $src => "poet";
    my $composer = get_key $src => "composer";
    my $meter    = get_key $src => "meter";

    my $index    = int(($stem =~ /EOG(\d+)/)[0]);
    (my $safetitle = $title) =~ s/[^\s\w]//g;
    print qq(
    <tr>
      <th class="index">$index</th>
      <td class="title" sorttable_customkey="$safetitle">$title</td>
      <td class="poet">$poet</td>
      <td class="composer">$composer</td>
      <td class="meter">$meter</td>);
    for my $dir (@dirs) {
        for my $v (@{ $variants{$dir} }) {
            print qq(
      <td><a href="$dir/$v/$stem.$exts{$dir}">$stem.$exts{$dir}</a></td>);
        }
    }
    print qq(
    </tr>);
}

print qq(
  </tbody>
</table>
</body>
</html>
);

