\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
  system-system-spacing.padding = 11
}

\header{
  %children
  hymnnumber = "337"
  title = "If I Come to Jesus"
  tunename = ""
  meter = "6. 5. 6. 5. D."
  poet = "Fanny J. Crosby"
  composer = "Anon."
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  c8 g g g | a c4 r8 |
  b8 c d e | c4( g) |
  c8 g g g | a c4 r8 |
  b8 c d b | c4. r8 |

  << s^\markup { \small \caps "Refrain" }
  { b8 b d b | c4 b | } >>
  a8 c b a | g2 |
  c8 g g g | a c4 r8 |
  b8 c d b | c4. r8 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e8 e e e | f f4 r8 |
  f8 f f f | e2 |
  e8 e e e | f f4 r8 |
  f8 e f d | e4. r8 |

  e8 e gis gis | a4 gis |
  a8 a g! fis | g2 |
  e8 e e e | f f4 r8 |
  f8 e f d | e4. r8 |

}
}

notesTenor = {
\global
\relative a {

  c8 c c c | c a4 r8 |
  d8 c b b | c2 |
  c8 c c c | c a4 r8 |
  d8 c b g | g4. r8 |

  gis8 gis b e | e4 e |
  c8 e d c | b2 |
  c8 c c c | c a4 r8 |
  d8 c b g | g4. r8 |

}
}

notesBass = {
\global
\relative f {

  c8 c c c | f f4 r8 |
  g8 g g g | c,2 |
  c8 c c c | f f4 r8 |
  g8 g g, g | c4. r8 |

  e8 e e e | a4 e |
  c8 a d d | g2 |
  c,8 c c c | f f4 r8 |
  g8 g g, g | c4. r8 |

}
}

Refrain = \lyricmode {

If I come to Je -- sus, \bar "."
Hap -- py I shall be; \bar "."
He is gen -- tly call -- ing \bar "."
Lit -- tle ones like me. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

If I come to Je -- sus, \bar "."
He will make me glad; \bar "."
He will give me pleas -- ure \bar "."
When my heart is sad. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

If I come to Je -- sus,
He will bid me live;
He will love me dear -- ly,
And my sins for -- give.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

If I come to Je -- sus,
He will take my hand;
He will kind -- ly lead me
To a bet -- ter land.

}

wordsD = \lyricmode {
\set stanza = "4."

There with hap -- py chil -- dren,
Robed in snow -- y white,
I shall see the Sav -- iour,
In that world so bright.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
