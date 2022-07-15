\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG232.ily"
}

\header{
  hymnnumber = "232"
  title = "Christ the Lord Will Come Again"
  tunename = "Innocents" % see https://hymnary.org/tune/innocents_parishchoir
  meter = "7. 7. 7. 7."
  poet = "Joseph Swain" % see https://hymnary.org/text/christ_the_lord_will_come_again_swain
  composer = "The Parish Choir, 1850" % see https://hymnary.org/tune/innocents_parishchoir
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

notesAlign = {
\global
\relative a {

  c4. c8 c4 c | c8[ c] c[ c] c2 |
  c4. c8 c4 c | c8[ c] c4 c2 |
  c4. c8 c4 c | c c c4. ~ c8 |
  c4. c8 c8[ c] c[ c] | c4 c4 c2 |

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
      \context NullVoice = aligned { \voiceTwo << \notesAlign >> }
      \context Lyrics = one   \lyricsto aligned \wordsA
      \context Lyrics = two   \lyricsto aligned \wordsB
      \context Lyrics = three \lyricsto aligned \wordsC
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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
