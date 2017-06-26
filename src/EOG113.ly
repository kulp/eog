\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "113"
  title = "Only A Step To Jesus"
  tunename = ""
  meter = "7. 6. 7. 6. with Refrain"
  poet = "Fanny J. Crosby"
  composer = "W. H. Doane"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { \ta c8 c8 c8 c4 c8 | c4. c4 }
patternAB = { \ta c8 c8 c8 c4 c8 | c4. c4. }
patternAC = { \ta c8 c8 c8 c4 c8 | c4. c4 }
patternAD = { \ta c8 c8 c8 c4 c8 | c4. \tb c4 }

patternBA = { \ta c8 | c4 c8 c4 c8 | c4. ~ c4. }

patternCA = { \ta c8 c8 c8 c4 c8 }
patternCB = { \ta c4 c8 c4 c8 | c4. ~ c4 c8 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { c c c des c | bes aes }
  \changePitch \patternBA { f | ees aes aes c | bes bes }
  \changePitch \patternAA { c c c des c | bes aes }
  \changePitch \patternBA { f | ees aes c bes | aes aes }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { f f f aes r | ees ees ees c' r } >>
  \changePitch \patternCB { c des ees c | bes bes r }
  \changePitch \patternAB { bes bes bes bes c | des bes }
  \changePitch \patternAC { c c c c des | ees c r }
  \changePitch \patternAD { c c c des c | bes aes \fermata }
  \changePitch \patternBA { f | ees aes c bes | aes aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees ees ees f ees | f f }
  \changePitch \patternBA { des | ees ees ees ees | ees ees }
  \changePitch \patternAA { ees ees ees f ees | f f }
  \changePitch \patternBA { des | c c ees des | c c }

  \changePitch \patternCA { des des des f r | c c c ees r }
  \changePitch \patternCB { ees ees ees aes | g g r }
  \changePitch \patternAB { g g g g aes | bes g }
  \changePitch \patternAC { aes aes aes aes aes | aes aes r }
  \changePitch \patternAA { ees ees ees f ees | f f }
  \changePitch \patternBA { des | c c ees des | c c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { aes aes aes aes aes | aes des }
  \changePitch \patternBA { aes | aes aes aes aes | g g }
  \changePitch \patternAA { aes aes aes aes aes | aes des }
  \changePitch \patternBA { aes | aes aes aes g | aes aes }

  \changePitch \patternCA { aes aes aes aes r | aes aes aes aes r }
  \changePitch \patternCB { aes bes c ees | ees ees r }
  \changePitch \patternAB { ees ees ees ees ees | ees ees }
  \changePitch \patternAC { ees ees ees ees bes | c ees r }
  \changePitch \patternAA { aes, aes aes aes aes | aes des }
  \changePitch \patternBA { aes | aes aes aes g | aes aes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { aes aes aes aes aes | des des }
  \changePitch \patternBA { des | c c c aes | ees' ees }
  \changePitch \patternAA { aes, aes aes aes aes | des des }
  \changePitch \patternBA { des | ees ees ees ees | aes, aes }

  \changePitch \patternCA { des des des des r | aes' aes aes aes r }
  \changePitch \patternCB { aes aes aes aes | ees ees r }
  \changePitch \patternAB { ees ees ees ees ees | ees ees }
  \changePitch \patternAC { aes aes aes aes aes | aes aes r }
  \changePitch \patternAA { aes, aes aes aes aes | des des_\fermata }
  \changePitch \patternBA { des | ees ees ees ees | aes, aes }

}
}

Refrain = \lyricmode {

On -- ly a step, On -- ly a step; \bar "."
Come, He waits for thee; \bar "."
Come, and thy sin con -- fess -- ing, \bar "."
Thou shalt re -- ceive a bless -- ing; \bar "."
Do not re -- ject the mer -- cy \bar "."
He free -- ly of -- fers thee. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

On -- ly a step to Je -- sus! \bar "."
Then why not take it now? \bar "."
Come, and, thy sin con -- fess -- ing, \bar "."
To Him, thy Sav -- iour bow. \bar "." % original has "Thy"

}

wordsB = \lyricmode {
\set stanza = "2."

On -- ly a step to Je -- sus!
Be -- lieve, and thou shalt live;
Lov -- ing -- ly now He’s wait -- ing,
And rea -- dy to for -- give.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

On -- ly a step to Je -- sus!
A step from sin to grace;
What hast thy heart de -- ci -- ded?
The mo -- ments fly a -- pace.

}

wordsD = \lyricmode {
\set stanza = "4."

On -- ly a step to Je -- sus!
Oh why not come, and say,
Glad -- ly to Thee, my Sav -- iour,
I give my -- self to -- day.

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
