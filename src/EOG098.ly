\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = 5
  page-count = 2
}

\header{
  title = "Just On the Threshold"
  subsubtitle = "(Moment By Moment. P. M.)"
  %meter = "P.M."
  poet = "G. Cooper"
  composer = "Mary Whittle Moody"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=120 }
tb = { \tempo 4=60 }

patternAA = { c4 c4 c4 | c4 c4 c4 | c4 c4 c4 | c2 r4 }
patternBA = { c4 c4 c4 | c4 c4 c4 | c4 c4. c8 | c2. }
patternBB = { c4 c4 c4 | c4 c4 c4 | c4 c4. c8 | c2( c4) }
patternCA = { c4 c4 c4 | c4 c8 r8 c4 | c4 \tb c4 \ta c4 | c2. }
patternDA = { c4 c4 c4 | c4 c4 c4 | c4. c8 c4 | c2 r4 }
patternEA = { c4 c4 c4 | c4 c4 c4 | c4. c8 c4 | c2. }
patternEB = { c4 c4 c4 | c4 c4 c4 | c4. c8 c4 | c2( c4) }
patternFA = { c4 c4 c4 | c4 c4 c4 | c4 c4. c8 | c2 r4 }
patternGA = { c4 c4 c4 | c4 c8 r8 c4 | c4 c4. c8 | c2. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 3/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { c f g | a a a | bes f g | a r }
  \changePitch \patternBA { a g fis | g a g | f e d | g }
  \changePitch \patternAA { c, f g | a a a | bes bes b | c r }
  \changePitch \patternCA { c bes a | d, g f | e a \fermata g | f }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternDA { a bes c | a g f | e f g | a r } >>
  \changePitch \patternEA { a bes c | a g f | d e f | g }
  \changePitch \patternFA { c, f g | a a a | d d c | bes r }
  \changePitch \patternGA { bes a g | d g f | e a g | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c c c | f f f | f f f | f r }
  \changePitch \patternBA { e e ees | e e e | c b! b | c }
  \changePitch \patternAA { c c c | f f f | f f f | f r }
  \changePitch \patternCA { ees ees ees | d d d | c e e | c }

  \changePitch \patternDA { f g a | f c c | c d e | f r }
  \changePitch \patternEA { f f f | f e d | b! c d | e }
  \changePitch \patternFA { c c c | f f g | fis fis a | g r }
  \changePitch \patternGA { d d d | d d d | c e c | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { a a bes | c c cis | d d d | c r }
  \changePitch \patternBB { c bes a | bes c bes | a aes aes | g( bes) }
  \changePitch \patternAA { a a bes | c c c | bes bes gis | a r }
  \changePitch \patternCA { a g f | g g g | g c bes | a }

  \changePitch \patternDA { c c c | c bes a | g c c | c r }
  \changePitch \patternEB { c g a | c bes a | g g g | g( bes) }
  \changePitch \patternFA { a a bes | c c c | a a d | d r }
  \changePitch \patternGA { bes c bes | g g g | g c bes | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f f f | f f f | f f f | f r }
  \changePitch \patternBA { c c c | c c c | f f f | e }
  \changePitch \patternAA { f f f | f f ees | d d des | c r }
  \changePitch \patternCA { f f f | bes, bes b! | c c \fermata c | <f f,> }

  \changePitch \patternDA { f f f | f f f | c c c | f r }
  \changePitch \patternEA { f f f | f c d | f e d | c }
  \changePitch \patternFA { f f f | f f ees | d d d | g r }
  \changePitch \patternGA { g, a bes | bes bes b! | c c c | <f f,> }

}
}

% This hymn does not have \bar "." at the end of each line as typeset in the
% original

Refrain = \lyricmode {

Just on the thresh -- old,– and Christ calls to thee! \bar "."
Come! with the par -- doned for -- ev -- er to be! \bar "."
Just on the thresh -- old– why lin -- ger so long? \bar "."
Sing, with the ran -- somed, E -- ter -- ni -- ty’s song! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Just on the thresh -- old! O, why not come in,
Leav -- ing the maz -- es of dark -- ness and sin?
For -- ward the light, and the glo -- ry di -- vine;
Back -- ward the dan -- gers, and woes that were thine.

}

wordsB = \lyricmode {
\set stanza = "2."

Just on the thresh -- old, and joy near at hand;
Yon -- der’s the gleam of Im -- man -- u -- el’s land;
Ref -- uge and rest are now of -- fered to thee:
Sin or sal -- va -- tion— O, which shall it be?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Just on the thresh -- old,– O, make now thy choice;
Come with the ser -- vants of Christ, and re -- joice!
Je -- sus is call -- ing, O, turn not a -- side!
Come! ‘tis the voice of the Spir -- it and Bride!

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

%\markup { \fill-line { \column {
%  \line{ \bold 5 \column { \wordsE } } \vspace #0.4
%  \line{ \bold 6 \column { \wordsF } } \vspace #0.4
%  \line{ \bold 7 \column { \wordsG } } \vspace #0.4
%  \line{ \bold 8 \column { \wordsH } } \vspace #0.4
%} } }

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond