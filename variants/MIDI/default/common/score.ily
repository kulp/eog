\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
    >>
    \context Staff = men <<
      \clef bass
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

