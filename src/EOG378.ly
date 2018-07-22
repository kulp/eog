\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG378.ily"
}

\header{
  hymnnumber = "378"
  title = "The Father from Eternity" % not found at hymnary.org
  tunename = "Wie schön leuchtet der Morgenstern"
  meter = "P. M."
  poet = ""
  composer = "Philipp Nicolai" % see https://hymnary.org/tune/wie_schon_leuchtet_nicolai ; see https://en.wikipedia.org/wiki/Wie_schön_leuchtet_der_Morgenstern
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
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees | bes' g ees bes' | c c \tb bes\fermata \ta
  bes4 | c d ees d | c c \tb bes\fermata \ta
  g4 | c bes aes g | f2 \tb ees4\fermata \ta
  ees | bes' g ees bes' | c c \tb bes\fermata \ta
  bes4 | c d ees d | c c \tb bes\fermata \ta
  g4 | c bes aes g | f2 \tb ees4\fermata \ta r4

  bes'4( aes) g2 | bes4( aes) \tb g2\fermata \ta |
  aes4 g f \tb g\fermata \ta | aes4 g f \tb g\fermata \ta
  aes4 g f2 | \tb ees\fermata \ta
  ees'4 d | c bes aes g | f2 \tb ees4\fermata \ta

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 | d bes c ees | ees ees ees
  ees | ees f ees f | g ees d
  ees | ees ees ees ees | ees( d) ees
  ees4 | d bes c ees | ees ees ees
  ees | ees f ees f | g ees d
  ees | ees ees ees ees | ees( d) ees r4

  d4( f) ees2 | d4( f) ees2 |
  f4 ees d ees | f4 ees d ees |
  ees4 ees ees( d) | ees2
  g4 g | ees g f ees | ees( d) ees


}
}

notesTenor = {
\global
\relative a {

  g4 | f g g bes | aes aes g
  g4 | aes aes bes bes | bes a bes
  bes4 | aes bes c bes | c( bes8[ aes]) g4
  g4 | f g g bes | aes aes g
  g4 | aes aes bes bes | bes a bes
  bes4 | aes bes c bes | c( bes8[ aes]) g4 r4

  bes2 bes | bes bes |
  bes4 bes bes bes | bes bes bes bes |
  aes bes bes( aes) | g2
  c4 bes | c ees bes bes | bes( aes) g

}
}

notesBass = {
\global
\relative f {

  ees4 | bes ees c g | aes c ees_\fermata
  ees4 | aes f g f | ees f bes,_\fermata
  ees | aes, g aes bes | aes( bes) ees_\fermata
  ees4 | bes ees c g | aes c ees_\fermata
  ees4 | aes f g f | ees f bes,_\fermata
  ees | aes, g aes bes | aes( bes) ees_\fermata r4

  bes4( d) ees2 | bes4( d) ees2_\fermata |
  d4 ees bes ees_\fermata | d4 ees bes ees_\fermata |
  c4 bes bes2 | ees_\fermata
  c4 g' | aes ees d ees | bes2 ees4_\fermata

}
}

wordsA = \lyricmode {
\set stanza = "1."

The Fa -- ther, from e -- ter -- ni -- ty, \bar "."
Chose us, O Je -- sus Christ, in Thee, \bar "."
In Thee, His well -- be -- lov -- ed; \bar "."
And we, as giv’n to Thee— Thy bride, \bar "."
In Thee, Lord Je -- sus, can con -- fide; \bar "."
Thy love re -- mains un -- mov -- ed. \bar "."
From Thee dai -- ly \bar "."
Strength re -- ceiv -- ing— to Thee cleav -- ing, \bar "."
Bless -- ed Sav -- iour, \bar "."
May we all show forth Thy prais -- es. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Be -- fore the world we’d make our boast,
That Thou, in whom is all our trust,
Art Lord of life and glo -- ry;
And soon Thou’lt bring us to that place
Where we shall see Thee face to face,
And, glo -- ri -- fied, a -- dore Thee.
A -- men! Be then
Praise and bless -- ing— nev -- er ceas -- ing
To Thee giv -- en
Here and when we come to heav -- en.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one \lyricsto sopranos \wordsA
      \context Lyrics = two \lyricsto sopranos \wordsB
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
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1.8
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
