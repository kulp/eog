\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 3) (#t #f)) % fits in 2 systems, but page fit favours 3
}

\header{
  %children
  hymnnumber = "340"
  title = "Happy Is the Boy"
  tunename = ""
  meter = "P. M."
  poet = ""
  composer = "W. Perkins, Jr."
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a8 d a g fis4 fis8 e | d4 d d2 |
  e8 a a b cis4 e8 d | cis4 b a2 |
  fis8 fis e d g4 fis8 e | a4 g8[ fis] \tb b2\fermata \ta
  cis8 d e cis a4 a8 b | fis4 e d2 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  fis4 e d cis | a b a2 |
  cis4 e e a8 fis | a4 gis e2 |
  d4 s4 d8[ cis] cis4 | e8[ d] dis4 e2 | % original has missing notes for alto = s4
  a4 a d, e | d cis d2 |

}
}

notesTenor = {
\global
\relative a {

  a4 a a a8 g | fis4 g fis2 |
  a4 g a a8 a | e'4 d cis2 |
  a4 a a a | fis4 b b2 |
  e4 cis a b | a g fis2 |

}
}

notesBass = {
\global
\relative f {

  d4 cis d a | d d d2 |
  cis4 b a cis8 d | e4 e a2 |
  d,4 fis e a | fis a g2_\fermata |
  g4 g fis g | a, a d2 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Hap -- py is the boy who be -- lieves in Him, \bar "."
Hap -- py is the boy who is cleansed from sin; \bar "."
Nev -- er to a boy did the Lord say, “No!” \bar "."
Let us ev -- ’ry one to the Sav -- iour go. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Hap -- py is the girl who be -- lieves in Him, \bar "."
Hap -- py is the girl who is cleansed from sin; \bar "."
Nev -- er to a girl did the Lord say, “No!” \bar "."
Let us ev -- ’ry one to the Sav -- iour go. \bar "."

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


\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
