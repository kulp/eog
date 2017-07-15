\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 11
}

\header{
  %children
  hymnnumber = "306"
  title = "Like a Little Wandering Lamb"
  tunename = "Homeward"
  meter = "7. 7. 7. 7."
  poet = "Ter Steegen"
  composer = "Miss A. Gausby"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=110
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  b4 d, d d | e g d2 |
  g4 g g g | a e a2 |
  b4 d, d d | e g d2 |
  e4 e' d g, | b a g2 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 b b b | c c b2 |
  b4 b d d | e c fis2 |
  d4 b b b | c c b2 |
  c4 e g d | g fis d2 |

}
}

notesTenor = {
\global
\relative a {

  g4 g g g | g e g2 |
  d4 d g g | g c c2 |
  b4 g g g | g e g2 |
  g4 c b b | d c b2 |

}
}

notesBass = {
\global
\relative f, {

  g4 g g g | c c g2 |
  g4 g b b | c c d2 |
  g4 g, g g | c c g2 |
  c4 c d d | d d g2 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Like a lit -- tle wan -- d’ring lamb, \bar "."
Lost up -- on the hills I am; \bar "."
Like a shep -- herd Je -- sus stands, \bar "."
Hold -- ing out His bless -- ed hands. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“Come,” He says, “come back to Me;
Lit -- tle lamb, I died for thee;
I will take thee to My home;
Lit -- tle lamb, I pray thee, come.

}

wordsC = \lyricmode {
\set stanza = "3."

“Thou wouldst like to have thy way,
On the lone -- ly hills to stray,
Where the hun -- gry li -- on hides,
Where the fier -- y ser -- pent glides.

}

wordsD = \lyricmode {
\set stanza = "4."

“I would have thee lie at rest,
Lit -- tle lamb, up -- on My breast;
Thou shalt be My sweet de -- light
All the day and all the night.

}

wordsE = \lyricmode {
\set stanza = "4."

“Tho’ thou hast a way -- ward will,
Lit -- tle lamb, I love thee still;
Come to Me and be for -- giv’n;
I will bear thee safe to heaven.”

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
