\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 5) (#t #f))
}

\header{
  %children
  hymnnumber = "349"
  title = "News for Little Children"
  tunename = "St. Gertrude" % original has all caps
  meter = "6. 5. 6. 5. 6. 5. D."
  poet = ""
  composer = "Sir Arthur Sullivan"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key e \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  b4 b b b | b4.( cis8) b2 |
  fis4 fis e fis | gis1 |
  e4 gis b e | e2 dis |
  cis4 cis gis ais | b1 |
  fis4 fis b fis | gis4.( a8) gis2 |
  b4 b e b | cis1 |
  cis4 b a b | cis( b) a( b) |
  cis4 b a gis | fis1 |

  \eogbreak
  e4^\markup { \small \caps "Refrain" } e e e | e( dis8)[ cis] dis4( e) |
  fis4 fis fis e8[ fis] | gis1 |
  b4 b e dis | e2 b |
  a4 gis fis4. e8 | e1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  gis4 gis gis gis | a2 a |
  dis,4 dis cis dis | e1 |
  e4 e e e | fis2 fis |
  e4 e e e | dis1 |
  dis4 dis fis dis | e4.( fis8) e2 |
  e4 e e e | e1 |
  e4 e e e | e2 e | e4 e fis e | dis1 |

  b4 b b b | b2 b |
  b4 b b b | b1 |
  gis'4 gis a a | gis2 e |
  e4 e dis4. e8 | e1 |

}
}

notesTenor = {
\global
\relative a {

  e4 gis b e | e2 dis |
  b4 b b b | b1 |
  b4 b b b | b4.( cis8) b2 |
  ais4 ais b cis | b1 |
  b4 b b b | b2 b |
  gis4 gis b gis | a1 |
  a4 gis a gis | a( gis) a( gis) |
  a4 gis fis fis | b1 |

  gis4 gis gis gis | a2 a |
  a4 a a a | gis( e gis b) |
  e4 e b b | b2 b |
  cis4. b8 a4. gis8 | gis1 |

}
}

notesBass = {
\global
\relative f {

  e4 e e e | fis2 b, |
  a'4 a gis fis | e1 |
  gis4 gis gis gis | fis2 fis |
  fis4 fis fis fis | b,1 |
  b4 b dis b | e2 e |
  e4 e gis e | a1 |
  a4 e cis e | a( e) cis( e) |
  a,4 a a ais | b1 |

  e4 b e b | fis'( b,) fis'( b,) |
  dis4 b dis b | e1 |
  e4 e fis fis | gis2 gis, |
  a4 fis b4. e8 | e1 |

}
}

Refrain = \lyricmode {

Lis -- ten to the mes -- sage, \bar "." % original has "List -- en"
Pre -- cious words and true– \bar "."
Joy and peace and par -- don \bar "."
God is of -- fering you. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

News for lit -- tle chil -- dren! \bar "."
Oh! how sweet the sound, \bar "."
Roll -- ing in its full -- ness \bar "."
To earth’s far -- thest bound! \bar "."
News of God’s sal -- va -- tion, \bar "."
Bless -- ings from a -- bove, \bar "."
Sav -- ing, help -- ing, cheer -- ing– \bar "."
Words of life and love. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Love for lit -- tle chil -- dren!
Sent from God’s own throne;
Love! how sweet the ti -- dings
Each can make his own;
Love that mak -- eth hap -- py,
Love that mak -- eth blest,
Love that gives the wear -- y % original has "wear -- y"
Full and per -- fect rest.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Peace for lit -- tle chil -- dren!
Peace from God on high,
Brought by Christ the Sav -- iour,
When He came to die;
Made in Cal -- v’ry’s dark -- ness,
Sealed with Je -- sus’ blood;
To the world pro -- claim it–
Per -- fect peace with God.

}

wordsD = \lyricmode {
\set stanza = "4."

Joy for lit -- tle chil -- dren!
Per -- fect joy so true,
Not like the at -- trac -- tions
This world of -- fers you,
But a joy that rest -- eth
On foun -- da -- tion sure,
Joy– for God hath said it–
Which must e’er en -- dure.

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
