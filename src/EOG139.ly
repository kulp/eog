\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  %gospel
  hymnnumber = "139"
  title = "What Can Wash Away My Sins?"
  tunename = ""
  meter = "P. M."
  poet = "R. Lowry"
  composer = "R. Lowry"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=100 }
tb = { \tempo 4=50  }

patternAA = { c4 c4 c4 c4 | c4 c4 c2 }
patternAB = { c8 c8 c8 c8 c4 c4 | c2 c2 }

patternBA = { c2 c4 c4 | c4 c4 c2 }
patternBB = { c2 c4 c4 | c4 c4 c4( c4) }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g g g a | b d b }
  \changePitch \patternAB { g g g a b b | a g }
  \changePitch \patternAA { g g g a | b d b }
  \changePitch \patternAB { g g g a b b | a g }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBA { d' b a | b d b } >>
  \changePitch \patternBB { a a g | a a b d }
  \changePitch \patternBA { d b a | b d b }
  \changePitch \patternAB { g g g a b b | a g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d d fis | g b g }
  \changePitch \patternAB { d d d d g g | fis g }
  \changePitch \patternAA { d d d fis | g b g }
  \changePitch \patternAB { d d d d g g | fis g }

  \changePitch \patternBA { g g fis | g g g }
  \changePitch \patternBA { fis fis g | fis fis g }
  \changePitch \patternBA { g g fis | g g g }
  \changePitch \patternAB { d d d d g g | fis g }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b b b d | d d d }
  \changePitch \patternAB { b b b c d d | c b }
  \changePitch \patternAA { b b b d | d d d }
  \changePitch \patternAB { b b b c d d | c b }

  \changePitch \patternBA { b d d | d b d }
  \changePitch \patternBB { c c b | d d d b }
  \changePitch \patternBA { b d d | d b d }
  \changePitch \patternAB { b b b c d d | c b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g g g d | g g g  }
  \changePitch \patternAB { g g g g g g | d g, }
  \changePitch \patternAA { g' g g d | g g g  }
  \changePitch \patternAB { g g g g g g | d g, }

  \changePitch \patternBA { g' g d | g g g }
  \changePitch \patternBA { d d e | d d g }
  \changePitch \patternBA { g g d | g g g }
  \changePitch \patternAB { g g g g g g | d g, }

}
}

Refrain = \lyricmode {

O pre -- cious is the flow
That makes me white as snow:
No oth -- er fount I know,
Noth -- ing but the blood of Je -- sus.

}

wordsA = \lyricmode {
\set stanza = "1."

What can wash a -- way my sins?
Noth -- ing but the blood of Je -- sus;
What can make me whole a -- gain?
Noth -- ing but the blood of Je -- sus.

}

wordsB = \lyricmode {
\set stanza = "2."

For my par -- don this I see–
Noth -- ing but the blood of Je -- sus;
For my cleans -- ing, this my plea–
Noth -- ing but the blood of Je -- sus.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Noth -- ing can for sins a -- tone–
Noth -- ing but the blood of Je -- sus;
Naught of good that I have done–
Noth -- ing but the blood of Je -- sus.

}

wordsD = \lyricmode {
\set stanza = "4."

This is all my hope and peace–
Noth -- ing but the blood of Je -- sus;
This is all my right -- eous -- ness–
Noth -- ing but the blood of Je -- sus.

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
