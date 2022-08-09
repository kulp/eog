\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG287.ily"
}

\header{
  hymnnumber = "287"
  title = "Oh! The Peace Forever Flowing"
  tunename = "Batavia" % not found at hymnary.org
  meter = "8. 7. 8. 7."
  poet = "A. P. Cecil" % see https://hymnary.org/text/o_the_peace_forever_flowing
  composer = "German" % not found at hymnary.org
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

Oh! the peace for -- ev -- er flow -- ing \bar "."
From God’s thoughts of His own Son, \bar "."
Oh, the peace of sim -- ply know -- ing \bar "."
On the cross that all was done. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Peace with God, the blood in heav -- en
Speaks of par -- don now to me:
Peace with God! The Lord is ris -- en!
Right -- eous -- ness now counts me free.

}

wordsC = \lyricmode {
\set stanza = "3."

Peace with God through Christ in glo -- ry;
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
\set stanza = "5."

Je -- sus, Sav -- iour, we a -- dore Thee!
Christ of God— a -- noint -- ed Son;
We con -- fess Thee, Lord of glo -- ry,
Fruits of vic -- t’ry Thou hast won!

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
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
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
