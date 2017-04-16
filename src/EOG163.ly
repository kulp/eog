\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  hymnnumber = "163"
  title = "Guide Us, O Thou Gracious Saviour"
  tunename = "Mannheim"
  meter = "8. 7. 8. 7. 4. 7."
  poet = "W. Williams"
  composer = "From Friedrich Filitz"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key e \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e2 gis b b | cis b a gis |
  gis2 a b e, | gis fis e1 |
  b'2 b cis b | d cis cis b |
  b2 fis gis cis | b ais b1 |
  e,2 gis b b | cis b a gis |
  gis2 a b e, | gis fis e1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  b2 e fis e | e dis e e |
  e2 fis fis e | e dis e1 |
  e2 e e e | e e e e |
  fis2 dis e gis | fis e dis1 | 
  b2 e fis e | e dis e e |
  e2 fis fis e | e dis e1 |

}
}

notesTenor = {
\global
\relative a {

  gis2 b b gis | a fis e e |
  cis'2 cis b gis | b a gis1 |
  gis2 gis a gis | b a a gis |
  b2 b b e | dis cis b1 |
  gis2 b b gis | a fis e e |
  cis'2 cis b gis | b a gis1 |

}
}

notesBass = {
\global
\relative f {

  e2 e dis e | a, b cis e |
  cis2 fis dis e | b b e1 |
  e2 e e e | gis a e e |
  dis b e cis | fis fis b,1 |
  e2 e dis e | a, b cis e |
  cis2 fis dis e | b b e1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Guide us, O Thou gra -- cious Sav -- iour, \bar "."
Pil -- grims thro’ this bar -- ren land; \bar "."
We are weak, but Thou art might -- y; \bar "."
Hold us with Thy power -- ful hand. \bar "."
Bread of heav -- en,
%{HIDE>%} Bread of heav -- en! %{<HIDE%} \bar "."
Feed us now and ev -- er -- more. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

While we tread this vale of sor -- row,
May we in Thy love a -- bide;
Keep us ev -- er, gra -- cious Sav -- iour,
Cleav -- ing close -- ly to Thy side;
Still re -- ly -- ing,
%{HIDE>%} still re -- ly -- ing, %{<HIDE%}
On the Fa -- ther’s change -- less love.

}

wordsC = \lyricmode {
\set stanza = "3."

Sav -- iour, come, we long to see Thee,
Long to dwell with Thee a -- bove,
And to know in full com -- mun -- ion
All the sweet -- ness of Thy love.
Come, Lord Je -- sus,
%{HIDE>%} come, Lord Je -- sus, %{<HIDE%}
Take Thy wait -- ing peo -- ple home.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
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

\noPageBreak

\markup { \fill-line { \lower #4 \line { Alternate tunes: No.’s 190, 191, 291. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
