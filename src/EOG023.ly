\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = 2
}

\header{
  title = "My Redeemer"
  subsubtitle = "(8. 7. 8. 7. and Refrain)"
  %meter = "8.7.8.7. and Refrain"
  poet = "P. P. Bliss"
  composer = "Mrs. Addie McGranahan"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8[ c8] c8 | c4. c4. c8[ c8] c8         | c4. c4.         }
patternAB = { c4      c8 | c4. c4. c8[ c8] c8         | c4. c4.         }
patternAC = { c4      c8 | c4. c4. c4      c8         | c4. c4.         }
patternAD = { c8[ c8] c8 | c4. ~ c4 c8 c8[ c8] c8     | c4. ~ c4.       }
patternAE = { c4      c8 | c4. ~ c4 c8 c4      c8     | c4. ~ c4.       }
patternAF = { c4      c8 | c4. ~ c4 c8 c8[ c8] c8     | c4. ~ c4.       }

patternBA = { c8[ c8] c8 | c2. ~ c4 c8 c8[ c8] c8     | c4. c2.         }
patternBB = { c8[ c8] c8 | c2. ~ c4 c8 c8[ c8] c8     | c2. ~ c4.       }
patternBC = { c8[ c8] c8 | c4 c8 c4 c8 c4 c8 c4 c8    | c2. ~ c4.       }
patternBD = { c8[ c8] c8 | c2. ~ c4 c8 c4 c8          | c2. ~ c4.       }
patternBE = { c8[ c8] c8 | c2. ~ c4 c8 c4 c8          | c4 c8 c4 c8 c4. }

