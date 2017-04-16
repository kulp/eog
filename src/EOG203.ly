\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "203"
  title = "Shine Forth, O Lord"
  tunename = "Viens, Seigneur"
  meter = "10. 10. 10. 10. with Refrain"
  poet = ""
  composer = "French Hymn Melody"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 g4 g | g fis g a | b2 a | g1 |
  b2 b4 b | b a b d | c2 b | a1 |
  g2 g4 a | b g e a | g2 fis | g1 |
  a2 a4 b | a d b e | d2 cis | d1 |

  << s^\markup { \small \caps "Refrain" }
  { d4 b e d | c a d c | b g c b | a1 } >>
  d4 d c b | b a c a | g2 fis | g1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 d4 d | d d d cis | d( g) fis2 | g1 |
  g2 g4 g | g fis g g | fis( a) g2 | fis1 |
  d4( e) d c | b d g, c | d2 d | d1 |
  fis2 fis4 g | fis4 a g g | fis2 e | fis1 |

  b4 g c b | a fis fis a | g g a g | fis1 |
  d4 d d d | e e a e | d2 d | d1 |

}
}

notesTenor = {
\global
\relative a {

  b2 b4 b | b a g g | g2 c | b1 |
  d2 d4 d | d d d d | d2 d | d1 |
  g,2 g4 fis | g g g c | b2 a | b1 |
  d2 d4 d | d d d b | a2 a | a1 |

  d4 d d d | d d d d | d d d d | d1 |
  g,4 g fis g | g c e c | b2 a | b1 |

}
}

notesBass = {
\global
\relative f {

  g2 g4 g | g d b e | d2 d | g,1 |
  g2 b4 d | g d g b | a( fis) g( g,) | d'4( e d c)
  b4( c) b a | g b c a | d2 d | g,1 |
  d'2 d4 d | d fis g g | a2 a, | d1 |

  g4 g g g | d d d fis | g b fis g | d( e d c)
  b4 b a g | c c a c | d2 d | g,1 |

}
}

Refrain = \lyricmode {

{ \eogbreak }

A -- men, come Lord Je -- sus! Claim Thy peo -- ple for Thine own!
Crown Thy church in glo -- ry, seat -- ed in Thy throne!

}

wordsA = \lyricmode {
\set stanza = "1."

Shine forth, O Lord, Thou bright and morn -- ing Star!
Come quick -- ly come! Thy peo -- ple wait -- ing are,
Shout, shout the word that bids Thy dead a -- rise,
And calls Thy saints to meet Thee in the skies.

}

wordsB = \lyricmode {
\set stanza = "2."

Shine forth, O Lord, come soon for Thy re -- deemed,
For those on whom Thy ten -- der love has beamed;
Thy pil -- grim saints oft wea -- ry in the way
Cry out for Thee– Star of the com -- ing day!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Shine forth, O Lord, and claim Thy blood -- bought bride,
Put forth Thy power and raise her to Thy side,
We wait the hour when our glad shout shall be
That death is swal -- lowed up in vic -- to -- ry.

}

wordsD = \lyricmode {
\set stanza = "4."

Shine forth, O Lord, and bring to pass the day
When ev -- ery clime shall own Thy right -- ful sway,
When all man -- kind be -- fore Thy throne shall fall,
And heav’n and earth shall crown Thee Lord of all.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
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
