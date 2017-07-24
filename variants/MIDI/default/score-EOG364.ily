\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice = sopranos { \voiceOne { \notesSoprano \notesSopranoSecond } }
      \context Voice = altos { \voiceTwo { \notesAlto \notesAltoSecond } }
    >>
    \context Staff = men <<
      \clef bass
      \context Voice = tenors { \voiceOne { \notesTenor \notesTenorSecond } }
      \context Voice = basses { \voiceTwo { \notesBass \notesBassSecond } }
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

