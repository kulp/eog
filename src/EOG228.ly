\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "228"
  title = "In Heavenly Love Abiding"
  tunename = "Confidence"
  meter = "7. 6. 7. 6. D."
  poet = "Miss A. L. Waring"
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key d \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  fis8[ g] | a2 fis4 g2 cis,4 | d2( fis4) fis2
  fis4 | a2 a4 b( g) e | d2.( cis2)
  e4 | fis2 fis4 g( fis) g | a2. b2
  b8[ cis] | d2 a4 a( g) e | d2. ~ d2
  fis8[ g] a2 d4 cis2 b4 | a2. fis2
  fis8[ g] | a2 d4 e2 g,4 | fis2.( e2)
  d4 | fis2 fis4 g( fis) g | a2. b2
  b8[ cis] | d2 a4 a( g) e | d2. ~ d2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d8[ e] | fis2 d4 cis2 a4 | a2. d2
  d4 | fis2 fis4 d2 b4 | a2. ~ a2
  cis4 | d2 d4 cis( d) cis | d2. d2
  g4 | fis2 fis4 cis2 cis4 | d2. ~ d2
  d8[ e] | fis2 fis4 a2 g4 | fis2. d2
  d8[ e] | fis2 fis4 g2 e4 | d2.( cis2)
  d4 | d2 d4 cis( d) cis | d2. d2
  d8[ e] | d2 fis4 cis2 cis4 | d2. ~ d2

}
}

notesTenor = {
\global
\relative a {

  a4 | a2 a4 a2 g4 | fis2( a4) a2
  a4 | d2 a4 g2 g4 | fis2.( e2)
  a4 | a2 a4 a2 a4 | a2. g2
  g4 | a2 a4 a2 g4 | fis2. ~ fis2
  a4 | d2 a4 b2 cis4 | d2. a2
  a4 | d2 a4 cis2 a4 | a2. ~ a2
  fis4 | a2 a4 a2 a4 | a2. g2
  g4 | a2 a4 a2 g4 | fis2. ~ fis2

}
}

notesBass = {
\global
\relative f {

  d4 | d2 d4 a2 a4 | d2. d2
  d4 | d2 d4 g,2 g4 | a2. ~ a2
  a4 | d2 d4 e( d) e | fis2. g2
  g4 | d2 d4 a2 a4 | d2. ~ d2
  d4 | d2 d4 g2 g4 | d2. d2
  d4 | d2 d4 a2 cis4 | d2.( a2)
  d4 | d2 d4 e( d) e | fis2. g2
  g4 | fis2 d4 a2 a4 | d2. ~ d2

}
}

wordsA = \lyricmode {
\set stanza = "1."

In heaven -- ly love a -- bid -- ing, \bar "."
No change my heart shall fear, \bar "."
And safe is such con -- fid -- ing, \bar "."
For noth -- ing chang -- es here. \bar "."
The storm may roar with -- out me, \bar "."
My heart may low be laid, \bar "."
But God is round a -- bout me, \bar "."
And can I be dis -- mayed? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Wher -- ev -- er He may guide me,
No want shall turn me back;
My Shep -- herd is be -- side me,
And noth -- ing can I lack.
His wis -- dom ev -- er wak -- eth,
His sight is nev -- er dim,
He knows the way He tak -- eth,
And I will walk with Him.

}

wordsC = \lyricmode {
\set stanza = "3."

Green pas -- tures are be -- fore me,
Which yet I have not seen,
Bright skies will soon be o’er me,
Where the dark clouds have been.
My hope I can -- not meas -- ure,
My path to life is free,
My Sav -- iour has my trea -- sure,
And He will walk with me.

}

wordsD = \lyricmode {
\set stanza = "4."

Ere yet an -- oth -- er morn -- ing
My spi -- rit may be free,
As ab -- sent from the bod -- y,
At home, O Lord, with Thee.
Oh sleep, oh rest, how pre -- cious!
As, guard -- ed by Thy care,
I’m wait -- ing for Thy prom -- ise
To meet Thee in the air.

}

wordsE = \lyricmode {
\set stanza = "5."

The Lord Him -- self, e’en Je -- sus,
A -- mid the ran -- somed throng,
Its glo -- ry, joy and beau -- ty,
Its nev -- er -- end -- ing song.
Oh day of won -- drous prom -- ise,
The Bride -- groom and the bride
Are seen in glo -- ry ev -- er:
For -- ev -- er sat -- is -- fied!

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
