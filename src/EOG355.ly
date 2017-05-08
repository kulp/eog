\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "355"
  title = "Safe in Christ"
  tunename = "Near the Cross"
  meter = "P. M."
  poet = "H. d’A. Champney"
  composer = "W. H. Doane"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=130
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a2 bes4 a2 g4 | f2 d4 d2. |
  c2 f4 f2 a4 | a2. g2. |
  a2 bes4 a2 g4 | f2 d4 d2. |
  c2 f4 f2 e4 | g2. f2. |

  << s^\markup { \small \caps "Refrain" }
  { a2 c4 c2. | bes2 d4 d2. } >>
  c2 d4 c2 a4 | a2. g2. |
  a2 bes4 a2 g4 | f2 d4 d2. |
  c2 f4 f2 e4 | g2. f2. |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 f4 f2 e4 | d2 d4 d2. |
  a2 c4 c2 f4 | f2. e2. |
  f2 f4 f2 e4 | d2 d4 bes2. |
  a2 c4 c2 c4 | e2. f2. |

  f2 f4 f2. | f2 f4 f2. |
  f2 f4 f2 f4 | f2. e2. |
  c2 d4 c2 cis4 | d2 d4 bes2. |
  a2 c4 c2 c4 | e2. f2. |

}
}

notesTenor = {
\global
\relative a {

  c2 d4 c2 bes4 | a2 bes4 bes2. |
  a2 a4 a2 c4 | c2. c2. |
  c2 d4 c2 bes4 | a2 bes4 f2. |
  f2 a4 a2 g4 | bes2. a2. |

  c2 a4 a2. | d2 bes4 bes2. |
  a2 bes4 a2 c4 | c2. c2. |
  a2 g4 a2 a4 | a2 bes4 f2. |
  f2 a4 a2 g4 | bes2. a2. |

}
}

notesBass = {
\global
\relative f {

  f2 f4 f2 c4 | d2 bes4 bes2. |
  f'2 f4 f2 f4 | c2. c2. |
  f2 f4 f2 c4 | d2 bes4 bes2. |
  c2 c4 c2 c4 | c2. f2. |

  f2 f4 f2. | bes2 bes4 bes2. |
  f2 f4 f2 f4 | c2. c2. |
  f2 f4 f2 e4 | d2 bes4 bes2. |
  c2 c4 c2 c4 | c2. f2. |

}
}

Refrain = \lyricmode {

Safe in Christ! safe in Christ! \bar "."
He’s their glo -- ry ev -- er; \bar "."
None can pluck them from His hand, \bar "."
They shall per -- ish nev -- er. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Safe in Christ, the weak -- est child
Stands in all God’s fa -- vor;
All in Christ are re -- con -- ciled
Through that on -- ly Sav -- iour.

}

wordsB = \lyricmode {
\set stanza = "2."

Once their sins on ev -- ery side,
Seemed to tow -- er o’er them;
Christ has stemmed the an -- gry tied;
Been through death be -- fore them.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

In His death, they’ve crossed the sea,
Passed thro’ con -- dem -- na -- tion;
Well they may tri -- um -- phant be;
Saved thro’ God’s sal -- va -- tion.

}

wordsD = \lyricmode {
\set stanza = "4."

Now by faith the just -- i -- fied
Know that God is for them;
To the world they’re cru -- ci -- fied,
Glo -- ry is be -- fore them.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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
