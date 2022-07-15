\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "79"
  title = "Decide for Christ Today" % not found at hymnary.org
  tunename = "Welcome Voice" % see https://hymnary.org/tune/welcome_voice_hartsough
  meter = "S. M. with Refrain"
  poet = "T. R. Dale" % not found at hymnary.org
  composer = "Lewis Hartsough" % see https://hymnary.org/tune/welcome_voice_hartsough
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=140 }
tb = { \tempo 4=70  }

patternAA = { c4( c4) | c2. c4 c4 c4 | c1 }
patternAB = { c2      | c2. c4 c4 c4 | c1 }
patternAC = { c4( c4) | c2  c2 c4 c4 | c1 }

patternBA = { \patternAB }
patternBB = { c2 | c2 c2 c4 c4 | c1 }

patternCA = { c2 | c2. c4 c4 c4 | c4 c4 c2 }
patternCB = { c2 | c2  c2 c4 c4 | c4 c4 c2 }

patternDA = { c2 | c2. c4 c4 c4 | c1. }
patternDB = { c2 | c2  c2 c4 c4 | c1. }

patternEA = { c2. c4 c4 c4 | c1. }

patternFA = { c2. c4 c4 c4 | c4 c4 c2 }

patternGA = { c2 | c2. c4 c4 c4 | c1 }
patternGB = { c2 | c2  c2 c4 c4 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees g | bes g f ees | ees }
  \changePitch \patternBA { ees | f aes c bes | g }
  \changePitch \patternCA { bes | ees d c bes | c bes g }
  \changePitch \patternDA { ees | f ees g f | ees }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternEA { ees' d c bes | c } >>
  \changePitch \patternEA { bes g f ees | f }
  \changePitch \patternFA { bes c g f | ees f g }
  \changePitch \patternGA { ees | f ees g f | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { ees | g ees d bes | bes }
  \changePitch \patternBA { ees | d d d d | ees }
  \changePitch \patternCB { g | g g ees ees | ees ees ees }
  \changePitch \patternDA { ees | d bes d d | ees }

  \changePitch \patternEA { g g ees ees | ees }
  \changePitch \patternEA { ees ees d c | d }
  \changePitch \patternFA { ees ees d d | c d ees }
  \changePitch \patternGA { ees | d bes d d | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAC { g bes | bes bes aes g | g }
  \changePitch \patternBB { g | bes f f bes | bes }
  \changePitch \patternCA { bes | bes bes aes bes | aes bes bes }
  \changePitch \patternDA { a | aes! g bes aes | g }

  \changePitch \patternEA { bes bes aes bes | aes }
  \changePitch \patternEA { bes bes aes g | bes }
  \changePitch \patternFA { bes ees bes aes | g bes bes }
  \changePitch \patternGA { a | aes! g bes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { ees | ees ees bes ees | ees }
  \changePitch \patternBA { ees | bes bes bes bes | ees }
  \changePitch \patternCA { ees | ees ees aes g | aes g ees }
  \changePitch \patternDB { c | bes bes bes bes | ees }

  \changePitch \patternEA { ees ees aes g | aes }
  \changePitch \patternEA { g ees bes c | bes }
  \changePitch \patternFA { g' aes bes bes, | c bes ees }
  \changePitch \patternGB { c | bes bes bes bes | ees }

}
}

Refrain = \lyricmode {

Christ a -- lone can save— \bar "."
Break the power of sin; \bar "."
Christ doth ful -- ly sat -- is -- fy \bar "."
The heart that cleaves to Him. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

De -- cide for Christ to -- day, \bar "."
And God’s sal -- va -- tion see; \bar "." \eogbreak
Yield soul and bod -- y, heart and will \bar "."
To Him, who died for thee! \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

De -- cide for Christ to -- day,
Thy -- self thou canst not save;
Help -- less and guilt -- y, dead and blind,
No lon -- ger judg -- ment brave.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

De -- cide for Christ to -- day,
Con -- fess Him as thy Lord;
Pro -- claim to all the Sav -- iour’s worth,
How faith -- ful is His Word.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
