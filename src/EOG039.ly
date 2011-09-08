\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "He Knew No Sin, That Holy One"
  subsubtitle = "(Sawley. C. M.)"
  %meter = "C.M."
  %poet = ""
  composer = "J. J. Walch"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 3/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key bes \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { }
  \changePitch \patternAB { }
  \changePitch \patternAA { }
  \changePitch \patternAB { }

  \changePitch \patternBB { }
  \changePitch \patternBB { }
  \changePitch \patternBC { }
  \changePitch \patternAC { }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { }
  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternAB { }

  \changePitch \patternBB { }
  \changePitch \patternBB { }
  \changePitch \patternBA { }
  \changePitch \patternAB { }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { }
  \changePitch \patternBA { }
  \changePitch \patternAB { }
  \changePitch \patternAB { }

  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternAB { }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternBA { }

  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternAB { }

}
}

wordsA = \lyricmode {
\set stanza = "1."

He knew no sin, that Ho -- ly One,
Yet was made sin for us;
God gave His well -- be -- lov -- ed Son
To die for sin -- ners thus.

}

wordsB = \lyricmode {
\set stanza = "2."

For -- sa -- ken whol -- ly on the tree,
Un -- heard His bi -- ter cy, 
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
