\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "29"
  title = "Only Trust Him"
  tunename = ""
  meter = "C. M. with Refrain"
  poet = "J. H. Stockton"
  composer = "J. H. Stockton"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { c4 | c4. c8 c4 c4 | c4. c8 c4 }

patternBA = { c4 | c4 c4 c4 c4 | c2. }
patternBB = { c4 | c4 c4 c4 c4 | c2. c4 }

patternCA = { c4. c8 c8[ c8] c4 | c4. c8 c4 c4 }
patternCB = { c4. c8 c4      c4 | c4. c8 c4 c4 }

patternDA = { c4 c4 c4 c4 | c2. c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d | d e d g  | b b a }
  \changePitch \patternBA { g | d' d b g | a     }
  \changePitch \patternAA { b | d d b g  | g g e }
  \changePitch \patternBB { d | d g b a  | g r   }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { d' b b a g | g e e d } >>
  \changePitch \patternDA { d g b g    | a r     }
  \changePitch \patternCA { d b b a g  | g e e d }
  \changePitch \patternDA { d g b a    | g       }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { b | b c b d | g g d }
  \changePitch \patternBA { d | g g g g | fis   }
  \changePitch \patternAA { g | g g g d | e e c }
  \changePitch \patternBB { b | b d d d | d r   }

  \changePitch \patternCB { g g d d | e c c b }
  \changePitch \patternDA { d d g g | fis r   }
  \changePitch \patternCB { g g d d | e c c b }
  \changePitch \patternDA { b d d d | d       }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g  | g g g b | d d c }
  \changePitch \patternBA { b  | b b d d | d     }
  \changePitch \patternAA { g, | b b d d | c c g }
  \changePitch \patternBB { g  | g b d c | b r   }

  \changePitch \patternCA { b b d c b | g g g g }
  \changePitch \patternDA { b b d b   | d r     }
  \changePitch \patternCA { b d d c b | g g g g }
  \changePitch \patternDA { g b d c   | b       }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g  | g g g g  | g g g }
  \changePitch \patternBA { g  | g, g g b | d     }
  \changePitch \patternAA { g  | g g g b, | c c c }
  \changePitch \patternBB { g' | d d d d  | g r   }

  \changePitch \patternCB { g g g g  | c, c c g }
  \changePitch \patternDA { g' g g g | d r      }
  \changePitch \patternCB { g, g g g | c c c g  }
  \changePitch \patternDA { d' d d d | g        }

}
}

Refrain = \lyricmode {

On -- ly trust Him, on -- ly trust Him, \bar "."
On -- ly trust Him now; \bar "." \eogbreak
He will save you, He will save you, \bar "."
He will save you now. \bar "." \eogbreak

}

wordsA = \lyricmode {
\set stanza = "1."

Come, ev -- ’ry soul by sin op -- pressed, \bar "."
There’s mer -- cy with the Lord, \bar "." \eogbreak
And He will sure -- ly give you rest, \bar "."
By trust -- ing in His Word. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

For Je -- sus shed His pre -- cious blood
Rich bless -- ings to be -- stow;
Plunge now in -- to the crim -- son flood
That wash -- es white as snow.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Yes, Je -- sus is the Truth, the Way,
That leads you in -- to rest;
Be -- lieve in Him with -- out de -- lay,
And you are full -- y blest.

}

wordsD = \lyricmode {
\set stanza = "4."

Come, then, and join this ho -- ly band,
And on to glo -- ry go,
To dwell in that ce -- les -- tial land,
Where joys im -- mor -- tal flow.

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
      %\context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
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
