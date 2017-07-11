\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-system-spacing.padding = 7
}

\header{
  %gospel
  hymnnumber = "285"
  title = "Well May We Sing, with Triumph Sing"
  tunename = "Antioch"
  meter = "C. M."
  poet = "G. V. Wigram"
  composer = "Arr. from Handel"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key d \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  d4 cis8. b16 | a4. g8 | fis4 e | d4.
  a'8 | b4. b8 | cis4. cis8 | d4. \eogbreak
  d8 | d8[ cis] b[ a] | a8.[ g16 fis8] d'8 | d8[ cis] b[ a] | a8.[ g16 fis8]
  fis8 | fis fis fis fis16[ g] | a4.
  g16[ fis] | e8 e e e16[ fis] | g4.
  fis16[ e] | d8( d'4) b8 | a8.[ g16 fis8] g8 | fis4 e | d2 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  fis4 a8. g16 | fis4. e8 | d4 cis | d4.
  a'8 | g4. g8 | e4. g8 | fis4.
  fis8 | fis8[ a] g[ fis] | fis8.[ e16 d8] fis8 | fis8[ a] g[ fis] | fis8.[ e16 d8]
  d8 | d d d d16[ e] | fis4.
  e16[ d] | cis8 cis cis cis16[ d] | e4.
  d16[ cis] | d8( fis4) g8 | fis8.[ e16 d8] e | d4 cis | d2 |

}
}

notesTenor = {
\global
\relative a {

  a4 d8. d16 | d4. b8 | a4. g8 | fis4.
  d'8 | d4. d8 | a4. a8 | a4.
  a8 | a4 d | d4( a8) a8 | a4 d | d4( a8)
  a8 | a4. a8 | a a a a | a2 ~ | a4.
  a16[ g] | fis8( a4) d8 | d4( a8) b | a4. g8 | fis2 |

}
}

notesBass = {
\global
\relative f {

  d4 d8. d16 | d4. g,8 | a4 a | d4.
  fis8 | g4. g8 | a4. a8 | d,4.
  d8 | d4 d | d4. d8 | d4 d | d4.
  d8 | d4. d8 | d d d d |
  a4. a8 | a a a a | d4. d8 | d4. g,8 | a4 a | d2

}
}

wordsA = \lyricmode {
\set stanza = "1."

Well may we sing, with tri -- umph sing \bar "."
The great Re -- deem -- er’s praise; \bar "."
The glo -- ries of our \markup\caps Sav -- \markup\caps iour \markup\caps God, \bar "."
Re -- vealed in Je -- sus’ face, \bar "."
Re -- vealed in Je -- sus’ face, \bar "."
Re -- vealed, re -- vealed in Je -- sus’ face. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The Fa -- ther’s love it was that sought
From hell to set us free;
That gave the Lamb whose pre -- cious blood
Has bought our lib -- er -- ty,
Has bought our lib -- er -- ty,
Has bought, has bought our lib -- er -- ty.

}

wordsC = \lyricmode {
\set stanza = "3."

In Him we read the Fa -- ther’s love,
And find e -- ter -- nal peace;
In Him we meet a \markup\caps Sav -- \markup\caps iour \markup\caps God,
And fear and ter -- ror cease,
And fear and ter -- ror cease,
And fear, and fear and ter -- ror cease.

}

wordsD = \lyricmode {
\set stanza = "4."

Then glad -- ly sing and sound a -- broad
The great Re -- deem -- er’s praise,
The glo -- ries of our \markup\caps Sav -- \markup\caps iour \markup\caps God,
The rich -- es of His grace,
The rich -- es of His grace,
The { \mon } rich -- es, { \moff } the rich -- es of His grace.

}

underWordsTenor = \lyricmode {
\override LyricText.font-size = #-2

\repeat unfold 22 \skip 4
Re -- vealed, re -- vealed in Je -- sus’ face, __

}

underWordsBass = \lyricmode {
\override LyricText.font-size = #-2

\repeat unfold 29 \skip 4
face, Re -- vealed in Je -- sus’ face,

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
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
      \context Lyrics = five \with { alignAboveContext = men } \lyricsto tenors \underWordsTenor
      \context Lyrics = six  \with { alignBelowContext = men } \lyricsto basses \underWordsBass
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
