\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "34"
  title = "Salvation Through Christ Jesus"
  tunename = "Missionary"
  meter = "7. 6. 7. 6. D."
  %poet = ""
  composer = "Dr. Lowell Mason"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { c4 | c4 c4 c4 c4 | c2 c4 }
patternAB = { c2 | c4 c4 c4 c4 | c2 c4 }

patternBA = { c4 | c4 c4 c4 c4 | c2( c4) }
patternBB = { c4 | c4 c4 c4 c4 | c2. }
patternBC = { c4 | c4 c4 c8[ c8] c4 | c2( c4) }
patternBD = { c4 | c4 c4 c4 c4 | c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { f | a c c d     | c a }
  \changePitch \patternBA { f | e f bes a   | a g }
  \changePitch \patternAA { f | a c c d     | c a }
  \changePitch \patternBD { g | a d c b     | c   }

  \changePitch \patternAB { c | f c bes a   | d c }
  \changePitch \patternBC { e | f c c bes a | a g }
  \changePitch \patternAA { f | a c c d     | c a }
  \changePitch \patternBB { f | g bes a g   | f   }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c   | f f f f | f f }
  \changePitch \patternBA { f   | c c e f | f e }
  \changePitch \patternAA { c   | f f f f | f f }
  \changePitch \patternBD { e   | f a g f | e   }

  \changePitch \patternAB { f   | f f e f | f f }
  \changePitch \patternBA { bes | a f g f | f e }
  \changePitch \patternAA { f   | f g f f | f f }
  \changePitch \patternBB { c   | d g f e | f   }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { a | c a a bes   | a c   }
  \changePitch \patternBB { c | c c c c     | c     }
  \changePitch \patternAA { a | c a a bes   | a c   }
  \changePitch \patternBD { c | c f e d     | c     }

  \changePitch \patternAB { a | a c c c     | bes c }
  \changePitch \patternBB { c | c a g c     | c     }
  \changePitch \patternAA { a | c g a bes   | a c   }
  \changePitch \patternBB { c | bes d c bes | a     }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f | f f f f    | f f   }
  \changePitch \patternBB { a | bes a g f  | c     }
  \changePitch \patternAA { f | f f f f    | f f   }
  \changePitch \patternBD { c | f d g g    | c,    }

  \changePitch \patternAB { f | f a g f    | bes a }
  \changePitch \patternBB { g | f f e f    | c     }
  \changePitch \patternAA { f | f e f f    | f f   }
  \changePitch \patternBB { a | bes g c c, | f     }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Sal -- va -- tion thro’ Christ Je -- sus! \bar "."
En -- dear -- ing, pre -- cious sound! \bar "." \break
Shout, shout the word “sal -- va -- tion” \bar "."
To earth’s re -- mot -- est bound— \bar "." \break
Sal -- va -- tion for the guilt -- y, \bar "."
Sal -- va -- tion for the lost; \bar "." \break
Sal -- va -- tion for the wretch -- ed, \bar "."
The sad and tem -- pest tossed. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Sal -- va -- tion for the a -- ged,
Sal -- va -- tion for the young,
Sal -- va -- tion e’en for chil -- dren,
Pro -- claim with joy -- ful tongue;
Sal -- va -- tion for the wealth -- y,
Sal -- va -- tion for the poor,
Sal -- va -- tion for the low -- ly,
Yes, life for -- ev -- er -- more!

}

wordsC = \lyricmode {
\set stanza = "3."

Sal -- va -- tion with -- out mon -- ey,
Sal -- va -- tion with -- out price,
Sal -- va -- tion with -- out la -- bor—
Be -- liev -- ing doth suf -- fice:
Sal -- va -- tion now, this mo -- ment;
Then why, O, why de -- lay?
You may not see to -- mor -- row,
Now is sal -- va -- tion’s day.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
