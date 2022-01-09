\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG150.ily"
}

\header{
  hymnnumber = "150"
  title = "Break Forth and Sing the Song"
  tunename = "St. Thomas"
  meter = "S. M."
  poet = "Isaac Watts" % see https://hymnary.org/text/break_forth_and_sing_the_song_of_glory
  composer = "George F. Handel, arr. by Aaron Williams" % see http://hymnary.org/tune/st_thomas_williams
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
\line { { \hspace #2 } “Ye ransomed pilgrims, come”; }
\line { Soon will He call us hence away, }
\line { { \hspace #2 } And take us to His home. }

}

wordsE = \markuplist {

\line { Then shall each raptured tongue }
\line { { \hspace #2 } His fullest praise proclaim; }
\line { And sweeter voices wake the song }
\line { { \hspace #2 } Of “Glory to the Lamb!” }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\markup { \fontsize #0.3 \vcenter \column {
  \vspace #1
  \fill-line {
    \null
    \line{ \bold 4 \column { \wordsD } }
    \null
    \line{ \bold 5 \column { \wordsE } }
    \null
  }
} }

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
