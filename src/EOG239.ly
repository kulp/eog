\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "239"
  title = "Midst the Darkness, Storm and Sorrow"
  tunename = ""
  meter = "8. 5. 8. 5. D."
  poet = "Frances Bevan"
  composer = "J. Revell"
  tagline = ##f
}

ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key e \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e4. fis8 gis4 a | b cis cis b |
  b4. gis8 e2 | fis2 gis |
  cis4. b8 b4 a | b4. a8 a4 gis |
  fis4 b b ais | b1 |
  e4. dis8 dis4 cis | dis4. cis8 cis4 b |
  cis4. b8 b4 a | fis1 |
  e4 e fis fis | gis gis a \tb cis\fermata \ta |
  b4 gis gis4. fis8 | e1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  b4. dis8 e4 e | e e e e |
  e4. e8 e2 | dis e |
  e4 eis fis fis | fis dis e e |
  dis fis e e | dis1 |
  e4 gis a a | a a gis gis |
  gis4 eis eis fis | dis1 |
  cis4 cis dis dis | e e e e |
  e4 e dis4. dis8 | b1 |

}
}

notesTenor = {
\global
\relative a {

  gis4. a8 b4 cis | gis a a gis |
  gis4. gis8 gis4( ais) | b2 b |
  cis4 cis cis cis | b b b b |
  b4 dis cis cis | b1 |
  b4 e e e | b b b e |
  cis4 cis cis cis | b2( a) |
  gis4 gis b b | b b a a |
  gis4 b a4. a8 | gis1 |

}
}

notesBass = {
\global
\relative f {

  e4. e8 e4 e | e a, cis e |
  e4. e8 cis2 | b e |
  a4 gis fis e | dis b e e |
  fis4 fis fis fis | b,1 |
  gis'4 e a fis | fis b, e e |
  eis cis fis fis | b,1 |
  cis4 cis b b | e d cis a\fermata |
  b4 b b b | e1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Midst the dark -- ness, storm, and sor -- row, \bar "." % TODO Oxford comma here is not present in title
One bright gleam I see;
Well I know, the bless -- ed mor -- row,
Christ will come for me.
Midst the light, and peace, and glo -- ry,
Of the Fa -- ther’s home;
Christ for me is watch -- ing, wait -- ing,
Wait -- ing till I come.

}

wordsB = \lyricmode {
\set stanza = "2."

There, a -- midst the songs of heav -- en,
Sweet -- er to His ear,
Is the foot -- fall thro’ the des -- ert,
Ev -- er draw -- ing near.
There made read -- y are the man -- sions,
Glo -- rious, bright and fair;
But the Bride the Fa -- ther gave Him
Still is want -- ing there.

}

wordsC = \lyricmode {
\set stanza = "3."

He and I to -- geth -- er en -- t’ring
Those bright courts a -- bove;
He and I to -- geth -- er shar -- ing
All the Fa -- ther’s love.
Where no shade or stain can en -- ter,
Nor the gold be dim,
In that ho -- li -- ness un -- sul -- lied,
I shall walk with Him.

}

wordsD = \lyricmode {
\set stanza = "4."

Meet com -- pan -- ion then for Je -- sus,
From Him, for Him made;
Glo -- ry of God’s grace for -- ev -- er
There in me dis -- played.
He and I in that bright glo -- ry
One deep joy shall share:
Mine, to be for -- ev -- er with Him;
His, that I am there.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
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
