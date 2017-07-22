\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "20"
  title = "Jesus of Nazareth Passeth By"
  tunename = ""
  meter = "P. M."
  poet = "Emma Campbell"
  composer = "T. E. Perkins"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=86 }
tb = { \tempo 4=43 }

patternAA = { \ta c8 | c4 c8 c4 c8      | c4 c8 \tb c4 \ta } %
patternAB = { \ta c8 | c4 c8 c4 c8      | c4 c8 c4.        } %

patternBA = { \ta c8 | c4 c8 c8.[ c16] c8 | c4 c8 c4       } %
patternBB = { \ta c8 | c4 c8 c4 c8      | c4 c8 c4         } %

patternCA = { \ta c8. c16 c8 c8. c16 c8 | c4 c8 c4 } %
patternCB = { \ta c8. c16 c8 c8 c8 c8   | c4 c8 c4 } %

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d  | d g g a     | b c d\fermata }
  \changePitch \patternBA { e  | d b g fis g | a b a }
  \changePitch \patternAA { d, | d g g a     | b c d\fermata }
  \changePitch \patternBA { e  | d b g fis g | b a g }

  \changePitch \patternAB { b              | a b c a | b c d }
  \changePitch \patternCA { g, g g g fis g | a b a   }
  \changePitch \patternAB { d,             | d g g a | b c d }
  \changePitch \patternCB { d e d d b g    | b a g   }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d | d d d fis | g g g     }
  \changePitch \patternBB { g | g g d d   | fis g fis }
  \changePitch \patternAA { d | d d d fis | g g g     }
  \changePitch \patternBB { g | g g d d   | g fis g   }

  \changePitch \patternAB { g           | fis g a fis | g g g }
  \changePitch \patternCA { d d d d d g | fis g fis   }
  \changePitch \patternAB { d           | d d d fis   | g g g }
  \changePitch \patternCB { g g g g g g | g fis g     }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b | b b b d   | d a b }
  \changePitch \patternBA { c | b d d c b | d d d }
  \changePitch \patternAA { c | b b b d   | d a b }
  \changePitch \patternBA { c | b d d c b | d c b }

  \changePitch \patternAB { d           | d d d d | d a b }
  \changePitch \patternCA { b b b d c b | d d d   }
  \changePitch \patternAB { c           | b b b d | d a b }
  \changePitch \patternCB { b c b b d b | d c b   }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g | g g g d   | g g g_\fermata }
  \changePitch \patternBA { g | g g b a g | d d d  }
  \changePitch \patternAA { d | g g g d   | g g g_\fermata }
  \changePitch \patternBA { g | g g b a g | d d g, }

  \changePitch \patternAB { g'          | d d d d | g g g }
  \changePitch \patternCA { g g g b a g | d d d   }
  \changePitch \patternAB { fis g g g d | g g g   }
  \changePitch \patternCB { g g g g g g | d d g,  }

}
}

wordsA = \lyricmode {
\set stanza = "1."

What means this ea -- ger, anx -- ious throng, \bar "."
Which moves with bus -- y haste a -- long, \bar "." \eogbreak
These won -- drous gath -- ’rings day by day? \bar "."
What means this strange com -- mo -- tion, pray? \bar "." \eogbreak
In ac -- cents hushed the throng re -- ply, \bar "."
“Je -- sus of Naz -- a -- reth pass -- eth by.” \bar "." \eogbreak
In ac -- cents hushed the throng re -- ply, \bar "."
“Je -- sus of Naz -- a -- reth pass -- eth by.” \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus! ’tis He who once be -- low
Man’s path -- way trod, mid pain and woe;
And bur -- dened ones, wher -- e’er He came,
Brought out their sick, and deaf, and lame.
The blind re -- joiced to hear the cry,
“Je -- sus of Naz -- a -- reth pass -- eth by.”
The blind re -- joiced to hear the cry,
“Je -- sus of Naz -- a -- reth pass -- eth by.”

}

wordsC = \lyricmode {
\set stanza = "3."

Ho! all ye heav -- y la -- den, come!
Here’s par -- don, com -- fort, rest and home.
Ye wan -- d’rers from a Fa -- ther’s face,
Re -- turn, ac -- cept His prof -- fered grace.
Ye tempt -- ed ones, there’s ref -- uge nigh:
“Je -- sus of Naz -- a -- reth pass -- eth by.”
Ye tempt -- ed ones, there’s ref -- uge nigh:
“Je -- sus of Naz -- a -- reth pass -- eth by.”

}

wordsD = \lyricmode {
\set stanza = "4."

But if you still His call re -- fuse,
And all His won -- drous love a -- buse,
Soon will He sad -- ly from you turn,
Your bit -- ter prayer for par -- don spurn.
“Too late, too late” will be the cry_–
“Je -- sus of Naz -- a -- reth has passed by.”
“Too late, too late” will be the cry_–
“Je -- sus of Naz -- a -- reth has passed by.”

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
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
