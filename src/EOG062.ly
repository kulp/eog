\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  %gospel
  hymnnumber = "62"
  title = "Behold the Lamb Whose Precious Blood"
  tunename = ""
  meter = "" % sung with C. M.
  poet = ""
  composer = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  { c4( e4) | g2 g2 g2 g4( a4) | bes2 bes2 a2. }
  { g4 | a2 c2 c4( a4) g4( a4) | c1. }
  { c4( d4) | e2 c2 c2 a2 | g2 f2 e2 }
%  { c4( d4) | e4( g4) a4 g4( e4) | d2 c1 } % this is how it looks in my probably-mismarked photocopy
  { c4( d4) | e4( g2) a4 g4( e4) d2 | c1. } % I changed the c1 to a c1. at the end to make it fit, and moved the barcheck

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  { c2 | e2 f2 g2 ees2 | d2 f2 f2. }
  { e4 | a2 g2 f2 f2 | e2( f2 g2) }
  { a2 | g2 e4( f4) g2 g4( f4) | e4( d4) c4( b4) c2 }
  { c2 | c2( e4) d4 e4( c4) b2 | c1. }

}
}

notesTenor = {
\global
\relative a {

  { e4( g4) | c2 b2 c2 c2 | bes2 d2 c2. }
  { c4 | c2 c2 a2 b2 | c1. }
  { c2 | c2 c2 c2 c2 | c2 g2 g2 }
  { e4( f4) | g4( c2) c4 c4( g4) f2 | e1. }

}
}

notesBass = {
\global
\relative f {

  { c2 | c2 d2 e2 f2 | bes,2 bes2 f'2. }
  { c4 | f2 e2 d2 g2 | c,2( d2 e2) }
  { f2 | c2 c4( d4) e2 f2 | g2 g,2 c2 }
  { c2 | c2. fis,4 g2 g2 | c1. }

}
}

wordsA = \markuplist {

\line { Behold the Lamb whose precious blood, }
\line { { \hspace #2 } Drawn from His riven side, }
\line { Had power to make our peace with God, }
\line { { \hspace #2 } Nor lets one spot abide. }

}

wordsB = \markuplist {

\line { The dying thief beheld that Lamb }
\line { { \hspace #2 } Expiring by his side, }
\line { And proved the value of the name }
\line { { \hspace #2 } Of Jesus crucified. }

}

wordsC = \markuplist {

\line { His soul, by virtue of the blood, }
\line { { \hspace #2 } To paradise received; }
\line { Redemption’s earliest trophy stood, }
\line { { \hspace #2 } From sin and death retrieved. }

}

wordsD = \markuplist {

\line { We too the cleansing power have known }
\line { { \hspace #2 } Of the atoning blood, }
\line { By grace have learned His name to own, }
\line { { \hspace #2 } Which brings us back to God. }

}

wordsE = \markuplist {

\line { To Him, then, let our songs ascend, }
\line { { \hspace #2 } Who stooped in grace so low: }
\line { To Christ, the Lamb, the sinner’s Friend, }
\line { { \hspace #2 } Let ceaseless praises flow. }

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
  \midi{
    \include "common/midi.ily"
  }
}

% this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  62"
          "Behold the Lamb Whose Precious Blood"
          \null
        }
      }
    }

    \fill-line {
      \column {
        \vspace #1 \line { \bold 1 \column { \wordsA } }
        \vspace #1 \line { \bold 2 \column { \wordsB } }
        \vspace #1 \line { \bold 3 \column { \wordsC } }
        \vspace #1 \line { \bold 4 \column { \wordsD } }
        \vspace #1 \line { \bold 5 \column { \wordsE } }
      }
    }
    \vspace #1 \fill-line { \smaller { "May be sung to tune No. 61." } }
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
