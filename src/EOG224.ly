\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  hymnnumber = "224"
  title = "He Is Coming! — Who Is Coming?"
  tunename = "Regent Square"
  meter = "8. 7. 8. 7. 8. 7."
  poet = ""
  composer = "Henry Smart"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 e c' g | e'2. d4 c2 g |
  a2 a g c | g f e1 |
  g2 e c' g | e'2. d4 c2 b |
  c2 b a b4( c) | b2 a g1 |
  d'2. d4 b2 g | e'2. d4 c2 a |
  f'2 e d c | c b c1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e2 c g' e | g2. g4 g2 g |
  c,2 c c c | d b c1
  e2 c g' g4( f) | e2. f4 e2 e |
  e2 e e e | g fis g1 |
  g2. g4 g2 g | g2. e4 f2 f |
  a2 g f e4( a) | g2. f4 e1 |

}
}

notesTenor = {
\global
\relative a {

  c2 g g c | c2. b4 c2 c |
  a2 c g a | g g g1 |
  c2 c g g | c2. b4 a2 gis |
  a2 gis e' d4( c) | b2 c b1 |
  b2. b4 d2 b | c2. bes4 a2 c |
  d2 g, a4( b) c2 | d2 d c1 |

}
}

notesBass = {
\global
\relative f {

  c2 c e c | g'2. f4 e2 e |
  f2 f e a, | b g c1 |
  c'2 g e e4( d) | c2. d4 e2 e |
  a2 e c a | d d g,1 |
  g'2. g4 g2 g | c,2. c4 f2 f |
  d2 e f4( g) a2 | g g, c1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

He is com -- ing!– Who is com -- ing? \bar "."
Is it One whom I shall fear? \bar "."
No!– the bless -- ed Sav -- iour, Je -- sus– \bar "."
He who suf -- fered for me here; \bar "."
He is com -- ing! %{HIDE>%} He is com -- ing! %{<HIDE%} \bar "."
In the clouds He will ap -- pear. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

O, how hap -- py!– those who love Him,
All His beau -- ty then shall see;
And the glo -- rious sight will make them
Bright and beau -- ti -- ful as He,–
In a mo -- ment, %{HIDE>%} in a mo -- ment, %{<HIDE%}
Like their Sav -- iour they will be.

}

wordsC = \lyricmode {
\set stanza = "3."

He will take them up to heav -- en,
From this world and sin a -- part,
There His Fa -- ther will re -- ceive them
To His home and to His heart,–
In His glo -- ry, %{HIDE>%} in His glo -- ry, %{<HIDE%}
Nev -- er -- more from Him to part.

}

wordsD = \lyricmode {
\set stanza = "4."

Hap -- py peo -- ple who are wait -- ing
For that bright and joy -- ful day,
Know -- ing Je -- sus as their Sav -- iour,
They can watch for Him and say,
“Come, Lord Je -- sus! %{HIDE>%} come, Lord Je -- sus! %{<HIDE%}
Take Thy wait -- ing saints a -- way.”

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
      \set Staff.autoBeaming = ##f
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
