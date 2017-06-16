\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
  system-count = #(cond (is-eogsized 6) (#t #f))
  systems-per-page = ##f
}

\header{
  %gospel
  hymnnumber = "12"
  title = "God Loved the World So Tenderly"
  tunename = ""
  meter = "C. M. with Refrain"
  poet = "Fanny J. Crosby"
  composer = "W. J. Kirkpatrick"
  %copyright = ""
  tagline = ##f
}

patternA = { c4 | c8 c8 c4. c8 | c8 c8 c4 } % Line 1, 3 soprano / alto / tenor / bass
patternB = { c4 | c4. c8 c8 c8 | c2       } % Line 2 soprano / alto / tenor / bass
patternC = { c4 | c4. c8 c8 c8 | c2 c8    } % Line 4 soprano / alto / tenor / bass

patternD = { c8 | c4 c8 c8[ c8] c8 | c4. ~ c4 c16 c16 | c4 c8 c8[ c8] c8 | c4. ~ c4 } % Refrain line 1 soprano
patternE = { c8 | c4 c8 c8[ c8] c8 | c4. ~ c4 c16 c16 | c4 c8 c4      c8 | c4. ~ c4 } % Refrain line 1 alto / bass
patternF = { c8 | c4 c8 c4      c8 | c4. ~ c4 c16 c16 | c4 c8 c8[ c8] c8 | c4. ~ c4 } % Refrain line 1 tenor

patternG = { c8 | c4 c8 c8 c8 c8 | c8 c8 c8 c4 c8                } % Refrain line 2 all
patternH = { c4. c4. | c8 c4 ~ c4 c8 | c4. c4. | c8 c4 ~ c4      } % Refrain line 3 all
patternI = { c8 | c4 c8 c8 c8 c8 | c8 c8 c8 c4.                  } % Refrain line 4 all
patternJ = { c4. c4. | c8 c4 ~ c4 c8 | c8 c8 c8 c4 c8 | c4. ~ c4 } % Refrain line 5 all

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \once \override Score.MetronomeMark.transparent = ##t
  \tempo 4 = 86
  \key a \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  << s^\markup { \small \caps "Solo." \italic "ad lib." }
  \changePitch \patternA { e   | e a a e       | gis fis fis } >>
  \changePitch \patternB { fis | e cis b d     | cis         }
  \changePitch \patternA { e   | e a cis b     | b a a       }
  \changePitch \patternC { fis | e gis gis fis | e r         }

  << s^\markup { \small \caps "Refrain" }
  \time 6/8
  \set Timing.measurePosition = #(ly:make-moment -1 8)
  \changePitch \patternD { e     | e a a gis a        | b b e, e    | b' b b a b  | cis cis } >>
  \changePitch \patternG { e,    | cis' cis cis b cis | e d d d r   }
  \changePitch \patternH { cis a | b b b r            | a a         | gis gis gis }
  \changePitch \patternI { gis   | fis fis a gis fis  | fis e e e   }
  \changePitch \patternJ { a b   | cis cis cis a      | b b b a gis | a a         }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { cis | cis cis cis cis | e d d       }
  \changePitch \patternB { d   | cis a gis b     | a           }
  \changePitch \patternA { cis | cis cis e eis   | fis fis fis }
  \changePitch \patternC { d   | b e dis dis     | e r         }

  \changePitch \patternE { e   | cis cis cis d e | e e e e           | e e e e     | e e }
  \changePitch \patternG { cis | e e e d e       | fis fis fis fis r }
  \changePitch \patternH { e e | e e e r         | cis fis           | eis eis eis }
  \changePitch \patternI { eis | fis d fis e d   | d cis cis cis     }
  \changePitch \patternJ { e e | e e e e         | fis fis fis e e   | e e         }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a | a e e a     | a a a     }
  \changePitch \patternB { a | a e e e     | e         }
  \changePitch \patternA { a | a a a gis   | fis fis a }
  \changePitch \patternC { a | gis gis b a | gis r     }

  \changePitch \patternF { e     | a e e a       | gis gis gis gis | gis gis gis fis gis | a a }
  \changePitch \patternG { a     | a a a a a     | a a a a r       }
  \changePitch \patternH { a a   | gis gis gis r | a cis           | cis cis cis         }
  \changePitch \patternI { b     | a a a a a     | a a a a         }
  \changePitch \patternJ { a gis | a a a cis     | d d d cis b     | cis cis             }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { a | a a a a   | d d d }
  \changePitch \patternB { d | e e e e   | a,    }
  \changePitch \patternA { a | a a a cis | d d d }
  \changePitch \patternC { d | b b b b   | e r   }

  \changePitch \patternE { e             | a, a a b cis | e e e e    | e e e e           | a a }
  \changePitch \patternG { a             | a a a a a    | d, d d d r }
  \changePitch \patternH { a cis         | e e e r      | fis fis    | cis cis cis       }
  \changePitch \patternI { cis d d d d d | a a a a      }
  \changePitch \patternJ { cis e         | a a a a      | d, d d e e | < a a, > < a a, > }

}
}

Refrain = \lyricmode {

For God so loved the world that He gave His on -- ly Son, \bar "."
That who -- so -- ev -- er be -- liev -- eth in Him \bar "."
Should not per -- ish, should not per -- ish; \bar "."
That who -- so -- ev -- er be -- liev -- eth in Him \bar "."
Should not per -- ish, but have ev -- er -- last -- ing life. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

God loved the world so ten -- der -- ly, \bar "."
His on -- ly Son He gave, \bar "." \break
That all who on His name be -- lieve, \bar "."
Its won -- drous pow’r will save. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

O, love that on -- ly God can feel,
And on -- ly He can show!
Its height and depth, its length and breadth,
Nor heav’n nor earth can know!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Why per -- ish, then ye care -- less ones?
Why slight the gra -- cious call?
Why turn from Him whose words pro -- claim
E -- ter -- nal life to all?

}

wordsD = \lyricmode {
\set stanza = "4."

O Sav -- iour, melt these hearts of theirs,
And teach them to be -- lieve
That who -- so -- ev -- er comes to Thee,
Shall end -- less life re -- ceive.

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
