\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG362.ily"
}

\header{
  %children
  hymnnumber = "362"
  title = "Two Little Eyes"
  tunename = ""
  meter = "L. M."
  poet = ""
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=140
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 g g | g( d) g | b( g) b | d2. |
  d4 e d | d( b) g | g( fis) g | a2. |
  g4 g g | g( d) g | b( g) b | d2. |
  e4 c e | d b g | b2 a4 | g2. |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 d d | d ~ d d | g( d) g | g2. |
  g4 g g | g( d) d | cis ~ cis cis | d2. |
  d4 d d | d ~ d d | g( d) g | g2. |
  g4 e g | g g d | g2 fis4 | d2. |

}
}

notesTenor = {
\global
\relative a {

  b4 b b | b ~ b b | d( b) d | b2. |
  b4 c b | b( g) g | a ~ a g | fis2( c'4) |
  b4 b b | b ~ b b | d( b) d | b2. |
  c4 g c | b d b | d2 c4 | b2. |

}
}

notesBass = {
\global
\relative f {

  g4 g g | g ~ g g | g ~ g g | g2. |
  g4 g g | g ~ g b, | a ~ a a | d2. |
  g4 g g | g ~ g g | g ~ g g | g2. |
  c,4 c c | g' g g | d2 d4 | g2. |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Two lit -- tle eyes to look to God, \bar "."
Two lit -- tle ears to hear His Word, \bar "."
Two lit -- tle feet to walk His ways, \bar "."
Two hands to work for Him all my days. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

One lit -- tle tongue to speak His truth,
One lit -- tle { \mon } heart for Him now in { \moff } my youth;
Take them, Lord { \mon } Je -- sus, { \moff } and let them be
Al -- ways o -- be -- dient and true to Thee.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one \lyricsto sopranos \wordsA
      \context Lyrics = two \lyricsto sopranos \wordsB
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
