\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  % decrease system-to-system padding to fit onto page with next score
  system-system-spacing.padding = 2
  system-system-spacing.basic-distance = 2
  scoreTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \override #'(baseline-skip . 3.5)
      \column {
        \fill-line {
          \huge \larger \larger \bold {
            \concat { "  " \fromproperty #'header:hymnnumber }
            \mytitle
            \null
          }
        }
        \fill-line {
          % less lowering (to save vertical space)
          \lower #1 \fromproperty #'header:poet
          \smaller \bold \mysubtitle
          \lower #1 \fromproperty #'header:composer
        }
      }
    }
  }
}

\header{
  hymnnumber = "198"
  title = "There Is a Name We Love to Hear"
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

There is a Name we love to hear, \bar "."
We love to sing its worth; \bar "."
It sounds like mu -- sic in our ear, \bar "."
The sweet -- est Name on earth. \bar "."

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

Je -- sus! the Name we love so well,
The Name we love to hear!
No saint on earth its worth can tell,
No heart con -- ceive how dear.

}

wordsD = \markuplist {

\line { This Name shall shed its fragrance still }
\line { { \hspace #2 } Along this thorny road, }
\line { Shall sweetly smooth the rugged hill }
\line { { \hspace #2 } That leads us up to God. }

}

wordsE = \markuplist {

\line { And there the whole triumphant throng, }
\line { { \hspace #2 } Of blood-bought saints on high, }
\line { Shall sing the new, eternal song }
\line { { \hspace #2 } With Jesus ever nigh. }

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
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak

\markup { \raise #5 \fill-line {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } }
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
} }

\noPageBreak \markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 165. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
