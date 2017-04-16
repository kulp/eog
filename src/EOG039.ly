\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "39"
  title = "He Knew No Sin, That Holy One"
  tunename = "Sawley"
  meter = "C. M."
  %poet = ""
  composer = "J. J. Walch"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=96 }
tb = { \tempo 4=48 }

patternAA = { c4 c4 c4 | c2      c4 | c4( c4) c4 | c2. }
patternAB = { c4 c4 c4 | c2      c4 | c2      c4 | c2. }
patternAC = { c4 c4 c4 | c4( c4) c4 | c2      c4 | c2. }
patternBA = { c4 c4 c4 | c4( c4) c4 | c2.      }
patternBB = { c4 c4 c4 | c2      c4 | c2.      }
patternBC = { c4 c4 c4 | c2      c4 | c2( c4)  }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key bes \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { bes a g  | f d     | ees a g | f }
  \changePitch \patternBA { d' c bes | a bes g | f       }
  \changePitch \patternAA { bes a g  | f d     | ees a g | f }
  \changePitch \patternBB { g a bes  | d c     | bes     }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d f ees | d d       | c ees ees | d }
  \changePitch \patternBB { f f f   | f e       | f         }
  \changePitch \patternAC { f f ees | ees d bes | ees c     | d }
  \changePitch \patternBA { g ges f | f e ees   | d         }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes bes bes | bes bes | a c bes | bes }
  \changePitch \patternBA { bes a bes   | c d bes | a       }
  \changePitch \patternAA { bes bes bes | bes bes | bes c a | bes }
  \changePitch \patternBA { bes c d     | bes g a | bes     }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAB { bes bes bes | bes bes  | f' f    | bes, }
  \changePitch \patternBC { bes c d     | c c      | f ees   }
  \changePitch \patternAA { d d ees     | bes aes' | g f ees | d    }
  \changePitch \patternBB { ees ees d   | f f      | bes,    }

}
}

wordsA = \lyricmode {
\set stanza = "1."

He knew no sin, that Ho -- ly One, \bar "."
Yet was made sin for us; \bar "." \break
God gave His well -- be -- lov -- ed Son \bar "."
To die for sin -- ners thus. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

For -- sa -- ken whol -- ly on the tree,
Un -- heard His bit -- ter cry,
That we from judg -- ment might be free,
The right -- eous One must die.

}

wordsC = \lyricmode {
\set stanza = "3."

Blood -- sprin -- kled is the mer -- cy -- seat,
The throne is sat -- is -- fied,
Re -- demp -- tion’s work is all com -- plete,
And Christ is glo -- ri -- fied.

}

wordsD = \lyricmode {
\set stanza = "4."

In right -- eous -- ness God now can bless
All who His word be -- lieve,
And life e -- ter -- nal they pos -- sess
Who Christ the Son re -- ceive.

}

wordsE = \lyricmode {
\set stanza = "5."

But soon will close that o -- pen door,
Be hushed that gra -- cious voice,
Glad ti -- dings shall be heard no more;
Now make thy fi -- nal choice.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
