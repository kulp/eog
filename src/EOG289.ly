\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "289"
  title = "Who Is He?"
  tunename = ""
  meter = "P. M."
  poet = "B. R. Hanby"
  composer = "B. R. Hanby"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key a \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e8^\markup\italic Tenderly. e | e4. e8 e8 e8 | fis2
  fis8 fis | e4. e8 a a | b2

  a8^\f^\markup \italic Joyful. b | cis4. cis8 d cis | cis4 b
  gis8 a | b4. b8 cis b | b4 a
  a8^\p a | a4. a8 a e | fis2
  a8^\ff b | cis4. cis8 b b | a2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  cis8 cis | cis4. cis8 cis e | d2
  d8 d | cis4. cis8 cis cis | d2

  cis8 d | e4. e8 fis e | e4 e
  e8 cis | e4. e8 e e | d4 cis
  cis8 cis | cis4. cis8 e e | d2
  fis8 fis | e4. e8 e d | cis2

}
}

notesTenor = {
\global
\relative a {

  a8 a | a4. a8 a a | a2
  a8 a | a4. a8 a a | gis2

  e8 e | a4. a8 a a | a4 gis
  b8 a | gis4. gis8 a gis | a4 a
  e8 e | a4. a8 a a | a2
  a8 a | a4. a8 gis gis | a2

}
}

notesBass = {
\global
\relative f, {

  a8 a | a4. a8 cis cis | d2
  d8 d | e4. e8 fis fis | e2
  a,8 a | a4. a8 a a | e'4 e
  e8 e | e4. e8 e e | a,4 a
  a8 a | a4. a8 cis cis | d2
  d8 d | e4. e8 e e | a,2

}
}

Refrain = \lyricmode {

’Tis the Lord! Oh, won -- drous sto -- ry! \bar "."
’Tis the Lord, the King of glo -- ry! \bar "."
At His feet we hum -- bly fall– \bar "."
Crown Him, crown Him Lord of all! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Who is He in yon -- der stall, \bar "."
At whose feet the shep -- herds fall? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Who is He in deep dis -- tress,
Fast -- ing in the wil -- der -- ness?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Who is He that stands and weeps
At the grave where Laz -- ’rus sleeps?

}

wordsD = \lyricmode {
\set stanza = "4."

Lo! at mid -- night, who is He
Prays in dark Geth -- sem -- a -- ne?

}

wordsE = \markuplist {

\line { Who is He in Calvary’s throes, }
\line { Asks for blessings on His foes? }

}

wordsF = \markuplist {

\line { Who is He that from the grave }
\line { Comes to heal, and bless, and save? }

}

wordsG = \markuplist {

\line { Lo! ascending, who is He }
\line { Captive leads captivity? }

}

wordsH = \markuplist {

\line { Who is He on yonder throne, }
\line { Rules the world of light alone? }

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

\noPageBreak

\markup { \fill-line {
  \hspace #0.1
  \column {
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } }
  }
  \hspace #0.1
  \column {
  \line{ \bold 7 \column { \wordsG } } \combine \null \vspace #0.4
  \line{ \bold 8 \column { \wordsH } }
  }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
