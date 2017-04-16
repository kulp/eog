\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "293"
  title = "A Little Ship Was On the Sea"
  tunename = "Alida"
  meter = "C. M. D."
  poet = ""
  composer = "D. B. Thompson"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=140
  \key c \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 | c2 c4 e( d) c | a2 a4 c( b)
  a4 | g2 g4 g( c) e | d2. ~ d2
  g,4 | c2 c4 e( d) c | a2 a4 c( b)
  a4 | g( c) e a,2 b4 | c2. ~ c2

  c4 | d2 d4 b( a) g | c2 c4 c2
  c4 | d2 d4 b( a) g | c2. ~ c2
  g4 | c2 c4 e( d) c | a2 a4 c( b)
  a4 | g( c) e a,2 b4 | c2. ~ c2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g4 | e2 e4 g2 g4 | f2 f4 a( g)
  f4 | e2 e4 e2 g4 | g2. ~ g2
  g4 | e2 e4 g2 g4 | f2 f4 a( g)
  f4 | e2 g4 f2 f4 | e2. ~ e2

  e4 | f2 f4 f2 f4 | e2 e4 e2
  e4 | f2 f4 f2 f4 | e2. ~ e2
  g4 | e2 e4 g2 g4 | f2 f4 a( g)
  f4 | e2 g4 f2 f4 | e2. ~ e2

}
}

notesTenor = {
\global
\relative a {

  g4 | g2 g4 c( b) c | c2 c4 c2
  c4 | c2 c4 c( g) c | b2. ~ b2
  g4 | g2 g4 c( b) c | c2 c4 c2
  c4 | c2 c4 c2 g4 | g2. ~ g2

  c4 | b2 b4 d( c) b | c2 g4 g2
  c4 | b2 b4 d( c) b | c2. ~ c2
  g4 | g2 g4 c( b) c | c2 c4 c2
  c4 | c2 c4 c2 g4 | g2. ~ g2

}
}

notesBass = {
\global
\relative f {

  g4 | c,2 c4 c( d) e | f2 f4 f2
  f4 | c2 c4 c2 c4 | g2. ~ g2
  g'4 | c,2 c4 c( d) e | f2 f4 f2
  f4 | g( e) c f2 g4 | c,2. ~ c2

  c4 | g'2 g4 g2 g4 | c,2 c4 c2
  c4 | g'2 g4 g2 g4 | c,2. ~ c2
  g'4 | c,2 c4 c( d) e | f2 f4 f2
  f4 | g( e) c f2 g4 | c,2. ~ c2

}
}

wordsA = \lyricmode {
\set stanza = "1."

A lit -- tle ship was on the sea, \bar "."
It was a pret -- ty sight; \bar "."
It sailed a -- long so pleas -- ant -- ly, \bar "."
And all was calm and bright. \bar "."
The sun was sink -- ing in the west; \bar "."
The shore was near at hand, \bar "."
And those on board with hearts at rest, \bar "."
Tho’t soon to reach the land. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

When lo! a storm be -- gan to rise;
The wind grew loud and strong;
It blew the clouds a -- cross the skies;
It blew the waves a -- long.
And all but One were sore a -- fraid
Of sink -- ing in the deep;
His head was on a pil -- low laid,
And He was fast a -- sleep.

}

wordsC = \lyricmode {
\set stanza = "3."

“Mas -- ter, we per -- ish! Mas -- ter, save!”
They cried; their Mas -- ter heard:
He rose, re -- buked the wind and wave,
And stilled them with a word.
He to the storm said, “Peace, be still!”
The ra -- ging bil -- lows cease;
The might -- y winds o -- bey His will,
And all are hushed in peace.

}

wordsD = \lyricmode {
\set stanza = "4."

They great -- ly won -- dered– so may we,
And ask as well as they,
Who could this glo -- rious Per -- son be,
Whom winds and seas o -- bey?
O, well we know it was the Lord,
The Sav -- iour and the Friend,
Whose care of those who trust His word
Will nev -- er, nev -- er end.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
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
