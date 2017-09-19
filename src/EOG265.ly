\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  systems-per-page = #(cond (is-eogsized 2) (#t #f))
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  hymnnumber = "265"
  title = "We Joy in Our God"
  tunename = "Houghton"
  meter = "11. 11. 11. 11." % original has 10. 10. 11. 11.
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

  d4 | b' g e | d2 d8 ~ d | b'4 g e | d2 \eogbreak
  g8 ~ g | c4 c a | d2 b4 | a fis e | d2 \eogbreak
  a'4 | fis g b | b a b | c d e | d2 \eogbreak
  d4 | d c c | c b b | a g fis | g2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | d d c | b2 d8 ~ d | d4 d c | b2
  g'8 ~ g | g4 g fis | g2 g4 | fis d cis | d2
  d4 | d d g | g fis g | g g g | g2
  f4 | e e e | d d d | e d d | d2

}
}

notesTenor = {
\global
\relative a {

  b4 | b d g, | g2 b8 ~ b | b4 d g, | g2
  b8 ~ b | e4 e d | d2 d4 | d a g | fis2
  fis4 | a g d' | d d d | c b c | b2
  b4 | b a a | a g d' | c b a | b2

}
}

notesBass = {
\global
\relative f, {

  g4 | g b c | g2 g8 ~ g | g4 b c | g2
  e'8 ~ e | g,4 g d' | b2 g4 | a4 a a | d2
  d4 | d b g | d' d g | e d c | g'2
  gis4 | gis a g | fis g g, | c d d | g,2

}
}

wordsA = \lyricmode {
\set stanza = "1."

We joy in our God, \mon and we \moff sing of that love, \bar "."
So sov -- ’reign and free, which did His heart move; \bar "."
When lost our con -- di -- tion, all ru -- ined, un -- done, \bar "."
He saw with com -- pas -- sion, and spared not His Son. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

His Son, His de -- light, His loved One, He gave,
The curse to en -- dure_– by suf -- f’ring to save;
Sure love so a -- maz -- ing, un -- meas -- ured, un -- told,
Since Him it hath giv -- en, no good will with -- hold.

}

wordsC = \lyricmode {
\set stanza = "3."

We praise, then, our God; how rich is His grace!
\mon We were \moff far from Him once, es -- tranged from His face.
By blood we are pur -- chased, are cleansed and made nigh,
And blest in His pres -- ence, in Je -- sus, on high.

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
