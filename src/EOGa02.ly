\include "common/global.ily"
\paper {
  \include "common/paper-additional.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "2"
  tunename = "German Evening Hymn"
  meter = "8. 7. 8. 7."
  composer = "German"
  alternate = \markup { "Alternate tune for No. 152." }
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f2. f4 | f f e f | a2 g | \bar "."
  g2. g4 | g g f g | a1 | \bar "."
  a2. a4 | a a g f | d'2 c | \bar "."
  c4 a c bes | d,2 e | f1 | \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c2. c4 | c c c c | f2 e |
  e2. e4 | e e f e | f1 |
  f2. f4 | f f e f | f2 f |
  fis4 fis a g | d2 c | c1 |

}
}

notesTenor = {
\global
\relative a {

  a2. a4 | a a bes a | c2 c |
  c2. c4 | c c c c | c1 |
  c2. c4 | c4 c bes c | bes2 a |
  a4 d d d | bes2 bes | a1 |

}
}

notesBass = {
\global
\relative f {

  f2. f4 | f f g f | c2 c |
  c'2. c4 | c bes a g | f1 |
  f2. f4 | f f g a | bes2 f |
  d4 d fis g | c,2 c | f1 |

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
