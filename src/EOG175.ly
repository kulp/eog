\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 4) (#t #f))
  system-count = #(cond (is-eogsized 6) (#t #f))
}

\header{
  hymnnumber = "175"
  title = "Low in the Grave He Lay"
  tunename = "Christ Arose"
  meter = "6. 5. 6. 4. with Refrain"
  poet = "R. Lowry"
  composer = "R. Lowry"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=110
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 g4 a | a g g2 |
  g2 f4 a | a2 g |
  a2 b4 c | c g g2 |
  a2 g4 fis | g1 |

  << s^\markup { \small \caps "Refrain" }
  { c,4 c8. c16 e4 g8. g16 | c2. } >>
  c8. d16 | e4 c d8. c16 b8. a16 | g2.
  b8. c16 | d4 d d8. c16 d8. e16 | c4 a g
  g8. g16 | a4 a a8. d16 d8. c16 | b4 c d
  g,8. g16 | e'2. d8. c16 | f2.
  e8. d16 | c4 g^\markup{rit.} e' d | c1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e2 e4 f | f e e2 |
  d2 d4 f | f2 e2 |
  f2 g4 a | g e e2 |
  e2 d4 c | b1 |


  c4 c8. c16 e4 g8. g16 | e2.
  e8. f16 | g4 g a8. a16 g8. f16 | e2.
  d8. e16 | f4 f f8. e16 f8. g16 | e4 f e
  e8. e16 | f4 f fis8. fis16 fis8. a16 | g8[ f] e4 g
  g8. g16 | g2. f8. e16 | a2.
  g8. f16 | e4 e g f | e1 |

}
}

notesTenor = {
\global
\relative a {

  c2 c4 c | c c c2 |
  b2 b4 b | c2 c |
  c2 c4 c | c c c2 |
  c2 b4 a | g1 |

  c,4 c8. c16 e4 g8. g16 | g4 g8. g16 g4
  c8. c16 | c4 c c8. c16 c8. c16 c4 c8. c16 c4
  g8. g16 | g4 g g8. g16 g8. g16 | c4 c c
  c8. c16 | c4 c c8. a16 a8. d16 | d4 c b
  r4 r c8. c16 c4 r4 | r c8. c16 c4
  c8. a16 | g4 c c b | c1 |

}
}

notesBass = {
\global
\relative f {

  c2 c4 c | c c c2 |
  g2 g4 g | c2 c |
  f2 f4 f | e c c2 |
  a2 d4 d | g,1 |

  c4 c8. c16 e4 g8. g16 | c,4 c8. c16 c4
  c8. c16 | c4 e f8. f16 f8. f16 | c4 c8. c16 c4
  g'8. g16 | g4 g g8. g16 g8. g16 | a4 f c
  c8. c16 | f4 f d8. d16 d8. d16 | g4 a g
  r4 r c8. c16 c4 r4 | r f,8. f16 f4
  f8. f16 | g4 g g g | c,1 |

}
}

Refrain = \lyricmode {

Up from the grave He a -- rose, \bar "."
With a might -- y tri -- umph o’er His foes; \bar "."
He a -- rose a Vic -- tor from the dark do -- main, \bar "."
And He lives for -- ev -- er with His saints to reign: \bar "."
He a -- rose! He a -- rose! \bar "."
Hal -- le -- lu -- jah! Christ a -- rose! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Low in the grave He lay_– \bar "."
Je -- sus, my Sav -- iour! \bar "."
Wait -- ing the com -- ing day_– \bar "."
Je -- sus, my Lord! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Vain -- ly they watch His bed_–
Je -- sus, my Sav -- iour!
Vain -- ly they seal the dead_–
Je -- sus, my Lord!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Death can -- not keep his prey_–
Je -- sus, my Sav -- iour!
He tore the bars a -- way_–
Je -- sus, my Lord!

}

underWords = \lyricmode {

{ \repeat unfold 28 \skip 4 }
He a -- rose
{ \repeat unfold 9 \skip 4 }
He a -- rose!
{ \repeat unfold 22 \skip 4 }
He a -- rose!
He a -- rose!

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
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
    >>
    \context Lyrics = three \lyricsto tenors \underWords
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
