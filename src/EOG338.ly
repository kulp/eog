\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 3) (#t #f))
}

\header{
  %children
  hymnnumber = "338"
  title = "I Love My Saviour" % TODO original has subtitle "(I Have A Saviour)"
  tunename = ""
  meter = "10. 8. 10. 8."
  poet = "H. Sweetman & F. W. Schwartz"
  composer = "B. B. McKinney"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d8 g b | d4 d4 ~ d8 b8 c b | a4 e4 ~ e8
  d8 fis a | d4 c d, c' | b2 ~ b8
  d,8 g b | d4 d4 ~ d8 b8 c b | a4 e4 ~ e8
  d8 fis a | d4 c e, fis | \tb g2\fermata ~ \ta g8

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d8 d g | g4 g4 ~ g8 g8 fis g8 | e4 c4 ~ c8
  c8 d fis | fis4 d d d | d2 ~ d8
  d8 d g | g4 g4 ~ g8 g8 fis g8 | e4 c4 ~ c8
  c8 d fis | fis4 d c d | d2 ~ d8

}
}

notesTenor = {
\global
\relative a {

  fis8 g d' | b4 b4 ~ b8 d8 d d | c4 g4 ~ g8
  fis8 a d | c4 fis, a fis | g2 ~ g8
  b8 b d | b4 b4 ~ b8 d8 d d | c4 g4 ~ g8
  fis8 a d | a4 fis a c | b2 ~ b8

}
}

notesBass = {
\global
\relative f {

  d8 b d | g4 g4 ~ g8 g,8 a b | c4 c4 ~ c8
  d8 d d | d4 d fis d | g,2 ~ g8
  g'8 g g | g4 g4 ~ g8 g,8 a b | c4 c4 ~ c8
  d8 d d | d4 d d d | <g g,>2_\fermata ~ <g g,>8

}
}

wordsA = \lyricmode {
\set stanza = "1."

I love my Sav -- iour, my pre -- cious Sav -- iour, \bar "."
Who died on Cal -- v’ry’s cross for me; \bar "."
And now He’s ris -- en, gone back to heav -- en, \bar "."
Some -- day He’s com -- ing back for me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

And while I’m wait -- ing, I’ll try to please Him
In ev -- ery -- thing I do and say;
And when I see Him, oh, how I’ll praise Him
For wash -- ing all my sins a -- way.

}

wordsC = \lyricmode {

Oh, trust my Sav -- iour, my pre -- cious Sav -- iour;
He died for you as well as me;
He’ll keep you ev -- er, for -- sake you nev -- er;
He’ll make you glad e -- ter -- nal -- ly.

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
