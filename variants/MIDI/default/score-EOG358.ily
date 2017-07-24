\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice = sopranos { \voiceOne { \notesSoprano \refrainNotesSoprano } }
      \context Voice = altos { \voiceTwo { \notesAlto \refrainNotesAlto } }
    >>
    \context Staff = men <<
      \clef bass
      \context Voice = tenors { \voiceOne { \notesTenor \refrainNotesTenor } }
      \context Voice = basses { \voiceTwo { \notesBass \refrainNotesBass } }
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

