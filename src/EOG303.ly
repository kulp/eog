\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  hymnnumber = "303"
  title = "Jesus Christ Is Passing By"
  tunename = "Mozart"
  meter = "7. 7. 7. 7."
  poet = ""
  composer = "Mozart"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 g4 | fis2 d4 | c'2 c4 | b2. |
  d2 b4 | d( c) a | g2 b4 | a2. |
  g2 g4 | fis4.( e8) d4 | c'2 c4 | b2. |
  d2 b4 | a( c) e | g,2 fis4 | g2. |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 d4 | d2 d4 | d( fis) a | g2. |
  g2 g4 | d2 d4 | d2 d4 | d2. |
  b4( d) b | d2 d4 | d( fis) a | g2. |
  g2 f4 | e2 e4 | d2 d4 | d2. |

}
}

notesTenor = {
\global
\relative a {

  b2 b4 | c2 fis,8[ g] | a4( d) d | d2. |
  d2 d4 | c2 c4 | b2 g4 | fis2. |
  g2 g4 | a4.( g8) fis8[ g] | a4( d) d | d2. |
  d2 d4 | c2 a4 | b2 c4 | b2. |

}
}

notesBass = {
\global
\relative f {

  g2 g4 | a2 d,8[ e] | fis4( d) fis | g2. |
  b2 g4 | a2 fis4 | g2 g,4 | d'2. |
  g,4( b) g | d'2 d8[ e] | fis4( d) fis4 | g2. |
  b2 gis4 | a2 c,4 | d2 d4 | g2. |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus Christ is pass -- ing by; \bar "."
Child, now lift to Him thine eye; \bar "."
As the pre -- cious mo -- ments flee, \bar "."
See, His mer -- cy waits for thee. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Lo! He stands and calls to thee,
“What wilt thou then have of Me?”
Rise and tell Him all thy need,
Come, He call -- eth thee, in -- deed.

}

wordsC = \lyricmode {
\set stanza = "3."

O! how sweet the love and peace,
Shin -- ing in the Sav -- iour’s face;
Je -- sus gives from sin re -- lease,
He can save and give thee peace.

}

wordsD = \lyricmode {
\set stanza = "4."

Je -- sus calls to you, dear one,
“Ev -- ’ry -- thing is full -- y done;
Come to Me, re -- ceive My love,
Come and live with Me a -- bove.”

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
