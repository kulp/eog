\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = 2
  %page-count = ##f
}

\header{
  title = "Man Of Sorrows! What A Name"
  subsubtitle = "(P. M.)"
  %meter = "P.M."
  poet = "P. P. Bliss"
  composer = "P. P. Bliss"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4 c4 c4 c4 | c4 c4 c2 }
patternAB = { c4 c4 c4 c4 | c4 c4 c4( c4) }

patternBA = { c4 c4 c4 c4 | c4 c4 c4 }

patternCA = { c8. c16 | c2 c4 c8. c16 | c2 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g\p g g e | c' c b }
  \changePitch \patternAA { a a g c | b a g }
  \dynamicUp
  \changePitch \patternBA { g\f g g e | c' c c }
  \changePitch \patternCA { c\ff d | e d c a | a g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { e e e c | e e e d }
  \changePitch \patternAA { c c g' a | g fis g }
  \changePitch \patternBA { e e e c | e f e }
  \changePitch \patternCA { g g | g f e e | f e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c c c g | a a gis }
  \changePitch \patternAA { a b c e | d c b }
  \changePitch \patternBA { c c c g | g a g }
  \changePitch \patternCA { c b | c b c c | c c }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c c c c | a' a e }
  \changePitch \patternAA { f f e c | d d g, }
  \changePitch \patternBA { c c c c | c c c }
  \changePitch \patternCA { e g | c g a a | f c }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Man of sor -- rows,” what a name \bar "."
For the Son of God, Who came, \bar "."
Ru -- in’d sin -- ners to re -- claim! \bar "."
Hal -- le -- lu -- jah! what a Sav -- iour! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Bear -- ing shame and scof -- fing rude,
In my place con -- demn’d He stood;
Seal’d my par -- don with His blood:
Hal -- le -- lu -- jah! what a Sav -- iour!

}

wordsC = \lyricmode {
\set stanza = "3."

Guil -- ty, vile, and help -- less, we,
Spot -- less Lamb of God was He,
“Full a -- tone -- ment,” can it be?
Hal -- le -- lu -- jah! what a Sav -- iour!

}

wordsD = \lyricmode {
\set stanza = "4."

Lift -- ed up was He to die,
“It is fin -- ish’d” was His cry,
Now in heav’n ex -- alt -- ed high;
Hal -- le -- lu -- jah! what a Sav -- iour!

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
