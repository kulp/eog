\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG371.ily"
}

\header{
  %gospel
  hymnnumber = "371"
  title = "At Calvary"
  tunename = ""
  meter = "P. M. with Refrain"
  poet = "William R. Newell" % see https://hymnary.org/text/years_i_spent_in_vanity_and_pride
  composer = "Daniel B. Towner" % see https://hymnary.org/tune/years_i_spent_in_vanity_and_pride_towner
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key c \major
  \autoBeamOff
}

patternA = { c4. c8 c8. c16 c8. c16 | c4 c c2 | }
patternB = { c4. c8 c8. c16 c8. c16 | c4 c c }
patternC = { c4 | c2 c | c2. c4 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { g g g f e f | g a g }
  \changePitch \patternA { b b b a g f | e a g }
  \changePitch \patternB { g g g f e f | g a g }
  \changePitch \patternC { c | d b | c r }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternA { c b c b c a | a g g } >>
  \changePitch \patternA { b a b a b a | g c c }
  \changePitch \patternB { c b c b c a | a g g }
  \changePitch \patternC { c | d b | c r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { e e e d c d | e f e }
  \changePitch \patternA { f f f f e d | c f e }
  \changePitch \patternB { e e e d c d | e f e }
  \changePitch \patternC { g | f f | e r }

  \changePitch \patternA { a gis a gis a f | f e e }
  \changePitch \patternA { f f f f f f | e e e }
  \changePitch \patternB { a gis a gis a f | f e e }
  \changePitch \patternC { g | f f e r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { c c c c g g | c c c }
  \changePitch \patternA { d d d b c g | g c c }
  \changePitch \patternB { c c c c g g | c c c }
  \changePitch \patternC { c | a g | g r }

  \changePitch \patternA { c c c c c c | c c c }
  \changePitch \patternA { d d d d d b | c g g }
  \changePitch \patternB { f f f f f c' | c c c }
  \changePitch \patternC { c | a g | g r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { c c c c c c | c c c }
  \changePitch \patternA { g' g g g g g | c, c c }
  \changePitch \patternB { c c c c c c | c c c }
  \changePitch \patternC { e | f g | c, r }

  \changePitch \patternA { f f f f f f | c c c }
  \changePitch \patternA { g' g g g g g | c, c c }
  \changePitch \patternB { f f f f f f | c c c }
  \changePitch \patternC { e | f g | c, r }

}
}

Refrain = \lyricmode {

Mer -- cy there was great, and grace was free; \bar "."
Par -- don there was mul -- ti -- plied to me; \bar "."
There my bur -- dened soul found lib -- er -- ty \bar "."
At Cal -- va -- ry. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Years I spent in van -- i -- ty and pride, \bar "."
Car -- ing not my Lord was cru -- ci -- fied; \bar "."
Know -- ing not it was for me He died \bar "."
On Cal -- va -- ry. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

By God’s Word at last my sin I learned,
Then I trem -- bled at the truth I’d spurned,
Till my guilt -- y soul, im -- plor -- ing, turned
To Cal -- va -- ry.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Oh! the love that drew sal -- va -- tion’s plan,
Oh! the grace that brought it down to man,
Oh! the might -- y gulf that God did span
At Cal -- va -- ry.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
