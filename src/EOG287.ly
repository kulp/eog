\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "287"
  title = "O, The Peace Forever Flowing"
  tunename = "Batavia"
  meter = "8. 7."
  poet = "A. P. Cecil"
  composer = "German"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 a b g | b c d b |
  e2 d d b | c c b1 | \eogpagebreak
  d2 d d a | b c b a |
  g2 a b c | b a g1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 fis g d | g g a g |
  g2 g a g | e fis g1 |
  g2 g fis fis | g a g fis |
  d2 fis g g | g fis g1 |

}
}

notesTenor = {
\global
\relative a {

  b2 d d b | d e d d |
  c2 b d d | c d d1 |
  b2 b a d | d d d d | 
  b2 c d e | d c b1 |

}
}

notesBass = {
\global
\relative f {

  g2 d g b | g e fis g |
  c,2 g' fis g | a d, g1 |
  g2 b, d c' | b fis g d |
  b'2 a g c, | d d g,1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

O, the peace for -- ev -- er flow -- ing \bar "."
From God’s tho’ts of His own Son! \bar "."
O, the peace of sim -- ply know -- ing \bar "."
On the cross that all was done! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Peace with God, the blood in heav -- en
Speaks of par -- don now to me:
Peace with God! the Lord is ris -- en!
Right -- eous -- ness now counts me free.

}

wordsC = \lyricmode {
\set stanza = "3."

Peace with God is Christ in glo -- ry;
God is just and God is love;
Je -- sus died to tell the sto -- ry,
Foes to bring to God a -- bove.

}

wordsD = \lyricmode {
\set stanza = "4."

Now free ac -- cess to the Fa -- ther,
Thro’ the Christ of God, we have;
By the Spir -- it here a -- bid -- ing,
Prom -- ise of the Fa -- ther’s love.

}

wordsE = \lyricmode {
\set stanza = "4."

Je -- sus, Sav -- iour, we a -- dore Thee!
Christ of God– A -- noint -- ed Son;
We con -- fess Thee, Lord of glo -- ry,
Fruits of vic -- t’ry Thou hast won!

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
