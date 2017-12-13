\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG169.ily"
}

\header{
  hymnnumber = "169"
  title = "Blest Be the Tie That Binds"
  tunename = "Dennis" % see https://hymnary.org/tune/dennis_nageli
  meter = "S. M."
  poet = "John Fawcett" % see https://hymnary.org/text/blest_be_the_tie_that_binds
  composer = "Johann G. Nägeli, arr. by Lowell Mason" % see https://hymnary.org/tune/dennis_nageli
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
  g2 | g( e) g | g( d) g | fis1 \eogbreak
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
And oft -- en for each oth -- er flows
The sym -- pa -- thiz -- ing tear.

}

wordsD = \lyricmode {
\set stanza = "4."

When for a while we part,
This thought will soothe our pain:
That we shall still be joined in heart,
And one day meet a -- gain.

}

wordsE = \markuplist {

\line { “That blessed hope” revives }
\line { { \hspace #2 } Our spirits by the way, }
\line { While each in expectation lives }
\line { { \hspace #2 } And longs to see the day, }

}

wordsF = \markuplist {

\line { When from all toil and pain }
\line { { \hspace #2 } And sin we shall be free, }
\line { And we shall with the Saviour reign }
\line { { \hspace #2 } Through all eternity. }

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\markup { \column {
  \fill-line { \vcenter \column {
    \vspace #1
    \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
    \line{ \bold 6 \column { \wordsF } }
  } }
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
