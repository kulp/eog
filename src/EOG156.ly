\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  systems-per-page = ##f
}

\header{
  hymnnumber = "156"
  title = "Child of God, by Christ’s Salvation"
  tunename = ""
  meter = "8. 7. 8. 7. D." % original has 8. 7. 8. 7.
  poet = "H. Lyte"
  composer = "E. Gebhart"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key e \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  gis4 gis gis b | b a8[ gis] a4 fis |
  fis4 fis fis8[ gis] a[ b] | cis4 b b2
  gis4 gis gis b | b a8[ gis] a4 fis |
  fis8 gis a b cis4 b | e,2. r4 |

  cis'4 cis cis8[ dis] e[ cis] | b4 b b gis |
  fis4 fis fis8[ gis] a[ b] | cis4 b b2 |
  cis4 cis cis8[ dis] e[ cis] | b4 b b gis |
  fis8 gis a b cis4 b | e,2. r4 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e4 e e gis | gis fis8[ e] fis4 dis |
  dis4 dis dis8[ e] fis[ gis] | e4 e e2 |
  e4 e e gis | gis fis8[ e] fis4 dis |
  dis8 e fis gis dis4 dis | e2. r4 |

  a4 a a a | gis gis gis e |
  dis4 dis dis8[ e] fis[ gis] | e4 e e2 |
  a4 a a a | gis gis gis e |
  dis8 e fis gis dis4 dis | e2. r4 |

}
}

notesTenor = {
\global
\relative a {

  b4 b b e | e b b b |
  b b b b | a gis gis2 |
  b4 b b e | e b b b |
  b8 b b b fis4 a | gis2. r4 |

  e'4 e e8[ b] cis[ e] | e4 e e b |
  a4 a a a | a gis gis2 |
  e'4 e e8[ b] cis[ e] | e4 e e b |
  b8 b b b fis4 a | gis2. r4 |

}
}

notesBass = {
\global
\relative f {

  e4 e e e | e e b b |
  b4 b b b | e e e2 |
  e4 e e e | e e b b |
  b8 b b b b4 b | e2. r4 |

  a4 a a a | e e e e |
  b4 b b b | e e e2 |
  a4 a a a | e e e e |
  b8 b b b b4 b | e2. r4 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Child of God, by Christ’s sal -- va -- tion, \bar "."
Rise o’er sin and fear and care; \bar "."
Joy to find in ev -- ’ry sta -- tion, \bar "."
Some -- thing still to do or bear. \bar "."
Think what Spir -- it dwells with -- in thee, \bar "."
Think what Fa -- ther’s smiles are thine, \bar "."
Think that Je -- sus died to win thee, \bar "."
Child of God, wilt thou re -- pine? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Haste thee on from grace to glo -- ry,
Armed by faith and winged by prayer,
Heaven’s e -- ter -- nal day’s be -- fore thee,
God’s right hand shall guide thee there.
Soon shall close thine earth -- ly mis -- sion,
Soon shall pass thy pil -- grim days,
Hope shall change to glad fru -- i -- tion,
Faith to sight, and prayer to praise.

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
