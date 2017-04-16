\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "256"
  title = "Some Day"
  tunename = ""
  meter = "L. M. D."
  poet = "A. H. Rule"
  composer = "Mrs. A. H. Rule"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=70
  \key d \major
  \partial 4.
  \autoBeamOff
}

patternA = { c8 c c | c4. }
patternB = { c8 c c | c c c4 c | c4. }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { a a a | gis a b a | d }
  \changePitch \patternA { d cis b | a a gis a | fis }
  \changePitch \patternA { a gis a | b a d d | cis }
  \changePitch \patternA { a gis a | d fis, a a | d, } \eogbreak

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternA { a' a a | a a b b | b } >>
  \changePitch \patternA { b a a | a a^\markup{\italic rit.} d fis, | e }
  \changePitch \patternA { d' d d | d cis b b | b }
  \changePitch \patternB { b a fis | d e fis^\markup{\italic rit.} e | d }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d d d | d d d d | fis }
  \changePitch \patternA { b a g | fis fis f fis | d }
  \changePitch \patternA { d d d | d d fis fis | e }
  \changePitch \patternA { fis f fis | fis d cis cis | d }

  \changePitch \patternA { d d d | d d d d | d }
  \changePitch \patternA { d d d | cis d fis d | cis }
  \changePitch \patternA { fis fis fis | a a g g | g }
  \changePitch \patternB { g fis d | a cis cis cis | a }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { fis fis fis | f fis g fis | a }
  \changePitch \patternA { b cis d | d a b a | a }
  \changePitch \patternA { fis f fis | g fis a a | a }
  \changePitch \patternA { a b a | a a g g | fis }

  \changePitch \patternA { fis fis fis | fis fis g g | g }
  \changePitch \patternA { g fis fis | g fis a a | a }
  \changePitch \patternA { a a a | d d d d | d }
  \changePitch \patternB { d d a | fis g a g | fis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { d d d | d d d d | d }
  \changePitch \patternA { g a b | d d, d d | d }
  \changePitch \patternA { d d d | g, d' d d | a }
  \changePitch \patternA { d d d | d a a a | d }

  \changePitch \patternA { d d d | d d d d | g, }
  \changePitch \patternA { g d' d | a d d d | a }
  \changePitch \patternA { d d d | fis g g g | g }
  \changePitch \patternB { g d d | d a a a | d }

}
}

Refrain = \lyricmode {

And I shall see Him face to face, \bar "."
And tell the sto -- ry– saved by grace; \bar "."
And I shall see Him face to face, \bar "."
And tell the sto -- ry– saved by grace. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Some day I’ll quit this vale of tears, \bar "."
And I no more as now shall sigh; \bar "."
I’ll bid fare -- well to all my fears, \bar "."
And with my Sav -- iour rest on high. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Some day my com -- ing Lord will call,
I can -- not tell how soon ’t_will be,
But this I know, my All in all
Has now a place in heav’n for me.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Some day I’ll meet Him in the air,
It may be morn, or noon, or night,
And this I know, His voice I’ll hear,
And gaze up -- on His glo -- ry bright.

}

wordsD = \lyricmode {
\set stanza = "4."

Some day, I know ’t_will not be long;
He says, “Be -- hold, I quick -- ly come;”
Soon, soon I’ll join in heav -- en’s song,
And dwell with Him in His bright home.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
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
