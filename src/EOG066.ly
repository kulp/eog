\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = 2
  %page-count = ##f
}

\header{
  hymnnumber = "66"
  title = "A Look to Jesus Saves the Soul"
  tunename = "Remember Me"
  meter = "C. M."
  %poet = ""
  composer = "Asa Hull"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=120 }
tb = { \tempo 4=60  }

patternAA = { c2 | c4 c4 c2 c2 | c4 c4 c2 }
patternBA = { c2 | c2. c4 c4 c4 | c1 }
patternBB = { c2 | c2 c2 c4 c4 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { a | a g g bes | bes a a }
  \changePitch \patternBA { c |  c a f a | g }
  \changePitch \patternAA { a | bes c d d | d c c }
  \changePitch \patternBA { c | c c bes g | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { f | f e e g | g f f }
  \changePitch \patternBA { f | f f f f | e }
  \changePitch \patternAA { f | f f f f | f f f }
  \changePitch \patternBA { f | e e e e | f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c | c c c c | c c c }
  \changePitch \patternBA { a | a c c c | c }
  \changePitch \patternAA { c | bes a bes bes | bes a a }
  \changePitch \patternBA { a | g g g bes | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f | f c c e | f f f }
  \changePitch \patternBB { f | f f a f | c }
  \changePitch \patternAA { f | d c bes d | f f f }
  \changePitch \patternBB { f | c c c c | f }

}
}

wordsA = \lyricmode {
\set stanza = "1."

A look to Je -- sus saves the soul, \bar "."
So bound -- less is His grace; \bar "." \break % comma appears in original after "boundless"
One look suf -- fic -- eth ev -- ’ry sin \bar "."
For -- ev -- er to ef -- face. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

The thief be -- held, with eye of faith,
The Sav -- iour by his side;
He looked up -- on that bles -- sed One,
Re -- ceived His word and died.

}

wordsC = \lyricmode {
\set stanza = "3."

Thous -- sands be -- sides have looked to Him
Who might -- y is to save,
And proved the truth of God’s own word,
The soul that looks shall live.

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

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
