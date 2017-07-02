\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "19"
  title = "It Is Finished"
  tunename = ""
  meter = "7. 5. 7. 5."
  poet = "James Proctor"
  composer = "Ira D. Sankey"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { c4 c4 c4 c4   | c4. c8 c2      } %

patternBA = { c4 c4 c4 c4   | c1             } %
patternBB = { c4( c4) c4 c4 | c1             } %
patternBC = { c4 ~ c4 c4 c4 | c1             } %

patternCA = { c4. c8 c4 c4  | c4. c8 c4( c4) } %
patternCB = { c4. c8 c4 c4  | c4. c8 c2      } %
patternCC = { c4. c8 c4 c4  | c4 c4 c2      } %
patternCD = { c4. c8 c4 c4  | c4 c4 c4( c4) } %

patternDA = { c4 c4 c4. c8  | c1             } %
patternDB = { c4. c8 c4 c4  | c1             } %

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key a \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { e e e e      | a b cis     }
  \changePitch \patternBA { d d gis, gis | a           }
  \changePitch \patternAA { e e e e      | a b cis     }
  \changePitch \patternBC { d d gis, gis | a           }

  << s^\markup { \small \caps "Refrain"  }
  \changePitch \patternCA { e' d cis b   | a gis fis e } >>
  \changePitch \patternDA { e a b cis    | b           }
  \changePitch \patternCD { cis cis b a  | gis fis e a }
  \changePitch \patternDB { b a cis b    | a           }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { cis cis cis cis | e e e       }
  \changePitch \patternBA { fis fis d d     | cis         }
  \changePitch \patternAA { cis cis cis cis | e e e       }
  \changePitch \patternBC { fis fis d d     | cis         }

  \changePitch \patternCA { cis' b a gis    | fis e d cis }
  \changePitch \patternDA { cis e e e       | e           }
  \changePitch \patternCD { e e d cis       | e d cis e   }
  \changePitch \patternDB { d cis e d       | cis         }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { a a a a     | a gis a }
  \changePitch \patternBA { a b b b     | a       }
  \changePitch \patternAA { a a a a     | a gis a }
  \changePitch \patternBB { a b b b     | a       }

  \changePitch \patternCB { a a a a     | a a a   }
  \changePitch \patternDA { a a gis a   | gis     }
  \changePitch \patternCC { a a a a     | a a a   }
  \changePitch \patternDB { gis a a gis | a       }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { a a a a   | cis e a   }
  \changePitch \patternBA { d, b e e  | a,        }
  \changePitch \patternAA { a a a a   | cis e a   }
  \changePitch \patternBB { d, b e e  | a,        }

  \changePitch \patternCB { a a a a   | a a a     }
  \changePitch \patternDA { a cis e e | e         }
  \changePitch \patternCD { a, a a a  | d d a cis }
  \changePitch \patternDB { e e e e   | a,        }

}
}

Refrain = \lyricmode {

“It is fin -- ished!” Yes, in -- deed, \bar "."
Fin -- ished ev -- ’ry jot. \bar "."
Sin -- ner, this is all you need; \bar "."
Tell me, is it not? \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Noth -- ing, ei -- ther great or small, \bar "."
Noth -- ing, sin -- ner, no; \bar "." \eogbreak
Je -- sus did it, did it all, \bar "."
Long, long a -- go. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

When He, from His loft -- y throne,
Stooped to do and die,
Ev -- ’ry -- thing was ful -- ly done:
{ \mon } Heark -- en { \moff } to His cry–

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Wear -- y, work -- ing, bur -- dened one,
Where -- fore toil you so?
Cease your do -- ing; all was done
Long, long a -- go.

}

wordsD = \lyricmode {
\set stanza = "4."

Till to Je -- sus’ work you cling,
By a sim -- ple faith,
“Do -- ing” is a dead -- ly thing–
{ \mon } “Do -- ing” { \moff } ends in death.

}

wordsE = \lyricmode {
\set stanza = "5."

Cast your dead -- ly “do -- ing” down,
Down at Je -- sus’ feet;
Stand “in Him,” “in Him” a -- lone,
{ \mon } Glo -- rious -- ly { \moff } com -- plete.

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
    >>

		\new Lyrics = one
		\new Lyrics = two
		\new Lyrics = three
		\new Lyrics = four
		\new Lyrics = five

    \new Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
    >>

		\context Lyrics = one   \lyricsto sopranos \wordsA
		\context Lyrics = two   \lyricsto sopranos \wordsB
		\context Lyrics = three \lyricsto sopranos \wordsC
		\context Lyrics = four  \lyricsto sopranos \wordsD
		\context Lyrics = five  \lyricsto sopranos \wordsE
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
