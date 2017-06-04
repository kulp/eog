\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 11
}

\header{
  hymnnumber = "219"
  title = "His Be “The Victor’s Name”"
  tunename = "Victor"
  meter = "S. M."
  poet = "Whittock Gandy" % Samuel *Whitelock* Gandy ?
  composer = "W. P."
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a4 gis a | d2 f,4 | a2( g4) | \bar "."
  bes4 a bes | e2 d4 | c2.( | a ) | \bar "."
  f'4 c a | e'2 d4 | c2 g4 | bes2( a4) | \bar "."
  \time 2/2
  r2^\pp f2 | f^\< f\! | f^\> e\! | f1 \bar "."

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f4 f f | f2 c4 | f2( e4) |
  e4 e e | e2 e4 | f2. ~ | f |
  a4 f f | e2 e4 | e2 e4 | f2. |
  r2 d2 | c d | d c | c1 |

}
}

notesTenor = {
\global
\relative a {

  c4 b c | bes2 a4 | c2. |
  c4 c c | bes2 bes4 | a2.( | c ) |
  c4 a c | bes2 bes4 | bes2 bes4 | d2( c4) |
  r2 bes2 | c b | bes bes | a1 |

}
}

notesBass = {
\global
\relative f {

  f4 f f | f2 f4 | c2. |
  c'4 bes g | c,2 c4 | f2. ~ | f |
  f4 f f | c2 c4 c2 c4 | f2. |
  r2 bes2 | a g | c, c | f1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

His be “the Vic -- tor’s name”
Who fought the fight a -- lone;
Tri -- um -- phant saints no hon -- or claim,
His con -- quest was their own.

}

wordsB = \lyricmode {
\set stanza = "2."

By weak -- ness and de -- feat
He won the meed and crown,
Trod all our foes be -- neath His feet
By be -- ing trod -- den down.

}

wordsC = \lyricmode {
\set stanza = "3."

Bless, bless the Con -- q’ror slain,
Slain in His vic -- to -- ry;
Who lived, who died, who lives a -- gain–
For thee, His Church, for thee!

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
