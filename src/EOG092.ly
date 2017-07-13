\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "92"
  title = "Have You Any Room for Jesus?"
  tunename = ""
  meter = "8. 7. 8. 7. D."
  poet = "El Nathan (Arr.)"
  composer = "C. C. Williams"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4. c8 c8 c8 c8. c16 | c2 c4 c4 }
patternAB = { c4. c8 c8 c8 c8. c16 | c2.   c4 }
patternAC = { c4. c8 c8 c8 c8  c8  | c2.   c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g a g c b a | a g r }
  f4. e8 f8 g8 a8. g16 | g2( e4) r4
  g4. a8 g8 c8 b8. a16 | a2 g4 r4
  \changePitch \patternAB { f e f g a b | c r }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAA { d d d d e d | c g r } >>
  a4. a8 a8 a8 b8 c8 | d2. r4
  \changePitch \patternAA { e e f e c a | g e r }
  \changePitch \patternAB { f a g c b b | c r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e f e e g f | f e r }
  d4. cis8 d8 e8 f8. e16 | e2( c4) r4
  e4. f8 e8 e8 g8. f16 | f2 e4 r4
  \changePitch \patternAB { d cis d e f f | e r }

  \changePitch \patternAA { f f f f g f | e e r }
  e4. e8 e8 e8 e8 e8 | f2. r4
  \changePitch \patternAA { g g a g e f | e c r }
  \changePitch \patternAB { c f e e d f | e r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c c c c c c | c c r }
  \changePitch \patternAA { b ais b b b b | c( g) r }
  \changePitch \patternAA { c c c g a b | c c r }
  \changePitch \patternAB { b ais b b b g | g r }

  \changePitch \patternAA { b b b b c g | g c r }
  \changePitch \patternAC { c c c c e c | b r }
  \changePitch \patternAA { c c c c g c | c g r }
  \changePitch \patternAB { a c c g g g | g r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c c c c c c | c c r }
  \changePitch \patternAB { g' g g g g g | c, r }
  \changePitch \patternAA { c c c c c c | c c r }
  \changePitch \patternAB { g' g g g < g g, > g, c r }

  \changePitch \patternAA { g' g g g g g | c, c r }
  \changePitch \patternAC { a' a a a gis a | g r }
  \changePitch \patternAA { c, c c c c c | c c r }
  \changePitch \patternAB { f f g g g g | c, r }

}
}

Refrain = \lyricmode {

Room for Je -- sus, Lord of glo -- ry! \bar "."
Hast -- en now, His word o -- bey; \bar "."
Swing the heart’s door wide -- ly o -- pen, \bar "."
Let Him en -- ter while you may. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Have you an -- y room for Je -- sus, \bar "."
He who bore the load of sin? \bar "."
As He knocks and seeks ad -- mis -- sion, \bar "."
Sin -- ner, will you let Him in? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Room for pleas -- ure, room for busi -- ness,
But for Christ the Cru -- ci -- fied,
Not a place that He can en -- ter
In the heart for which He died.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Have you an -- y time for Je -- sus,
As in grace He calls a -- gain?
Oh, to -- day is time ac -- cept -- ed,
La -- ter you may call in vain.

}

wordsD = \lyricmode {
\set stanza = "4."

Room and time now give to Je -- sus,
Soon will pass God’s day of grace;
Soon thy heart be cold and si -- lent,
And the Sav -- iour’s plead -- ing cease.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
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
      \partcombine #'(2 . 9) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
