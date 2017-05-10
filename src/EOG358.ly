\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "358"
  title = "Tell Me the Story of Jesus"
  tunename = ""
  meter = "8. 7. 8. 7. with Refrain"
  poet = "F. J. Crosby"
  composer = "Ira D. Sankey"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key ees \major
  \autoBeamOff
}

patternA = { c4 c8. c16 c4 c8. c16 | } % s2 s4. r8

refrainNotesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { g g f ees g aes | } bes2 g4. r8
  \changePitch \patternA { bes f g aes g f | } g2. r4
  \changePitch \patternA { g g g aes bes c | } bes2 g4 r4
  \changePitch \patternA { bes f g aes g f | } ees2. r4^\markup{\italic Fine}

}
}

notesSoprano = {
\global
\relative c'' {

  \refrainNotesSoprano
  \changePitch \patternA { c c c ees d c | } c2 bes4 r4
  \changePitch \patternA { bes c bes aes bes aes | } g2. r4
  \changePitch \patternA { c c c ees d c | } c2 bes4. r8
  \changePitch \patternA { bes f d' } d8[ c] bes8. a16 | bes2( aes!)^\markup{\italic {D. C.}} |

  \bar "|."

}
}

refrainNotesAlto = {
\global
\relative e' {

  \changePitch \patternA { ees ees ees ees ees f | } g2 ees4. r8
  \changePitch \patternA { d d ees f ees d | } ees2. r4
  \changePitch \patternA { ees ees ees ees ees ees | } ees2 ees4 r4
  \changePitch \patternA { d d ees f ees d | } ees2. r4

}
}

notesAlto = {
\global
\relative e' {

  \refrainNotesAlto
  \changePitch \patternA { ees ees ees ees ees ees | } ees2 ees4 r4
  \changePitch \patternA { d aes' g f g f | } ees2. r4
  \changePitch \patternA { ees ees ees ees ees ees | } ees2 ees4. r8
  \changePitch \patternA { d d f f f ees } d2( f) |

}
}

refrainNotesTenor = {
\global
\relative a {

  \changePitch \patternA { bes bes aes g bes bes | } ees2 bes4. r8
  \changePitch \patternA { bes bes bes bes bes bes | } bes2. r4
  \changePitch \patternA { bes bes bes aes g aes | } g2 bes4 r4
  \changePitch \patternA { bes bes bes bes bes aes | } g2. r4

}
}

notesTenor = {
\global
\relative a {

  \refrainNotesTenor
  \changePitch \patternA { aes aes aes c bes aes | } aes2 g4 r4
  \changePitch \patternA { f bes bes bes bes bes | } bes2. r4
  \changePitch \patternA { aes aes aes c bes aes | } aes2 g4. r8
  \changePitch \patternA { f bes bes } bes8[ ees] d8. c16 | bes1 |

}
}

refrainNotesBass = {
\global
\relative f {

  \changePitch \patternA { ees ees ees ees ees ees | } ees2 ees4. r8
  \changePitch \patternA { bes bes bes bes bes bes | } ees2. r4
  \changePitch \patternA { ees des des c bes aes | } ees'2 ees4 r4
  \changePitch \patternA { bes bes bes bes bes bes | } ees2. r4

}
}

notesBass = {
\global
\relative f {

  \refrainNotesBass
  \changePitch \patternA { aes aes aes aes aes aes | } ees2 ees4 r4
  \changePitch \patternA { bes bes bes bes bes bes | } ees2. r4
  \changePitch \patternA { aes aes aes aes aes aes | } ees2 ees4. r8
  \changePitch \patternA { f f f f f f | } bes1 |

}
}

Refrain = {
\set stanza = \markup \small \normal-text \caps "Refrain"
\lyricmode {

\italicsOn Tell me the sto -- ry of Je -- sus, \bar "."
Write on my heart ev -- ery word, \bar "." % original has comma here but exclamation point in second line of first verse
Tell me the sto -- ry most pre -- cious, \bar "."
Sweet -- est that ev -- er was heard. \bar "."

}
}

wordsA = \lyricmode {
\set stanza = "1."

Tell me the sto -- ry of Je -- sus, \bar "."
Write on my heart ev -- ery word! \bar "."
Tell me the sto -- ry most pre -- cious, \bar "."
Sweet -- est that ev -- er was heard. \bar "."
Tell how the an -- gels in cho -- rus \bar "."
Praised as they wel -- comed His birth, \bar "."
Glo -- ry to God in the high -- est, \bar "."
Peace and good tid -- ings to earth. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Fast -- ing a -- lone in the des -- ert,
Thus was His ser -- vice be -- gun;
Tell how thro’ faith and o -- be -- dience
Vic -- tory o’er Sa -- tan He won.
Tell of the years of His la -- bors,
Tell of the sor -- rows He bore;
He was de -- spised and af -- flict -- ed,
Home -- less, re -- ject -- ed and poor.

}

wordsC = \lyricmode {
\set stanza = "3."

Tell of the cross where they nailed Him,
Suff -- ’ring in sor -- row and pain;
Tell of the grave where they laid Him;
Tell how He liv -- eth a -- gain.
Love in that sto -- ry so ten -- der,
Clear -- er than ev -- er I see;
This is the sto -- ry most pre -- cious–
Love paid the ran -- som for me.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
    >>
    \new Lyrics \with { alignBelowContext = men } \lyricsto sopranos \Refrain
  >>
  \layout {
    \include "common/layout.ily"
  }
}

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
