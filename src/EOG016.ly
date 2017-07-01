\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "16"
  title = "God in Mercy Sent His Son"
  tunename = "Herald Angels"
  meter = "8-7s."
  poet = "H. K. Burlingham"
  composer = "Mendelssohn"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4 c4 | c4. c8 c4 c4 | c4( c4) } % Line 1 soprano / alto / bass, Line 3 soprano
patternAB = { c4 c4 | c4. c8 c4 c4 | c2 } % Line 1 tenor, Line 2 soprano, Line 3 tenor, Line 4 soprano / alto / tenor
patternAC = { c4 c8[ c8 ] | c4. c8 c4 c4 | c2 } % Refrain line 4 soprano

patternBA = { c4 c4 | c4 c4 c4 c4 | c2 } % Line 2 alto, Line 3 alto / bass, Line 4 bass, Refrain line 1 / 2 tenor / bass, Refrain line 3 tenor, Refrain line 4 bass
patternBB = { c4 c4 | c4 c4 c4 c4 | c4( c4) } % Refrain line 1 / 2 soprano / alto, Refrain line 3 bass
patternBC = { c4. c8 | c4 c4 c4 c4 | c2 } % Refrain line 3 soprano

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d g   | g fis g b   | b a }
  \changePitch \patternAB { d d   | d c b a     | b   }
  \changePitch \patternAA { d, g  | g fis g b   | b a }
  \changePitch \patternAB { d a   | a fis fis e | d   }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBB { d' d  | d g, c b    | b a } >>
  \changePitch \patternBB { d d   | d g, c b    | b a }
  \changePitch \patternBC { e' e  | e d c b     | c   }
  \changePitch \patternAC { a b c | d g, g a    | g   }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d    | d d d g       | g fis }
  \changePitch \patternBA { g fis  | e a g fis     | g     }
  \changePitch \patternBA { d d    | d d b g'      | g     }
  \changePitch \patternAB { fis e  | fis d d cis   | d     }

  \changePitch \patternBB { d d    | d g a g       | g fis }
  \changePitch \patternBB { d d    | d g a g       | g fis }
  \changePitch \patternBA { c' c   | c b a gis     | a     }
  \changePitch \patternAB { d, fis | g d d <d fis> | d     }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { b b  | b a g d' | d   }
  \changePitch \patternBA { d d  | e e d d  | d   }
  \changePitch \patternAB { b b  | b a g d' | e   }
  \changePitch \patternAB { b a  | a a b g  | fis }

  \changePitch \patternBA { d' d | d d d d  | d   }
  \changePitch \patternBA { d d  | d d d d  | d   }
  \changePitch \patternBA { e e  | e d c b  | c   }
  \changePitch \patternAB { d d  | d b b c  | b   }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternBA { g g    | g d b g    | d'   }
  \changePitch \patternBA { b b    | c c d d    | g,   }
  \changePitch \patternBA { g' g   | g d e d    | cis  }
  \changePitch \patternBA { b cis! | d fis, g a | d    }

  \changePitch \patternBA { d' d   | d b fis g  | d    }
  \changePitch \patternBA { d' d   | d b fis g  | d    }
  \changePitch \patternBB { c' c   | c b a gis  | a g! }
  \changePitch \patternBA { fis c' | b g d d    | g    }

}
}

notesLower = {
\global
\relative f {

  \repeat unfold 48 \skip 4
  \override NoteHead.font-size = #-4
  c2 | c2 c4 e4

}
}

Refrain = \lyricmode {

Oh, the glo -- ry of the grace, \bar "."
Shin -- ing in the Sav -- iour’s face! \bar "." \eogbreak
Tell -- ing sin -- ners from a -- bove, \bar "."
“God is light” and “God is love.” \bar "." \eogbreak

}

wordsA = \lyricmode {
\set stanza = "1."

God in mer -- cy sent His Son \bar "."
To a world by sin un -- done; \bar "." \eogbreak
Je -- sus Christ was cru -- ci -- fied– \bar "."
’Twas for sin -- ners Je -- sus died. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Sin and death no more shall reign,
Je -- sus died, and lives a -- gain!
In the glo -- ry’s high -- est height,
See Him, God’s su -- preme de -- light.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

All who in His name be -- lieve
Ev -- er -- last -- ing life re -- ceive;
Lord of all is Je -- sus now,
Ev -- ’ry knee to Him must bow.

}

wordsD = \lyricmode {
\set stanza = "4."

Christ the Lord will come a -- gain,
He who suf -- fered once will reign,
Ev -- ’ry tongue at last will own,
“Je -- sus Christ is Lord” a -- lone.

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
      % TODO share stems properly
      %\context Voice = loweryet { \voiceFour << \notesLower >> }
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
