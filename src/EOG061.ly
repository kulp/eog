\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 2) (#t #f))
  %page-count = ##f
}

\header{
  hymnnumber = "61"
  title = "Behold the Lamb! ’Tis He Who Bore"
  tunename = "St. Louis"
  meter = "C. M."
  poet = "Haweis"
  composer = "Southern Air"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  { c4( e4) | g2 g2 g2 g4( a4) | bes2 bes2 a2. }
  { g4 | a2 c2 c4( a4) g4( a4) | c1. }
  { c4( d4) | e2 c2 c2 a2 | g2 f2 e2 }
%  { c4( d4) | e4( g4) a4 g4( e4) | d2 c1 } % this is how it looks in my probably-mismarked photocopy
  { c4( d4) | e4( g2) a4 g4( e4) d2 | c1. } % I changed the c1 to a c1. at the end to make it fit, and moved the barcheck

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  { c2 | e2 f2 g2 ees2 | d2 f2 f2. }
  { e4 | a2 g2 f2 f2 | e2( f2 g2) }
  { a2 | g2 e4( f4) g2 g4( f4) | e4( d4) c4( b4) c2 }
  { c2 | c2( e4) d4 e4( c4) b2 | c1. }

}
}

notesTenor = {
\global
\relative a {

  { e4( g4) | c2 b2 c2 c2 | bes2 d2 c2. }
  { c4 | c2 c2 a2 b2 | c1. }
  { c2 | c2 c2 c2 c2 | c2 g2 g2 }
  { e4( f4) | g4( c2) c4 c4( g4) f2 | e1. }

}
}

notesBass = {
\global
\relative f {

  { c2 | c2 d2 e2 f2 | bes,2 bes2 f'2. }
  { c4 | f2 e2 d2 g2 | c,2( d2 e2) }
  { f2 | c2 c4( d4) e2 f2 | g2 g,2 c2 }
  { c2 | c2. fis,4 g2 g2 | c1. }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Be -- hold the Lamb! ’tis He who bore \bar "."
My sins up -- on the tree, \bar "." \break
And paid in death the dread -- ful score— \bar "."
The guilt that lay on me. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

I’d look to Him till sight en -- dear
The Sav -- iour to my heart;
To Him I look who calms my fear,
Nor from Him -- self would part.

}

wordsC = \lyricmode {
\set stanza = "3."

I’d look un -- til His pre -- cious love
My ev -- ery thought con -- trol,
Its vast con -- strain -- ing in -- fluence prove
O’er bod -- y, spir -- it, soul.

}

wordsD = \lyricmode {
\set stanza = "4."

To Him I look, while still I run—
My nev -- er -- fail -- ing Friend—
Fin -- ish, He will, the work be -- gun,
And grace in glo -- ry end.

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
