\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = 3
  page-count = ##f
}

\header{
  title = "In Rags and in Ruin"
  subsubtitle = "(Comfort. 11s.)"
  %meter = "11s."
  %poet = ""
  %composer = ""
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { c8 ~ c8 | c4 c4 c4 | c4 c4 c4 | c4 c4 c4 | c2 }
patternAB = { c8( c8) | c4 c4 c4 | c4 c4 c4 | c4 c4 c4 | c2 }

patternBA = { c8 ~ c8 | c8[ c8] c8[ c8] c8[ c8] | c2 c8( c8) | c4 c4 c4 | c2 }
patternBB = { c8 ~ c8 | c4      c4      c8[ c8] | c2 c8( c8) | c4 c4 c4 | c2 }
patternBC = { c8 ~ c8 | c4      c4      c4      | c2 c8( c8) | c4 c4 c4 | c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 3/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { bes bes | bes g aes       | bes g ees   | f ees f | g   }
  \changePitch \patternAA { g g     | aes aes c       | bes bes g   | f aes g | f   }
  \changePitch \patternAB { g aes   | bes g aes       | bes ees bes | c aes c | bes }
  \changePitch \patternBA { g g     | f g aes bes c d | ees bes aes | g g f   | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { g g     | g ees f         | g ees ees | d c d       | ees }
  \changePitch \patternAA { ees ees | ees ees aes     | g g ees   | d f ees     | d   }
  \changePitch \patternAB { ees f   | g ees f         | g g g     | aes ees aes | g   }
  \changePitch \patternBA { ees ees | d ees f g aes f | ees ees f | ees ees d   | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes bes | bes bes bes     | bes bes g   | bes bes bes | bes }
  \changePitch \patternAA { bes bes | c c ees         | ees ees bes | bes bes bes | bes }
  \changePitch \patternAA { bes bes | bes bes bes     | bes bes ees | ees c ees   | ees }
  \changePitch \patternBB { bes bes | bes bes bes aes | g g c       | bes bes aes | g   }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees ees | ees ees ees | ees ees ees | bes bes bes  | ees  }
  \changePitch \patternAA { ees ees | aes aes aes | ees ees ees | bes d ees    | bes  }
  \changePitch \patternAA { ees ees | ees ees ees | ees ees ees | aes aes aes, | ees' }
  \changePitch \patternBC { ees ees | bes bes bes | c ees aes,  | bes bes bes  | ees  }

}
}

wordsA = \lyricmode {
\set stanza = "1."

In rags and in ru -- in, with -- out and with -- in, \bar "."
One ter -- ri -- ble mass of pol -- lu -- tion and sin; \bar "."
By false friends de -- sert -- ed, of for -- tune be -- reft, \bar "."
He turns to the home he_once ea -- ger -- ly left. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

O! none can re -- store, nor such deep sin ef -- face,
But_the One who comes forth in such in -- fin -- ite grace;
For grace is a -- bove all his sin and dis -- tress,
And_he’s noth -- ing to do— save_his sin to con -- fess!

}

wordsC = \lyricmode {
\set stanza = "3."

What_an ear -- nest and seal of un -- speak -- a -- ble bliss
Is_con -- veyed in the Fa -- ther’s af -- fec -- tion -- ate kiss!
The lost one is found, and the ser -- vants must bring,
At_the Fa -- ther’s com -- mand, the shoes and the ring.

}

wordsD = \lyricmode {
\set stanza = "4."

And_the ver -- y best robe, and the fat -- ling and wine,
(What_a change from the rags, and the husks, and the swine!)
With mu -- sic and danc -- ing— ’tis some -- thing so new,
Such_a ful -- ness of bless -- ing— and noth -- ing to do!

}

wordsE = \markuplines {

\line { Ah! nothing to do! for the sinner that’s dead } 
\line { Must needs have another to work in his stead: } 
\line { And Jesus, in Calvary’s terrible hour,        } 
\line { Redemption accomplished in marvelous power.   } 

}

wordsF = \markuplines {

\line { Which shut up the world to its folly and strife, } 
\line { But opened a passage from death unto life.       } 
\line { Are you ruined and helpless? God offers to you   } 
\line { A free, full salvation— and nothing to do!       } 

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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

\markup { \fill-line { \column {
  \line{ \bold 5 \column { \wordsE } } \vspace #0.4
  \line{ \bold 6 \column { \wordsF } } %\vspace #0.4
} } }

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
