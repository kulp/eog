\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  \include "override/override-EOG033.ily"
}

\header{
  %gospel
  hymnnumber = "33"
  title = "O Christ, What Burdens Bowed Thy Head!"
  tunename = ""
  meter = "8. 6. 8. 6. 8. 6."
  poet = "Anne Ross Cousin" % see https://hymnary.org/text/o_christ_what_burdens_bowed_thy_head
  composer = "Ira D. Sankey"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8[ c8] | c4. c8 c4. c8 | c4 c4 c4. }
patternAB = { c4      | c4. c8 c4. c8 | c4 c4 c4. }

patternBA = { c8 | c4 c4 c4  c4 | c2. }
patternBB = { c8 | c4 c4 c4. c8 | c2. }

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
\relative c' {

  \changePitch \patternAA { ees g | bes bes bes g | g f ees   }
  \changePitch \patternBA { bes'  | c bes aes f   | g         }
  \changePitch \patternAA { ees g | bes bes bes g | g f ees   }
  \changePitch \patternBA { g     | f bes c d     | bes       }
  \changePitch \patternAB { aes   | g g aes aes   | bes ees c }
  \changePitch \patternBB { c     | bes ees, g f  | ees       }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { ees | g g g ees     | ees d ees   }
  \changePitch \patternBA { ees | ees ees d d   | ees         }
  \changePitch \patternAB { ees | g g g ees     | ees d ees   }
  \changePitch \patternBA { ees | d d ees f     | d           }
  \changePitch \patternAB { d   | ees ees d d   | ees ees ees }
  \changePitch \patternBB { ees | ees ees ees d | ees         }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g bes | ees ees ees bes | bes aes g   }
  \changePitch \patternBA { bes   | aes bes bes bes | bes         }
  \changePitch \patternAA { g bes | ees ees ees bes | bes aes g   }
  \changePitch \patternBA { bes   | bes bes a a     | bes         }
  \changePitch \patternAB { bes   | bes bes bes bes | bes bes aes }
  \changePitch \patternBB { aes   | g g bes aes     | g           }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { ees  | ees ees ees ees | bes bes ees }
  \changePitch \patternBA { g    | aes g f bes,    | ees         }
  \changePitch \patternAB { ees  | ees ees ees ees | bes bes ees }
  \changePitch \patternBA { ees  | f f f f         | bes,        }
  \changePitch \patternAB { bes  | ees ees f f     | g g aes     }
  \changePitch \patternBB { aes, | bes bes bes bes | ees         }

}
}

wordsA = \lyricmode {
\set stanza = "1."

O Christ, what bur -- dens bowed Thy head! \bar "."
Our load was laid on Thee; \bar "." \eogbreak
Thou stood -- est in the sin -- ner’s stead \bar "."
To bear all ill for me. \bar "." \eogbreak
A vic -- tim led, Thy blood was shed; \bar "."
Now there’s no load for me. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Death and the curse were in our cup—
O Christ, ’twas full for Thee;
But Thou hast drained the last dark drop,
’Tis emp -- ty now for me.
That bit -- ter cup— love drank it up;
Left but the love for me.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- ho -- vah lift -- ed up His rod—
O Christ, it fell on Thee;
Thou wast for -- sa -- ken of Thy God;
No dis -- tance now for me.
Thy blood be -- neath that rod has flowed:
Thy bruis -- ing heal -- eth me.

}

wordsD = \lyricmode {
\set stanza = "4."

The tem -- pest’s aw -- ful voice was heard,
O Christ, it broke on Thee;
Thy o -- pen bos -- om was my ward;
It bore the storm for me.
Thy form was scarred, Thy vis -- age marred;
Now cloud -- less peace for me.

}

wordsE = \lyricmode {
\set stanza = "5."

For me, Lord Je -- sus, Thou hast died,
And I have died in Thee;
Thou’rt risen: my bands are all un -- tied,
And now Thou liv’st in me.
The Fa -- ther’s face of ra -- diant grace
Shines now in light on me.

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
