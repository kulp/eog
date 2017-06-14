\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  % TODO increase intra-system spacing
  systems-per-page = #(cond (is-eogsized 4) (#t #f))
}

\header{
  %children
  hymnnumber = "328"
  title = "A Little Child of Seven"
  tunename = "Webb" % identical to EOG220
  meter = "7. 6. 7. 6. D."
  poet = ""
  composer = "George. J. Webb"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key bes \major
  \partial 4
  \autoBeamOff
}

patternA = { c4 | c4. c8 c4 c | c2 c4 }
patternB = { c4 | c c c c | c2 c4 }
patternC = { c4 | c4 c c, c | c2( c4) }
patternD = { c4 | c4 c c, c | c2. }
patternE = { c8[ c] | c4 c c, c | c2. }

notesSoprano = {
\global
\relative c' {

  f4 | bes4. bes8 d4 bes | bes2 g4
  bes4 | f bes c d | c2 r4 \eogbreak
  f,4 | bes4. bes8 d4 bes | bes2 g4
  bes4 | f bes d c | bes2 r4 \eogbreak

  f4 | c'4. c8 bes4 c | d2 d4
  d4 | ees4 d g, c | bes2( a4) \eogbreak
  f4 | bes4. bes8 d4 bes | bes2 g4
  bes4 | f bes d c | bes2 r4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d | d d f f | g ees }
  \changePitch \patternB { g | f f f f | f r }
  \changePitch \patternA { f | d d f f | g ees }
  \changePitch \patternB { g | f d f ees | d r }

  \changePitch \patternA { f | f f f f | f f }
  \changePitch \patternD { f | ees f g g | f }
  \changePitch \patternA { f | d d f f | g ees }
  \changePitch \patternB { g | f d f ees | d r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes | bes bes bes bes | bes bes }
  \changePitch \patternB { bes | bes bes a bes | a r }
  \changePitch \patternA { a | bes bes bes bes | bes bes }
  \changePitch \patternB { bes | bes bes bes a | bes r }

  \changePitch \patternA { f | a a g a | bes bes }
  \changePitch \patternC { bes | bes bes bes ees | d c }
  \changePitch \patternA { a | bes bes bes bes | bes bes }
  \changePitch \patternB { bes | bes bes bes a | bes r }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { bes | bes bes bes d | ees ees }
  \changePitch \patternB { ees | d d c bes | f' r }
  \changePitch \patternA { f | bes, bes bes d | ees ees }
  \changePitch \patternB { ees | d bes f' f | bes, r }

  \changePitch \patternA { f' | f f f f | bes bes }
  \changePitch \patternE { bes a | g f ees c | f }
  \changePitch \patternA { f | bes, bes bes d | ees ees }
  \changePitch \patternB { ees | d bes f' f | bes, r }

}
}

wordsA = \lyricmode {

A lit -- tle child of sev -- en, \bar "."
Or ev -- en three or four, \bar "."
May en -- ter in -- to heav -- en \bar "."
Through Christ, the O -- pen Door. \bar "."
For when the heart be -- liev -- eth \bar "."
On Christ, the Son of God, \bar "."
’Tis then the soul re -- ceiv -- eth \bar "."
Sal -- va -- tion through His blood. \bar "."

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
