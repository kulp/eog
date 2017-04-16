\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = ##f
  page-count = ##f
}

\header{
  hymnnumber = "7"
  title = "My Hope On Nothing Less Is Built"
  tunename = "Foundation"
  meter = "6-8s."
  poet = "Edward Mote"
  composer = "W. B. Bradbury"
  %copyright = ""
  tagline = ##f
}

patternA = { c4 | c8 c8 c4 c4 | c8 c8 c4 } % all phrases

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \once \override Score.MetronomeMark.transparent = ##t
  \tempo 4 = 66
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { d  | g b d b | b a a   } \bar "."
  \changePitch \patternA { b  | c c c a | g fis g } \bar "."
  \changePitch \patternA { d  | g b d b | b a a   } \bar "."
  \changePitch \patternA { b  | c c c a | g fis g } \bar "."

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternA { d' | d d d d | e e e   } \bar "." >>
  \changePitch \patternA { e  | d b b g | b b a   } \bar "."
  \changePitch \patternA { d, | g g g b | a a g   } \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d | d g g g   | g fis fis }
  \changePitch \patternA { g | g g g e   | d d d     }
  \changePitch \patternA { d | d g g g   | g fis fis }
  \changePitch \patternA { g | g g g e   | d d d     }

  \changePitch \patternA { g | g fis g g | g g g     }
  \changePitch \patternA { g | g d d d   | d d d     }
  \changePitch \patternA { d | d b e d   | d d b     }

}
}

notesTenor = {
\global
\relative a, {


  \changePitch \patternA { d   | b' d b d | d d d   }
  \changePitch \patternA { d   | e e e c  | b a b   }
  \changePitch \patternA { d,  | b' d b d | d d d   }
  \changePitch \patternA { d   | e e e c  | b a b   }

  \changePitch \patternA { b   | b c d b  | c c c   }
  \changePitch \patternA { c   | b g g b  | g g fis }
  \changePitch \patternA { fis | g g g g  | g fis g }

}
}

notesBass = {
\global
\relative f {


  \changePitch \patternA { d | g g g g  | d d d   }
  \changePitch \patternA { g | c, c c c | d d g   }
  \changePitch \patternA { d | g g g g  | d d d   }
  \changePitch \patternA { g | c, c c c | d d g   }

  \changePitch \patternA { g | g a b g  | c, c c  }
  \changePitch \patternA { c | g' g g g | g, b d  }
  \changePitch \patternA { d | b g c g  | d' d g, }

}
}

Refrain = \lyricmode {

  On Christ, the sol -- id Rock, I stand;
  All oth -- er ground is sink -- ing sand,
  All oth -- er ground is sink -- ing sand.

}

wordsA = \lyricmode {
\set stanza = "1."

  My hope on noth -- ing less is built
  Than Je -- sus, and the blood He spilt;
  I dare not trust the sweet -- est frame,
  But whol -- ly lean on His blest name.
}

wordsB = \lyricmode {
\set stanza = "2."

  Should dark -- ness seem to veil His face,
  Un -- changed is He, un -- changed His grace;
  In ev -- ’ry high and storm -- y gale
  Faith’s an -- chor holds with -- in the veil. \break
  \Refrain
}

wordsC = \lyricmode {
\set stanza = "3."

  E -- ter -- nal -- ly His pro -- mise stands,
  My name is gra -- ven on His hands;
  Let all a -- round my soul give way,
  He still a -- bides my last -- ing stay.
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
