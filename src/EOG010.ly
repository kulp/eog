\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = ##f
}

\header{
  %gospel
  hymnnumber = "10"
  title = "Faith Is a Very Simple Thing"
  tunename = "Remember Me"
  meter = "C. M."
  poet = ""
  composer = "Asa Hull"
  tagline = ##f
}

patternA = { c4 | c8 c8 c4 c4 | c8 c8 c4 } % Lines 1, 3
patternB = { c4 | c4. c8 c8 c8 | c2 } % Lines 2, 4

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \once \override Score.MetronomeMark.transparent = ##t
  \tempo 4 = 60
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { a | a g g bes | bes a a }
  \changePitch \patternB { c | c a f a   | g       }
  \changePitch \patternA { a | bes c d d | d c c   }
  \changePitch \patternB { a | c c bes g | f       }

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { f | f e e g | g f f }
  \changePitch \patternB { a | a f f f | e     }
  \changePitch \patternA { f | f f f f | f f f }
  \changePitch \patternB { f | e e e e | f     }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { c | c c c c       | c c c   }
  \changePitch \patternB { f | f c c c       | c       }
  \changePitch \patternA { c | bes a bes bes | bes a a }
  \changePitch \patternB { c | c c g bes     | a       }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { f | c c c c     | f f f  }
  \changePitch \patternB { f | f f a f     | c      }
  \changePitch \patternA { f | d c bes bes | f' f f }
  \changePitch \patternB { f | c c c c     | f      } \bar "|."

}
}

wordsA = \lyricmode {
\set stanza = "1."

  Faith is a ver -- y sim -- ple thing, \bar "."
  Tho’ lit -- tle un -- der -- stood; \bar "." \eogbreak
  It frees the soul from death’s dread sting, \bar "."
  By rest -- ing on the blood. \bar "|." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

  It looks not on the things a -- round,
  Nor on the things with -- in;
  It takes its flight to scenes a -- bove,
  Be -- yond the sphere of sin.

}

wordsC = \lyricmode {
\set stanza = "3."

  It sees up -- on the throne of God
  A vic -- tim that was slain;
  It rests its all on His shed blood,
  And says, “I’m born a -- gain.”

}

wordsD = \lyricmode {
\set stanza = "4."

  Faith is not what we see or feel;
  It is a sim -- ple trust
  In what the God of love has said
  Of Je -- sus as the Just.

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
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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
