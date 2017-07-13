\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "59"
  title = "Why Wilt Thou Linger"
  tunename = ""
  meter = "" % sung with P. M.
  poet = "I. Fleming"
  composer = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4.   c4 c8 | c4. c4. }
patternAB = { c4 c8 c4 c8 | c4. c4. }
patternAC = { c4. \tb c4 \ta c8 | c4. c4. }
patternBA = { c4. c4 c8 | c4 c8 c4. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { b c c | b g | g a a | b ~ b }
  \changePitch \patternAA { b c c | b g | a b a | g ~ g }
  \changePitch \patternBA { c c c | c b b }
  \changePitch \patternBA { d a c | c b b }
  \changePitch \patternBA { g g g | g a b }
  \changePitch \patternAC { b b \fermata a | g ~ g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d e e | d b | e fis fis | g ~ g }
  \changePitch \patternAA { d e e | d b | d d c | b ~ b }
  \changePitch \patternBA { e e e | e d d }
  \changePitch \patternBA { fis fis a | a g g }
  \changePitch \patternBA { b, c d | e e d }
  \changePitch \patternAB { d( g) fis fis | g ~ g }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g g g | g g | b d d | d ~ d }
  \changePitch \patternAA { g, g g | g g | fis g fis | g ~ g }
  \changePitch \patternBA { g g g | g g g }
  \changePitch \patternBA { a d d | d d d }
  \changePitch \patternBA { g, g g | g g g }
  \changePitch \patternAB { g( b) d c | b ~ b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g g g | g g | e d d | g ~ g }
  \changePitch \patternAA { g g g | g g | d d d | g, ~ g }
  \changePitch \patternBA { c c e | g g g }
  \changePitch \patternBA { d d fis | g g g }
  \changePitch \patternBA { g, a b | c c g }
  \changePitch \patternAC { d' d_\fermata d | g, ~ g }

}
}

wordsA = \markuplist {

\line { Why wilt thou linger? }
\line { { \hspace #2 } Why wilt thou die? }
\line { God’s wrath upon thee, }
\line { { \hspace #2 } Judgment so nigh. }
\line { Now in salvation’s day }
\line { Tread the blood-sprinkled way; }
\line { Sinner, no more delay, }
\line { { \hspace #2 } Jesus will come. }

}

wordsB = \markuplist {

\line { Soon will the Saviour }
\line { { \hspace #2 } Close fast the door, }
\line { Tidings of mercy }
\line { { \hspace #2 } Sound nevermore; }
\line { Time’s course will soon be run. }
\line { Stop then, thou Christless one, }
\line { Think of the great white throne, }
\line { { \hspace #2 } Judgment will fall. }

}

wordsC = \markuplist {

\line { Then the dread sentence, }
\line { { \hspace #2 } “Depart from Me,” }
\line { Room for repentance, }
\line { { \hspace #2 } Gone, gone for aye. }
\line { Endless the sinner’s doom, }
\line { Darkness and dismal gloom; }
\line { Now in God’s house there’s room, }
\line { { \hspace #2 } Jesus will save. }

}

wordsD = \markuplist {

\line { Glory before thee, }
\line { { \hspace #2 } Pilgrim, press on; }
\line { Share now the sorrow, }
\line { { \hspace #2 } Share soon the crown. }
\line { Tell forth the Saviour’s fame, }
\line { Honor His holy name, }
\line { Bear now His cross and shame, }
\line { { \hspace #2 } Pilgrim, press on. }

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
          "  59"
          "Why Wilt Thou Linger?"
          \null
        }
      }
    }

    \vspace #0.3

    \fill-line \smaller { "Sing to tune No. 57 or No. 58" } % original has "tunes"

    \vspace #0.3

    \fill-line {
      \null

      \column {
        \line{ \bold 1 \column { \wordsA } }
        \vspace #1
        \line{ \bold 2 \column { \wordsB } }
      }

      \null

      \column {
        \line{ \bold 3 \column { \wordsC } }
        \vspace #1
        \line{ \bold 4 \column { \wordsD } }
        \vspace #0.6
        \line{ \hspace #20 "I. Fleming" }
      }

      \null
    }
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
