\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice = sopranos { \voiceOne { \notesSoprano \notesSopranoFirst } }
      \context Voice = altos { \voiceTwo { \notesAlto \notesAltoFirst } }
    >>
    \context Staff = men <<
      \context Voice = tenors { \voiceOne { \notesTenor \notesTenorFirst } }
      \context Voice = basses { \voiceTwo { \notesBass \notesBassFirst } }
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

