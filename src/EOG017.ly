\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "17"
  title = "He Comes! He Comes!"
  tunename = "Ostend"
  meter = "C. M. D."
  poet = ""
  composer = "L. Mason"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4 | c4. c8 c4 c4 | c4 c4 c4    } % Line 1 / 3 all
patternAB = { c4 | c4. c8 c4 c4 | c4. c8 c4   } % Line 5 / 7 all
patternAC = { c4 | c4. c8 c4 c4 | c4.( c8 c4) } % Line 6 soprano / alto

patternBA = { c4 | c4. c8 c4 c4 c2. } % Line 2 / 4 / 8 all, Line 6 tenor / bass

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { bes  | g aes bes bes   | c bes bes }
  \changePitch \patternBA { g    | f g aes bes     | g         }
  \changePitch \patternAA { bes  | g aes bes bes   | c bes bes }
  \changePitch \patternBA { g    | f f g f         | ees       }

  \changePitch \patternAB { bes' | ees bes bes ees | ees c c   }
  \changePitch \patternAC { c    | bes f f aes     | g aes bes }
  \changePitch \patternAB { bes  | ees bes bes ees | ees c c   }
  \changePitch \patternBA { c    | bes f g f       | ees       }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees | ees ees ees ees | ees ees ees }
  \changePitch \patternBA { ees | d ees f g       | ees         }
  \changePitch \patternAA { ees | ees ees ees ees | ees ees ees }
  \changePitch \patternBA { ees | ees ees d d     | ees         }

  \changePitch \patternAB { ees | ees ees ees ees | ees aes aes }
  \changePitch \patternAC { aes | f d d f         | ees f g     }
  \changePitch \patternAB { ees | ees ees ees ees | ees aes aes }
  \changePitch \patternBA { aes | f d d d         | ees         }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g   | ees f g g       | aes g g   }
  \changePitch \patternBA { bes | bes bes bes bes | bes       }
  \changePitch \patternAA { g   | ees f g g       | aes g g   }
  \changePitch \patternBA { bes | bes bes bes aes | g         }

  \changePitch \patternAB { g   | g g g g         | c ees ees }
  \changePitch \patternBA { ees | d bes bes bes   | bes       }
  \changePitch \patternAB { g   | g g g g         | c ees ees }
  \changePitch \patternBA { ees | d bes bes aes   | g         }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees | ees ees ees ees  | ees ees ees }
  \changePitch \patternBA { ees | bes bes bes bes  | ees         }
  \changePitch \patternAA { ees | ees ees ees ees  | ees ees ees }
  \changePitch \patternBA { ees | bes bes bes bes  | ees         }

  \changePitch \patternAB { ees | ees ees ees ees  | aes aes aes }
  \changePitch \patternBA { aes | bes bes bes bes, | ees         }
  \changePitch \patternAB { ees | ees ees ees ees  | aes aes aes }
  \changePitch \patternBA { aes | bes bes bes bes, | ees         }

}
}

wordsA = \lyricmode {
\set stanza = "1."

He comes! He comes! the Bride -- groom comes! \bar "."
The “Morn -- ing Star” ap -- pears; \bar "." \eogbreak
The cloud -- less morn -- ing sweet -- ly dawns; \bar "."
Saints, quit this vale of tears; \bar "." \eogbreak
Your ab -- sent Lord no lon -- ger mourn; \bar "."
Re -- proach no lon -- ger bear; \bar "." \eogbreak
He comes! He comes! rise, hap -- py saints, \bar "."
To meet Him in the air. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

He comes! He comes! the Son of Man!
The fi -- nal Ad -- am now;
“The King of kings, and Lord of lords”!
All knees be -- fore Him bow.
He comes! His Is -- rael in the land
Of prom -- ise to in -- stall;
He comes! He comes! to clear a -- way
The ru -- ins of the fall.

}

wordsC = \lyricmode {
\set stanza = "3."

He comes! He comes! the Bride -- groom comes!
O sin -- ner, hear the sound;
Ac -- cept Him now, if you a -- mong
His cho -- sen would be found;
Still mer -- cy’s of -- fered– cost -- less– free–
No lon -- ger turn a -- way;
He comes! He comes! oh, lin -- ger not,
Come while ’tis called “to -- day.”

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
      %\context Lyrics = four  \lyricsto sopranos \wordsD
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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
