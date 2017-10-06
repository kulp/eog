\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG141.ily"
}

\header{
  %gospel
  hymnnumber = "141"
  title = "How Vast, How Full, How Free"
  tunename = "St. Ethelwald"
  meter = "S. M."
  poet = "A. Midlane"
  composer = "W. H. Monk"
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
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  d2 | c b a b4( c) | b1.
  b2 | a d, e e | d1.
  d2 | e fis g b | a a b
  b2 | c b a a | g1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g2 | e4( fis) g2 g fis | g1.
  d2 | d d d cis | d1.
  d2 | d c b g'4( fis) | e2 e dis
  e2 | e4( fis) g2 g fis | g1.

}
}

notesTenor = {
\global
\relative a {

  b2 | c d e d | d1.
  g,2 | a b4( a) b2 a | fis1.
  fis2 | g a g g | a4( g) fis( e) fis2
  gis2 | a g! g4( a) b( c) | b1.

}
}

notesBass = {
\global
\relative f {

  g2 | a b c d | g,1.
  g2 | fis g4( fis) g2 a | d,1.
  d2 | c a e' e4( d) | c2 c b
  e2 | a, b4( c) d2 d | g,1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

How vast, how full, how free, \bar "."
The mer -- cy of our God! \bar "." \eogbreak
Pro -- claim the bless -- ed news a -- round, \bar "."
And spread it all a -- broad. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

How vast! “Who -- ev -- er will”
May drink at mer -- cy’s stream,
And know that faith in Je -- sus brings
Sal -- va -- tion e’en for him.

}

wordsC = \lyricmode {
\set stanza = "3."

How full! It doth re -- move
The stain of ev -- ery sin,
And leaves the soul as white and pure
As though no sin had been.

}

wordsD = \markuplist {

\line { How free! It asks no price, }
\line { { \hspace #2 } For God delights to give; }
\line { It only says — a simple thing — }
\line { { \hspace #2 } “Believe in Christ, and live.” }

}

wordsE = \markuplist {

\line { Poor trembling sinner, “Come,” }
\line { { \hspace #2 } God waits to comfort thee; }
\line { Oh, cast thyself upon His love, }
\line { { \hspace #2 } So vast, so full, so free! }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
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

\noPageBreak

\markup { \fill-line { \vcenter \column {
  \vspace #1
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } }
  \vspace #1
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
