\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG366.ily"
}

\header{
  %children
  hymnnumber = "366"
  title = "We Are Little Children, Very Young Indeed"
  tunename = "Portbrush"
  meter = "6. 5. 6. 5. D." % original has 11. 11. 11. 12.
  poet = "Fanny J. Crosby" % see https://hymnary.org/text/we_are_little_children_very_young_indeed
  composer = "Hubert P. Main" % see https://hymnary.org/tune/we_are_little_children_very_young_main
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=140
  \key d \major
  \autoBeamOff
}

patternA = { c8 c c c | c4 c | c8 c c c | c2 | }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { a g fis g | a fis | e fis g a | fis }
  \changePitch \patternA { b d cis b | a fis | e a gis b | cis }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternA { d d cis b | a fis | b a g fis | e } >>
  fis8 g a d | cis b a[ g] | fis fis g e | d2 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { fis e d e | fis d | cis d e fis | d }
  \changePitch \patternA { g b a g | fis d | cis cis d d | cis }

  \changePitch \patternA { fis fis a g | fis d | g fis e d | cis }
  d8 e fis fis | a g fis[ e] d d e cis | d2 |

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a a a a | d a | a a a a | a }
  \changePitch \patternA { b b cis d | d a | a a b gis | a }

  \changePitch \patternA { a a b cis | d a | g d' b e, | a }
  a8 a d a | b d b4 | a8 a a g | fis2 |

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { d d d d | d d | a a a a | d }
  \changePitch \patternA { g, g g g | d' d | e e e e | a }

  \changePitch \patternA { d, d d d | d d | g, g g gis | a }
  d8 d d d | g, g g4 | a8 a a a | d2 |

}
}

Refrain = \lyricmode {

If we seek Him ear -- ly, \bar "."
If we come to -- day, \bar "."
We can be His lit -- tle friends, \bar "."
He has said we may. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

We are lit -- tle chil -- dren, ver -- y young in -- deed, \bar "."
But the Sav -- iour’s prom -- ise each of us may plead. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Lit -- tle friends of Je -- sus, what a hap -- py thought!
What a pre -- cious prom -- ise in the Bi -- ble taught!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Lit -- tle friends of Je -- sus, walk -- ing by His side,
With His arms a -- round us, ev -- ’ry step to guide.

}

wordsD = \lyricmode {
\set stanza = "4."

We should love Him dear -- ly with a con -- stant love;
Soon we’ll go and see Him in our home a -- bove.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
