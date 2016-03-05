\context {
	\Score
	% **** Turns off bar numbering
	\remove "Bar_number_engraver"
}
\context {
    \Lyrics
    % Make the text of lyrics a little smaller
    \override LyricText.font-size = #0.2
    % Move lines of lyrics closer together
    \override VerticalAxisGroup.minimum-Y-extent = #'(-1 . 1)
    % Center lyrics between related staves
    \override VerticalAxisGroup.staff-affinity = #CENTER
    % Keep enough space between lyrics and their notes
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2
}

