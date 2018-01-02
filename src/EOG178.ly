\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  systems-per-page = ##f
  \include "override/override-EOG178.ily"
}

\header{
  hymnnumber = "178"
  title = "Glory Unto Jesus Be!"
  tunename = "Vienna"
  meter = "7. 7. 7. 7."
  poet = "Archibald Rutherford" % see https://hymnary.org/text/glory_unto_jesus_be
  composer = "Justin H. Knecht" % see https://hymnary.org/tune/vienna_knecht
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
Pa -- tient wait His sure re -- turn;
For His saints with Him shall reign—
“Come, Lord Je -- sus, come! A -- men!”

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
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\noPageBreak

\markup { \fill-line { \line { Alternate tune: No. 316. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
