\context {
	\Score
	% **** Turns off bar numbering
	\remove "Bar_number_engraver"
}
\context {
	\Lyrics
	% **** Prevents lyrics from running too close together
	\override LyricSpace.minimum-distance = #0.6
	% **** Makes the text of lyrics a little smaller
	\override LyricText.font-size = #-1
	% **** Moves lines of lyrics closer together
	\override VerticalAxisGroup.minimum-Y-extent = #'(-1 . 1)
}

