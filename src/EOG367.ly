\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "367"
  title = "When He Cometh"
  tunename = "Jewels"
  meter = "8. 6. 8. 5. with Refrain"
  poet = "William O. Cushing" % see https://hymnary.org/text/when_he_cometh_when_he_cometh
  composer = "George F. Root" % see https://hymnary.org/tune/when_he_cometh_when_he_cometh_root
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=90
  \key d \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d4 e | fis2 fis fis4 g | a2 a
  b2 | fis fis e | d d
  d4 e | fis2 fis fis4 g | a2 a
  b2 | fis fis e | d1

  d'4^\markup { \small \caps "Refrain" } cis | b2 b d | a a
  b4( a) | d,2 d e | fis a
  d4 cis | b2 b d | a a
  b2 | a d, e | d1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 d | d2 d d4 d | d2 d
  d2 | d d cis | d d
  d4 d | d2 d d4 d | d2 d
  d2 | d d cis | d1

  d4 d | d2 d d | d d
  d2 | d d cis | d d
  d4 d | d2 d d | d d
  d2 | d d cis | d1

}
}

notesTenor = {
\global
\relative a {

  fis4 g | a2 a a4 g | fis2 fis
  g2 | d4( fis) a2 g | fis2 fis
  fis4 g | a2 a a4 g | fis2 fis
  g2 | d4( fis) a2 g | fis1

  a4 a | g2 g b | a a
  fis | fis fis a | a fis
  a4 a | g2 g b | a fis
  g2 | fis fis g | fis1

}
}

notesBass = {
\global
\relative f {

  d4 d | d2 d d4 d | d2 d
  g,2 | a a a | d d
  d4 d | d2 d d4 d | d2 d
  g,2 | a a a | d1

  fis4 fis | g2 g g | fis fis
  d2 | b b a | d d
  fis4 fis | g2 g g | fis d
  g,2 | a a a | d1

}
}

Refrain = \lyricmode {

Like the stars of the morn -- ing, \bar "."
His bright crown a -- dorn -- ing, \bar "."
They shall shine in His beau -- ty, \bar "."
Bright gems for His crown. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

When He com -- eth, when He com -- eth, \bar "."
To make up His jew -- els, \bar "."
All His jew -- els, pre -- cious jew -- els, \bar "."
His loved and His own. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He will gath -- er, He will gath -- er
The gems for His king -- dom;
All the saved ones, all the bright ones,
His loved and His own.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Lit -- tle chil -- dren, lit -- tle chil -- dren, % original has "child -- ren"
Who love their Re -- deem -- er,
Are the jew -- els, pre -- cious jew -- els,
His loved and His own.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
