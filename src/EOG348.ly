\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
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

wordsA = \lyricmode {
\set stanza = "1."

Lit -- tle chil -- dren, heav -- y -- la -- den, \bar "."
With your sin and woe, \bar "."
Come to Je -- sus, He in -- vites you, \bar "."
Wants you so. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Let His own sweet word of prom -- ise
Drive a -- way all doubt,
“Come to Me now, I will nev -- er
Cast you out.”

}

wordsC = \lyricmode {
\set stanza = "3."

His, the blood– the on -- ly clean -- sing
You can ev -- er know,
It will make your sins– now scar -- let–
White as snow.

}

wordsD = \lyricmode {
\set stanza = "4."

You can nev -- er make a -- tone -- ment,
That is ful -- ly made;
You can nev -- er pay the ran -- som,
He has paid.

}

wordsE = \markuplist {

\line { Let your heart go out towards Him }
\line { In a simple faith, }
\line { He is willing now to save you, }
\line { As He saith. }

}

wordsF = \markuplist {

\line { Yes! the living, loving Saviour }
\line { Waits to make you free; }
\line { Waits to give you peace and pardon, }
\line { “Come and see.” }

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

\noPageBreak

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
  \line{ \bold 6 \column { \wordsF } }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond: