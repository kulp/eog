\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  systems-per-page = #(cond (is-eogsized 4) (#t #f))
  system-count = #(cond (is-eogsized 6) (#t #f))
  ragged-last-bottom = ##t
}

\header{
  hymnnumber = "218"
  title = "He Is Coming"
  tunename = ""
  meter = "8. 7. 8. 7. D. with Refrain"
  poet = ""
  composer = "German Melody"
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

  b4. ais8 b4 d, | e4. fis8 g4 d |
  b'4. e8 d4 a | c4. e8 d4( b) |
  b4. ais8 b4 d, | e4. fis8 g4 d |
  b'4. e8 d4 a | c b g2

  g4. fis8 e4. fis8 | g4. e8 d8[ b'] g4 |
  g4. fis8 e4. fis8 | g4 e d r |
  b'4. b8 a4. a8 | b4. a8 a8[ d] a4 |
  a4. d8 fis4 fis | fis e d( c) % !

  b4. ais8 b4 d, | e4. fis8 g4 d |
  b'4. e8 d4 a | c4. e8 d4( b) |
  b4. ais8 b4 d, | e4. fis8 g4 d |
  b'4. e8 d4 a | c b g2 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g4. g8 g4 d | c4. c8 d4 b |
  g'4. g8 g4 a | fis4. fis8 g2 |
  g4. g8 g4 d | c4. c8 d4 b |
  g'4. g8 g4 fis | fis fis d2 |

  e4. d8 c4. c8 | c4. c8 b4 d |
  e4. e8 e4. dis8 | e4 c d r |
  g4. g8 a4. a8 | g4. a8 fis4 fis |
  fis4. fis8 a4 a | a g fis2 |

  g4. g8 g4 d | c4. c8 d4 b |
  g'4. g8 g4 a | fis4. fis8 g2 |
  g4. g8 g4 d | c4. c8 d4 b |
  g'4. g8 g4 fis | fis fis d2 |

}
}

notesTenor = {
\global
\relative a {

  d4. cis8 d4 g, | g4. a8 b4 g |
  d'4. c8 d4 d | d4. d8 d2 |
  d4. cis8 d4 g, | g4. a8 b4 g |
  d'4. c8 d4 d | a4 c b2 |

  g4. g8 g4. g8 | g4. g8 g4 g |
  b4. a8 g4. b8 | b4 c b r |
  d4. d8 d4. d8 | d4. d8 d4 d |
  d4. d8 d4 d | d cis d2 |

  d4. cis8 d4 g, | g4. a8 b4 g |
  d'4. c8 d4 d | d4. d8 d2 |
  d4. cis8 d4 g, | g4. a8 b4 g |
  d'4. c8 d4 d | a4 c b2 |

}
}

notesBass = {
\global
\relative f {

  g4. g8 g4 b, | c4. a8 g4 g |
  g'4. c8 b4 fis | a4. c8 b4( g) |
  g4. g8 g4 b, | c4. a8 g4 g |
  g'4. c8 b4 d, | d d g2 |

  c,4. c8 c4. d8 | e4. c8 g4 b |
  e4. e8 e4. b8 | e4 c g r |
  g'4. g8 fis4. fis8 | g4. fis8 d4 d |
  d4. d8 a'4 a | a a d,2 |

  g4. g8 g4 b, | c4. a8 g4 g |
  g'4. c8 b4 fis | a4. c8 b4( g) |
  g4. g8 g4 b, | c4. a8 g4 g |
  g'4. c8 b4 d, | d d g2 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

He is com -- ing, com -- ing for us; \bar "."
Soon we’ll see His light a -- far, \bar "."
On the dark ho -- ri -- zon ris -- ing, \bar "."
As the bright and morn -- ing Star, \bar "."
Cheer -- ing many a wak -- ing watch -- er, \bar "."
As the star whose kind -- ly ray \bar "."
Her -- alds the ap -- proach -- ing morn -- ing \bar "."
Just be -- fore the break of day. \bar "."
Oh, what joy, as night hangs round us, \bar "."
’Tis to think of morn -- ing’s ray! \bar "."
Sweet to know He’s com -- ing for us, \bar "."
Just be -- fore the break of day. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He is com -- ing, com -- ing for us;
Soon we’ll hear His voice on high;
Dead and liv -- ing, ris -- ing, chang -- ing,
In the twink -- ling of an eye
Shall be caught up all to -- geth -- er,
For the meet -- ing in the air;
With a shout the Lord de -- scend -- ing,
Shall Him -- self a -- wait us there.
Oh, what joy that great fore -- gath -- ’ring,
Tryst -- ed meet -- ing in the air!
Sweet to know He’s com -- ing for us,
Call -- ing us to join Him there.

}

wordsC = \lyricmode {
\set stanza = "3."

He is com -- ing as the Bride -- groom,
Com -- ing to un -- fold at last
The great se -- cret of His pur -- pose,
Mys -- ter -- y of a -- ges past.
And the bride, to her is grant -- ed,
In His beau -- ty then to shine,
As in rap -- ture she ex -- claim -- eth,
“I am His, and He is mine!”
Oh, what joy that mar -- riage un -- ion,
Mys -- ter -- y of love di -- vine!
Sweet to sing in all its full -- ness,
“I am His, and He is mine.”

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
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
