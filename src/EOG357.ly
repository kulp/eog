\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "357"
  title = "Something More than Gold"
  tunename = ""
  meter = "C. M. with Refrain" % original has "With"
  poet = "Anon."
  composer = "Anon."
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=130
  \key f \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  c8 | f, f a a g g f
  a8 | c c d f c4. \break % \break verified in letter as well as eogsized
  c8 | d d c c bes bes a8 % original has tie, but only one verse is sung that way
  a8 | g8 c c b c4. \eogbreak

  c8^\markup { \small \caps "Refrain" } | f, f a a g g f[ a8] |
  c c d f c4.
  c8 | d d c c bes bes a8
  a8 | c bes a g f4.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f8 | c c f f e e f
  f8 | f f f f f4.
  f8 | f f f f e e f8
  f8 | e8 e f f e4.

  f8 | c c f f e e f4
  f8 f f f f4.
  f8 | f f f f e e f8
  f8 f f f e f4.

}
}

notesTenor = {
\global
\relative a {

  a8 | a a c c bes bes a
  c8 | a a bes bes a4.
  c8 | bes bes c c c c c8
  c8 | c8 c d d c4.

  a8 | a a c c bes bes a[ c]
  a8 a bes bes a4.
  c8 | bes bes c c c c c8
  c8 | c8 d c bes a4.

}
}

notesBass = {
\global
\relative f {

  f8 | f f f f c c f
  f8 | f f bes, d f4.
  a8 | bes bes a a g g f
  f8 | g8 g g g c,4.


  f8 | f f f f c c f4
  f8 f bes, d f4.
  a8 | bes bes a a g g f
  f8 | a, bes c c f4.

}
}

Refrain = \lyricmode {

Oh, yes, oh, yes, there’s some -- thing more, \bar "."
Some -- thing more than gold: \bar "."
To know your sins are all for -- given \bar "."
Is some -- thing more than gold. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

A cer -- tain man of whom we read, \bar "."
Who lived in days of old, \bar "."
Though he was rich, he felt his need \bar "."
Of some -- thing more than gold. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

It hap -- pened on a cer -- tain day,
This lit -- tle man was told
That Je -- sus soon would pass that way
With some -- thing more than gold.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

He climbed a tree a -- bove the crowd,
So that he might be -- hold
That bless -- ed One with pow’r to give
Him some -- thing more than gold.

}

wordsD = \markuplist {

\line { The Saviour came along the way }
\line { And saw him in the tree; }
\line { Then calling to him, Jesus said, }
\line { “I must abide with thee.” }

}

wordsE = \markuplist {

\line { So he obeyed, and soon he found }
\line { The half had not been told; }
\line { The blessing Jesus brought to him }
\line { Was better far than gold. }

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

\markup { \fill-line { \column {
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } }
  \vspace #3
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
