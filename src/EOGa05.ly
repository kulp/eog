\include "common/global.ily"
\paper {
  \include "common/paper-additional.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOGa05.ily"
}

\header{
  hymnnumber = "5"
  tunename = "Olive’s Brow"
  meter = "L. M."
  composer = "William B. Bradbury" % see https://hymnary.org/tune/olives_brow_bradbury
  alternate = \markup { "Alternate tune for No. 205." }
  tagline = ##f
}

ta = { \tempo 4=100 }
tb = { \tempo 4=50 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees2 | ees4 ees f f | ees2 ees | ees \bar "."
  aes2 | aes4 aes bes c | bes2 bes | aes \bar "."
  c2 | bes4 bes bes bes | bes2 aes | g \bar "."
  g2 | aes4 aes aes f | ees2 ees | \tb ees\fermata \ta \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c2 | c4 c des des | c2 bes | c
  c2 | c4 c ees ees | f2 ees4( des) | c2
  ees2 | ees4 ees ees ees | d2 f | ees
  ees2 | ees4 ees f des | c( bes) des2 | c

}
}

notesTenor = {
\global
\relative a {

  aes2 | aes4 aes aes aes | aes2 g | aes
  aes2 | aes4 aes g aes | aes2 g | aes2
  aes2 | g4 g bes g | f( bes) bes2 | bes
  bes2 | aes4 aes aes aes | aes2 g | aes

}
}

notesBass = {
\global
\relative f, {

  aes2 | aes4 aes des des | ees2 ees | aes,
  aes2 | f'4 f ees c | des2 ees | aes,
  aes2 | ees'4 ees g ees | bes2 d | ees
  des!2 | c4 c des des | ees2 ees | aes,_\fermata

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
