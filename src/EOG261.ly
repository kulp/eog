\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "261"
  title = "Lord Jesus, Are We One with Thee?"
  tunename = "Manoah"
  meter = "C. M."
  poet = "J. G. Deck"
  composer = "From Mehul & Haydn"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g8[ a] | b2 a4 | g2 fis4 | fis2 e4 | e2
  a8[ b] | c2 b4 | a2 g4 | g2.( | fis2)
  d4 | b'2 a4 | c2 b4 | e2 b4 | d4( c)
  a4 | g2 d4 | b'2 a4 | g2. ~ | g2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | g2 fis4 | e2 d4 | d2 c4 | c2
  e8[ d] | c2 d4 | e2 e4 | d2. ~ | d2
  c4 | b( d) d | c2 d4 | e2 e4 | e2
  d4 | d2 d4 | g2 fis4 | d2. ~ | d2

}
}

notesTenor = {
\global
\relative a {

  b8[ c] | d2 c4 | b2 g4 | g2 g4 | g2
  a8[ gis] | a2 gis4 | a2 ais4 | b2.( | a2)
  fis4 | g2 fis4 | g2 g4 | g2 gis4 | a2
  a4 | b2 b4 | d2 c4 | b2. ~ | b2

}
}

notesBass = {
\global
\relative f {

  <g g,>4 | g2 d4 | e2 b4 | c2 c4 | c2
  c8[ b] | a2 b4 | c2 cis4 | d2. ~ | d2
  d4 | g,2 d'4 | e2 d4 | c2 e4 | a,2
  c4 | d2 d4 | d2 d4 | <g g,>2. ~ | <g g,>2

}
}

wordsA = \lyricmode {
\set stanza = "1."

Lord Je -- sus, are we one with Thee? \bar "."
Oh height, oh depth, of love! \bar "."
And cru -- ci -- fied and dead with Thee, \bar "."
Now one in heaven a -- bove. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Such was Thy grace, that for our sake
Thou didst from heaven come down;
With us of flesh and blood par -- take,
And make our guilt Thine own.

}

wordsC = \lyricmode {
\set stanza = "3."

Our sins, our guilt, in love di -- vine,
Con -- fessed and borne by Thee;
The gall, the curse, the wrath were Thine,
To set Thy ran -- somed free.

}

wordsD = \lyricmode {
\set stanza = "4."

As -- cend -- ed now, in glo -- ry bright,
Life -- giv -- ing Head Thou art;
Nor life, nor death, nor depth, nor height,
Thy saints and Thee can part.

}

wordsE = \lyricmode {
\set stanza = "5."

And soon shall come that glo -- rious day,
When, seat -- ed on Thy throne,
Thou shalt to won -- d’ring worlds dis -- play
That we with Thee are one.

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
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
