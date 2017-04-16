\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "276"
  title = "We Sing of the Realms of the Blest"
  tunename = "Celeste"
  meter = "4-8s."
  poet = "Mrs. E. Mills"
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key a \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e2 | a a4 a | a( b) cis b | a2
  gis4( a) | b2 b4 b | b( cis) d b | cis2 \eogbreak
  a4( cis) | e2 e4 e | e2 d4 cis | b2
  e,2 | fis d'4 d | cis( b) a gis | a2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e2 | e e4 e | e2 e4 e | e2
  e2 | e e4 e | e2 e4 e | e2
  e4( a) | a2 a4 a | a2 gis4 a | gis2
  e2 | d2 fis4 e | e( fis) e d | cis2

}
}

notesTenor = {
\global
\relative a {

  cis2 | cis cis4 cis | cis4( d) e d | cis2
  b4( a) | gis2 gis4 gis | gis( a) b gis | a2
  cis4( e) | e2 e4 e | e2 e4 e | e2
  a,2 | a a4 gis | a( d) cis b | a2

}
}

notesBass = {
\global
\relative f {

  a2 | a a4 a | e2 e4 e | a,2
  e'2 | e e4 e | e2 e4 e | a,2
  a'2 | cis2 cis4 cis | cis2 b4 a | e2
  cis2 | d b4 b | cis( d) e e | a,2

}
}

wordsA = \lyricmode {
\set stanza = "1."

We sing of the realms of the blest, \bar "."
The home Je -- sus went to pre -- pare \bar "."
For all who His name now con -- fess: \bar "."
But what must it be to be there! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

We speak of its free -- dom from sin,
From sor -- row, temp -- ta -- tion, and care;
From tri -- als with -- out and with -- in:
But what must it be to be there!

}

wordsC = \lyricmode {
\set stanza = "3."

We speak of its peace and its love,
The robes which the glo -- ri -- fied wear;
The songs of the bless -- ed a -- bove:
But what must it be to be there!

}

wordsD = \lyricmode {
\set stanza = "4."

We speak of its path -- way of gold,
Its walls decked with jew -- els so rare;
Its won -- ders and pleas -- ures un -- told:
But what must it be to be there!

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
