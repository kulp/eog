\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-system-spacing.padding = 8
}

\header{
  %children
  hymnnumber = "294"
  title = "Around the Throne of God in Heaven"
  tunename = ""
  meter = "C. M. with Refrain"
  poet = "Anna Shepherd"
  composer = "Henry E. Matthews"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=130
  \key g \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d8 | g g fis g | a a g
  a8 | b a b c | d4 r8 \eogbreak
  d8 | e d c b | c b a
  g8 | a8. g16 fis8 e | d8[ e] \eogbreak

  << s^\markup { \small \caps "Refrain" }
  { fis8 d | g4 g8 r | a4 a8 r } >>
  b8. c16 d8 c | b4 a | g r8

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d8 | b b a b | c c b
  c8 | g' fis g a | b4 r8
  b8 | c b a g | e d c
  b8 | d8. e16 d8 cis8 | d4

  d8 c! | b4 b8 r | d4 d8 r
  d8. d16 d8 e | d4 c | b r8

}
}

notesTenor = {
\global
\relative a {

  r8 | R1*1/2 | r4.
  r8 | R1*1/2 | r4.
  r8 | R1*1/2 | r4.
  r8 | a8. b16 a8 g | fis8[ g]

  a8 fis | g4 g8 r | fis4 fis8 r
  g8. a16 b8 c | g4 fis | g4 r8

}
}

notesBass = {
\global
\relative f {

  d8 | g, g d' d | d d d
  d8 | g g g g | g4 r8
  g8 | g g g g | g g g
  g8 | fis8. g16 a8 a, | d4

  d8 d | g,4 g8 r | d'4 d8 r
  g8. g16 g8 c, | d4 d | g,4 r8

}
}

Refrain = \lyricmode {

Sing -- ing, “Glo -- ry, glo -- ry, glo -- ry be to God on high.” \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

A -- round the throne of God in heaven \bar "."
Will man -- y chil -- dren sing; \bar "."
Chil -- dren whose sins are all for -- giv’n \bar "."
Will heaven -- ly an -- thems bring, \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

In shin -- ing robes of spot -- less white
Each one will be ar -- rayed!
Dwell -- ing in ev -- er -- last -- ing light,
And joys that nev -- er fade,

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

What brings them to that world a -- bove,
That heaven so bright and fair,
Where all is peace, and joy, and love?
How came those chil -- dren there?

}

wordsD = \lyricmode {
\set stanza = "4."

Be -- cause the Sav -- iour shed His blood
To wash a -- way their sin;
Now washed in that most pre -- cious flood,
Be -- hold them white and clean,

}

wordsE = \lyricmode {
\set stanza = "5."

On earth they sought the Sav -- iour’s grace,
On earth they loved His name;
So then they’ll see His bless -- ed face,
And praise be -- fore the Lamb,

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
