\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  system-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "178"
  title = "Glory Unto Jesus Be!"
  tunename = "Vienna"
  meter = "7. 7. 7. 7."
  poet = "A. J. Rutherford"
  composer = "J. H. Knecht"
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

  b2 a g b | d c b1 |
  e,2 fis g a | fis e d1 |
  g2 fis e g | c b a1 |
  d2 c b a | g fis g1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g2 fis e g | g4( d) e( fis) g1 |
  c,2 c b e | d cis d1 |
  b2 d c d | e4( fis) g2 fis1 |
  g2 a g e | d d d1 |

}
}

notesTenor = {
\global
\relative a {

  d2. c4 b2 b | g c d1 |
  g,2 a b a | a2. g4 fis1 |
  g2 g g b | c d d1 |
  d2 d d c | b a b1 |

}
}

notesBass = {
\global
\relative f {

  g2 d e e | b a g1 |
  c2 a e' cis | d a d1 |
  e2 b c b | c b4( c) d1 |
  b'2 fis g c, | d d g,1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Glo -- ry un -- to Je -- sus be! \bar "."
From the curse who set us free; \bar "."
All our guilt on Him was laid, \bar "."
He the ran -- som ful -- ly paid. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

All that bless -- ed work is done,
God’s well pleas -- ed with His Son;
He has raised Him from the dead,
Set Him o -- ver all as Head.

}

wordsC = \lyricmode {
\set stanza = "3."

This we know, and cease to mourn,
Pa -- tient wait His sure re -- turn:
For His saints with Him shall reign–
“Come, Lord Je -- sus, Come! A -- men!”

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

\noPageBreak

\markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 316. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
