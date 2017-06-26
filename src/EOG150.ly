\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  % shrink space before markup verses to fit next hymn on same page
  score-markup-spacing.padding = #2
  score-markup-spacing.basic-distance = #2
}

\header{
  hymnnumber = "150"
  title = "Break Forth and Sing the Song"
  tunename = "St. Thomas"
  meter = "S. M."
  poet = "I. Watts"
  composer = "G. F. Handel, A. Williams" % http://hymnary.org/tune/st_thomas_williams
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d2 | g g b a4( g) | a1.
  b4( c) | d2 c4( b) c2 b | a1.
  d2 | b g a d, | g b d2.
  d4 | e2 d4( c) b2 a | g1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 | d d d d4( cis) | d1.
  d2 | d fis4( g) e( fis) g2 | fis1.
  d2 | d d d d | d e fis2.
  g4 | g2 g g fis | g1.

}
}

notesTenor = {
\global
\relative a, {

  d2 | g b g a | fis1.
  d'2 | b c4( d) c2 d | d1.
  a2 | g g fis a | b g a2.
  d4 | c2 d4( e) d2 c | b1.

}
}

notesBass = {
\global
\relative f {

  d2 | b g g' fis4( e) | d1.
  g4( a) | b2 a4( g) a2 g | d1.
  fis2 | g b, d fis | g e d2.
  b4 | c2 b4( c) d2 d | g,1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

Break forth and sing the song \bar "."
Of “Glo -- ry to the Lamb!” \bar "."
Wake ev -- ery heart and ev -- ery tongue \bar "."
To praise the Sav -- iour’s name. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Sing of His dy -- ing love;
Sing of His ris -- ing power;
Sing how He in -- ter -- cedes a -- bove
For those whose sins He bore.

}

wordsC = \lyricmode {
\set stanza = "3."

Sing on your heaven -- ly road,
Ye sons of glo -- ry, sing;
To the as -- cend -- ed Lamb of God
Your cheer -- ful prais -- es bring.

}

wordsD = \markuplist {

\line { Soon shall we hear Him say, }
\line { “Ye ransomed pilgrims, come”; }
\line { Soon will He call us hence away, }
\line { And take us to His home. }

}

wordsE = \markuplist {

\line { Then shall each raptured tongue }
\line { His fullest praise proclaim; }
\line { And sweeter voices wake the song }
\line { Of “Glory to the Lamb!” }

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

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } }
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
