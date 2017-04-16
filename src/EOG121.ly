\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  %ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 2) (#t #f))
  %page-count = ##f
}

\header{
  hymnnumber = "121"
  title = "“All Things Are Ready,” Come"
  tunename = "St. Michael"
  meter = "S. M."
  poet = "A. Midlane"
  composer = "Genevan Psalter"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternAA = { c2 | c2      c2 c2  c2 | c1. }
patternAB = { c2 | c2      c2 c2. c4 | c1. }
patternAC = { c2 | c4( c4) c2 c2  c2 | c1. }

patternBA = { c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d | g b a a | b }
  \changePitch \patternAA { d | c b a a | g }
  \changePitch \patternBA { g | fis e d g | g a b }
  \changePitch \patternAA { b | a g g fis | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { b | e g g fis | g }
  \changePitch \patternAA { a | g g g fis | g }
  \changePitch \patternBA { e | d c b d | e e dis }
  \changePitch \patternAA { d! | c d e d | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g | b d e d | d }
  \changePitch \patternAB { d | e d d c | b }
  \changePitch \patternBA { b | b g g g | b a fis }
  \changePitch \patternAC { g | e( fis) g c a | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g | e b c d | g }
  \changePitch \patternAA { fis | e g d d | g, }
  \changePitch \patternBA { e' | b c g b | e c b }
  \changePitch \patternAA { g | a b c d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“All things are rea -- dy,” Come, \bar "."
Come to the sup -- per spread; \bar "." \break
Come rich and poor, come old and young, \bar "."
Come, and be rich -- ly fed. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

“All things are rea -- dy,” Come,

The in -- vi -- ta -- tion’s given,
Through Him who now in glo -- ry sits
At God’s right hand in heaven.

}

wordsC = \lyricmode {
\set stanza = "3."

“All things are rea -- dy,” Come,
The door is o -- pen wide;
O feast up -- on the love of God,
For Christ His Son has died.

}

wordsD = \markuplist {

\line { “All things are ready,” Come, }
\line { All hindrance is removed; }
\line { And God in Christ, His precious love, }
\line { To fallen man has proved. }

}

wordsE = \markuplist {

\line { “All things are ready,” Come, }
\line { Tomorrow may not be; }
\line { O sinner, come, the Saviour waits }
\line { This hour to welcome thee! }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } }
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
