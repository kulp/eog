\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  systems-per-page = #(cond (is-eogsized 1) (#t #f))
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "216"
  title = "How Good Is the God We Adore"
  tunename = "Elland"
  meter = "8. 8. 8. 8."
  poet = "Hart, 1750"
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key f \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f4.( g8) a2 bes4 a g2 a4 g | f1.
  c'2 | d f4 d c2 a4 f | a2( g1)
  a4.( bes8) | c2 bes4 a d2 e4. e8 | f1( c2)
  f,4.( g8) | a2 bes4 a g2 d4 e | f1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 | f f4 f e2 e4 e | f1.
  f2 | f f4 f f2 f4 f | f2( e1)
  f4.( g8) | a2 g4  f f2 bes4. bes8 | a1( f2)
  f2 | f f4 f f2 bes,4 c | c1.

}
}

notesTenor = {
\global
\relative a {

  a4.( bes8) | c2 d4 c bes2 c4 bes | a1.
  c2 | bes d4 bes c2 c4 b | c1.
  c4.( bes8) | a2 bes4 c bes2 c4. c8 | c1( a2)
  a4.( b8) | c2 bes!4 c d2 g,4 bes | a1.

}
}

notesBass = {
\global
\relative f {

  f2 | f f4 f c2 c4 c | f1.
  a2 | bes2 bes4 bes a2 f4 d | c1.
  f2 | f g4 a bes2 g4. g8 | f1.
  d2 | c d4 c bes2 c4 c | f1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

How good is the God we a -- dore, \bar "."
Our faith -- ful, un -- change -- a -- ble Friend; \bar "."
Whose love is as great as His power, \bar "."
And knows nei -- ther meas -- ure nor end! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

’Tis Je -- sus the First and the Last,
Whose Spir -- it shall guide us safe home;
We’ll praise Him for all that is past,
And trust Him for all that’s to come.

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
