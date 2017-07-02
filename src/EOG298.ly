\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-count = #(cond (is-eogsized 4) (#t #f))
  system-system-spacing.padding = 8
}

\header{
  %children
  hymnnumber = "298"
  title = "Jesus Is Calling the Children"
  tunename = "Shepherd"
  meter = "8. 4. 8. 4. with Refrain"
  poet = "Alice Gausby"
  composer = "Alice Gausby"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key aes \major
  \autoBeamOff
}

patternA = { c8 c c c c c | c4. c }
patternB = { c4. c4 c8 | c2. }
patternC = { c4. ~ c8 c8 c | c4. c }
patternD = { c4. ~ c8 c8 c | c4. c4 c8 | c4. c4 c8 | c2. }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { aes aes aes g aes bes | aes ees }
  \changePitch \patternB { f aes aes | bes }
  \changePitch \patternA { c des c bes c bes | aes f }
  \changePitch \patternB { ees aes bes | aes }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternC { ees' ees des c | bes des } >>
  \changePitch \patternC { des des aes bes | c aes }
  \changePitch \patternD { aes aes g f | ees ees' des | c bes aes | aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { c c c des c des | c c }
  \changePitch \patternB { des d d | des! }
  \changePitch \patternA { ees f ees des ees des | c des }
  \changePitch \patternB { c ees ees | ees }

  \changePitch \patternC { ees ees ees ees | f f }
  \changePitch \patternC { ees ees ees g | aes ees }
  \changePitch \patternD { f f ees des | c f f | aes g ees | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { ees ees ees ees ees ees | ees aes }
  \changePitch \patternB { aes bes bes | g }
  \changePitch \patternA { aes aes aes g g g | f aes }
  \changePitch \patternB { aes c des | c }

  \changePitch \patternC { aes aes g aes | aes aes }
  \changePitch \patternC { g g c ees | ees c }
  \changePitch \patternD { des des aes aes | aes aes bes | ees des c | c }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { aes aes aes bes aes g | aes aes }
  \changePitch \patternB { des bes bes | ees }
  \changePitch \patternA { aes, aes aes ees' ees ees | f des }
  \changePitch \patternB { ees ees ees | aes }

  \changePitch \patternC { c, c bes aes | des bes }
  \changePitch \patternC { ees ees ees ees | aes aes }
  \changePitch \patternD { des, des des des | ees des des | ees ees aes | aes }

}
}

Refrain = \lyricmode {

Gen -- tly to lead them, \bar "."
Guard them and feed them, \bar "."
Je -- sus is call -- ing the lambs to His side. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus is call -- ing the chil -- dren \bar "."
Un -- to His side, \bar "."
Stretch -- es His arms to re -- ceive them, \bar "."
O -- pens them wide. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus is call -- ing the chil -- dren,
Why do they stay
Out in the wil -- der -- ness wan -- d’ring,
Go -- ing a -- stray?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus is call -- ing the chil -- dren,
Call -- ing to -- day;
Hast -- en each one for the bless -- ing,
Do not de -- lay.

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
