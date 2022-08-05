\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG098.ily"
}

\header{
  %gospel
  hymnnumber = "98"
  title = "Just on the Threshold"
  tunename = "Moment by Moment" % see https://hymnary.org/tune/whittle_moody
  meter = "10. 10. 10. 10. with Refrain" % see https://hymnary.org/tune/whittle_moody
  poet = "George Cooper" % see https://hymnary.org/text/just_on_the_threshold_o_why_not_come_in
  composer = "May Whittle Moody" % see https://hymnary.org/tune/whittle_moody
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=120 }
tb = { \tempo 4=60 }

patternAA = { c4 c4 c4 | c4 c4 c4 | c4 c4 c4 | c2 c4 }
patternBA = { c4 c4 c4 | c4 c4 c4 | c4 c4. c8 | c2. }
patternBB = { c4 c4 c4 | c4 c4 c4 | c4 c4. c8 | c2( c4) }
patternCA = { c4 c4 c4 | c4 c8 r8 c4 | c4 \tb c4 \ta c4 | c2. }
patternDA = { c4 c4 c4 | c4 c4 c4 | c4. c8 c4 | c2 c4 }
patternEA = { c4 c4 c4 | c4 c4 c4 | c4. c8 c4 | c2. }
patternEB = { c4 c4 c4 | c4 c4 c4 | c4. c8 c4 | c2( c4) }
patternFA = { c4 c4 c4 | c4 c4 c4 | c4 c4. c8 | c2 c4 }
patternGA = { c4 c4 c4 | c4 c8 r8 c4 | c4 c4. c8 | c2. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
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
  \changePitch \patternDA { a bes c | a g f | e f g | a r } >> \eogbreak
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
  \changePitch \patternCA { f f f | bes, bes b! | c c_\fermata c | <f f,> }

  \changePitch \patternDA { f f f | f f f | c c c | f r }
  \changePitch \patternEA { f f f | f c d | f e d | c }
  \changePitch \patternFA { f f f | f f ees | d d d | g r }
  \changePitch \patternGA { g, a bes | bes bes b! | c c c | <f f,> }

}
}

% This hymn does not have \bar "." at the end of each line as typeset in the
% original

Refrain = \lyricmode {

Just on the thresh -- old— and Christ calls to thee! \bar "."
Come! with the par -- doned for -- ev -- er to be! \bar "."
Just on the thresh -- old— why lin -- ger so long? \bar "."
Sing, with the ran -- somed, e -- ter -- ni -- ty’s song! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Just on the thresh -- old! Oh, why not come in, \bar "."
Leav -- ing the maz -- es of dark -- ness and sin? \bar "."
For -- ward the light, and the glo -- ry di -- vine; \bar "."
Back -- ward the dan -- gers, and woes that were thine. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Just on the thresh -- old, and joy near at hand;
Yon -- der’s the gleam of Im -- man -- u -- el’s land!
Ref -- uge and rest are now of -- fered to thee:
Sin or sal -- va -- tion— oh, which shall it be?

\break \Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Just on the thresh -- old— oh, make now thy choice;
Come with the ser -- vants of Christ, and re -- joice!
Je -- sus is call -- ing, oh, turn not a -- side!
Come! ’tis the voice of the Spir -- it and bride!

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
