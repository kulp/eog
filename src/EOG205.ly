\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 8
}

\header{
  hymnnumber = "205"
  title = "Asleep in Jesus, Blessed Sleep!"
  tunename = "Rest"
  meter = "L. M."
  poet = "Mrs. McKay"
  composer = "W. B. Bradbury"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=130
  \key d \major
  \partial 2.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a4 a a | d2 a a4 fis | e2.
  g4 g g | e'2 cis b4 cis | d2.
  a4 a a | a2 fis g4 a | b2.
  b4 d b | a fis e2 g | fis2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 d d | fis2 fis d4 d | cis2.
  e4 e e | g2 g g4 g | fis2.
  d4 d d | d2 d d4 d | d2.
  d4 d d | d d cis2 e | d2.

}
}

notesTenor = {
\global
\relative a {

  fis4 fis fis | a2 d a4 a | a2.
  a4 a a | cis2 e d4 e | d2.
  fis,4 fis fis | fis2 a g4 fis | g2.
  g4 b g | fis4 a a2 a | a2.

}
}

notesBass = {
\global
\relative f {

  d4 d d | d2 d fis4 d | a2.
  cis4 cis cis | a2 a' a4 a | d,2.
  d4 d d | d2 d4( c) b a | g2.
  g4 g g | a a a2 a | d2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

A -- sleep in Je -- sus, bless -- ed sleep! \bar "."
From which none ev -- er wakes to weep; \bar "."
A calm and un -- dis -- turbed re -- pose, \bar "."
Where pow’r -- less is the last of foes. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

A -- sleep in Je -- sus; oh, how sweet
To be for such a slum -- ber meet,
With ho -- ly con -- fi -- dence to sing
That death has lost its ven -- omed sting!

}

wordsC = \lyricmode {
\set stanza = "3."

A -- sleep in Je -- sus, peace -- ful rest!
Whence wak -- ing we’re su -- preme -- ly blest;
No fear, no woe, shall dim that hour
That man -- i -- fests the Sav -- iour’s power.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
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
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
