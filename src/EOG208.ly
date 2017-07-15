\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 6
}

\header{
  hymnnumber = "208"
  title = "We’ll Sing of the Shepherd That Died"
  tunename = "De Fleury"
  meter = "8. 8. 8. 8. D."
  poet = "T. Kelly"
  composer = "German"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d4. g8 d g b g b | d4.
  c4 ~ c8 | b8 d b a g a | g4. \eogbreak
  d4. g8 d g b g b | d4.
  c4. | b8 d b a g a | g4. \eogbreak
  d'4. d8 b d d b d | e4.
  c4. | b8 c d d c b | a4. \eogbreak
  d,4. g8 d g b g b | d4.
  c4. | b8 d b a g a | g4.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4. | d8 d d d d d | g4.
  a4 ~ a8 | g b g fis g fis | g4.
  d4. | d8 d d d d d | g4.
  a4. | g8 b g fis g fis | g4.
  g4. | g8 g g g g g | g4.
  fis4. | g8 g g g fis g | fis4.
  d4. | d8 d d d d d | g4.
  a4. | g8 b g fis g fis | g4.

}
}

notesTenor = {
\global
\relative a {

  b4. | b8 b b b b b | b4.
  e4 ~ e8 | d8 d d c b c | b4.
  b4. | b8 b b b b b | b4.
  e4. | d8 d d c b c | b4.
  b4. | b8 g b b g b | c4.
  a4( d8) | d8 d d d d d | d4.
  b4. | b8 b b b b b | b4.
  e4. | d8 d d c b c | b4.

}
}

notesBass = {
\global
\relative f {

  g4. | g8 g g g g g | g4.
  c,4 ~ c8 | d8 d d d d d | g,4.
  g'4. | g8 g g g g g | g4.
  c,4. | d8 d d d d d | g,4.
  g'4. | g8 g g g g g | c,4.
  d4. | g8 a b b a g | d4.
  g4. | g8 g g g g g | g4.
  c,4. | d8 d d d d d | g,4.

}
}

wordsA = \lyricmode {
\set stanza = "1."

We’ll sing of the Shep -- herd that died, \bar "."
That died for the sake of the flock; \bar "."
His love to the ut -- most was tried, \bar "."
But firm -- ly en -- dured as a rock. \bar "."
When blood from a vic -- tim must flow, \bar "."
This Shep -- herd, by pit -- y, was led \bar "."
To stand be -- tween us and the foe, \bar "."
And will -- ing -- ly died in our stead. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Our song then for -- ev -- er shall be
{ \mon } Of the { \moff } Shep -- herd who gave Him -- self thus;
No sub -- ject so glo -- rious as He,
No theme so af -- fect -- ing to us.
Of Him and His love will we sing,
His prais -- es our tongues shall em -- ploy,
Till heav -- en -- ly an -- thems we bring
In yon -- der bright re -- gions of joy.

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
