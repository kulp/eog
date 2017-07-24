\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne { \notesSopranoA \notesSopranoB \notesSopranoA } }
      \context Voice  = altos { \voiceTwo { \notesAltoA \notesAltoB \notesAltoA } }
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \context Voice  = tenors { \voiceOne { \notesTenorA \notesTenorB \notesTenorA } }
      \context Voice  = basses { \voiceTwo { \notesBassA \notesBassB \notesBassA } }
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

