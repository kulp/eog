\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 9
}

\header{
  hymnnumber = "233"
  title = "Now I Have Found a Friend"
  tunename = "Jesus Mine"
  meter = "6. 4. 6. 4. 6. 6. 6. 4."
  poet = "H. Hope"
  composer = "Henry Bennett"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 aes g | g4. e8 f4 |
  f4 g d | f2( ees4) |
  bes'4 c bes | bes4. g8 aes4 |
  aes4 bes f | aes2( g4) |
  ees'4 d c | c4. bes8 bes4 |
  bes4 aes g | g4. aes8 f4 |
  g4 aes bes | d4. c8 aes8[ f] |
  ees4 g4. f8 | ees2. |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 ees ees | ees4. cis8 d4 |
  d4 d bes | d2( ees4) |
  ees4 ees ees | g4. ees8 f4 |
  f4 g d | f2( ees4) |
  c'4 bes aes | aes4. g8 g4 |
  g4 f ees | ees4. f8 d4 |
  ees4 ees ees | ees4. ees8 c4 |
  bes4 ees4. d8 | ees2. |

}
}

notesTenor = {
\global
\relative a {

  bes8[ b] c4 bes4 | bes4. g8 aes4 |
  aes8[ a] bes4 f | aes2( g4) |
  g4 aes g | bes4. bes8 bes4 |
  bes4 bes bes | bes2. |
  aes4 bes c | ees4. ees8 ees4 |
  bes4 c c | bes4. bes8 bes4 |
  bes4 bes bes | aes4. aes8 aes4 |
  g4 bes4. aes8 | g2. |

}
}

notesBass = {
\global
\relative f {

  ees4 ees ees | bes4. bes8 bes4 |
  bes4 bes bes | bes2( ees4) |
  ees4 ees ees | bes4. bes8 bes4 |
  bes4 bes bes | bes2( ees4) |
  aes4 aes aes | ees4. ees8 ees4 |
  g4 aes a | bes4. bes8 bes,4 |
  ees4 f g | aes4. aes8 aes,4 |
  bes4 bes4. bes8 | ees2. |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Now I have found a Friend, \bar "."
Je -- sus is mine; \bar "."
His love will nev -- er end, \bar "."
Je -- sus is mine; \bar "."
Tho’ earth -- ly joys de -- crease, \bar "."
Tho’ hu -- man friend -- ships cease, \bar "."
Now I have last -- ing peace, \bar "."
Je -- sus is mine. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

When earth shall pass a -- way,
Je -- sus is mine;
In the great judg -- ment day,
Je -- sus is mine;
Oh, what a glo -- rious thing
When I be -- hold the King,
On tune -- ful harp to sing,
Je -- sus is mine.

}

wordsC = \lyricmode {
\set stanza = "3."

Fare -- well mor -- tal -- i -- ty!
Je -- sus is mine;
Wel -- come e -- ter -- ni -- ty!
Je -- sus is mine;
He my Re -- demp -- tion is,
Wis -- dom and Right -- eous -- ness,
Life, Light and Ho -- li -- ness,
Je -- sus is mine.

}

wordsD = \lyricmode {
\set stanza = "4."

Fa -- ther, Thy name I bless,
Je -- sus is mine;
Thine was the sov -- ’reign grace,
Je -- sus is mine;
Spir -- it of ho -- li -- ness,
Seal -- ing the Fa -- ther’s grace,
Thou mad’st my soul em -- brace,
Je -- sus is mine.

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
