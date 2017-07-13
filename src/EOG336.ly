\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 11
}

\header{
  %children
  hymnnumber = "336"
  title = "I Am the Door"
  tunename = ""
  meter = "P. M."
  poet = ""
  composer = "Anon."
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d8 g g g4 ~ g8 | e8 a a a4.
  fis8 fis fis fis g a | b4 g8 d4 ~ d8 |
  d8 g g g4. | e8 a a a4 ~ a8 |
  d4. b4 a8 | g2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  b8 b d d4 ~ d8 | c8 c e e4. |
  d8 d d d d d | d4 b8 b4 ~ b8 |
  b8 b d d4 ~ d8 | c8 c e e4. |
  fis4. g4 fis8 | d2.

}
}

notesTenor = {
\global
\relative a {

  g8 g b b4 ~ b8 | g8 g c c4. |
  a8 a a a g fis | g4 g8 g4 ~ g8 |
  g8 g b b4 ~ b8 | g8 g c c4. |
  a4. d4 c8 | b2.

}
}

notesBass = {
\global
\relative f, {

  g8 g g g4 ~ g8 | c8 c c c4. |
  d8 d d d d d | g,4 g8 g4 ~ g8 |
  g8 g g g4 ~ g8 | c8 c c c4. |
  d4. d4 d8 | g,2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

I am the Door, I am the Door, \bar "."
By Me if an -- y man en -- ter in, \bar "."
He shall be saved, he shall be saved, \bar "."
He shall be saved. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I am the { \mon } Door, the { \moff } words are but four;
Mil -- lions are in, but there’s room for { \mon } more;
The { \moff } door’s o -- pen wide, come right in -- { \mon } side,
And { \moff } thou shalt be saved. % original has lowercase 'and'

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
