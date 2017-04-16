\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  system-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "169"
  title = "Blest Be the Tie That Binds"
  tunename = "Dennis"
  meter = "S. M."
  poet = "J. Fawcett"
  composer = "H. G. Nageli"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  b2 | b( g) b | a( fis) a | g1
  g2 | g( e) g | g( d) g | fis1
  a2 | a( fis) a | g( b) d | d( a) c | b( d)
  e2 | d( b) c | b( g) a | g1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g2 | g( d) g | fis( d) d | d1
  d2 | e( c) e | d( b) d | d1
  fis2 | fis( d) fis | g1 g2 | fis1 a2 | g1
  g2 | g1 g2 | g1 fis2 | g1

}
}

notesTenor = {
\global
\relative a {

  d2 | d( b) d | d( a) c | b1
  b2 | c( g) c | b( g) b | a1
  a2 | d( a) c | b( d) b | a( d) d | d( b)
  c2 | d1 c2 | d( b) c | b1

}
}

notesBass = {
\global
\relative f {

  g2 | g1 g2 | d1 d2 | g1
  g2 | c,1 c2 | g'1 g2 | d1
  d2 | d1 d2 | g1 g2 | d1 fis2 | g1
  c2 | b( g) e | d1 d2 | g,1

}
}

wordsA = \lyricmode {
\set stanza = "1."

Blest be the tie that binds \bar "."
Our souls in Je -- sus’ love; \bar "."
The fel -- low -- ship of kin -- dred minds \bar "."
Is shared with Him a -- bove. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Be -- fore our Fa -- ther’s throne
We pour our fer -- vent prayers;
In Christ our thoughts and hopes are one,
Our com -- forts and our cares.

}

wordsC = \lyricmode {
\set stanza = "3."

We share each oth -- er’s woes,
Each oth -- er’s bur -- dens bear;
And oft -- en for each oth --er flows
The sym -- pa -- thiz -- ing tear.

}

wordsD = \lyricmode {
\set stanza = "4."

When for a while we part,
This thought will sooth our pain:
That we shall still be joined in heart,
And one day meet a -- gain.

}

wordsE = \markuplist {

\line { “That blessed hope” revives }
\line { Our spirits by the way, }
\line { While each in expectation lives }
\line { And longs to see the day, }

}

wordsF = \markuplist {

\line { When from all toil and pain, }
\line { And sin we shall be free, }
\line { And we shall with the Saviour reign }
\line { Through all eternity. }

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
