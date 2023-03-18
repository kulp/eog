#!/usr/bin/perl
use strict;
use utf8;

use List::Util qw(sum);

binmode \*STDIN , ":utf8";
binmode \*STDOUT, ":utf8";

my @list;
my %uniq;

my $width_threshold = 101;
my @widths = (
    [ qw() ],
    [ qw(; : ‘ ’ . , !) ],
    [ qw(t i f j l r I “ ”), ' ' ],
    [ qw(q e y u o p a s d g h k z x c v b n ?), 0..9  ],
    [ qw(w m T F J L Q E R Y U O P A S D G H K Z X C V B N –) ],
    [ qw(W M —) ],
);
my %widths = map {
    my $w = $_;
    map { $_ => $w } @{ $widths[$w] }
} 0 .. $#widths;

# guess length based on rough proportional-width map
sub compute_length {
    return sum map $widths{$_}, split //, shift;
}

# Translate explicit (UTF-8) quotes into ascii symbols that TeX understands,
# and do similarly for dashes. This is a workaround for tectonic with TeX Gyre
# Schola (lualatex with that font works; tectonic with the default font works).
sub fix_chars {
    local $_ = shift;
    s/“/``/g;
    s/”/''/g;
    s/‘/`/g;
    s/’/'/g;
    s/–/\\textendash{}/g;
    s/—/\\textemdash{}/g;
    $_
}

sub add {
    my $i = shift;
    local $_ = shift;
    s/è/e/g;
    my @F = split " ";
    pop @F while compute_length("@F $i") > $width_threshold;
    $_ = "@F";
    s/[,:;–—]$//g;
    # Translate explicit quotes back into implicit quotes; this is a workaround
    # for tectonic with TeX Gyre Schola (lualatex with that font works;
    # tectonic with the default font works).
    $_ = fix_chars($_);
    push @list, [ $_, $i ] unless $uniq{"$_/$i"}++;
}

for my $file (@ARGV) {
    my ($i) = $file =~ /EOG0*(\d+)/;
    open my $fh, "<:utf8", $file;

    add($i, scalar <$fh>);
    my ($refrain) = grep /^ /, <$fh>;
    add($i, $refrain) if defined $refrain and $ENV{USE_REFRAIN};
}

sub dictionary_order {
    (my $aa = $a->[0]) =~ s/\p{IsPunct}//g;
    (my $bb = $b->[0]) =~ s/\p{IsPunct}//g;
    return $aa cmp $bb;
}

my $last_letter = '';
my $last_title = qr/^$/; # unmatchable to begin with
for (sort dictionary_order @list) {
    my ($letter) = $_->[0] =~ /(\w)/;
    print qq(\\smallbreak{\\centering\\textbf{\\textemdash{}\u$letter\\textemdash{}}\\par}\\nopagebreak\n\n) if $letter ne $last_letter;
    my $title = $_->[0];
    $title =~ s/ \.\.\.$//; # suppress ellipsis dots that interfere with \dotfill
    # Suppress titles that are merely suffixes (let the prefix just emitted cover both)
    printf qq(\\hyperlink{EOG%03d}{%s\\dotfill{}%s}\n\n), $_->[1], $title, $_->[1] unless $title =~ /^$last_title/;
    $last_title = $title;
    $last_letter = $letter;
}

