\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = 2
}

\header{
  hymnnumber = "90"
  title = \markup \center-column { "Have You Been To Jesus" "for the Cleansing Power?" \vspace #0.4 }
  % markup title doesn't work with make_index.pl, so we use this commented version instead
  %title = "Have You Been To Jesus for the Cleansing Power?"
  tunename = ""
  meter = "11. 9. 11. 9. with Refrain"
  poet = "E. A. H."
  composer = "E. A. Hoffman"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8 c8 | c4 c4 c8 c8 c8 c8 | c4 c4 c4 }

patternBA = { c8 c8 | c4 c8 c8 c4 c8 c8 | c2. }
patternBB = { c8 c8 | c4 c8 c8 c4 c8 c8 | c4 c8 c8 c4 }

patternCA = { c8 c8 | c2. c8 c8 | c2. }
patternCB = { c4 | c4 c8 c8 c4 c4 | c4 c8 c8 c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { c ees | aes aes aes ees c ees | aes aes aes }
  \changePitch \patternBA { aes bes | c c c c bes aes | bes }
  \changePitch \patternAA { c bes | aes aes aes c bes aes | f f f }
  \changePitch \patternBA { aes f | ees ees ees aes g g | aes }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { c bes | aes aes g | f } >>
  \changePitch \patternBA { aes f | ees aes bes c des c | bes }
  \changePitch \patternAA { c bes | aes aes aes c bes aes | f f f }
  \changePitch \patternBA { aes f | ees ees ees aes g g | aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e {

  \changePitch \patternAA { aes c | c c c c aes c | ees des c }
  \changePitch \patternBA { ees ees | ees ees ees ees ees d | ees }
  \changePitch \patternAA { ees des | c c c ees ees ees | des des des }
  \changePitch \patternBA { f des | c c c ees des des | c }

  \changePitch \patternCA { ees des | c c ees | des }
  \changePitch \patternBA { f des c ees ees ees ees ees | ees }
  \changePitch \patternAA { ees des | c c c ees ees ees | des des des }
  \changePitch \patternBA { f des | c c c ees des des | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { ees ees | ees ees ees aes aes aes | aes f ees }
  \changePitch \patternBA { aes g | aes aes aes aes bes bes | g }
  \changePitch \patternAA { aes ees | ees ees ees aes g aes | aes aes aes }
  \changePitch \patternBA { aes aes | aes aes aes c bes bes | aes }

  \changePitch \patternCB { r | r aes aes aes r | r aes aes aes }
  \changePitch \patternBB { aes aes | aes aes g aes bes aes | g g g g }
  \changePitch \patternAA { aes ees | ees ees ees aes g aes | aes aes aes }
  \changePitch \patternBA { aes aes | aes aes aes c bes bes | aes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { aes aes | aes aes aes aes aes aes | c des aes }
  \changePitch \patternBA { c ees | aes aes aes aes g f | ees }
  \changePitch \patternAA { ees ees | aes, aes aes aes bes c | des des des }
  \changePitch \patternBA { des des | ees ees ees ees ees ees | aes, }

  \changePitch \patternCB { r | r aes aes aes r | r des des des }
  \changePitch \patternBB { des des aes c ees aes g aes  | ees ees ees ees }
  \changePitch \patternAA { ees ees | aes, aes aes aes bes c | des des des }
  \changePitch \patternBA { des des | ees ees ees ees ees ees | aes, }

}
}

Refrain = \lyricmode {

Are you wash’d in the blood—
In the soul -- clean -- sing blood of the Lamb?
Are your gar -- ments spot -- less? Are they white as snow?
Are you wash’d in the blood of the Lamb?

}

wordsA = \lyricmode {
\set stanza = "1."

Have you been to Je -- sus for the clean -- sing power? \bar "."
Are you wash’d in the blood of the Lamb? \bar "."
Are you ful -- ly trust -- ing in His grace this hour? \bar "."
Are you wash’d in the blood of the Lamb? \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Are you walk -- ing dai -- ly by the Sav -- iour’s side?
Are you wash’d in the blood of the Lamb?
Do you rest each mo -- ment in the Cru -- ci -- fied?
Are you wash’d in the blood of the Lamb?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

When the Bride -- groom com -- eth, will your robes be white?
Pure and white in the blood of the Lamb?
Will your soul be rea -- dy for the man -- sions bright,
And be wash’d in the blood of the Lamb?

}

wordsD = \lyricmode {
\set stanza = "4."

Lay a -- side the gar -- ments that are stained with sin,
And be wash’d in the blood of the Lamb!
There’s a foun -- tain flow -- ing for the soul un -- clean—
O, be wash’d in the blood of the Lamb!

}

underWords = \lyricmode {

{ \repeat unfold 40 { \skip 4 } }
Are you wash’d in the blood—
{ \repeat unfold 9 { \skip 4 } }
of the Lamb?

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
		\new Lyrics \with { alignAboveContext = men } \lyricsto tenors \underWords
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
