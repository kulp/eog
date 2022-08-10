\context {
    \Score
    % **** Turns off bar numbering
    \remove "Bar_number_engraver"
}
\context {
    \Lyrics
    % Make the text of lyrics a little smaller
    \override LyricText.font-size = #0.2
    \override LyricHyphen.thickness = #0.9
    % Center lyrics between related staves
    \override VerticalAxisGroup.staff-affinity = #CENTER
    % Keep enough space between lyrics and their notes
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1.8
}
\context {
    \Voice
    % Make stem direction follow melody
    \consists "Melody_engraver"
    \override Stem.neutral-direction = #'()
}
