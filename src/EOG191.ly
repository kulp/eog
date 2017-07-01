\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tunes: No.’s 163, 190, 291." } }

}

\header{
  hymnnumber = "191"
  title = "Saviour, Though the Desert Lead Us"
  tunename = ""
  meter = "8. 7. 8. 7. D."
  poet = "T. Kelly"
  composer = "W. B. Bradbury"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 g g8 f g aes | bes4( ees) bes( g) |
  f4 g aes8 c bes aes | g2. r4 % rest not in original, but required to make timing work
  g4 g g8 f g aes | bes4( ees) bes( g) |
  f4 g aes8 c bes aes | g2.
  bes8 bes | c4 ees2
  d8 c | bes4 g2
  g8 g | f4 c' bes aes | g2.
  bes8 bes | c4 ees2
  d8 c | bes4 \tb ees2 \fermata \ta
  ees,8 f | g4 bes aes f | ees2. r4 % impossible "r8" in original

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 ees ees8 d ees f | g2 g4( ees) |
  d4 ees f8 aes g f | ees2. r4 % added rest
  ees4 ees ees8 d ees f | g2 g4( ees) |
  d4 ees f8 aes g f | ees2.
  g8 g | aes4 c2
  bes8 aes | g4 ees2
  ees8 ees | d4 aes' g f | ees2.
  g8 g | aes4 c2
  bes8 aes | g4 g2
  ees8 ees | ees4 g f d | ees2. r4

}
}

notesTenor = {
\global
\relative a {

  bes4 bes bes8 bes bes bes | bes2 ees4( bes) |
  bes4 bes bes8 bes bes bes | bes2. r4 % added rest
  bes4 bes bes8 bes bes bes | bes2 ees4( bes) |
  bes4 bes bes8 bes bes bes | bes2.
  ees8 ees | ees4 ees2
  ees8 ees | ees4 bes2
  bes8 bes | bes4 bes bes bes | bes2.
  ees8 ees | ees4 ees2
  ees8 ees | ees4 bes2
  g8 aes | bes4 bes bes aes | g2. r4

}
}

notesBass = {
\global
\relative f {

  ees4 ees ees8 aes g f | ees2 ees
  bes4 bes bes8 bes bes bes | ees2. r4 % added rest
  ees4 ees ees8 aes g f | ees2 ees
  bes4 bes bes8 bes bes bes | ees2.
  c8 c aes'4 aes2
  aes8 aes | ees4 ees2
  ees8 ees bes4 bes bes bes | ees2.
  c8 c aes'4 aes2
  aes8 aes | ees4 ees2_\fermata
  ees8 ees | ees4 ees bes bes | ees2. r4

}
}

wordsA = \lyricmode {
\set stanza = "1."

Sav -- iour, through the des -- ert lead us, \bar "."
With -- out Thee we can -- not go; \bar "."
Thou from cru -- el chains hast freed us, \bar "."
And hast laid the ty -- rant low: \bar "."
Let Thy pre -- sence, let Thy pre -- sence, \bar "."
Cheer us all our jour -- ney through. \bar "."
%{HIDE>%} Let Thy pre -- sence, let Thy pre -- sence \bar "."
Cheer us all our jour -- ney through. %{<HIDE%} \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Through a des -- ert waste and cheer -- less
Though our des -- tined jour -- ney lie,
Ren -- dered by Thy pre -- sence fear -- less,
We may ev -- ’ry foe de -- fy:
Naught shall move us, naught shall move us,
While we see Thee, Sav -- iour, nigh.
%{HIDE>%} Naught shall move us, naught shall move us,
While we see Thee, Sav -- iour, nigh. %{<HIDE%}

}

wordsC = \lyricmode {
\set stanza = "3."

With a price Thy love has bought us,
Sav -- iour, what a love is Thine!
Hith -- er -- to Thy power has brought us,
Power and love in Thee com -- bine:
Lord of glo -- ry, Lord of glo -- ry,
Ev -- er on Thy house -- hold shine.
%{HIDE>%} Lord of glo -- ry, Lord of glo -- ry,
Ev -- er on Thy house -- hold shine. %{<HIDE%}

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
