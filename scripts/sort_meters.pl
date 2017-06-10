#!/usr/bin/perl
use strict;

sub normalize {
    local $_ = shift;
    if (my ($mult, $base, $rest) = /(\d+)-(\d+)s\.(?:\s*(.*)\s*)?/) {
        return ("$base. " x $mult) . $rest;
    } elsif (my ($base, $dup) = /((?:\d+\. )+)D\./) {
        return $base x 2;
    } else {
        return $_;
    }
}

sub is_num {
    return shift =~ /^\d+\.?$/;
}

sub compare_recurse {
    my ($ar, $br) = @_;
    if ($#$ar > 0 and $#$br > 0) {
        my $a = shift @$ar;
        my $b = shift @$br;
        return is_num($a) - is_num($b)
            || $a - $b
            || compare_recurse($ar, $br);
    } else {
        my ($w) = (@$ar, @$br);
        # flip sort direction if only non-numerics remaining
        return ($#$ar - $#$br) *1;# (is_num($w) ? 1 : -1);
    }
}

sub by_meter {
    my $aa = normalize $a;
    my $bb = normalize $b;

    if ($aa =~ /\d+/ and $bb =~ /\d+/) {
        return compare_recurse [ split " ", $aa ], [ split " ", $bb ];
    } else {
        return $aa, $bb;
    }
}

#print normalize shift;

print for sort by_meter <>;

