\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "“Too Late, Too Late!” How Sad the Sound"
  subsubtitle = "(Arlington. C. M.)"
  %meter = "C.M."
  %poet = ""
  composer = "Dr. Arne"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=120 }
tb = { \tempo 4=60  }

patternAA = { c2 | c4. c8 c2 c2      | c4. c8 c2 }
patternAB = { c2 | c4. c8 c2 c4( c4) | c4. c8 c2 }
patternBA = { c2 | c4 c4 c2      c2      | c2( c2) }
patternBB = { c2 | c4 c4 c4( c4) c2      | c2( c2) }
patternBC = { c2 | c4 c4 c2      c2      | c1      }
patternBD = { c2 | c4 c4 c2      c4( c4) | c1      }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 3/2
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g | b b b a | g g g }
  \changePitch \patternBA { a | b d c b | b a }
  \changePitch \patternAA { c | b b b e | d d d }
  \changePitch \patternBC { g, | a c b a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d | g g g fis | e e e }
  \changePitch \patternBB { fis | g d e fis g | g fis }
  \changePitch \patternAA { fis | g g g bes | b! g g }
  \changePitch \patternBC { d | e a g fis | g }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { b | d d d d c | b b b }
  \changePitch \patternBC { d | d b c d | d }
  \changePitch \patternAA { a | b b d cis | d b b }
  \changePitch \patternBD { d | c e d d c | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g | g g g d | e e e }
  \changePitch \patternBC { d | g b a g | d }
  \changePitch \patternAA { d | g g g g | g g g }
  \changePitch \patternBC { b, | c a d d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Too late, too late!” how sad the sound \bar "."
On anx -- ious hu -- man ears, \bar "." \break
Of those who’ve wait -- ed long, a prey \bar "."
To doubts, and hopes, and fears. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

But there’s a time, when sad -- der far,
Shall sound in hu -- man ears,
A dread “too late,” which, kill -- ing hope,
Will turn to death all fears.

}

wordsC = \lyricmode {
\set stanza = "3."

“Too late” they’ll feel their lost es -- tate,
Which now they don’t be -- lieve;
“Too late” they’ll see the grace of God
Which now they won’t re -- ceive.

}

wordsD = \lyricmode {
\set stanza = "4."

“Too late” they’ll find the door will shut,
Which now stands o -- pen wide;
“Too late” they’ll have to meet their God
With no place then to hide.

}

wordsE = \lyricmode {
\set stanza = "5."

O! sinner, pause ere yet “too late;”
Now is the day of grace,
Now Jesus calls, O! do obey
His pleading, loving voice.

}

wordsF = \lyricmode {
\set stanza = "6."

Today, ’tis free to all who come,
And take Him at His word;
Tomorrow’s sun may rise “too late”
For you who now have heard.

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
