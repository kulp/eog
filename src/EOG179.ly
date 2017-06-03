\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
}

\header{
  hymnnumber = "179"
  title = "Nothing but Christ, As On We Tread"
  tunename = "Arizona"
  meter = "L. M."
  poet = "S. O’M. Cluff"
  composer = "Dr. R. H. Earnshaw"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=100
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a2 a a | a1 a2 | c1 bes2 | a1. |
  f2 f e | f2.( g4) a2 | g1 f2 | g1. |
  a2 a a | a1 a2 | d1 c2 | bes1. |
  g2 c bes | a1 f2 | f1 e2 | f1. |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 f f | f1 f2 | g1 e2 | f1. |
  f2 c c | c1 f2 | d1 d2 | e1. |
  f2 f g | f1 f2 | f1 fis2 | g1. |
  e2 f g | f1 d2 | c1 c2 | c1. |

}
}

notesTenor = {
\global
\relative a {

  c2 c c | d1 a2 | g( c) c | c1. |
  d2 c bes | a2.( bes4) c2 | bes1 a2 | c1. |
  c2 c cis | d1 ees2 | d1 d2 | d1. |
  c2 c c | c1 bes4( a) | g2.( a4) bes2 | a1. |

}
}

notesBass = {
\global
\relative f {

  f2 f f | d1 d2 | e1 c2 | f1. |
  bes2 a g | f1 f2 | bes,1 d2 | c1. |
  f2 f e | d( f) f | bes1 a2 | g1. |
  c,2 d e | f1 bes,2 | c1 c2 | f1. |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Noth -- ing but Christ, as on we tread, \bar "."
The gift un -- priced– God’s liv -- ing Bread; \bar "."
With staff in hand and feet well shod. \bar "."
Noth -- ing but Christ, the Christ of God. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Ev -- ’ry -- thing loss for Him be -- low,
Tak -- ing the cross wher -- e’re we go;
Show -- ing to all, where once He trod,
Noth -- ing but Christ, the Christ of God.

}

wordsC = \lyricmode {
\set stanza = "3."

Noth -- ing save Him, in all our ways,
Giv -- ing the theme for cease -- less praise;
Our whole re -- source a -- long the road,
Noth -- ing but Christ, the Christ of God.

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
