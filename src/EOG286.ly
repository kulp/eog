\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "286"
  title = "When Israel, By Divine Command"
  tunename = "Dumferline"
  meter = "C. M."
  poet = "J. Newton"
  composer = "Este’s Psalter"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d4 | g a b c | d d b
  b4 | e d d cis | d2.
  \tb d4\fermata \ta | b d e d | c b a
  b4 | a g g fis | g2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | d d d g | g fis g
  d4 | g fis e e | fis2.
  fis4 | g g g g | fis g fis
  g4 | fis e e d | d2.

}
}

notesTenor = {
\global
\relative a {

  b4 | b a g g | a a b
  b4 | b a b a | a2.
  d4 | d d c d | d d d
  d4 | d8[ c] b4 c8[ b] a4 | b2.

}
}

notesBass = {
\global
\relative f {

  g4 | g fis g e | d d g
  g | e fis g a | d,2.
  d4\fermata | g b c b | a g d
  g4 | d e c d | g,2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

When Is -- rael, by di -- vine com -- mand, \bar "."
The path -- less des -- ert trod, \bar "."
They found, thro’ -- out the bar -- ren land, \bar "."
A sure re -- source in God. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

A cloud -- y pil -- lar marked the road,
And screened them from the heat;
From the hard rock the wa -- ter flowed,
And man -- na was their meat.

}

wordsC = \lyricmode {
\set stanza = "3."

Like them, we have a rest in view,
Se -- cure from hos -- tile pow’rs;
Like them, we pass a des -- ert, too,
But Is -- rael’s God is ours.

}

wordsD = \lyricmode {
\set stanza = "4."

His word a light be -- fore us spreads,
By which our path we see;
His love, a ban -- ner o’er our heads,
From harm pre -- serves us free.

}

wordsE = \markuplist {

\line { Jesus, the bread of life, is given }
\line { { \hspace #2 } To be our daily food; }
\line { Within us dwells that well from heaven, }
\line { { \hspace #2 } The Spirit of our God. }

}

wordsF = \markuplist {

\line { Lord, ’tis enough, we ask no more; }
\line { { \hspace #2 } Thy grace around us pours }
\line { Its rich and unexhausted store, }
\line { { \hspace #2 } And all its joy is ours. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \clef bass
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

\noPageBreak

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
  \line{ \bold 6 \column { \wordsF } }
  \hspace #0.1
} }

\noPageBreak \markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 46. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
