\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = 2
  %page-count = ##f
}

\header{
  title = "Precious, Precious Blood of Jesus"
  subsubtitle = "(Stephanos. 8. 5. 8. 3.)"
  %meter = "8.5.8.3."
  poet = "F. R. Havergal"
  composer = "H. W. Baker"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { c4 }
patternAB = { c4 c8[ c8] c4 c4 }

patternBA = { c4 c4 c4 c4 | c2. r4 }

patternCA = { c2 c2 | c1 }

global = {
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { b b b a        | b d d c   }
  \changePitch \patternBA { b b a g        | a r       }
  \changePitch \patternAB { d, e fis g fis | g a b c b }
  \changePitch \patternCA { a a            | g         }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d d d | d d g d }
  \changePitch \patternBA { d d d d | d r     }
  \changePitch \patternAA { d d d d | d d c d }
  \changePitch \patternCA { e d     | b       }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g g g fis | g a b a }
  \changePitch \patternBA { g b c b   | fis r   }
  \changePitch \patternAA { d' c b a  | b a g g }
  \changePitch \patternCA { g fis     | g       }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { g b d d   | g fis e fis }
  \changePitch \patternBA { g g fis g | d r         }
  \changePitch \patternAA { b' a g d  | g fis e d   }
  \changePitch \patternCA { c d       | g,          }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Pre -- cious, pre -- cious blood of Je -- sus, \bar "."
Shed on Cal -- va -- ry, \bar "." \break
Shed for reb -- els, and for sin -- ners, \bar "."
Shed for me! \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Pre -- cious blood that hath re -- deemed us,
All the price is paid!
Per -- fect par -- don now is of -- fered,
Peace is made.

}

wordsC = \lyricmode {
\set stanza = "3."

Tho’ thy sins are red like crim -- son,
Deep in scar -- let glow,
Je -- sus’ pre -- cious blood can make them
White as snow.

}

wordsD = \lyricmode {
\set stanza = "4."

Pre -- cious, pre -- cious blood of Je -- sus,
Ev -- er of -- fered free!
O be -- lieve it, O re -- ceive it,
’Tis for Thee! % XXX the capitalised Thee exists in the original, but is possibly not intended

}

wordsE = \lyricmode {
\set stanza = "5."

Pre -- cios blood, whose full a -- tone -- ment
Makes us nigh to God!
Pre -- cious blood, our song and glo -- ry,
Praise and laud!

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
