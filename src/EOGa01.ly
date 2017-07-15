\include "common/global.ily"
\paper {
  \include "common/paper-additional.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "1"
  tunename = "French"
  meter = "C. M."
  composer = "Scottish Psalter, 1615"
  alternate = \markup { \column {
    "Alternate tune for No. 286."
    "See also No. 275, Little Flock."
  } }
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f4 | a bes c f, | g a bes \bar "."
  a4 | g f f e | f2. \bar "."
  c'4 | f e d c | c b c \bar "."
  a4 | g f f e | f2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c4 | f f f d | e f f
  f4 | e d d c | c2.
  f4 | a g g e | a g e
  f4 | e d d c | c2.

}
}

notesTenor = {
\global
\relative a {

  a4 c d c a | c c d
  c | c a bes g | a2.
  a4 | c c b c | d d c
  c4 | c a bes g | a2.

}
}

notesBass = {
\global
\relative f {

  f4 | f bes, a d | c f bes,
  f'4 | c d bes c | f2.
  f4 | f c g' a | f g c,
  f4 | c d bes c | f2.

}
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
