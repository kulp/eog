\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "197"
  title = "The Saviour Is Coming"
  tunename = ""
  meter = "11’s."
  poet = ""
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key bes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f4 | bes2 bes4 d | f,2 f4
  g4 | f( ees) d f | bes2.
  bes4 | c2 c4 c | d2 ees4
  ees | d( c) bes a | bes2.
  bes4 | d2 d4 d | c2 c4
  d4 | bes4.( a8) bes4 g | g4( f2)
  ees4 | d( f) bes bes | bes2 f4
  f4 | bes( d) f f | d4.( c8 bes4)
  bes4 | c2 c4 c | d2 ees4
  ees4 | d( c) bes a | bes2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | d2 d4 f | d2 d4
  ees4 | d( c) bes c | d( ees f)
  d4 | f2 f4 f | f2 g4
  ges4 | f( ees) d ees | d2.
  d4 | f2 f4 f | f2 f4
  fis4 | g4.( d8) d4 ees | ees( d2)
  c4 | bes( d) d d | d2 d4
  d4 | d( f) bes bes | f4.( ees8 d4)
  d4 | f2 f4 f | f4( aes) g
  ges4 | f( ees) d ees | d2.

}
}

notesTenor = {
\global
\relative a {

  bes4 | bes2 bes4 bes | bes2 bes4
  bes4 | bes( a) bes a | bes2.
  bes4 | a2 a4 a | bes2 bes4
  bes4 | bes( a) bes c | bes2.
  bes4 | bes2 bes4 bes | a2 a4
  d4 | d4.( c8) bes4 bes | bes2.
  r4 | r1 | r2 r4
  bes4 | bes2 d4 d | bes4.( f8 g4)
  bes4 | a2 a4 a | bes2 bes4
  bes4 | bes( a) bes c | bes2.

}
}

notesBass = {
\global
\relative f, {

  bes4 | bes2 bes4 bes | bes2 bes4
  ees4 | f2 f4 f | bes,( c d)
  bes4 | f'2 f4 f | bes( a) g
  ees4 | f2 f4 f | bes,2.
  bes4 | bes2 bes4 d | f2 f4
  d4 | g4.( fis8) g4 ees | bes2.
  r4 | r1 | r2 r4
  r4 | r1 | r2 r4
  bes4 | f'2 f4 f | bes2
  ees,4 ees | f2 f4 f | bes,2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

The Sav -- iour is com -- ing, \bar "."
The mo -- ment is near; \bar "."
The bright Star of Morn -- ing \bar "."
Will quick -- ly ap -- pear. \bar "."
Then will His be -- loved ones \bar "."
With swift -- ness a -- rise, \bar "."
And meet their blest Sav -- iour, \bar "."
With joy, in the skies. \bar "."
%{HIDE>%} And meet their blest Sav -- iour, \bar "."
With joy, in the skies. %{<HIDE%} \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

With Him, they to -- geth -- er
To heav -- en will go,
Where riv -- ers of pleas -- ures
And peace ev -- er flow;
They shine in the like -- ness
Of Him whom they love,
And dwell in the bright -- ness
Of glo -- ry a -- bove.
%{HIDE>%} And dwell in the bright -- ness
Of glo -- ry a -- bove. %{<HIDE%}

}

wordsC = \lyricmode {
\set stanza = "3."

Who now trust the Sav -- iour,
The sent One of God,
Are cleansed and for -- giv -- en
Through His pre -- cious blood;
And when all in heav -- en
To praise Him shall throng,
Each one, who here loved Him,
Will join in the song.
%{HIDE>%} Each one, who here loved Him,
Will join in the song. %{<HIDE%}

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
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
