\score {
  \new Score {
    \context ChoirStaff <<
      \new Staff = upper <<
        \new Voice  = sopranos { \voiceOne { << \notesSoprano >> << \notesSopranoRefrain >> } }
        \new Voice  = altos { \voiceTwo { \repeat unfold 32 { \skip 4 } << \notesAlto >> } }
      >>
      \new PianoStaff = men <<
        \new Voice  = righthand { \voiceTwo << \notesRightHand >> }
        \new Voice  = lefthand { \voiceTwo << \notesLeftHand >> }
        \new Voice  = tenors { \voiceOne { \repeat unfold 32 { \skip 4 } << \notesTenor >> } }
        \new Voice  = basses { \voiceTwo { \repeat unfold 32 { \skip 4 } << \notesBass >> } }
      >>
    >>
  }
  \midi{
    \include "common/midi.ily"
  }
}


