\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG364.ily"
}

\header{
  %children
  hymnnumber = "364"
  title = "Little Children, Praise the Saviour"
  tunename = "" % not found at hymnary.org
  meter = "8. 7. 8. 7. D."
  poet = "" % see https://hymnary.org/text/little_children_praise_the_savior_he_reg
  composer = "George F. Handel"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=100
  \key ees \major
  \autoBeamOff
}

marksegno = { \mark \markup { \musicglyph #"scripts.segno" } }

notesSopranoSecond = {
\relative c'' {

  g2 f ees f4( g) | aes2 g g f |
  bes2 c d ees | g, f ees1^\markup{\italic Fine} |

}
}

notesSoprano = {
\global
\relative c'' {

  g2 f ees f4( g) | aes2 g g f |
  bes2. c4 bes2 g | aes f g1 |
  \notesSopranoSecond

  bes2. c4 bes2 g | aes g4( f) g2 bes | % original has bar in wrong place
  bes2. c4 bes2 g | aes f g1^\markup{\italic{D. S.}} |

  \bar "|."

}
}

notesAltoSecond = {
\relative e' {

  ees2 d ees d4( ees) | f2 ees ees d |
  ees2 ees aes g | ees d ees1 |

}
}

notesAlto = {
\global
\relative e' {

  ees2 d ees d4( ees) | f2 ees ees d |
  ees2. ees4 ees2 ees | f d ees1 |
  \notesAltoSecond

  g2. aes4 g2 ees | f ees4( d) ees2 g |
  g2. aes4 g2 ees | f d ees1 |

}
}

notesTenorSecond = {
\relative a {

  bes2 aes g bes | bes bes bes bes |
  g2 aes bes bes | bes aes g1 |

}
}

notesTenor = {
\global
\relative a {

  bes2 aes g bes | bes bes bes bes |
  g2. aes4 g2 bes | bes bes bes1 |
  \notesTenorSecond

  bes2. c4 bes2 bes | bes bes bes bes |
  bes2. c4 bes2 bes | bes bes bes1 |

}
}

notesBassSecond = {
\relative f {

  ees2 bes c bes4( ees) | d2 ees bes bes |
  ees2 aes f ees | bes bes ees1 |

}
}

notesBass = {
\global
\relative f {

  ees2 ees ees ees | d ees bes bes |
  ees2. ees4 ees2 ees | d bes ees1 |
  \notesBassSecond

  ees2. ees4 ees2 ees | d bes ees ees |
  ees2. ees4 ees2 ees | d bes ees1 |

}
}

Refrain = \lyricmode {

Sweet ho -- san -- nas, sweet ho -- san -- nas \bar "."
To the name of Je -- sus sing. \bar "."
( - Repeat last two lines of stanza - )

}

wordsA = \lyricmode {
\set stanza = "1."

Lit -- tle chil -- dren, praise the Sav -- iour; \bar "."
He re -- gards you from a -- bove. \bar "."
%{HIDE>%} \marksegno %{<HIDE%} Praise Him for His great sal -- va -- tion, \bar "."
Praise Him for His gra -- cious love! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

When the anx -- ious moth -- ers round Him,
With their ten -- der in -- fants pressed,
He with o -- pen arms re -- ceived them,
And the lit -- tle ones He blessed. % 1951 music edition and blue book both have "blest" here but that is not a verbal form (only adjectival)

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Lit -- tle chil -- dren, praise the Sav -- iour;
Praise Him, your un -- dy -- ing Friend;
Praise Him, till a -- bove you meet Him;
There to praise Him with -- out end.

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
}

\include "score-EOG364.ily"

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
