\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG140.ily"
}

\header{
  %gospel
  hymnnumber = "140"
  title = "Will Your Anchor Hold?"
  tunename = ""
  meter = "P. M. with Refrain"
  poet = "Priscilla J. Owens" % see https://hymnary.org/text/will_your_anchor_hold_in_the_storms_of_l
  composer = "William J. Kirkpatrick" % see https://hymnary.org/tune/will_your_anchor_hold_kirkpatrick
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternAA = { c4. c8 | c2 c2 c2 }
patternAB = { c4. c8 | c4 ~ c4 c2 c2 c4( c4) | c2 c2 c2 }

patternBA = { c4. c8 | c2 c2 c4( c4) c4( c4) | c2 c2 c1 }
patternBB = { c4. c8 | c2 c2 c2      c4 ~ c4 | c2 c2 c1 }

patternCA = { c2 c4. c8 c4 c2 c4 | c2 c2 c1 }

patternDA = { c2 c4 c4 c2 c4. c8 | c2 c2 c1 }

patternEA = { c4 c4 c4. c8 c2 c2 | c2 c2 c1 }

patternFA = { c4 c4 c4 c4 c2 c4. c8 | c2 c2 \tb c2 \ta }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { f g | a f d g g | f e f } \eogbreak
  \changePitch \patternAB { a a | g g g c e, f | e d c } \eogbreak
  \changePitch \patternAA { c c | f a g c, c | g' bes a } \eogbreak
  \changePitch \patternBA { f a | c c c bes f g | a g f } \eogbreak

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { c' c c c c c | d c c } >>
  \changePitch \patternDA { a a a c c a | f a g }
  \changePitch \patternEA { c c c c c a | bes c d }
  \changePitch \patternFA { c c a f c bes' bes | a g f \fermata }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c c | f c d d d | c c c }
  \changePitch \patternAB { f f | e e e e c d | c b c }
  \changePitch \patternAA { c c  | c f e c c | e g f }
  \changePitch \patternBB { c f | f ees d f f | f e c }

  \changePitch \patternCA { f f f f f f | f f f }
  \changePitch \patternDA { f f f a a f | f f e }
  \changePitch \patternEA { f f f f f f | f f f }
  \changePitch \patternFA { c c a' f c f f | f e c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { a bes | c a f bes bes | a g a }
  \changePitch \patternAB { c c | c c c g g a | g f e }
  \changePitch \patternAA { bes' bes | a c c c c | c c c }
  \changePitch \patternBB { a c | a a f d' d | c bes a }

  \changePitch \patternCA { a a a a a a | bes a a }
  \changePitch \patternDA { c c c a c c | c c c }
  \changePitch \patternEA { a a a a a c | bes a bes }
  \changePitch \patternFA { c c a f c d' d | c bes a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f f | f f bes, bes bes | c c f }
  \changePitch \patternAB { f f | c c c c c f | g g, c }
  \changePitch \patternAA { e e | f f c c c | c c f }
  \changePitch \patternBB { f f | f f bes, bes bes | c c f }

  \changePitch \patternCA { f f f f f f | f f f }
  \changePitch \patternDA { f f f f f f | a f c }
  \changePitch \patternEA { f f f f f ees | d c bes }
  \changePitch \patternFA { c' c a f c bes bes | c c <f f,>_\fermata }

}
}

Refrain = \lyricmode {

We have an an -- chor that keeps the soul \bar "."
Stead -- fast and sure while the bil -- lows roll; \bar "."
Fast -- ened to the Rock which can -- not move, \bar "."
Ground -- ed firm and deep in the Sav -- iour’s love. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Will your an -- chor hold in the storms of life, \bar "."
When the clouds un -- fold their wings of strife? \bar "."
When the strong tides lift, and the ca -- bles strain, \bar "."
Will your an -- chor drift, or firm re -- main? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Will your an -- chor hold in the straits of fear,
When the break -- ers roar { \mon } and the { \moff } reef is near?
While the sur -- ges rave, and the wild winds blow,
Shall the an -- gry waves { \mon } then your { \moff } bark o’er -- flow?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Will your an -- chor hold in the floods of death,
When the wa -- ters { \mon } cold chill { \moff } your lat -- est breath?
On the ris -- ing tide you can nev -- er fail
While your an -- chor holds with -- in the veil.

}

wordsD = \lyricmode {
\set stanza = "4."

Will your eyes be -- hold thro’ the morn -- ing light
The __ _ { \mon } ci -- ty { \moff } of gold { \mon } and the { \moff } har -- bor bright?
Will you an -- chor safe by the heaven -- ly shore
When life’s storms are past for -- ev -- er -- more?

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
