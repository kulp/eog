\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 11
}

\header{
  %children
  hymnnumber = "353"
  title = "Come to Jesus, Come Today"
  tunename = ""
  meter = ""
  poet = ""
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  c4. c8 c c8 ~ c4 | d4. d8 d2 |
  c4. d8 c a8 ~ a4 | a4. g8 g2 |
  a4 a g f | d f f2 |
  f4 a c4. a8 | g2 f |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f4. f8 f f8 ~ f4 | f4. f8 f2 |
  f4. f8 f f8 ~ f4 | f4. e8 e2 |
  f4 f e d | d d des2 |
  c4 f f4. f8 | e2 f2 |

}
}

notesTenor = {
\global
\relative a {

  a4. a8 a a8 ~ a4 | bes4. bes8 bes2 |
  a4. bes8 a c8 ~ c4 | c4. c8 c2 |
  c4 c bes a | gis gis gis2 |
  a4 c a4. c8 | bes2 a |

}
}

notesBass = {
\global
\relative f {

  f4. f8 f f8 ~ f4 | bes,4. bes8 bes2 |
  f'4. f8 f f8 ~ f4 | c4. c8 c2 |
  f4 f cis d | b b b2 |
  c4 c c4. c8 | c2 f |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Come to Je -- sus, come to -- day! \bar "." % original has capital second "Come"
There is noth -- ing more to pay. \bar "."
He will wash your sins a -- way, \bar "."
He’s a glo -- rious Sav -- iour. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Trust in Je -- sus, trust to -- day! % original has capital second "Trust"
“It is fin -- ished!” hear Him say.
Je -- sus is the on -- ly way,
He’s a might -- y Sav -- iour.

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
      \context Lyrics = one \lyricsto sopranos \wordsA
      \context Lyrics = two \lyricsto sopranos \wordsB
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
