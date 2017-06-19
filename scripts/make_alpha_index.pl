#!/usr/bin/perl
use strict;
use utf8;

use List::Util qw(sum);

binmode \*STDIN , ":utf8";
binmode \*STDOUT, ":utf8";

my $count = shift;
my @list;
my %uniq;

my $width_threshold = 62;
my @widths = (
    [ qw() ],
    [ qw(t i f j l I ; : “ ” ‘ ’ . , ! ?), ' ', 0..9 ],
    [ qw(q e r y u o p a s d g h k z x c v b n T F J L Q E R Y U O P A S D G H K Z X C V B N) ],
    [ qw(w m W M –) ],
);
my %widths = map {
    my $w = $_;
    map { $_ => $w } @{ $widths[$w] }
} 0 .. $#widths;

# guess length based on rough proportional-width map
sub compute_length {
    return sum map $widths{$_}, split //, shift;
}

sub add {
    my $i = shift;
    local $_ = shift;
    s/è/e/g;
    my @F = split " ";
    pop @F while compute_length("@F $i") > $width_threshold;
    $_ = "@F";
    s/[,:;–—]$//g;
    push @list, [ $_, $i ] unless $uniq{"$_/$i"}++;
}

for my $file (@ARGV) {
    my ($i) = $file =~ /EOG0*(\d+)/;
    my $txt = sprintf "TXT/default/EOG%03d.txt", $i;
    open my $fh, "<:utf8", $txt;

    add($i, scalar <$fh>);
    my ($refrain) = grep /^ /, <$fh>;
    add($i, $refrain) if defined $refrain and $ENV{USE_REFRAIN};
}

sub dictionary_order {
    (my $aa = $a->[0]) =~ s/\p{IsPunct}//g;
    (my $bb = $b->[0]) =~ s/\p{IsPunct}//g;
    return $aa cmp $bb;
}

my $last = '';
for (sort dictionary_order @list) {
    my ($letter) = $_->[0] =~ /(\w)/;
    print qq(\\vfil\n);
    print qq({\\centering\\textbf{—\u$letter—}\\par}\\nopagebreak\n\n) if $letter ne $last;
    print qq($_->[0]\\dotfill{}$_->[1]\n\n);
    $last = $letter;
}

