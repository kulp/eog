\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "91"
  title = "On Christ Salvation Rests Secure"
  tunename = "Hebron"
  meter = "L. M."
  poet = "S. Medley"
  composer = "Dr. Lowell Mason"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=60 }
tb = { \tempo 2=30 }

patternAA = { c2 | c4 c4 c2 c2 | c4 c4 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key bes \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { f | d f g f | g a bes }
  \changePitch \patternAA { bes | a c d bes | a g f }
  \changePitch \patternAA { f | bes c d bes | ees d c }
  \changePitch \patternAA { c | d bes g f | g a bes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d bes d ees d | ees ees d }
  \changePitch \patternAA { f | f f f g | f e f }
  \changePitch \patternAA { f | f ees d f | g f f }
  \changePitch \patternAA { f | f f ees d | ees ees d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes | f bes bes bes | bes f f }
  \changePitch \patternAA { bes | c a bes d | c bes a }
  \changePitch \patternAA { a | bes a bes bes | bes bes a }
  \changePitch \patternAA { a | bes bes bes bes | bes f f }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { bes | bes bes ees bes | ees f bes, }
  \changePitch \patternAA { d | f f bes g | c c, f }
  \changePitch \patternAA { ees | d c bes d | ees bes f' }
  \changePitch \patternAA { f | bes d, ees bes | ees f bes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

On Christ sal -- va -- tion rests se -- cure; \bar "."
The Rock of A -- ges must en -- dure; \bar "." \break
Nor can that faith be o -- ver -- thrown \bar "."
Which rests up -- on the “Liv -- ing Stone.” \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

No oth -- er hope shall in -- ter -- vene;
To Him we look, on Him we lean,
Oth -- er foun -- da -- tions we dis -- own,
And build on Christ the “Liv -- ing Stone.”

}

wordsC = \lyricmode {
\set stanza = "3."

In Him it is or -- dained to raise
A tem -- ple to Je -- ho -- vah’s praise,
Com -- posed of all the saints, who own
No Sav -- iour but the “Liv -- ing Stone.”

}

wordsD = \markuplist {

\line { View the vast building, see it rise; }
\line { The work how great! the plan how wise! }
\line { O wondrous fabric! power unknown }
\line { That rears it on the “Living Stone.” }

}
wordsE = \markuplist {

\line { But most adore His precious name; }
\line { His glory and His grace proclaim; }
\line { For us, condemned, despised, undone; }
\line { He gave Himself, the “Living Stone.” }

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

\noPageBreak

\markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 205. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
