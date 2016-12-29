\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
  system-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "147"
  title = "And Did the Holy and the Just"
  tunename = "St. Peter"
  meter = "C. M."
  poet = "I. Watts"
  composer = "A. R. Reinagle"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes2 | ees d c bes | bes aes g
  g | f ees aes g | f1.
  g2 | aes g c bes | bes aes g
  ees | g f ees d | ees1.
  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees2 | g g ees ees | f d ees
  ees | c bes d ees | d1.
  ees2 | ees ees ees ees | c d ees
  c | ees c bes bes | bes1.

}
}

notesTenor = {
\global
\relative a {

  g2 | bes bes aes bes | bes bes bes
  bes | aes bes bes bes | bes1.
  bes2 | aes bes ees, ees | f f ees
  g | bes aes g f4( aes) | g1.

}
}

notesBass = {
\global
\relative f {

  ees2 | ees g aes g | d bes ees
  ees | aes g f ees | bes1.
  ees4( des) | c2 bes aes g | f bes c
  c | g aes bes bes | ees1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

And did the Ho -- ly and the Just, \bar "."
The Sov -- ereign of the skies, \bar "."
Stoop down to man’s es -- tate and dust \bar "."
That guilt -- y worms might rise? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Yes, the Re -- deem -- er left the throne,
The ra -- diant throne on high;
Sur -- pris -- ing mer -- cy! love un -- known!
To suf -- fer, bleed and die.

}

wordsC = \lyricmode {
\set stanza = "3."

He took the guilt -- y cul -- prit’s place,
And suf -- fered in his stead;
For man! (O mir -- a -- cle of grace!)
For man the Sav -- iour bled.

}

wordsD = \lyricmode {
\set stanza = "4."

Je -- sus, my soul a -- dor -- ing bends
To love, so full, so free;
Thy word de -- clares that love ex -- tends,
In sav -- ing power, to me.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
