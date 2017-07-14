#!/usr/bin/perl
use strict;

sub normalize {
    local $_ = shift;
    chomp;
    s/\t.*$//;
    if (my ($mult, $base, $rest) = /(\d+)[-–—](\d+)s\.(?:\s*(.*)\s*)?/) {
        return ("$base. " x $mult) . $rest;
    } elsif (my ($base, $dup) = /((?:\d+\. )+)D\./) {
        return $base x 2;
    } else {
        return $_;
    }
}

sub is_num {
    return shift =~ /^\d+\.?/;
}

sub compare_recurse {
    my ($ar, $br) = @_;
    if (@$ar > 0 and @$br > 0) {
        my $a = shift @$ar;
        my $b = shift @$br;
        return is_num($a) - is_num($b)
            || $a - $b
            || compare_recurse($ar, $br);
    } else {
        my ($w) = (@$ar, @$br);
        return $#$ar - $#$br;
    }
}

sub by_meter {
    my $aa = normalize $a;
    my $bb = normalize $b;

    # Force P. M. to end
    return  1 if $aa =~ /^P/;
    return -1 if $bb =~ /^P/;

    if (is_num($aa)) {
        if (is_num($bb)) {
            my ($an) = $aa =~ /^(.*?)\s*(with Refrain)?$/;
            my ($bn) = $bb =~ /^(.*?)\s*(with Refrain)?$/;
            return
                ($an eq $bn)
                  ? ($aa =~ /Refrain/) - ($bb =~ /Refrain/)
                  : compare_recurse [ split " ", $an ], [ split " ", $bn ];
        } else {
            return 1;
        }
    } else {
        if (is_num($bb)) {
            return -1;
        } else {
            my ($ax) = $aa =~ /^(\w\. M\.)( D.)?/;
            my ($bx) = $bb =~ /^(\w\. M\.)( D.)?/;
            my ($an) = $aa =~ /^((\w\.\s*)+)\s*(with Refrain)?/;
            my ($bn) = $bb =~ /^((\w\.\s*)+)\s*(with Refrain)?/;
            return $ax cmp $bx
                || $an cmp $bn
                || ($aa =~ /Refrain/) - ($bb =~ /Refrain/);
        }
    }
}

1;
