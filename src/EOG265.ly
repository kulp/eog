\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  systems-per-page = #(cond (is-eogsized 2) (#t #f))
  system-count = #(cond (is-eogsized 3) (#t #f))
}

\header{
  hymnnumber = "265"
  title = "We Joy In Our God"
  tunename = "Houghton"
  meter = "10. 10. 11. 11."
  poet = "Yerburg"
  composer = "Dr. Gauntlett"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d4 | b' g e | d2 d4 | b' g e | d2
  g4 | c c a | d2 b4 | a fis e | d2
  a'4 | fis g b | b a b | c d e | d2
  d4 | d c c | c b b | a g fis | g2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | d d c | b2 d4 | d d c | b2
  g'4 | g g fis | g2 g4 | fis d cis | d2
  d4 | d d g | g fis g | g g g | g2
  f4 | e e e | d d d | e d d | d2

}
}

notesTenor = {
\global
\relative a {

  b4 | b d g, | g2 b4 | b d g, | g2
  b4 | e e d | d2 d4 | d a g | fis2
  fis4 | a g d' | d d d | c b c | b2
  b4 | b a a | a g d' | c b a | b2

}
}

notesBass = {
\global
\relative f, {

  g4 | g b c | g2 g4 | g b c | g2
  e'4 | g, g d' | b2 g4 | a4 a a | d2
  d4 | d b g | d' d g | e d c | g'2
  gis4 | gis a g | fis g g, | c d d | g,2

}
}

wordsA = \lyricmode {
\set stanza = "1."

We joy in our God, we sing of that love, \bar "."
So sov -- ’reign and free, which did His heart move; \bar "."
When lost our con -- di -- tion, all ru -- ined, un -- done, \bar "."
He saw with com -- pas -- sion, and spared not His Son. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

His Son, His de -- light, His loved one He gave,
The curse to en -- dure– by suf -- f’ring to save;
Sure love so a -- maz -- ing, un -- meas -- ured, un -- told,
Since Him it hath giv -- en, no good will with -- hold.

}

wordsC = \lyricmode {
\set stanza = "3."

We praise, then, our God; how rich is His grace!
We were far from Him, es -- tranged from His face.
By blood we are pur -- chased, are cleasned and made nigh,
And blest in His pres -- ence, in Je -- sus on high.

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
