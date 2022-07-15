\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG187.ily"
}

\header{
  %children
  hymnnumber = "187"
  title = "Scarlet, Scarlet!" % not found at hymnary.org
  tunename = ""
  meter = "P. M." % something like 10. 11. 10. 11.
  poet = ""
  composer = "Robert Lowry" % inferred ; not found at hymnary.org
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key aes \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  c4 ees c8.[ bes16] aes4 | aes8 bes aes f f4 ees
  g8 g g4 aes8 aes aes4 | bes8 c des c bes2 |
  c4 ees c8.[ bes16] aes4 | aes8 bes aes f f4 ees
  f8 g aes bes c c ees des | c4 bes aes2 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  aes4 aes g aes | f8 e f des des4 c |
  ees8 ees ees4 ees8 ees ees4 | g8 aes bes aes g2 |
  aes4 aes g aes | f8 e f des des4 c |
  des8 ees ees ees ees ees ges f | ees4 g aes2 |

}
}

notesTenor = {
\global
\relative a' {

  ees4 c ees8.[ des16] c4 | aes8 g aes aes aes4 aes |
  bes8 bes des4 c8 c c4 | ees8 ees ees ees ees2 |
  ees4 c ees8.[ des16] c4 | aes8 g aes aes aes4 aes |
  aes8 bes aes g aes aes aes aes | aes4 des c2 |

}
}

notesBass = {
\global
\relative f {

  aes4 aes ees aes | des,8 des des des aes4 aes |
  ees'8 ees ees4 aes8 aes aes4 | ees8 aes g aes ees2 |
  aes4 aes ees aes | des,8 des des des aes4 aes |
  des8 des c ees aes aes c, des | ees4 ees aes,2 |

}
}

wordsA = \lyricmode {

Scar -- let, scar -- let, though your sins be scar -- let, \bar "."
They shall be white as snow in His pre -- cious blood. \bar "."
Crim -- son, crim -- son, though your sins be crim -- son, \bar "."
In His pre -- cious blood they shall be white as wool. \bar "."

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
