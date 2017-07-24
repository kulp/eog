\score {
  \unfoldRepeats \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice = altos { \voiceTwo << \notesAlto >> }
    >>
    \context Staff = men <<
      \context Voice = tenors { \voiceOne << \notesTenor >> }
      \context Voice = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

