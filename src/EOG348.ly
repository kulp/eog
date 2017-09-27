\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  %children
  hymnnumber = "348"
  title = "Little Children, Heavy-Laden"
  tunename = "Rideau Ferry"
  meter = "8. 5. 8. 3."
  poet = ""
  composer = "S. J. D."
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key d \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  fis2 d e fis | g e fis g |
  a d cis b | a\breve |
  d2 fis, g a | b d, e fis |
  g1 e | d\breve |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 d a d | cis cis cis cis |
  d2 d d d | d( cis fis e) |
  d2 d d d | d d cis d |
  b2( e) d( cis) | d\breve |

}
}

notesTenor = {
\global
\relative a {

  fis2 a g fis | g b a g |
  a2 a gis gis | a\breve | % original has voices impossible to distinguish here
  a2 d d c! | b a g fis |
  g2( b) a( g) | fis\breve |

}
}

notesBass = {
\global
\relative f {

  d2 fis cis d | e g fis e |
  fis b, e e | a1( g!) |
  fis2 c' b a | g fis e d |
  g,1 a | d\breve |

}
}

notesAlign = \notesAlto

wordsA = \lyricmode {
\set stanza = "1."

Lit -- tle chil -- dren, heav -- y -- la -- den, \bar "."
With your sin and woe, __ \bar "."
Come to Je -- sus, He in -- vites you, \bar "."
Wants you so. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Let His own sweet word of prom -- ise
Drive a -- way all doubt, __
“Come to Me now, I will nev -- er
Cast you out.”

}

wordsC = \lyricmode {
\set stanza = "3."

His, the blood_– the on -- ly cleans -- ing
You can ev -- er know, __
It will make your sins_– now scar -- let_–
White as snow.

}

wordsD = \lyricmode {
\set stanza = "4."

You can nev -- er make a -- tone -- ment,
That is ful -- ly made; __
You can nev -- er pay the ran -- som
He has paid.

}

wordsE = \markuplist {

\line { Let your heart go out toward Him }
\line { { \hspace #2 } In a simple faith, }
\line { He is willing now to save you, }
\line { { \hspace #2 } As He saith. }

}

wordsF = \markuplist {

\line { Yes! the living, loving Saviour }
\line { { \hspace #2 } Waits to make you free; }
\line { Waits to give you peace and pardon, }
\line { { \hspace #2 } “Come and see.” }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = aligned { \voiceOne << \notesAlign >> }
      \context Lyrics = one   \lyricsto aligned \wordsA
      \context Lyrics = two   \lyricsto aligned \wordsB
      \context Lyrics = three \lyricsto aligned \wordsC
      \context Lyrics = four  \lyricsto aligned \wordsD
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

\markup { \vcenter \column {
  \vspace #0.5 % not enough space for \vspace #1
  \fill-line {
    \null
    \line{ \bold 5 \column { \wordsE } }
    \null
    \line{ \bold 6 \column { \wordsF } }
    \null
  }
  \vspace #0.5 % not enough space for \vspace #1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
