#!/usr/bin/env perl
use strict;
use warnings;

while (<>) {
	s/\bcontext Voice\b\s*/context NullVoice /;

	if (/\\partcombine/) {
		next; # skip
	} elsif (/Voice.*sopranos.*voiceOne/) {
		print q(      \set ChoirStaff.printPartCombineTexts = ##f), "\n";
		print q(      \partcombine #'(2 . 9) \notesSoprano \notesAlto), "\n";
	} elsif (/Voice.*tenors.*voiceOne/) {
		print q(      \set ChoirStaff.printPartCombineTexts = ##f), "\n";
		print q(      \partcombine #'(2 . 9) \notesTenor \notesBass), "\n";
	}

	print;
}

