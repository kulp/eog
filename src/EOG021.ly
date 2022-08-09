\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG021.ily"
}

\header{
  %gospel
  hymnnumber = "21"
  title = "Make Room for Him"
  tunename = "" % not found at hymnary.org
  meter = "C. M. D. with Refrain"
  poet = "" % not found at hymnary.org
  composer = "George C. Stebbins" % not found at hymnary.org
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=76 }
tb = { \tempo 4=38 }

patternAA = { \ta c8 c8. c16 | c4. c8 c8. c16 | c2 } %
patternAB = { \ta c8 c8. c16 | c8 c8 c8 c8 c8. c16 | c4 c8 c8 } %

patternBA = { \ta c4 | c4. c8 c8. c16 | c4. } %
patternBB = { \ta c4 | c4. c8 c8. c16 | \tb c4. \tb } %

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { b a g   | fis e d cis | d   }
  \changePitch \patternBA { g       | c b e, a    | a   }
  \changePitch \patternAA { b a g   | fis e d cis | d   }
  \changePitch \patternBA { g       | a c fis, g  | g   }
  \changePitch \patternAA { b b     | g a c c a   | b   }
  \changePitch \patternBA { d       | cis b a g   | fis }
  \changePitch \patternAA { fis g a | b d c b     | e,  }
  \changePitch \patternBA { g       | b d, a' g   | g   }


  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAA { b b a  | d a a g    | b  } >>
  \changePitch \patternBA { b      | a a e' e d }
  \changePitch \patternAA { d d g, | b d c b    | e, }
  \changePitch \patternBB { g      | b d, a' g  | g \fermata }

  \bar "|."

}
}

notesAlto = {
\global
\relative c' {

  \changePitch \patternAA { b b b   | b b b ais   | b }
  \changePitch \patternBA { d       | e d cis cis | d }
  \changePitch \patternAA { d dis e | d c b ais   | b }
  \changePitch \patternBA { d       | e e c b     | b }
  \changePitch \patternAA { d d d   | d d fis fis | g }
  \changePitch \patternBA { g       | e g fis e   | d }
  \changePitch \patternAA { d d d   | d g g f     | e }
  \changePitch \patternBA { e       | d d d d     | d }

  \changePitch \patternAB { g fis fis | fis fis fis fis fis d | d < d g > < d g>  }
  \changePitch \patternBA { g         | g g g g fis           }
  \changePitch \patternAA { fis g d   | d g g f               | e     }
  \changePitch \patternBB { e         | d b c b               | b     }

}
}

notesTenor = {
\global
\relative d {

  \changePitch \patternAA { d d d   | d g g g   | g   }
  \changePitch \patternBA { g       | g g g g   | fis }
  \changePitch \patternAA { g g g   | g g g g   | g   }
  \changePitch \patternBA { g       | g a a g   | g   }
  \changePitch \patternAA { g g g   | fis a a d | d   }
  \changePitch \patternBA { b       | a cis d a | a   }
  \changePitch \patternAA { a g fis | g b c g   | g   }
  \changePitch \patternBA { g       | g b c b   | b   }

  \changePitch \patternAB { d d c | a a a c c b   | g d' d }
  \changePitch \patternBA { d     | e e cis cis c! }
  \changePitch \patternAA { c b b | g b c g       | g     }
  \changePitch \patternBB { g     | g g fis g     | g     }

}
}

notesBass = {
\global
\relative g, {

  \changePitch \patternAA { g g g  | g g g g  | g }
  \changePitch \patternBA { b      | c d a a  | d }
  \changePitch \patternAA { g, g g | c e g g, | g }
  \changePitch \patternBA { b      | c a d g, | g }
  \changePitch \patternAA { g g b  | d d d d  | g }
  \changePitch \patternBA { g      | a a a, a | d }
  \changePitch \patternAA { c b d  | g f e d  | c }
  \changePitch \patternBA { a      | d d d g  | g }

  \changePitch \patternAB { g d d | d d d d d d | g g g }
  \changePitch \patternBA { g     | c c a a d,  }
  \changePitch \patternAA { d g g | g f e d     | c     }
  \changePitch \patternBB { a     | d d d g,    | g_\fermata }

}
}

Refrain = \lyricmode {

Make room for Him! Make room for Him! \bar "."
He stands out -- side the door; \bar "." \break
He waits a -- mid the shad -- ows dim, \bar "."
And knocks and calls once more! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

No room for Thee, Thou bless -- ed One, \bar "."
The Fa -- ther’s ho -- ly Child— \bar "."
His well -- be -- lov -- ed on -- ly Son, \bar "."
The Sav -- iour un -- de -- filed! \bar "." \break
No room for Thee in crowd -- ed inn \bar "."
That e -- vening long a -- go! \bar "."
“Be -- hold the Lamb” who bore our sin \bar "."
Shut out by hearts be -- low! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

No room for Thee! Thy love did seek
To win Thine own in vain;
For they were proud and Thou wast meek—
They would not let Thee reign.
No room at last on earth for Thee,
As neath the start -- led sky,
With cru -- el scourge and mock -- er -- y
They led Thee forth to die.

\break

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

No room for Thee! Ah, still ’tis true!
Men cast Thy claims a -- side—
The rec -- ord old is ev -- er new;
They hate the Cru -- ci -- fied!
No room for Thee in bus -- y marts;
Thy pure and gen -- tle face
Would shame the hard and self -- ish hearts
That run the world -- ly race.

}

wordsD = \lyricmode {
\set stanza = "4."

No room for Him whose sac -- ri -- fice
Can put thy guilt a -- way?
O doubt -- ing soul, a -- rise, a -- rise,
Re -- ceive the Christ to -- day!
His grace ex -- tol! His prais -- es sing!
Make room for Him a -- lone!
For He is Lord and He is King;
And did for sin a -- tone!

}

TenorRefrainA = \lyricmode {

  \override LyricText.font-size = #-2
  \override LyricHyphen.thickness = #0.7
  \repeat unfold 59 { \skip 4 }
  for Him!
  \repeat unfold 4 { \skip 4 }
  for Him!

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
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
    >>
    \new Lyrics \with { alignAboveContext = men } \lyricsto tenors \TenorRefrainA
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
