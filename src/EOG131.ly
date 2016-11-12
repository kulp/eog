\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  %ragged-last-bottom = ##t
  systems-per-page = 3
  %page-count = ##f
}

\header{
  hymnnumber = "131"
  title = "We Sing the Praise of Him Who Died"
  tunename = "Warrington"
  meter = "L. M."
  poet = "T. Kelly"
  composer = "R. Harrison"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

g2 g f | e( g) c | c( d) b | c1
e2 | d1 d2 | e1 d4( c) | b1 a2 | g1. |
c2 c g | a( b) c | f2.( e4) d( c) | c2( b)
a | g1 f2 | e( g) c | c( d) b | c1. |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

e2 c b | c( d4 e) f2 | e( f) d | e1
g2 | g( fis) g | g1 g2 | g( e) fis | g1. |
e2 g e | f( g) g | f2.( g4) a2 | g1
d2 | e1 b2 | c1 e2 | f1 d2 | e1. |

}
}

notesTenor = {
\global
\relative a {

g2 c d | e( d) c | c( b) g | g1
c2 | b( c) d | c1 b4( c) | d1 c2 | b1. |
g2 c c | c( d) c | a( b4 cis) d2 | e( d)
a4( b) | g1 f2 | g( c) c | a1 g2 | g1. |

}
}

notesBass = {
\global
\relative f {

c2 e g | c( b) a | g1 g2 | c,1
c2 | g'( a) b | c( c,) d4( e) | d1 d2 | g1. |
c,2 e c | f1 e2 | d2.( e4) f2 | g1
f2 | e1 d2 | c( e) a | f( d) g | c,1. |

}
}

wordsA = \lyricmode {
\set stanza = "1."

We sing the praise of Him who died, \bar "."
Of Him who died up -- on the cross, \bar "."
The sin -- ner’s hope— let men de -- ride; \bar "."
For this we count the world but loss. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

In -- scribed up -- on the cross we see,
In shin -- ing let -- ters, “GOD IS LOVE!”
The Lamb who died up -- on the tree
Has brought us mer -- cy from a -- bove.

}

wordsC = \lyricmode {
\set stanza = "3."

The cross! it took our guilt a -- way,
It holds the faint -- ing spir -- it up;
It cheers with hope the gloom -- y day,
And sweet -- ens ev -- ery bit -- ter cup.

}

wordsD = \markuplist {

\line { It makes the coward spirit brave }
\line { And nerves the feeble arm for fight; }
\line { It takes its terror from the grave, }
\line { And gilds the bed of death with light. }

}

wordsE = \markuplist {

\line { The balm of life, the cure of woe, }
\line { The measure and the pledge of love, }
\line { The sinner’s refuge here below, }
\line { The theme of praise in heaven above. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } }
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
} }

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
