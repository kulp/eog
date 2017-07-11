\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-system-spacing.padding = 5
}

\header{
  hymnnumber = "274"
  title = "Love Divine, All Praise Excelling"
  tunename = "Zundel"
  meter = "8. 7. 8. 7. D."
  poet = "C. Wesley"
  composer = "John Zundel"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key bes \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f4 f g f | d' c8[ d] c4 bes |
  a4 g bes g | f ees8[ f] d2 |
  f4 f g f | d' c8[ d] c4 bes |
  g4 ees' d bes | a g8[ a] bes2 |

  bes4 bes bes a | g a8[ g] fis4 d |
  d'4 d ees d | c c8[ d] c2 |
  f,4 f g f | d' c8[ d] c4 bes |
  g4 ees' d bes | a g8[ a] bes2 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 d ees d | f ees8[ f] ees4 d |
  f ees g ees | d c bes2 |
  d4 d ees d | f ees8[ f] ees4 d |
  ees4 g f f | ees ees d2 |

  d4 g fis fis | g d d d |
  d4 f g f | f e f( ees) |
  d4 d ees d | f ees8[ f] ees4 d |
  ees4 g f f | ees ees d2 |

}
}

notesTenor = {
\global
\relative a {

  bes4 bes bes bes | bes a a bes |
  bes4 bes bes bes | bes a f2 |
  bes4 bes bes bes | bes a a bes |
  bes4 bes bes d | c f, f2 |

  g4 d' d c | bes c8[ bes] a4 d, |
  f4 bes bes bes | a bes a2 |
  bes4 bes bes bes | bes a a bes |
  bes4 bes bes d | c f, f2 |

}
}

notesBass = {
\global
\relative f, {

  bes4 bes ees bes | bes f' f bes, |
  ees4 ees ees ees | f f, bes2 |
  bes4 bes ees bes | bes f' fis g |
  ees4 ees f f | f f, bes2 |

  g4 bes d d | d d d d |
  bes4 bes bes' bes, | c c f2 |
  bes,4 bes ees bes | bes f' fis g |
  ees4 ees f f | f f, bes2 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Love di -- vine, all praise ex -- cel -- ling, \bar "."
Joy of heaven, to earth come down, \bar "."
Bless us with Thy rich in -- dwell -- ing, \bar "."
All Thy faith -- ful mer -- cies crown! \bar "."
Sav -- iour, Thee we’d still be bless -- ing, \bar "."
Serve Thee here, as soon a -- bove; \bar "."
Praise Thee, Sav -- iour, with -- out ceas -- ing, \bar "."
Glo -- ry in Thy dy -- ing love. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

First -- fruits of Thy new cre -- a -- tion–
Faith -- ful, ho -- ly, may we be,
Joy -- ful in Thy full sal -- va -- tion,
More and more con -- formed to Thee.
Changed from glo -- ry in -- to glo -- ry,
Till in heaven we take our place,
Then to wor -- ship and a -- dore Thee,
Lost in won -- der, love and praise!

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
