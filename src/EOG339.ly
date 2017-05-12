\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 4) (#t #f))
  system-count = #(cond (is-eogsized 6) (#t #f))
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "339"
  title = "I Love To Sing of Jesus"
  tunename = "Hora Novissima"
  meter = "7. 6. 7. 6. D."
  poet = "R. D. Edwards"
  composer = "Arr. from Rossini"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=140
  \key d \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  fis4 | fis2 fis4 fis( e) fis | a2. g2
  fis4 | fis2 fis4 fis( g) fis | e2. ~ e2 \eogbreak
  fis4 | fis2 fis4 fis( e) fis | a2. g2
  fis4 | fis2 fis4 e( fis) e | d2. ~ d2 \eogbreak

  a'4 | a2 a4 a( b) cis | d2. e2
  d4 | cis2 cis4 b( cis) b | a2. ~ a2 \eogbreak
  a4 | a2 a4 a( b) cis | d2. e2
  d4 | cis2 cis4 b( cis) b | a2.( g2) \eogbreak

  fis4^\markup { \small \caps "Refrain" } | fis2 fis4 fis( e) fis | a2. g2
  fis4 | fis2 fis4 fis( g) fis | e2. ~ e2 \eogbreak
  fis4 | fis2 fis4 fis( e) fis | a2. g2
  fis4 | fis2 fis4 e( fis) e | d2. ~ d2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | d2 d4 d2 d4 | d2. cis2
  d4 | d2 d4 d2 d4 | d2.( cis2)
  d4 | d2 d4 d2 d4 | d2. d2
  d4 | d2 d4 cis2 cis4 | d2. ~ d2

  cis4 | d2 d4 cis( d) e | fis2. g2
  fis4 | e2 a4 gis2 gis4 | a2. ~ a2
  cis,4 | d2 d4 cis( d) e | fis2. g2
  fis4 | e2 e4 d2 d4 | cis2.( e2)

  d4 | d2 d4 d2 d4 | d2. cis2
  d4 | d2 d4 d2 d4 | d2.( cis2)
  d4 | d2 d4 d2 d4 | d2. d2
  d4 | d2 d4 cis2 cis4 | d2. ~ d2

}
}

notesTenor = {
\global
\relative a {

  a4 | a2 a4 a( g) a | a2. a2
  a4 | a2 a4 a( b) a | a2. ~ a2
  a4 | a2 a4 b2 b4 | c2. b2
  a4 | a2 a4 g2 g4 | fis2. ~ fis2

  a4 | a2 d4 cis( b) a | a2. a2
  a4 | a2 e'4 d( e) d | cis2. ~ cis2
  a4 | a2 d4 cis( b) a | a2. a2
  a4 | a2 a4 gis2 gis4 | a2. ~ a2

  a4 | a2 a4 a( g) a | a2. a2
  a4 | a2 a4 a( b) a | a2. ~ a2
  a4 | a2 a4 b2 b4 | c2. b2
  a4 | a2 a4 g2 g4 | fis2. ~ fis2

}
}

notesBass = {
\global
\relative f {

  d4 | d2 d4 d2 d4 | fis2. e2
  d4 | d2 d4 d2 d4 | a2. ~ a2
  d4 | d2 d4 b2 b4 | g2. g2
  a4 | a2 a4 a2 a4 | d2. ~ d2

  g4 | fis2 fis4 g2 g4 | fis2. cis2
  d4 | e2 e4 e2 e4 | a2. ~ a2
  g4 | fis2 fis4 g2 g4 | fis2. cis2
  d4 | e2 e4 e2 e4 | a,2.( cis2)

  d4 | d2 d4 d2 d4 | fis2. e2
  d4 | d2 d4 d2 d4 | a2. ~ a2
  d4 | d2 d4 b2 b4 | g2. g2
  a4 | a2 a4 a2 a4 | d2. ~ d2

}
}

Refrain = \lyricmode {

I love to sing of Je -- sus, \bar "."
The sto -- ry all so true; \bar "."
To me most sweet and pre -- cious, \bar "."
The old but ev -- er new. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

I love to sing of Je -- sus, \bar "."
The sto -- ry all so true; \bar "."
To me most sweet and pre -- cious, \bar "."
The old but ev -- er new. \bar "."
He came from bright -- est glo -- ry, \bar "."
From ra -- diant courts on high; \bar "."
How match -- less is the sto -- ry \bar "."
Of Him Who came to die! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The Babe in Beth -- lehem’s man -- ger,
The low -- ly One on earth;
Re -- ject -- ed and a stran -- ger,
Few cared to know His worth.
My soul would now re -- call Him,
In all His per -- fect love;
Which on -- ly { \mon } Cal -- va -- { \moff } ry’s Vic -- tim
Its won -- drous depths could prove.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

’Twas there my Sav -- iour suf -- fered,
And tast -- ed death for me;
Yes, there the work He fin -- ished,
That sets me ev -- er free.
My sins all laid up -- on Him,
The wrath and judg -- ment borne.;
The power of Sa -- tan bro -- ken,
In Je -- sus’ death of scorn.

}

wordsD = \lyricmode {
\set stanza = "4."

And now the Lord is ris -- en,
His trav -- ail ev -- er o’er;
Seat -- ed in high -- est heav -- en,
A -- live to die no more.
And soon He’s com -- ing for me,
To take me home a -- bove
Where still I’ll sing the sto -- ry,
Of Je -- sus and His love.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

% TODO move to first page, like original
\noPageBreak \markup { \fill-line { "Alternate tune: No.’s 155 and 308." } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond: