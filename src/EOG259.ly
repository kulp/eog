\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-system-spacing.padding = 11
}

\header{
  %gospel
  hymnnumber = "259"
  title = "Rock of Ages!"
  tunename = "Toplady"
  meter = "6—7s."
  poet = "A. M. Toplady"
  composer = "Dr. Thos. Hastings"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=70
  \key bes \major
  \partial 2
  \autoBeamOff
}

patternA = { c4. c8 | c2 c c4. c8 | c1 }
patternB = { c4. c8 | c2. c4 c c | c1 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { f g | f d bes' g | f }
  \changePitch \patternB { bes c | d c bes a | bes }
  \changePitch \patternB { a bes | c c a f | bes}
  \changePitch \patternB { a bes | c c a f | bes}
  \changePitch \patternA { f g | f d bes' g | f }
  \changePitch \patternB { bes c | d c bes a | bes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d ees | d bes d ees | d }
  \changePitch \patternB { f g | f ees d c | d }
  \changePitch \patternB { c d | ees ees ees ees | d }
  \changePitch \patternB { c d | ees ees ees ees | d }
  \changePitch \patternA { d ees | d bes d ees | d }
  \changePitch \patternB { f g | f ees d c | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes bes | bes f f bes | bes }
  \changePitch \patternB { bes bes | bes f f f | bes }
  \changePitch \patternB { c bes | a a c a | bes }
  \changePitch \patternB { c bes | a a c a | bes }
  \changePitch \patternA { bes bes | bes f f bes | bes }
  \changePitch \patternB { bes bes | bes f f f | bes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { bes bes | bes bes bes bes | bes }
  \changePitch \patternB { d ees | f f f f | bes, }
  \changePitch \patternB { f' f | f f f f | bes, }
  \changePitch \patternB { f' f | f f f f | bes, }
  \changePitch \patternA { bes bes | bes bes bes bes | bes }
  \changePitch \patternB { d ees | f f f f | bes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Rock of A -- ges! cleft for sin, \bar "."
Grace hath hid us safe with -- in! \bar "."
Where the wa -- ter and the blood, \bar "."
From Thy riv -- en side which flowed, \bar "."
Are of sin the doub -- le cure, \bar "."
Cleans -- ing from its guilt and power. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Not the la -- bor of our hands
Could ful -- fill the law’s de -- mands;
Could our zeal no res -- pite know,
Could our tears for -- ev -- er flow,
Naught for sin could e’er a -- tone–
But Thy blood, and Thine a -- lone!

}

wordsC = \lyricmode {
\set stanza = "3."

Found by Thee be -- fore we sought,
Un -- to Thee in mer -- cy brought,
We have Thee for right -- eous -- ness–
From Thy full -- ness, grace on grace;
Thou hast washed us in Thy blood,
Made us live, and live to God.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
