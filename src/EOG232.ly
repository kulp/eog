\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "232"
  title = "Christ the Lord Will Come Again"
  tunename = "Innocents"
  meter = "7. 7. 7. 7."
  poet = "Swain"
  composer = "Adpt. by J. Smith"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4. aes8 bes4 ees | d c bes2 |
  ees,4. f8 g4 bes | aes g f2 |
  g4. aes8 bes4 ees | d c bes2 |
  ees,4. f8 g4 aes | g f ees2 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4. ees8 g4 ees | ees ees g2 |
  ees4. d8 ees4 ees | ees8[ f] ees4 d2 |
  ees4. ees8 ees4 g | f f8[ ees] d2 |
  ees4. d8 ees4 ees | ees d ees2 |

}
}

notesTenor = {
\global
\relative a {

  bes4. bes8 bes4 g | aes8[ bes] c[ d] ees2 |
  bes4. bes8 bes4 bes | c8[ bes] bes4 bes2 |
  bes4. bes8 bes4 bes | bes a bes2 |
  bes4. bes8 bes8[ des] c[ b] | bes4. aes8 g2 |

}
}

notesBass = {
\global
\relative f {

  ees4. f8 g4 ees | ees ees ees2 |
  g4. f8 ees4 g | c,8[ d] ees4 bes2 |
  ees4. f8 g4 ees | f f bes4.( aes8) |
  g4. f8 ees4 aes, | bes bes ees2 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Christ the Lord will come a -- gain, \bar "."
None shall wait for Him in vain; \bar "."
We shall then His glo -- ry see; \bar "."
His who died to set us free. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Then, when the Arch -- an -- gel’s voice
Calls the sleep -- ing saints to rise,
Ris -- ing mil -- lions shall pro -- claim
Bless -- ings on the Sav -- iour’s name.

}

wordsC = \lyricmode {
\set stanza = "3."

“This is our re -- deem -- ing God,”
Ran -- somed hosts will shout a -- loud:
“Praise, e -- ter -- nal praise, be giv’n
To the Lord of earth and heaven!”

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
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
