\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 5) (#t #f))
}

\header{
  %children
  hymnnumber = "333"
  title = "Come To the Saviour, Make No Delay"
  tunename = ""
  meter = "9. 9. 9. 6. with Refrain"
  poet = "George F. Root"
  composer = "George F. Root"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key bes \major
  \autoBeamOff
}

patternA = { c2 c4. c8 c2 c | c2 c4. c8 c1 }
patternB = { c2 c4. c8 c2 c4 ~ c | c2 c4. c8 c1 }
patternC = { c2 c4. c8 c2 c | c1. c2 }
patternD = { c2 c c2. c4 | c c c c c1 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { f g f d f | bes c bes g }
  \changePitch \patternB { a a bes c d d | bes a g f }
  \changePitch \patternA { f g f d f | bes c bes g }
  \changePitch \patternC { a a bes c d | bes r }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternD { d d ees d | d c c g c } >>
  \changePitch \patternD { c c c c | c bes bes g f }
  \changePitch \patternA { f g f d f | bes c bes g }
  \changePitch \patternC { a a bes c d | bes r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d ees d bes d | f f f ees }
  \changePitch \patternB { c c d ees f f | d ees ees d }
  \changePitch \patternA { d ees d bes d | f f f ees }
  \changePitch \patternC { c c d ees f | d r }

  \changePitch \patternD { f f g f | ees ees ees ees ees }
  \changePitch \patternD { ees ees f ees | d d d ees d }
  \changePitch \patternA { d ees d bes d | f f f ees }
  \changePitch \patternC { c c d ees f | d r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes bes bes f bes | bes bes bes bes }
  \changePitch \patternB { f f f a a a | bes bes bes bes }
  \changePitch \patternA { bes bes bes f bes | bes bes bes bes }
  \changePitch \patternC { f f f a a | bes r }

  \changePitch \patternD { bes bes bes bes | g g g g g }
  \changePitch \patternD { a a a a | bes bes bes bes bes }
  \changePitch \patternA { bes bes bes f bes | bes bes bes bes }
  \changePitch \patternC { f f f a a | bes r }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { bes bes bes bes bes | d d d ees }
  \changePitch \patternB { f f f f f f | bes, bes bes bes }
  \changePitch \patternA { bes bes bes bes bes | d d d ees }
  \changePitch \patternC { f f f f f | bes, r }

  \changePitch \patternD { bes bes bes bes | ees ees ees ees ees }
  \changePitch \patternD { f f f f | bes, bes bes bes bes }
  \changePitch \patternA { bes bes bes bes bes | d d d ees }
  \changePitch \patternC { f f f f f | bes, r }

}
}

Refrain = \lyricmode {

Joy -- ful, joy -- ful will the meet -- ing be, \bar "."
When from sin our hearts are pure and free, \bar "."
And we shall gath -- er, Sav -- iour, with Thee \bar "."
In our e -- ter -- nal home. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Come to the Sav -- iour, make no de -- lay; \bar "."
Here in His Word He’s shown us the way; \bar "."
Here in our midst He’s stand -- ing to -- day, \bar "."
Ten -- der -- ly say -- ing, “Come.” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Let all the chil -- dren now hear His voice;
Let ev -- ’ry heart make Je -- sus the choice;
And let us free -- ly trust and re -- joice;
Do not de -- lay, but come.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Think once a -- gain, He’s with us to -- day;
Heed now His blest com -- mand, and o -- bey;
Hear now His ac -- cents ten -- der -- ly say,
“Will you, dear chil -- dren, come?”

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
