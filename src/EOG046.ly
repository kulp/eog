\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
  systems-per-page = #(cond (is-eogsized 1) (#t #f))
  score-markup-spacing.basic-distance = 3
  score-markup-spacing.padding = 3
}

\header{
  %gospel
  hymnnumber = "46"
  title = "“Too Late, Too Late!” How Sad the Sound"
  tunename = "Arlington"
  meter = "C. M."
  poet = ""
  composer = "Dr. Arne"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=120 }
tb = { \tempo 4=60  }

patternAA = { c2 | c4. c8 c2 c2      | c4. c8 c2 }
patternAB = { c2 | c4. c8 c2 c4( c4) | c4. c8 c2 }
patternBA = { c2 | c4 c4 c2      c2      | c2( c2) }
patternBB = { c2 | c4 c4 c4( c4) c2      | c2( c2) }
patternBC = { c2 | c4 c4 c2      c2      | c1      }
patternBD = { c2 | c4 c4 c2      c4( c4) | c1      }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g | b b b a | g g g }
  \changePitch \patternBA { a | b d c b | b a }
  \changePitch \patternAA { c | b b b e | d d d }
  \changePitch \patternBC { g, | a c b a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d | g g g fis | e e e }
  \changePitch \patternBB { fis | g d e fis g | g fis }
  \changePitch \patternAA { fis | g g g bes | b! g g }
  \changePitch \patternBC { d | e a g fis | g }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { b | d d d d c | b b b }
  \changePitch \patternBC { d | d b c d | d }
  \changePitch \patternAA { a | b b d cis | d b b }
  \changePitch \patternBD { d | c e d d c | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g | g g g d | e e e }
  \changePitch \patternBC { d | g b a g | d }
  \changePitch \patternAA { d | g g g g | g g g }
  \changePitch \patternBC { b, | c a d d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Too late, too late!” how sad the sound \bar "."
On anx -- ious hu -- man ears, \bar "." \eogbreak
Of those who’ve wait -- ed long, a prey \bar "."
To doubts, and hopes, and fears. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

But there’s a time, when sad -- der far,
Shall sound in hu -- man ears,
A dread “too late,” which, kill -- ing hope,
Will turn to death all fears.

}

wordsC = \lyricmode {
\set stanza = "3."

“Too late” they’ll feel their lost es -- tate,
Which now they don’t be -- lieve;
“Too late” they’ll see the grace of God
Which now they won’t re -- ceive.

}

wordsD = \lyricmode {
\set stanza = "4."

“Too late” they’ll find the door will shut,
Which now stands o -- pen wide;
“Too late” they’ll have to meet their God
With no place then to hide.

}

wordsE = \markuplist {

\line { O sinner, pause, ere yet “too late”; }
\line { { \hspace #2 } Now is the day of grace, }
\line { Now Jesus calls, oh, do obey }
\line { { \hspace #2 } His pleading, loving voice. }

}

wordsF = \markuplist {

\line { Today ’tis free to all who come, }
\line { { \hspace #2 } And take Him at His word; }
\line { Tomorrow’s sun may rise “too late” }
\line { { \hspace #2 } For you who now have heard. }

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
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\noPageBreak

\markup { \fill-line {
  \null
  \line{ \bold 5 \column { \wordsE } }
  \null
  \line{ \bold 6 \column { \wordsF } }
  \null
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
