\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  systems-per-page = 5
  %page-count = ##f
}

\header{
  title = "Have You Any Room for Jesus?"
  subsubtitle = "(8. 7. 8. 7. D.)"
  %meter = "8.7.8.7.D."
  poet = "El Nathan (Arr.)"
  composer = "C. C. Williams"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4. c8 c8 c8 c8. c16 | c2 c4 r4 }
patternAB = { c4. c8 c8 c8 c8. c16 | c2.   r4 }
patternAC = { c4. c8 c8 c8 c8  c8  | c2.   r4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g a g c b a | a g r }
  \changePitch \patternAA { f e f g a g | g( e) r }
  \changePitch \patternAA { g a g c b a | a g r }
  \changePitch \patternAB { f e f g a b | c r }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAA { d d d d e d | c g r } >>
  \changePitch \patternAC { a a a a b c | d r }
  \changePitch \patternAA { e e f e c a | g e r }
  \changePitch \patternAB { f a g c b b | c r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e f e e g f | f e r }
  \changePitch \patternAA { d cis d e f e | e( c) r }
  \changePitch \patternAA { e f e e g f | f e r }
  \changePitch \patternAB { d cis d e f f | e r }

  \changePitch \patternAA { f f f f g f | e e r }
  \changePitch \patternAC { e e e e e e | f r }
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
Has -- ten now His word o -- bey; \bar "."
Swing the heart’s door wide -- ly o -- pen, \bar "."
Bid Him en -- ter while you may. \bar "."

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
Not a place that He can en -- ter,
In the heart for which He died?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Have you an -- y time for Je -- sus,
As in grace He calls a -- gain?
O, to -- day is time ac -- cept -- ed,
To -- mor -- row you may call in vain?

}

wordsD = \lyricmode {
\set stanza = "4."

Room and time now give to Je -- sus,
Soon will pass God’s day of grace;
Soon thy heart left cold and si -- lent,
And the Sav -- iour’s plead -- ing cease.

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

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
