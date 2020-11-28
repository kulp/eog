\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG198.ily"
}

\header{
  hymnnumber = "198"
  title = "There Is a Name We Love to Hear" % not found at hymnary.org
  tunename = "Los Angeles" % not found at hymnary.org
  meter = "C. M."
  poet = "Frederick Whitfield" % see http://www.stempublishing.com/hymns/ss/184
  composer = "" % not found at hymnary.org
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
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1.5
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\markup { \vcenter \column {
  \vspace #0.5 % not enough space for \vspace #1
  \fontsize #0.3 \fill-line {
    \null
    \line{ \bold 4 \column { \wordsD } }
    \null
    \line{ \bold 5 \column { \wordsE } }
    \null
  }
  \vspace #0.5 % not enough space for \vspace #1
  \fill-line { \line { Alternate tune: No. 165. } }
} }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
