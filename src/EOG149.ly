\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "149"
  title = "Blessed Assurance, Jesus Is Mine"
  tunename = ""
  meter = "P. M. with Refrain"
  poet = "Fanny J. Crosby" % see https://hymnary.org/text/blessed_assurance_jesus_is_mine
  composer = "Phoebe Palmer Knapp" % see https://hymnary.org/tune/blessed_assurance_jesus_is_mine_knapp
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 9/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=160
  \key d \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  fis8 e d | a'4. a g8 a b | a4. ~ a4.
  a8 fis a | d4. cis4 cis8 b a gis | a4. ~ a4.
  fis8 e d | a'4. a g8 a b | a4. ~ a4.
  d,8 e fis | g4. e d8 e cis | d4. ~ d4.

  << s^\markup { \small \caps "Refrain" }
  { a'8 a a | d4. a } >> b8 b b | a4. ~ a4.
  a8 a a | b4. d cis8 cis b | cis4. ~ cis4.
  cis8 d e | d4. a4. b8 a b | a4. ~ a4.
  d,8 e fis | g4. e d8. e16 cis8 | d4. ~ d4.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d8 d d | d4. fis d8 d d | d4. ~ d4.
  fis8 d fis | fis4. e4 e8 e e e | e4. ~ e4.
  d8 d d | d4. fis d8 d d | d4. ~ d4.
  d8 d d | d4. b4. d8 cis a | a4. ~ a4.

  fis'8 fis fis | fis4. fis4. g8 g g | fis4. ~ fis4.
  fis8 fis fis | g4. a4. a8 a gis | a4. ~ a4.
  g!8 g g | fis4. fis g8 fis g | fis4. ~ fis4.
  d8 cis d | d4. b4. d8. cis16 a8 | a4. ~ a4.

}
}

notesTenor = {
\global
\relative a {

  a8 g fis | fis4. a4. b8 fis g | fis4. ~ fis4.
  a8 a a | a4. a4 a8 d cis b | cis4. ~ cis4.
  a8 g fis | fis4. a4. b8 fis g | fis4. ~ fis4.
  fis8 g a | b4. g fis8 g e | fis4. ~ fis4.

  d'8 d d | a4. d d8 d d | d4. ~ d4.
  d8 d d | d4. d e8 e e | e4. ~ e4.
  a,8 b cis | d4. d d8 d d | d4. ~ d4.
  a8 a a | b4. g fis8. g16 e8 | fis4. ~ fis4.

}
}

notesBass = {
\global
\relative f {

  d8 d d | d4. d d8 d d | d4. ~ d4.
  d8 d d | d4. e4 e8 e e e | a,4. ~ a4.
  d8 d d | d4. d d8 d d | d4. ~ d4.
  d8 d d | g,4. g a8 a a | d4. ~ d4.

  d8 d d | d4. d  g8 g g | d4. ~ d4.
  d8 d d g4. fis e8 e e | a4. ~ a4.
  a8 a a | d,4. d d8 d d | d4. ~ d4.
  fis8 e d | g,4. g a8. a16 a8 | d4. ~ d4.

}
}

Refrain = \lyricmode {

This is my sto -- ry, this is my song, \bar "."
Prais -- ing my Sav -- iour all the day long. \bar "."
This is my sto -- ry, this is my song, \bar "."
Prais -- ing my Sav -- iour all the day long. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Bless -- ed as -- sur -- ance, Je -- sus is mine! \bar "."
Oh, what a fore -- taste of glo -- ry di -- vine! \bar "."
Heir of sal -- va -- tion, pur -- chase of God, \bar "."
Born of His Spir -- it, washed in His blood. \bar "."

\Refrain

}

wordsB = \lyricmode {
\set stanza = "2."

Per -- fect sal -- va -- tion, all is at rest,
I in my Sav -- iour am hap -- py and blest;
Watch -- ing and wait -- ing, look -- ing a -- bove,
Filled with His good -- ness, lost in His love.

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
