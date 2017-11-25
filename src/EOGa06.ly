\include "common/global.ily"
\paper {
  \include "common/paper-additional.ily"
  ragged-last-bottom = ##t
  ragged-last = ##t
  % shrink space before markup verses to fit next hymn on same page
  \include "override/override-EOGa06.ily"
}

\header{
  hymnnumber = "6"
  tunename = "Luther"
  meter = "8. 7. 8. 7. 8. 8. 7."
  composer = "Martin Luther, Geistliche Lieder, 1535" % see https://hymnary.org/tune/luthers_hymn_luther_11321
  alternate = \markup { \column {
    "Alternate tune for No. 281."
    "See also No. 188, Little Flock."
  } }
  tagline = ##f
}

ta = { \tempo 2=69 }
tb = { \tempo 4=69 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2 % original does not specify time signature
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too % original shows tempo
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 | g b a g | a a b \bar "." % original has \bar "||" or some such
  g2 | b c d b | a1 \tb g2^\fermata \ta \bar "."
  g2 | g b a g | a a b \bar "."
  g2 | b c d b | a1 \tb g2^\fermata \ta \bar "."
  b2 | c b a g | fis g a \bar "."
  b | g fis g d | g a \tb b^\fermata \ta \bar "."
  g2 | b c d b | a1 g2^\fermata \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 | d g fis g | g fis g
  d2 | d g fis g | g( fis) g
  d2 | e g fis g | g fis g
  d2 | d g fis g | g( fis) g
  g2 | g g fis g | dis e fis
  d2 | d c d d | b e dis
  e | g g g g | g( fis) d

}
}

notesTenor = {
\global
\relative a {

  b2 | g d' d b | e d d
  b | d g, a g | e'( d4 c) b2
  b2 | b d d b | e d d
  d4( c) | b4( a) g2 a g | e'( d4 c) b2
  d2 | e d d b | b b d!
  d2 | b c b a | g e fis
  g2 | e' e d e | e( d4 c) b2

}
}

notesBass = {
\global
\relative f, {

  g2 | b g d' e | c d g,
  g'2 | g e d e | c( d) g,_\fermata
  g'2 | e b d e | c d g
  b4( a) | g( fis) e2 d e | c( d) g_\fermata
  g2 | e b4( c) d2 e | b e d
  g2 | b a g fis | e c b_\fermata
  e2 | e c b e | c( d) g,_\fermata

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
