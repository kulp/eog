\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 2) (#t #f))
  page-count = #(cond (is-eogsized 1) (#t #f))
  system-system-spacing.padding = 11
}

\header{
  hymnnumber = "99"
  title = "My Soul, Repeat His Praise"
  tunename = "St. Michael"
  meter = "S. M."
  poet = "I. Watts (Psalm 103)"
  composer = "Genevan Psalter"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=160 }
tb = { \tempo 4=80 }

patternAA = { c2 | c2 c2 c2 c2 | c1. }
patternAB = { c2 | c2 c2 c2. c4 | c1. }
patternBA = { c2 | c2 c2 c2 c2 | c2 c2 c2 }
patternBB = { c2 | c2 c2 c2 c4( c4) | c2 c2 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d | g b a a | b }
  \changePitch \patternAA { d | c b a a | g } \eogbreak
  \changePitch \patternBA { g | fis e d g | g a b }
  \changePitch \patternAA { b | a g g fis | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { b | b d e d | d }
  \changePitch \patternAB { d | e d d c | b }
  \changePitch \patternBA { e | d c b d | e e dis }
  \changePitch \patternAA { d! | d b e d | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g | g g g fis | g }
  \changePitch \patternAA { g | g g g fis | g }
  \changePitch \patternBA { b | b g g b | b e, fis }
  \changePitch \patternAA { g | fis g a a | b }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { b | e b c d | g }
  \changePitch \patternAA { b, | c g d' d | g, }
  \changePitch \patternBB { e' | b c g g' fis | e c b }
  \changePitch \patternAA { b | d e c d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

My soul, re -- peat His praise \bar "."
Whose mer -- cies are so great; \bar "."
Whose an -- ger is so slow to rise, \bar "."
So read -- y to a -- bate. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

High as the heavens are raised % original has "heaven's here ! probably wanted heav'ns
A -- bove the earth we tread,
So far the rich -- es of God’s grace
Our high -- est thoughts ex -- ceed.

}

wordsC = \lyricmode {
\set stanza = "3."

His power sub -- dues our sin;
And His for -- giv -- ing love,
Far as the east is from the west,
Did all our guilt re -- move.

}

wordsD = \markuplist {

\line { Man’s life is as the grass, }
\line { Or like the morning flower; }
\line { If one sharp blast sweep o’er the field, }
\line { It withers in an hour. }

}

wordsE = \markuplist {

\line { But Thy compassions, Lord, }
\line { To endless years endure; }
\line { And all Thy people ever find }
\line { Thy word of promise sure. }

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

\noPageBreak

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } }
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
