\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = ""
  subsubtitle = "()"
  %meter = ""
  %poet = ""
  composer = ""
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
  \time 4/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
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

}

wordsB = \lyricmode {
\set stanza = "2."

}

wordsC = \lyricmode {
\set stanza = "3."

}

wordsD = \lyricmode {
\set stanza = "4."

}

%wordsE = \lyricmode {
%\set stanza = "5."
%
%}

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

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
