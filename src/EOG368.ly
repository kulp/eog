\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG368.ily"
}

\header{
  %children
  hymnnumber = "368"
  title = "Who Came Down from Heaven to Earth?"
  tunename = ""
  meter = "P. M."
  poet = "El Nathan"
  composer = "J. McGranahan"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  b4 b a g | d e fis2 |
  g4 b d b | b2 a |
  b4 b a g | d e fis2 |
  g4 b d b | a2 g |

  d'4^\markup { \small \caps "Refrain" } d d d | e e e2 |
  d4 e d b | b a a2 |
  b4 b a g | d e fis2 |
  g4 b d b | a2 g |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 d c b | c c c2 |
  b4 d d g | g2 fis |
  d4 d c b | c c c2 |
  b4 d d d | c2 b |

  g'4 g g g | g g g2 |
  g4 g g g | g fis fis2 |
  d4 d c b | c c c2 |
  b4 d d d | c2 b |

}
}

notesTenor = {
\global
\relative a {

  g4 g d d | fis g a2 |
  g4 g a d | d2 d |
  g,4 g d d | fis g a2 |
  g4 g a g | fis2 g |

  b4 b b b | c c c2 |
  b4 c b d | d d d2 |
  g,4 g d d | fis g a2 |
  g4 g a g | fis2 g |

}
}

notesBass = {
\global
\relative f {

  g4 g g, g | d' d d2 |
  g4 g fis g | d2 d |
  g4 g g, g | d' d d2 |
  g4 g fis g | d2 g, |

  g'4 g g g | c, c c2 |
  g'4 g g g | d d d2 |
  g4 g g, g | d' d d2 |
  g4 g fis g | d2 g, |

}
}

Refrain = \lyricmode {

Sound the cho -- rus loud and clear_– \bar "."
He hath brought sal -- va -- tion near; \bar "."
None so pre -- cious, none so dear: \bar "."
Je -- sus Christ our Sav -- iour. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Who came down from heaven to earth? \bar "."
Je -- sus Christ our Sav -- iour. \bar "."
Came a child of low -- ly birth? \bar "."
Je -- sus Christ our Sav -- iour. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Who was lift -- ed on the tree?
Je -- sus Christ our Sav -- iour.
There to ran -- som you and me?
Je -- sus Christ our Sav -- iour.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Who hath prom -- ised to for -- give? % original has "promed"
Je -- sus Christ our Sav -- iour.
Who hath said, “Be -- lieve and live”?
Je -- sus Christ our Sav -- iour.

}

wordsD = \markuplist {

\line { Who is now enthroned above? }
\line { { \hspace #2 } Jesus Christ our Saviour. }
\line { Whom should we obey and love? }
\line { { \hspace #2 } Jesus Christ our Saviour. }

}

wordsE = \markuplist {

\line { Who again from heaven shall come? }
\line { { \hspace #2 } Jesus Christ our Saviour. }
\line { Take to glory all His own? }
\line { { \hspace #2 } Jesus Christ our Saviour. }

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

\markup { \column {
  \fill-line { \vcenter \column {
    \vspace #1
    \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
    \line{ \bold 5 \column { \wordsE } }
    \vspace #1
  } }
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
