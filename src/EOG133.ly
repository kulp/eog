\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "133"
  title = "With Joy and With Gladness There Stand A Great Throng"
  markuptitle = \markup \center-column { "With Joy and With Gladness" "There Stand A Great Throng" \vspace #0.4 }
  % markup title doesn't work with make_index.pl, so we use this commented version instead
  %title = "With Joy and With Gladness There Stand A Great Throng"
  tunename = ""
  meter = "11s."
  poet = "A. T. Pierson"
  composer = "P. P. Bliss"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key bes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d8.[ ees16] | f4 f g8.[ a16] | bes4 bes a8.[ bes16] | c4 bes g | f2
  f8. f16 | f4 g a | bes c d | d c bes | c2

  << s^\markup { \small \caps "Refrain" }
  { d8. c16 | bes4 bes bes8.[ a16] | g4 g g | c c d | c2 } >>
  c8. c16 | d4 c d | ees d c | bes a c | bes2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  bes8.[ c16] | d4 d ees8.[ c16] | d4 d c8.[ d16] | ees4 ees ees | d2
  f8. f16 | f4 e ees | d d d | e e e | f2

  f8. ees16 | d4 d d8. f16 | ees4 ees ees | ees e e | f2
  f8. f16 | f4 f f | ees f g | f f ees | d2

}
}

notesTenor = {
\global
\relative a {

  bes4 | bes bes bes | bes f f | g g bes | bes2
  a8. a16 | a4 bes c | bes bes bes | bes bes bes | a2

  a8. a16 | bes4 bes bes | bes bes bes | c g bes | a2
  a8. a16 | bes4 c bes | bes bes ees | d c a | bes2

}
}

notesBass = {
\global
\relative f, {

  bes4 | bes bes bes | bes bes bes | ees ees ees | bes2
  f'8. f16 | f4 f f | g g g | g g g | f2

  f8. f16 | bes,4 bes bes8.[ d16] | ees4 ees ees8.[ d16] | c4 c c | f2
  f8. f16 | bes4 a aes | g f ees | f f f | bes,2

}
}

Refrain = \lyricmode {

Un -- to Him who hath loved us and washed us from sins, \bar "." \break
Un -- to Him be the glo -- ry for -- ev -- er. A -- men. \bar "." \break

}

wordsA = \lyricmode {
\set stanza = "1."

With joy and with glad -- ness there stand a great throng, \bar "." \break
In the pres -- ence of Je -- sus, and sing this new song: \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

All these once were sin -- ners, de -- filed in His sight,
Now ar -- rayed in pure gar -- ments in praise they u -- nite:

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

He mak -- eth the reb -- el a priest and a king;
He hath brought him and taught him this new song to sing:

}

wordsD = \markuplist {

\line { How helpless and hopeless } \line { { \hspace #2 } poor sinners had been, }
\line { If He never had loved them } \line { { \hspace #2 } till cleansed from their sins. }

}

wordsE = \markuplist {

\line { Aloud in His praises } \line { { \hspace #2 } their voices shall ring. }
\line { So that others believing, } \line { { \hspace #2 } this new song shall sing. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
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

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
