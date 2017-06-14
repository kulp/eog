\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  %children
  hymnnumber = "341"
  title = "Jesus Bids Us Shine"
  tunename = ""
  meter = ""
  poet = "Emily H. Miller"
  composer = "E. O. Excell"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2 % original has impossible 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=140
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 d d d d2
  g4 a | g2 fis fis1 |
  a4 d, d d d2 a'2 |
  a4 g g a b1 |
  b4 c b a g2 d | \eogbreak
  e4( g) fis e d1 |
  d4 d g a b d2
  c4 | b2 a g1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  b4 b b b b2
  b4 c | b2 c c1 |
  c4 c c c c2 c |
  c4 b b c d1 |
  d4 e d c b2 b |
  c4( e) d c b1 |
  b4 b b c d f2
  e4 | d2 c b1 |

}
}

notesTenor = {
\global
\relative a {

  g4 g g g g2
  g4 g | g2 a a1 |
  fis4 fis fis fis fis2 fis |
  g4 g g g g1 |
  g4 g g g g2 g |
  g2 g4 g g1 |
  g4 g g g g g2
  g4 | g2 fis g1 |

}
}

notesBass = {
\global
\relative f, {

  g4 g g g g2
  g4 g | d'2 d d1 |
  d4 d d d d2 d |
  g,4 g g g g1 |
  g4 g g g g2 g |
  c2 c4 c g1 |
  g4 g g g g b2
  c4 | d2 d g,1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus bids us shine \bar "."
With a pure, clear light, \bar "."
Like a lit -- tle can -- dle \bar "."
Burn -- ing in the night; \bar "."
In this world of dark -- ness, \bar "."
So we must shine– \bar "."
You in your small cor -- ner, \bar "."
And I in mine. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus bids us shine
First of all for Him;
Well He sees and knows it
If our light grows dim:
He looks down from heav -- en,
To see us shine–
You in your small cor -- ner,
And I in mine.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus bids us shine
Next for all a -- round;
Man -- y kinds of dark -- ness
In the world a -- bound,–
Sin and want and sor -- row;
So we must shine–
You in your small cor -- ner,
And I in mine.

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
