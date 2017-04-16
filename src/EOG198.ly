\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
}

\header{
  hymnnumber = "198"
  title = "There Is A Name We Love To Hear"
  tunename = "Los Angeles"
  meter = "C. M."
  poet = "Fred. Whitfield"
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key aes \major
  \partial 2.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees4 aes bes | c2. aes4 g aes | bes2.
  ees,4 bes' c | des1 ees2 | c2.
  ees,4 aes c | ees2. c4 bes c | des2.
  bes4 aes g | c1 bes2 | aes2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c4 ees ees | ees2. ees4 ees ees | ees2.
  ees4 ees ees | des2( f) ees | ees2.
  c4 ees ees | ees2. ees4 des ees | des2.
  f4 ees ees | ees1 des2 | c2.

}
}

notesTenor = {
\global
\relative a {

  aes4 aes g | aes2. ees'4 des c | g2.
  g4 g aes | bes1 g2 | aes2.
  aes4 aes aes | c2. c4 bes a | bes2.
  bes4 c bes | g2( f) g2 | aes2.

}
}

notesBass = {
\global
\relative f, {

  aes4 c ees | aes2. c4 bes aes | ees2.
  ees4 des c | bes1 ees2 | aes,2.
  aes4 c ees | aes2. ges4 f f | bes,2.
  des4 ees ees | ees1 ees2 | aes,2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

There is a name we love to hear, \bar "."
We love to sing its worth; \bar "."
It sounds like mu -- sic in our ear, \bar "."
The sweet -- est name on earth. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

It tells us of a Sav -- iour’s love,
Who died to set us free;
It tells us of His pre -- cious blood,
The sin -- ner’s per -- fect plea.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus! the name we love so well,
The name we love to hear!
No saint on earth its worth can tell,
No heart con -- ceive how dear.

}

wordsD = \markuplist {

\line { This name shall shed its fragrance still }
\line { { \hspace #2 } Along this thorny road }
\line { Shall sweetly smooth the rugged hill }
\line { { \hspace #2 } That leads us up to God. }

}

wordsE = \markuplist {

\line { And there the whole triumphant throng, }
\line { { \hspace #2 } Of blood-bought saints on high, }
\line { Shall sing the new eternal song }
\line { { \hspace #2 } With Jesus ever nigh. }

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
  \line{ \bold 4 \column { \wordsD } }
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
} }

\noPageBreak \markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 165. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
