\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  systems-per-page = #(cond (is-eogsized 1) (#t #f))
}

\header{
  hymnnumber = "258"
  title = "Many Sons To Glory Bringing"
  tunename = "Rhineland"
  meter = "8. 7."
  poet = "Mary Bowley"
  composer = "German"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e1 g2 | g1 c2 | c( b) a | a1 g2 |
  g1 c2 | g1 e'2 | d( e) d | c1. |
  e1 e2 | e( d) d | d( b) g | c1 g2 |
  c2( b) a | g1 c2 | e1 d2 | c1. |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c1 e2 | e1 e2 | a( g) f | f1 e2 |
  e1 e2 | e1 g2 | f1 f2 | e1. |
  g1 g2 | fis1 fis2 | f!1 f2 | e1 e2 |
  a2( g) f | e1 e2 | g1 f2 | e1. |

}
}

notesTenor = {
\global
\relative a {

  g1 c2 | c1 g2 | a( b) c | c1 c2 |
  c1 g2 | c1 c2 | b1 b2 | g1. |
  c1 c2 | a1 c2 | b( d) b | g1 c2 |
  a2( b) c | c1 g2 | g( a) b | g1. |

}
}

notesBass = {
\global
\relative f {

  c1 c2 | c1 c2 | f1 f2 | c1 c2 |
  c1 c2 | c1 c2 | g'1 g2 | c,1. |
  c1 c2 | d1 d2 | g,1 g2 | c1 c2 |
  f1 f2 | c1 c2 | g1 g2 | c1. |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Man -- y sons to glo -- ry bring -- ing, \bar "."
God sets forth His heav’n -- ly name; \bar "."
On we march, in cho -- rus sing -- ing, \bar "."
“Wor -- thy the as -- cend -- ed Lamb!” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

God, who gave the blood to screen us,
God looks down in per -- fect love;
Clouds may seem to pass be -- tween us,
There’s no change in Him a -- bove.

}

wordsC = \lyricmode {
\set stanza = "3."

Tho’ the rest -- less foe ac -- cus -- es, % original has "ac -- cus -- ses"
Sins re -- count -- ing like a flood,
Ev -- ’ry charge our God re -- fus -- es:
Christ has an -- swered with His blood.

}

wordsD = \lyricmode {
\set stanza = "4."

In the ref -- uge God pro -- vid -- ed,
Tho’ the world’s de -- struc -- tion low’rs,
We are safe,– to Christ con -- fid -- ed,
Ev -- er -- last -- ing life is ours.

}

wordsE = \lyricmode {
\set stanza = "4."

And, ere long, when come to glo -- ry,
We shall sing a well -- known strain,–
This (the nev -- er -- tir -- ing sto -- ry):–
“Wor -- thy is the Lamb once slain!”

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
