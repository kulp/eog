\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  % TODO add more intra-system spacing
}

\header{
  hymnnumber = "331"
  title = "For God So Loved the World"
  tunename = ""
  meter = ""
  poet = "Frances Townsend"
  composer = "Alfred B. Smith"
  copyright = "Copyright 1938 by Singspiration, Inc. All rights reserved. Used by permission."
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

patternA = { c4 | c4. c8 c c | c2 }
patternB = { c4 | c4. c8 c c | \ta c2. \tb }
patternC = { c4. c8 c c | c2 c4 | c2. ~ | c2 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { d | b' b ais b | c }
  \changePitch \patternA { b | b a gis a | e }
  \changePitch \patternA { g | fis e fis g | a }
  \changePitch \patternA { d, | g fis g a | b }
  \changePitch \patternA { d, | b' b ais b | c }
  \changePitch \patternB { b | b a gis a | e'\fermata }
  \changePitch \patternC { d cis c b | b a | g | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { b | d d cis d | e }
  \changePitch \patternA { d | cis cis cis cis | cis }
  \changePitch \patternA { cis | c c c c | c }
  \changePitch \patternA { c | b ais b c | d }
  \changePitch \patternA { b | d d cis d | e }
  \changePitch \patternB { d | cis cis cis cis | g' }
  \changePitch \patternC { fis eis e d | d c | b | b }

}
}

notesLeftHand = {
\global
% TODO don't force all stems downward, just bias them that way
% TODO make rests appear in the middle of the staff instead of the top
\override Stem.direction = #DOWN
\override NoteHead.font-size = #-4
\relative f, {

  r4 | g4 <d' g b> e8[ d] | e,4 <e' gis>
  r4 | a,4 <e' g a> e | a, <e' g a>
  r4 | d,4 <d' a'> d8[ e] | d,4 <d' fis>
  r4 | g,4 d' e8[ d] | g,4 <d' g b>
  r4 | g,4 <d' g b> e8[ d] | e,4 <e' gis>
  r4 | a,4 <e' g a> e | a, <e' a cis> <a cis e>\fermata
  d,4 a' <d, fis> | d4 e <d fis> | g d b | g2

}
}

wordsA = \lyricmode {

For God so loved the world, \bar "."
He gave His on -- ly Son, \bar "."
To die on Cal -- v’ry’s tree, \bar "."
From sin to set me free; \bar "."
Some day He’s com -- ing back, \bar "."
What glo -- ry that will be! \bar "."
Won -- der -- ful His love to me. \bar "."

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
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \context Voice = chords \voiceOne \notesLeftHand
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
