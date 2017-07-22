\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "354"
  title = "Oh! Would You Know My Saviour?"
  tunename = "Spes Celestis"
  meter = "C. M. D."
  poet = "Charlotte Gipps"
  composer = "W. A. Smith"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=130
  \key c \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 | g2 c4 c( b) a | a2. g2
  e4 | g2 f4 c2 d4 | e2. ~ e2 \eogbreak
  e4 | e2 d4 d2 c4 | f2 f4 e2
  e4 | d( e) fis b2 a4 | g2. ~ g2 \eogbreak
  g4 | d'2 c4 b2 a4 | a2 g4 e2
  e4 | e2 e4 b'2 b4 | e,2.( g2) \eogbreak
  g4 | g2 c4 c( b) a | a2 g4 g2
  g4 | a( b) c e2 d4 | c2. ~ c2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e4 e2 e4 f2 f4 | f2. e2
  c4 | e2 c4 c2 b4 | c2. ~ c2
  c4 | b2 b4 b2 c4 | c2 b4 c2
  c4 | c2 d4 fis!( e) fis | g2. ~ g2
  g4 | f2 f4 f2 f4 | e2 e4 c2
  c4 | b2 b4 dis2 dis4 | e2.( f2)
  f4 | e2 e4 f2 f4 | f2 f4 e2
  e4 | f2 fis4 g2 f4 | e2. ~ e2 % original fails to make last `f4` natural

}
}

notesTenor = {
\global
\relative a {

  c4 | c2 g4 gis2 a4 | b2. c2
  g4 | bes2 a4 aes2 aes4 | g2. ~ g2
  g4 | g2 g4 g2 g4 | g2 g4 g2
  g4 | fis4( g) a d2 c4 | b2. ~ b2
  b4 | b2 c4 d2 b4 | c2 c4 g2
  a4 | g2 g4 fis2 a4 | g2.( b2)
  b4 | c2 g4 gis2 a4 | b2 b4 c2
  c4 | c2 c4 c2 b4 | g2. ~ g2

}
}

notesBass = {
\global
\relative f {

  c4 | c2 c4 c2 c4 | c2. c2
  c4 | c2 c4 c2 c4 | c2. ~ c2
  c4 | g'2 g4 f2 e4 | g2 g,4 c2
  c4 | d2 d4 d2 d4 | g2. ~ g2
  g4 | g2 g4 g2 g4 | c,2 g4 c2
  a4 | b2 b4 b2 b4 | e2.( d2)
  d4 | c2 c4 c2 c4 | c2 c4 c2
  c'8[ b] | a2 aes4 g2 g4 | c,2. ~ c2

}
}

wordsA = \lyricmode {
\set stanza = "1."

Oh! would you know my Sav -- iour, \bar "."
Ye who are young today, \bar "."
Yet some -- times feel that earth’s de -- lights \bar "."
Must fade and pass a -- way? \bar "."
Then ear -- ly heed the voice of love, \bar "."
Which tells of joys in heaven. \bar "."
And God can say in right -- eous -- ness, \bar "."
“Your sins are all for -- given.” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Oh! would you know my Sav -- iour,
Ye trav -- ’lers to the tomb?
He takes the sting of death a -- way,
And chas -- es all its gloom.
Then come, be -- lieve, while yet you may,
The mes -- sage sent from heaven;
How God can say in right -- eous -- ness,
“Your sins are all for -- given.”

}

wordsC = \lyricmode {
\set stanza = "3."

Oh! would you know my Sav -- iour,
Ye hun -- gry souls and poor?
I can -- not tell you all He is,
I want to know Him more;
But let me seek to spread a -- broad
God’s bless -- ed news from heaven,
How He can say in right -- eous -- ness,
“Your sins are all for -- given.”

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
