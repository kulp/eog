\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 11
}

\header{
  %children
  hymnnumber = "345"
  title = "Jesus Loves the Little Children"
  tunename = ""
  meter = ""
  poet = "Edwin L. Bowyer"
  composer = "George F. Root"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key bes \major
  \autoBeamOff
}

patternA = { c4 c c8. c16 c8. c16 | }
patternB = { c8. c16 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { d d d c bes g } f2 bes |
  \changePitch \patternA { c c d c bes d } c2.
  \changePitch \patternB { f, ees | d f bes c } bes4
  \changePitch \patternB { bes a | g bes bes g } f
  \changePitch \patternB { d' c | bes a bes g a f a c | } bes2. r4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { f f f ees ees ees | } d4 d d d |
  f4 f f f | f f f
  \changePitch \patternB { bes, a | bes d d ees } d4
  \changePitch \patternB { f f | ees g g ees } d4
  \changePitch \patternB { f f | g g g ees ees ees ees ees | } d2. r4

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes bes f f g g | } bes4 bes f f |
  a4 a bes bes | a a a
  \changePitch \patternB { f f | f bes bes bes } bes4
  \changePitch \patternB { bes bes | bes ees ees bes } bes4
  \changePitch \patternB { bes bes | bes bes ees ees c a c a } bes2. r4

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { bes bes bes bes bes bes | } bes4 bes bes bes |
  f'4 f bes, d | f f f8[ ees]
  \changePitch \patternB { d c | bes bes bes bes } bes4
  \changePitch \patternB { d d | ees ees ees ees } bes4
  \changePitch \patternB { bes d | ees ees ees ees f f f } bes,2. r4

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus loves the lit -- tle chil -- dren, \bar "."
All the chil -- dren of the world: \bar "."
Red and yel -- low, black and white, \bar "."
All are pre -- cious in His sight; \bar "."
Je -- sus loves the lit -- tle chil -- dren of the world. \bar "."

}

underWordsA = \lyricmode {

\override LyricText.font-size = #-2
\repeat unfold 6 { \skip 4 }
pre -- cious chil -- dren,
All the chil -- dren of the world

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus died for lit -- tle chil -- dren,
All the chil -- dren of the world:
Red and yel -- low, black and white,
All are pre -- cious in His sight;
Je -- sus died for all the chil -- dren of the world.

}

underWordsB = \lyricmode {

\override LyricText.font-size = #-2
\repeat unfold 6 { \skip 4 }
pre -- cious chil -- dren,
All the chil -- dren of the world

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
      \context Lyrics = two   \lyricsto altos    \underWordsA
      \context Lyrics = three \lyricsto sopranos \wordsB
      \context Lyrics = four  \lyricsto altos    \underWordsB
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
