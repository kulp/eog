\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG356.ily"
}

\header{
  %children
  hymnnumber = "356"
  title = "Sing the Saviour’s Praises" % not found at hymnary.org
  tunename = "Ring the Bells of Heaven"
  meter = "P. M. with Refrain" % something like 11. 9. 11. 9. with Refrain (9. 9. 11. 9)
  poet = ""
  composer = "George F. Root" % see https://hymnary.org/tune/ring_the_bells_of_heaven_there_is_root
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=75
  \key bes \major
  \autoBeamOff
}

patternA = { c8. c16 c8. c16 c4 c | c8. c16 c8. c16 c2 }
patternB = { c8. c16 c8. c16 c8. c16 c8. c16 | c2. c4 }

patternC = { c4 c c8. c16 c8. c16 | c4 c c2 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { f f g f d' bes | c bes g a bes }
  \changePitch \patternB { a bes c bes | d c ees a, | bes r }
  \changePitch \patternA { f f g f d' bes | c bes g a bes }
  \changePitch \patternB { a bes c bes | d c ees a, | bes r } \eogbreak

  << s^\markup { \small \caps "Refrain" }
  { \changePitch \patternC { d d f ees c a | bes bes } d2 } >>
  \changePitch \patternC { g, g c d c bes | a g } f4 r4
  \changePitch \patternA { f f g f d' bes | c bes g a bes }
  \changePitch \patternB { a bes c bes | d c ees a, | bes r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d d ees d f d | ees ees ees f g }
  \changePitch \patternB { f f f f | f f f ees | d r }
  \changePitch \patternA { d d ees d f d | ees ees ees f g }
  \changePitch \patternB { f f f f | f f f ees | d r }

  \changePitch \patternC { f f f f f ees | d g } fis2
  \changePitch \patternC { g g e e e e | f e } f4 r4
  \changePitch \patternA { d d ees d f d | ees ees ees f g }
  \changePitch \patternB { f f f f | f f f ees | d r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes bes bes bes bes bes | g g bes bes ees }
  \changePitch \patternB { c bes a g | f a c c | bes r }
  \changePitch \patternA { bes bes bes bes bes bes | g g bes bes ees }
  \changePitch \patternB { c bes a g | f a c c | bes r }

  \changePitch \patternC { bes bes a c ees c | bes d } d2
  \changePitch \patternC { bes bes c c c c | c bes } a4 r4
  \changePitch \patternA { bes bes bes bes bes bes | g g bes bes ees }
  \changePitch \patternB { c bes a g | f a c c | bes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { bes bes bes bes bes bes | ees ees ees ees ees }
  \changePitch \patternB { f f f f f f f f | bes, r }
  \changePitch \patternA { bes bes bes bes bes bes | ees ees ees ees ees }
  \changePitch \patternB { f f f f f f f f | bes, r }

  \changePitch \patternC { bes' bes f f f f | g g } d2
  \changePitch \patternC { ees ees c c c c | f c } f4 r4
  \changePitch \patternA { bes, bes bes bes bes bes | ees ees ees ees ees }
  \changePitch \patternB { f f f f f f f f | bes, r }

}
}

Refrain = \lyricmode {

Praise Him! Praise Him for His won -- drous love! \bar "."
Praise Him! Praise Him, till in heaven a -- bove \bar "."
All the ran -- somed chil -- dren whom His love set free, \bar "."
Praise Him thro’ a glad e -- ter -- ni -- ty. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Sing the Sav -- iour’s prais -- es; lit -- tle chil -- dren, sing! \bar "."
Je -- sus loves you, died your souls to save. \bar "."
Glad -- ly then thanks -- giv -- ing to the Sav -- iour bring; \bar "."
Out of love for you Him -- self He gave. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Sing the Sav -- iour’s prais -- es; lit -- tle chil -- dren, sing!
For He list -- ens to your fee -- ble song.
Hearts and voi -- ces free -- ly to His ser -- vice bring;
All you have and are to Him be -- long.

\Refrain

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
