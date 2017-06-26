\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "342"
  title = "Jesus Came from Heaven"
  tunename = ""
  meter = ""
  poet = ""
  composer = "E. O. Excell"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2 % original has impossible 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=140
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 d d d d2
  g4 a | g2 fis fis1 |
  a4 d, d d d2 a'2 |
  a4 g g a b1 |
  b4 c b a g2 d |
  e4( g) fis e d1 |
  d4 d g a b d2
  c4 | b2 a g1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  b4 b b b b2
  b4 c | b2 c c1 |
  c4 c c c c2 c |
  c4 b b c d1 |
  d4 e d c b2 b |
  c4( e) d c b1 |
  b4 b b c d f2
  e4 | d2 c b1 |

}
}

notesTenor = {
\global
\relative a {

  g4 g g g g2
  g4 g | g2 a a1 |
  fis4 fis fis fis fis2 fis |
  g4 g g g g1 |
  g4 g g g g2 g |
  g2 g4 g g1 |
  g4 g g g g g2
  g4 | g2 fis g1 |

}
}

notesBass = {
\global
\relative f, {

  g4 g g g g2
  g4 g | d'2 d d1 |
  d4 d d d d2 d |
  g,4 g g g g1 |
  g4 g g g g2 g |
  c2 c4 c g1 |
  g4 g g g g b2
  c4 | d2 d g,1 |

}
}

wordsA = \markuplist {

\line { Jesus came from heaven, }
\line { { \hspace #2 } Many years ago; }
\line { Left His Father’s glory }
\line { { \hspace #2 } For this world of woe. }

}

wordsB = \markuplist {

\line { Here He lived and suffered, }
\line { { \hspace #2 } Here He also died, }
\line { On the cross of Calvary }
\line { { \hspace #2 } He was crucified. }

}

wordsC = \markuplist {

\line { ’Twas for sin He suffered, }
\line { { \hspace #2 } In the sinner’s stead, }
\line { And His Father raised Him, }
\line { { \hspace #2 } Even from the dead.}

}

wordsD = \markuplist {

\line { Now in brightest glory }
\line { { \hspace #2 } Jesus lives on high, }
\line { And His voice is calling, }
\line { { \hspace #2 } Calling from the sky. }

}

wordsE = \markuplist {

\line { “Come to Me, ye weary, }
\line { { \hspace #2 } I have rest to give”; }
\line { Hearken then unto Him, }
\line { { \hspace #2 } And your soul shall live. }

}

wordsF = \markuplist {

\line { He has peace and pardon }
\line { { \hspace #2 } For the sin-sick soul; }
\line { Come to Him believing, }
\line { { \hspace #2 } He will make you whole. }

}

% this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          " 342"
          "Jesus Came from Heaven"
          \null
        }
      }
    }

    \vspace #1

    \fill-line {
      \null

      \column {
        \line{ \bold 1 \column { \wordsA } }
        \vspace #1
        \line{ \bold 2 \column { \wordsB } }
        \vspace #1
        \line{ \bold 3 \column { \wordsC } }
      }

      \null

      \column {
        \line{ \bold 4 \column { \wordsD } }
        \vspace #1
        \line{ \bold 5 \column { \wordsE } }
        \vspace #1
        \line{ \bold 6 \column { \wordsF } }
      }

      \null
    }
  }
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
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak \markup { \vspace #1 \fill-line { "May be sung to tune No. 343." } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
