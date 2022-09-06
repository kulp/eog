\include "common/global.ily"
\paper {
  \include "common/paper-additional.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "8"
  title = ""
  tunename = "A Praise Song"
  meter = "P. M."
  poet = ""
  composer = "J. Revell, 1885" % from https://biblicalstudies.org.uk/pdf/eq/1962-4_206.pdf
  alternate = \markup { "Alternate tune for No. 376." }
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=126 }
tb = { \tempo 4=63  }

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
\relative c'' {

  g4 | g fis8 g bes4 g8( ees) | g4.( f8) ees4. \bar "."
  ees16 ~ ees | f4 e8( f) aes4 ~ aes8 c8 | bes2. \bar "." \eogbreak
  bes4 | bes aes8 bes c4 ~ c8 g | bes4.( aes8) g4. \bar "."
  f16 ~ f | ees4 bes8( ees) g4. f8 | ees2. \bar "." \eogbreak

  g4 | ees'4 d8 c d4 b8( g) | d'2( c4) \bar "."
  c4 | bes4 aes8 g bes4( aes8) g | f2. \bar "." \eogbreak
  fis8 ~ fis | g4 fis8 g bes4 g8( ees) | g4.( f8) ees4 \bar "."
  e8 ~ e | f4 aes8 c bes4 d,8 ~ d | ees2. \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g4 | ees2 <ees bes> | ees4.( d8) bes4.
  ees8 | d4 cis8[ d] f4. aes8 | g2.
  g4 | <g ees>2 <g e> | g4.( f8) c4. ~
  c8 | bes4 bes ees4. d8 | bes2.

  g'4 | <g ees>2 <g f> | <g f> ees4 ~
  ees4 | f4. ees8 ees4 d8 ees | d2.
  fis4 | ees2 ees | ees4.( d8) c4 ~
  c4 | c4. ees8 d4 bes4 | bes2.

}
}

notesTenor = {
\global
\relative a {

  r4 | bes2 g | bes4.( aes8) g4.
  r8 | bes2 bes | bes2.
  bes4 | bes2 g4. c8 | c2 aes4. ~
  aes8 | g2 bes4. aes8 | g2.

  r4 | <c g>2 b4 d8[ b] | b2 <c g>4 ~
  <c g>4 | bes4. bes8 bes4 bes8 bes | bes2.
  r4 | bes2 bes | bes4. aes8 g4 ~
  g4 | f4. <aes f>8 bes4 aes | g2.
}
}

notesBass = {
\global
\relative f {

  r4 | ees2 g, | bes ees4.
  r8 | bes2 d4. bes8 | ees2.
  ees4 | des2 c | f aes,4. ~
  aes8 | bes2 bes | ees2.

  r4 | c2 g' | g c,4 ~
  c4 | d4. ees8 g4 f8 ees | bes2.
  r4 | ees2 g4 ees8[ g] | bes,4. b8 c4
  bes4 | aes4( f8) f8 bes2 | ees2.
}
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
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

\markup {
  \center-column {
    \override #'(span-factor . 1/2)
    \fill-line { \null { \onlyEogMarkup \draw-hline \null } \null }
  }
}

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
