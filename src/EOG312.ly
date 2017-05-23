\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  hymnnumber = "312"
  title = "Jesus Loves Me!"
  tunename = ""
  meter = "7. 7. 7. 7. and Refrain"
  poet = "Anna Warner"
  composer = "W. B. Bradbury"
  tagline = ##f
}

ta = { \tempo 8=120 }
tb = { \tempo 8=60 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \autoBeamOff
}

patternA = { c8 c c c | c c c4 }
patternB = { c4 c8 c | c c4. }
patternC = { c8 | c c, c8. c16 | c2 }
patternD = { c4 c8 c | c c4 }

notesSoprano = {
\global
\relative c'' {

  bes8 g g f | g bes bes4
  c8 c ees c | c bes bes4
  bes8 g g f | g bes bes4
  c8 c bes ees, | g f ees4

  << s^\markup { \small \caps "Refrain" }
  { bes'4 g8 bes | c ees4. } >>
  bes4 g8 ees | g f4.
  bes4 g8 bes | c \tb ees4\fermata \ta
  c8 | bes ees, g8. f16 | ees2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { g ees ees d | ees g g }
  \changePitch \patternA { aes aes c aes | aes g g }
  \changePitch \patternA { g ees ees d | ees g g }
  \changePitch \patternA { aes aes g ees | ees d ees }

  \changePitch \patternB { g ees g | aes c }
  \changePitch \patternB { g g ees | ees d }
  \changePitch \patternD { g ees g | aes c }
  \changePitch \patternC { aes | g ees ees d | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes bes bes bes | bes bes bes }
  \changePitch \patternA { aes aes aes aes | aes bes bes }
  \changePitch \patternA { bes bes bes bes | bes bes bes }
  \changePitch \patternA { aes aes bes g | bes aes g }

  \changePitch \patternB { bes bes ees | ees ees }
  \changePitch \patternB { ees g, ees | bes' bes }
  \changePitch \patternD { bes bes ees | ees ees }
  \changePitch \patternC { ees | ees g, bes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { ees ees ees bes | ees ees ees }
  \changePitch \patternA { aes, aes aes c | ees ees ees }
  \changePitch \patternA { ees ees ees bes | ees ees ees }
  \changePitch \patternA { aes, c ees ees | bes bes ees }

  \changePitch \patternB { ees ees ees | aes, aes }
  \changePitch \patternB { ees' g ees | bes bes }
  \changePitch \patternD { ees ees ees | aes aes,_\fermata }
  \changePitch \patternC { aes | ees' ees bes bes | ees }

}
}

Refrain = \lyricmode {

Yes, Je -- sus loves me! \bar "."
Yes, Je -- sus loves me! \bar "."
Yes, Je -- sus loves me! \bar "."
The Bi -- ble tells me so! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus loves me! this I know, \bar "."
For the Bi -- ble tells me so; \bar "."
Lit -- tle ones to Him be -- long; \bar "."
They are weak, but He is strong. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus loves me, He who died,
Heav -- en’s gate to o -- pen wide;
He will wash a -- way my sin,
Let a lit -- tle child come in.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus loves me tho’ I’m bad,
And He waits to make me glad,
Waits to fold me in His arm,
Keeps me safe from ev -- ’ry harm.

}

wordsD = \lyricmode {
\set stanza = "4."

Je -- sus loves me, loves me still,
When I’m ver -- y weak and ill,
From His shin -- ing place on high,
Comes to watch me where I lie.

}

wordsE = \lyricmode {
\set stanza = "5."

Je -- sus loves me, He will stay
Close be -- side me all the way;
If I trust Him, should I die,
He will take me home on high.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
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
