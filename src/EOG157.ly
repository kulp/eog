\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  hymnnumber = "157"
  title = "Christ the Lord Is Coming"
  tunename = ""
  meter = "11. 11. 11. 11."
  poet = ""
  composer = "M. Koch"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered % original has `c`
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a4.^\p bes8 g4 e | f2 c4 r4 |
  bes'4. c8 a4 f | g2. r4 |
  a4. a8^\< b4 b\! | c2 a4( f) |
  e4. e8 f4 d | c2. r4 |

  bes'4.^\mf c8 a4 f | a2 g4 r4 |
  d'4.^\< c8 c8\![ bes] bes[ a] | g2. r4 |
  c4.^\f^\< c8 f4\! e | e( d) bes( g) |
  f4. f8 a4^\> g\! | f2. r4 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f4. g8 e4 c | a2 c4 r4 |
  g'4. e8 f4 c | c2. r4 |
  c4. c8 f4 f | e2 c |
  c4. c8 b4 b | c2. r4 |

  g'4. e8 f4 c | c2 c4 r4 |
  f4. f8 g4 g8[ f] | e2. r4 |
  c4. f8 a4 g | f2 d |
  c4. c8 e4 e | f2. r4 |

}
}

notesTenor = {
\global
\relative a {

  c4. c8 c4 g | f2 a4 r4 |
  c4. c8 c4 f, | e2. r4 |
  f4. f8 g4 g | g2 f4( a) |
  g4. g8 g4 f | e2. r4 |

  c'4. c8 c4 f, | f2 e4 r4 |
  bes'4. c8 c4 c | c2. r4 |
  a4. a8 d4 cis | d2 g,4( bes) |
  a4. a8 c4 bes | a2. r4 |

}
}

notesBass = {
\global
\relative f {

  f4. f8 c4 c | f,2 f'4 r4 |
  e4. g8 f4 a, | c2. r4 |
  f4. f8 d4 d | c2 f |
  g4. g8 g,4 g | c2. r4 |

  c4. c8 f4 a, | c2 c4 r4 |
  bes4. a8 e'4 f | c2. r4 |
  f4. f8 d4 a' | bes2 bes, |
  c4. c8 c4 c | f2. r4 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Christ the Lord is com -- ing, \bar "."
Com -- ing ve -- ry soon, \bar "."
Sud -- den -- ly some morn -- ing, \bar "."
Eve, or night, or noon. \bar "."
Quick -- ly, in a mo -- ment, \bar "."
Saints shall quit the earth; \bar "."
See Him in His beau -- ty, \bar "."
Glo -- ry, grace and worth. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Then– oh, won -- drous bless -- ing!
They shall be like Him;
Nev -- er more have sor -- row,
Ev -- er free from sin.
Then with Him in glo -- ry
Bright -- ly they shall shine;
Know His love more ful -- ly–
Love so true, di -- vine!

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
