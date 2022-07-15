\include "common/global.ily"
\paper {
  \include "common/paper-additional.ily"
  ragged-last-bottom = ##t
  system-count = 3
  % shrink space before markup verses to fit previous hymn on same page
  \include "override/override-EOGa07.ily"
}

\header{
  hymnnumber = "7"
  tunename = "Martyn"
  meter = "6—7s." % original has 7. 7. 7. 7. D but this tune has only six lines (whereas the alternate song 379 is only 7. 7. 7. 7.)
  composer = "Simeon B. Marsh" % see https://hymnary.org/tune/martyn_marsh
  alternate = \markup { "Alternate tune for No. 379." }
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
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
