\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "305"
  title = "The Saviour Is Loving"
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
  \tempo 4=90
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f4 | a2 bes4 bes | a4.( g8) f4
  a4 | g2 e4 e | f2.
  f4 | a2 bes4 bes | a4.( g8) f4
  a4 | g2 e4 e | f2.

  a4 | c2 d4 c | bes( a) g % original has overlapping slurs here
  c,4 | a'( c) bes g | f2( e4)
  f4 | a2 bes4 bes | a4.( g8) f4
  a4 | c( bes) a g | f2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c4 | f2 f4 f | f4.( c8) c4
  f4 | c2 c4 c | c2.
  c4 | f2 f4 f | f4.( c8) c4
  f4 | c2 c4 c | c2.

  c4 | f2 f4 f | e( f) c
  c4 | c2 d4 d | c2.
  c4 | f2 f4 f | f4.( c8) c4
  f4 | f( e) e e | f2.

}
}

notesTenor = {
\global
\relative a {

  a4 | c2 d4 d | c4.( bes8) a4
  c4 | bes2 g4 g | a2.
  a4 | c2 d4 d | c4.( bes8) a4
  c4 | bes2 g4 g | a2.

  f4 | a2 bes4 a | g( f) e
  c4 | f( a) g bes | a2( g4)
  a4 | c2 d4 d | c4.( bes8) a4
  c4 | a( g) c bes | a2.

}
}

notesBass = {
\global
\relative f {

  f4 | f2 f4 f | f2 f4
  f4 | c2 c4 c | f2.
  f4 | f2 f4 f | f2 f4
  f4 | c2 c4 c | f2.

  r4 | r1 | r2.
  r4 | r1 | r2.
  f4 | f2 f4 f | f2 f4
  f4 | c2 c4 c | f2.

}
}

wordsA = \markuplist {

\line { The Saviour is loving, the Saviour is kind, }
\line { { \hspace #2 } He came down from heaven the lost ones to find; }
\line { He never refuseth, nor turneth aside }
\line { { \hspace #2 } The soul that looks to Him, and for whom He died. }

}

wordsB = \markuplist {

\line { How many dear children have leaned on His breast; }
\line { { \hspace #2 } How many dear children His name have confessed; }
\line { Believing are happy, His goodness they prove, }
\line { { \hspace #2 } And now in the glory, rejoice in His love. }

}

#(cond ((ly:get-option 'eog-midi-permitted) #{ \score {
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
  \midi{
    \include "common/midi.ily"
  }
} #}))

% this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  305"
          "The Saviour Is Loving"
          \null
        }
      }
    }

    \fill-line {
      \column {
        \vspace #3 \line { \bold 1 \column { \wordsA } }
        \vspace #3 \line { \bold 2 \column { \wordsB } }
      }
    }
    \vspace #3 \fill-line { \smaller { "May be sung to tune No. 304 – opposite page" } }
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
