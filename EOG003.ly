\paper {
  #(set-paper-size "letter")
  indent        = 0\cm
  top-margin    = 1\cm
  bottom-margin = 1\cm
  left-margin   = 2\cm
  right-margin  = 2\cm
}

\include "inc/changePitch.ly"

\header{
  title = "Behold, Behold the Lamb of God"
  subsubtitle = "(Mercy’s Free. 8. 6. 8. 6. 8. 6. 8. 6.)"
  %meter = "8.6.8.6.8.6.8.6."
  poet = "A. Jukes"
  composer = "D. F. E. Auber"
  %copyright = ""
  tagline = ##f
}

patternOne   = { c4( c8) | c4 c8 c4 c8 c8 c8 c8 | c4.( c4.) c8 c8 c8 | c4.( c4.) c4 c8 | c4. ~ c4. }
patternTwo   = { c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. }
patternThree = { c4. | c4 c8 c4 c8 c4 c8 | c4.( c4.) c4 c8 | c4.( c4.) c4 c8 | c4. ~ c4. }

notesSoprano = {
\relative c' {

	\changePitch \patternOne { c' bes | a a a a a bes c | d c c bes a | g bes a g | f f }
	\changePitch \patternOne { c' bes | a a a a a bes c | d c c bes a | g bes a g | f f }
	\changePitch \patternTwo { c' | c bes g d' d c | a a c | c bes g d' d c | a a }
	\changePitch \patternOne { c bes | a a a a a bes c | d c c bes a | g bes a g | f f }

}
}

notesAlto = {
\relative e' {

	\changePitch \patternOne { a g | f f f f f g a | bes f a g f | e g f e | f f }
	\changePitch \patternOne { a g | f f f f f g a | bes f a g f | e g f e | f f }
	\changePitch \patternTwo { f | e g e e f f | f f f | e g e e f f | f f }
	\changePitch \patternOne { a g | f f f f f g a | bes f a g f | e g f e | f f }

}
}

notesTenor = {
\relative a {

	\changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }
	\changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }
	\changePitch \patternTwo   { a | g c c bes bes a | c c a | g c c bes bes a | c c }
	\changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }

}
}

notesBass = {
\relative a {

	\changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }
	\changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }
	\changePitch \patternTwo   { f | c c c c f f | f f | f c c c c f f | f f }
	\changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }

}
}

global = {
  %\autoBeamOff
  \override Staff.TimeSignature #'style = #'() \time 9/8
  % TODO \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 4)
  \once \override Score.MetronomeMark #'transparent = ##t
  \tempo 4 = 80
  \key f \major
  \partial 4.
}

VerseOne = \lyricmode {
\set stanza = "1."

	Be -- hold, be -- hold the Lamb _ of God \bar "|"
	On _ the cross! On the cross! \bar "|" \break
	For us He shed his Pre -- _ cious blood \bar "|"
	On _ the cross! On the cross! \bar "|" \break
	O hear the o -- ver whelm -- ing cry— \bar "|"
	“E -- li la -- ma sa -- bach -- tha -- ni.” \bar "|" \break
	Draw near and see the Sav -- _ iour die \bar "|"
	On _ the cross! On the cross! \bar "|"

}

VerseTwo = \lyricmode {
\set stanza = "2."

}

VerseThree = \lyricmode {
\set stanza = "3."

}

VerseFour = \lyricmode {
\set stanza = "3."

}

% TODO: use http://lsr.dsi.unimi.it/LSR/Snippet?id=653

\score {
  \new ChoirStaff <<
    \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
    \new Staff <<
      \clef "treble"
      \new Voice = "Soprano"  { \voiceOne \global \notesSoprano \bar "|" }
      \new Voice = "Alto" { \voiceTwo \global \notesAlto }
      \new Lyrics \lyricsto "Soprano" { \VerseOne }
      \new Lyrics \lyricsto "Soprano" { \VerseTwo }
      \new Lyrics \lyricsto "Soprano" { \VerseThree }
      \new Lyrics \lyricsto "Soprano" { \VerseFour }
    >>
    \new Staff <<
      \clef "bass"
      \new Voice = "Tenor" { \voiceOne \global \notesTenor }
      \new Voice = "Bass"  { \voiceTwo \global \notesBass }
    >>
  >>
  \layout{}
  \midi{}
}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

