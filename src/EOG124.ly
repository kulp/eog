\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 5) (#t #f))
  system-count = #(cond (is-eogsized 6) (#t #f))
}

\header{
  %gospel
  hymnnumber = "124"
  title = "There Is a Saviour on High in the Glory"
  tunename = ""
  meter = "P. M."
  poet = "E. B. Hartt"
  composer = "Ira D. Sankey"
  tagline = ##f
}

ta = { \tempo 4=120 }
tb = { \tempo 4=60 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \key g \major
  \ta
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \once \override NoteHead.font-size = #-4 d4 |
  d2 d4 g | b2 g4 b | b( a) e fis | g2 d4 \eogbreak
  d4 | d2 g4 b | d2 b4 b | g2 a4 g | a2. \eogbreak
  d,4 | d2 d4 g | b2 g4 b | b( a) e fis | g2 d4 \eogbreak
  g4 | g2 fis4 e | d2 g4 a | b2 a4 a | g2. \eogbreak

  << s^\markup { \small \caps "Refrain" } % TODO arrange REFRAIN and dynamic forte appropriately
  { b4^\markup \dynamic f | d2 d4 e d2 b4 } >>
  b^\markup \dynamic p | b2 b4 c | b2 a4
  g4 | g2 fis4 e | d2 \tb g4 \fermata \ta
  g4^\markup \dynamic pp | g( fis) e \tb fis \fermata | g1 \fermata \ta |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \once \override NoteHead.font-size = #-4 b4 |
  b2 b4 b | d2 b4 d | c2 c4 c | b2 b4
  b4 | b2 d4 g | g2 g4 g | g2 a4 cis, | fis2.
  b,4 | b2 b4 b | d2 b4 d | c2 c4 c | b2 b4
  b4 | e2 d4 c | b2 cis4 cis | d2 fis4 fis | d2.

  g4 | g2 g4 g | g2 g4
  g | g2 g4 g | g2 fis4
  e4 | e2 d4 c | b2 d4
  d4 | c2 c4 c | b1 |

}
}

notesTenor = {
\global
\relative a {

  \once \override NoteHead.font-size = #-4 g4 |
  g2 g4 g | g2 g4 g | fis2 a4 a | g2 g4
  g4 | g2 b4 d | b2 d4 d | d2 d4 a | fis2.
  fis4 | g2 g4 g | g2 g4 g | fis2 a4 a | g2 g4
  g4 | g2 g4 g | g2 g4 g | g2 c4 c | b2.

  d4 | b2 b4 c | b2 d4
  d | d2 d4 e | d2 c4
  b4 | c2 g4 g | g2 b4
  b4 | a2 g4 a | g1 |
}
}

notesBass = {
\global
\relative f {

  \once \override NoteHead.font-size = #-4 g4 |
  g2 g4 g | g2 g4 g | d2 d4 d4 | g2 g4
  g4 | g2 g4 g | g2 g4 g | g2 fis4 e | d2.
  d4 | g,2 g4 g | g2 g4 g | d'2 d4 d | g,2 g4
  g4 | c2 c4 c | g'2 e4 e | d2 d4 d | g2.

  g4 | g2 g4 g | g2 g4
  g | g2 g4 g | g2 d4
  e4 | c2 c4 c | d2 d4_\fermata
  d4 | d2 d4 d | g,1_\fermata |

}
}

Refrain = \lyricmode {

Oh, come now to Je -- sus, \bar "."
That dear, lov -- ing Sav -- iour, \bar "."
Re -- ceive Him this mo -- ment, \bar "."
And peace shall be thine. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

_ There is a Sav -- iour on high in the glo -- ry, \bar "."
A Sav -- iour who suf -- fered on Cal -- va -- ry’s tree, \bar "."
A Sav -- iour as will -- ing to save now as ev -- er, \bar "."
His arm is al -- might -- y, His love great and free. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

That dear lov -- ing Sav -- iour, who lives in the glo -- ry,
This world once re -- ject -- ed and nailed to the tree,
A robe of de -- ri -- sion they cir -- cled a -- round Him,
And all this He suf -- fered from sin -- ners like thee.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

_ Those hours of dark -- ness He suf -- fered for sin -- ners
On Cal -- va -- ry’s cross, all for -- sa -- ken, a -- lone,
While mak -- ing a -- tone -- ment and bear -- ing the judg -- ment,
Are end -- ed, and now He’s on high on the throne.

}

wordsD = \markuplist {

\line { He waiteth in patience for sinners to trust Him, }
\line { { \hspace #2 } And says: “I receive thee now just as thou art; }
\line { Salvation and pardon I heartily offer }
\line { { \hspace #2 } To all who receive Me by faith in their heart.” }

}

wordsE = \markuplist {

\line { No time should be wasted, thy moments are precious, }
\line { { \hspace #2 } Thy time for departing from earth draweth nigh; }
\line { Then come now this moment and He will receive you, }
\line { { \hspace #2 } And spend your eternity with Him on high. }

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

\noPageBreak

\markup { \fill-line { \column {
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
