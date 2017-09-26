\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  score-markup-spacing.padding = 2.5
  score-markup-spacing.basic-distance = 2.5
}

\header{
  hymnnumber = "266"
  title = "We’ll Praise Thee, Glorious Lord"
  tunename = "Armington"
  meter = "S. M."
  poet = "J. N. Darby"
  composer = "Dr. G. O. Baily"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d4 | g b a a | g2.
  a8[ b] | c4 b8[ a] b4 a8[ g] | a2. \eogbreak
  d4 | d b b a8[ g] | g4 e c'
  c4 | b4 g b a | g2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  b4 | b d e fis | d2.
  d4 | fis g8[ fis] g4 e | fis2.
  g4 | g g g d | e c e
  e4 | g d fis fis | d2.

}
}

notesTenor = {
\global
\relative a {

  g4 | g g a c | b2.
  fis8[ g] | a4 b8[ c] b4 cis | c2.
  b4 | b d d c8[ b] | c4 g g
  a | b b d c | b2.

}
}

notesBass = {
\global
\relative f, {

  g4 | g g c d | g2.
  d4 | d d d d | d2.
  g4 | g g g g | c, c c
  a4 | d d d d | <g g,>2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

We’ll praise Thee, glo -- rious Lord, \bar "."
Who died to set us free, \bar "."
No earth -- ly songs can joy af -- ford \bar "."
Like heaven -- ly mel -- o -- dy. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Love, that no suf -- f’ring stayed,
We’ll praise, true love di -- vine;
Love that for us a -- tone -- ment made,
Love that has made us Thine.

}

wordsC = \lyricmode {
\set stanza = "3."

Love in Thy lone -- ly life
Of sor -- row here be -- low;
Thy words of grace, with mer -- cy rife,
Make grate -- ful prais -- es flow.

}

wordsD = \markuplist {

\line { Love, that on death’s dark vale }
\line { { \hspace #2 } Its sweetest odors spread, }
\line { Where sin o’er all seemed to prevail }
\line { { \hspace #2 } Redemption’s glory shed. }

}

wordsE = \markuplist {

\line { And now we see Thee risen, }
\line { { \hspace #2 } Who once for us hast died, }
\line { Seated above the highest heaven: }
\line { { \hspace #2 } The Father’s glorified. }

}

wordsF = \markuplist {

\line { Soon wilt Thou take Thy throne, }
\line { { \hspace #2 } Thy foes Thy footstool made, }
\line { And take us with Thee for Thine own, }
\line { { \hspace #2 } In glory love displayed. }

}

wordsG = \markuplist {

\line { Jesus, we wait for Thee, }
\line { { \hspace #2 } With Thee to have our part; }
\line { What can full joy and blessing be }
\line { { \hspace #2 } But being where Thou art? }

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

\markup { \vcenter \column {
  \vspace #0.2 % not enough space for \vspace #1
  \fill-line {
    \null
    \column {
    \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
    \line{ \bold 5 \column { \wordsE } }
    }
    \null
    \column {
    \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
    \line{ \bold 7 \column { \wordsG } }
    }
    \null
  }
  \vspace #0.2 % not enough space for \vspace #1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
