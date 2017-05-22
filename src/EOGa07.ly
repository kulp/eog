\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  ragged-last = ##t
  % shrink space before markup verses to fit previous hymn on same page
  score-markup-spacing.padding = #1.8
  score-markup-spacing.basic-distance = #1.8
}

\header{
  hymnnumber = "7"
  title = "Martyn"
  tunename = ""
  meter = "7. 7. 7. 7. D."
  composer = "S. B. Marsh"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2.=60
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a2 a4 a2 f4 | g2 g4 g2. | \bar "."
  a2 a4 c2 bes4 | a2. g2. | f1. | \bar "."
  c'2 c4 c2 c4 | d2. d2. | c1. | \bar "."
  c2 c4 c2 c4 | d2. d2. | c1. | \bar "."
  a2 a4 a2 f4 | g2 g4 g2. | \bar "."
  a2 a4 c2 bes4 | a2. g2. | f1. | \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 f4 f2 f4 | e2 e4 e2. |
  f2 f4 f2 g4 | f2. e2. | f1. |
  f2 e4 f2 f4 | f2. f2. | f1. |
  f2 e4 f2 f4 | f2. f2. | e1. |
  f2 f4 f2 f4 | e2 e4 e2. |
  f2 f4 f2 f4 | f2. f2( e4) | f1. |

}
}

notesTenor = {
\global
\relative a {

  c2 c4 c2 a4 | c2 c4 c2. |
  c2 c4 c2 d4 | c2. bes2. | a1. |
  a2 bes4 c2 a4 | bes2. bes2. | a1. |
  a2 bes4 c2 a4 | a2. b2. | c1. |
  c2 c4 c2 b4 | c2 c4 c2. |
  c2 c4 ees2 d4 | c2. bes2. | a1. |

}
}

notesBass = {
\global
\relative f {

  f2 f4 f2 f4 | c2 c4 c2. |
  f2 f4 a,2 bes4 | c2. c2. | f1. |
  f2 g4 a2 f4 | bes,2. bes2( d4) | f1. |
  f2 g4 a2 f4 | d2. g2. | c,1. |
  f2 f4 f2 d4 | c2 c4 c2. |
  f2 f4 a2 bes4 | c2. c,2. | f1. |

}
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak \markup { \fill-line { "Alternate tune for No. 379." } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