patternCA = { c4 c8      }
patternCB = { c8[ c8] c8 | c2. ~ c4 c8 c8[ c8] c8     | c4 c8 c4 c8 c4. }
patternCC = { c4 c8      | c4 c8 c4 c8 c4. c8[ c8] c8 | c4 c8 c4 c8 c4. }
patternCD = { c8[ c8] c8 | c4 c8 c4 c8 c4 c8 c4 c8    | c4 c8 c4 c8 c4. }
patternCE = { c4 c8      | c4 c8 c4 c8 c4 c8 c4 c8    | c2. ~ c4.       }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 9/8
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees aes bes  | c c c bes aes           | bes bes }
  \changePitch \patternAD { ees, g bes   | des des des des c bes   | c c     }
  \changePitch \patternAA { ees, aes bes | c c c bes aes           | bes bes }
  \changePitch \patternAD { ees, g aes   | bes bes bes bes aes g   | aes aes }

  << s^\markup { \small \caps "Refrain"  }
  \time 12/8
  \partial 4.
  \changePitch \patternBA { aes bes c    | des des des f, aes des  | c c     } >>
  \changePitch \patternBB { ees, aes c   | bes bes bes bes aes bes | c c     }
  \changePitch \patternBA { aes bes c    | des des des f, aes des  | c c     }
  \changePitch \patternBD { ees, aes c   | ees ees des c bes       | aes aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { c des     | ees ees ees des c               | ees ees         }
  \changePitch \patternAE { ees ees   | ees ees ees ees ees             | ees ees         }
  \changePitch \patternAB { c des     | ees ees ees des c               | ees ees         }
  \changePitch \patternAE { ees ees   | ees ees ees ees ees             | ees ees         }

  \changePitch \patternBA { c des ees | f f f des f f                   | ees ees         }
  \changePitch \patternBC { c ees ees | ees ees ees ees ees ees ees ees | ees ees         }
  \changePitch \patternBA { c des ees | f f f des f f                   | ees ees         }
  \changePitch \patternBE { c ees aes | c c bes aes g                   | aes ees f f ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAC { aes aes   | aes aes aes aes                 | g g                     }
  \changePitch \patternAF { g g       | bes bes bes bes aes g           | aes aes                 }
  \changePitch \patternAC { aes aes   | aes aes aes aes                 | g g                     }
  \changePitch \patternAD { g bes c   | des des des des c bes           | c c                     }

  \changePitch \patternCA { aes aes   | aes aes aes aes aes aes aes aes | aes aes aes aes aes aes }
  \changePitch \patternCB { aes c ees | des des des des c bes           | aes aes aes aes aes     }
  \changePitch \patternCA { aes aes   | aes aes aes aes aes aes aes aes | aes aes aes aes aes aes }
  \changePitch \patternCD { aes c ees | ees ees ees ees ees ees ees des | c c des des c           }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAC { aes aes  | aes aes aes aes                  | ees ees                   }
  \changePitch \patternAE { ees ees  | ees ees ees ees ees              | aes, aes                  }
  \changePitch \patternAC { aes aes  | aes aes aes aes                  | ees' ees                  }
  \changePitch \patternAE { ees ees  | ees ees ees ees ees              | < aes aes, > < aes aes, > }

  \changePitch \patternCA { aes aes  | des, des des des des des des des | aes aes aes aes aes aes   }
  \changePitch \patternCC { aes aes  | ees' ees ees ees ees ees f g     | aes aes aes aes aes       }
  \changePitch \patternCA { aes aes  | des, des des des des des des des | aes aes aes aes aes aes   }
  \changePitch \patternCE { aes' aes | ees ees ees ees ees ees ees ees  | < aes aes, > < aes aes, > }

}
}

SopranoRefrainA = \lyricmode {

\override LyricText #'font-size = #-2
\repeat unfold 38 { \skip 4 }
With His blood __

}

SopranoRefrainB = \lyricmode {

\repeat unfold 53 { \skip 4 }
Paid the debt, __ and made me free. __ \bar "." \break

}

% Also lead (soprano) for most of it (second line of refrain excepted)
% The alto also deviates from this on the fourth line of the refrain, but it is
% probably easier to divide them this way than an unanalysed alternative.
AltoRefrain = \lyricmode {

Sing, O! sing __ of my Re -- deem -- er, \bar "." \break
With His blood He pur -- chased me, He pur -- chased me; __ \bar "." \break
\pageBreak
On the cross __ He sealed my par -- don, \bar "." \break
%Paid the debt, __ and made me free. __ \bar "." \break

}

TenorRefrain = \lyricmode {

\override LyricText #'font-size = #-2
\repeat unfold 46 { \skip 4 }
With His blood __ He pur -- chased me, He pur -- chased me;
On the cross He sealed my par -- don, On the cross He sealed my par -- don,
Paid the debt and made me free, and made me free, and made me free.

}

BassRefrain = \lyricmode {

\override LyricText #'font-size = #-2
\repeat unfold 30 { \skip 4 }
Sing, O! sing of my Re -- deem -- er, Sing, O! sing of my Re -- deem -- er,
With His blood He pur -- chased me, With His blood He pur -- chased me;
\repeat unfold 26 { \skip 4 }
free. __

}

wordsA = \lyricmode {
\set stanza = "1."

I will sing of my Re -- deem -- er, \bar "."
And His won -- drous love to me; \bar "." \break
On the cru -- el cross He suf -- fered, \bar "."
From the curse to set me free. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

I will tell the won -- drous sto -- ry,
How my lost es -- tate to save,
In His bound -- less love and mer -- cy,
He the ran -- som free -- ly gave.

\AltoRefrain

}

wordsC = \lyricmode {
\set stanza = "3."

I will praise my dear Re -- deem -- er,
His tri -- um -- phant pow’r I’ll tell,
How the vic -- to -- ry He giv -- eth
O -- ver sin, and death, and hell.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
	  % Synch to altos for convenience
      \context Lyrics = one   \lyricsto altos \wordsA
      \context Lyrics = two   \lyricsto altos \wordsB
      \context Lyrics = three \lyricsto altos \wordsC
    >>
	\new Lyrics \with { alignAboveContext = upper } \lyricsto sopranos \SopranoRefrainA
	\new Lyrics \with { alignBelowContext = upper } \lyricsto sopranos \SopranoRefrainB
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
	\new Lyrics \with { alignAboveContext = men } \lyricsto tenors \TenorRefrain
	\new Lyrics \with { alignBelowContext = men } \lyricsto basses \BassRefrain
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
