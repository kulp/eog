\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
    >>
    \context Staff = men <<
      \clef bass
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

