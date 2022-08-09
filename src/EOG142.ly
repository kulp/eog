\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG142.ily"
}

\header{
  %gospel
  hymnnumber = "142"
  title = "Ye Must Be Born Again"
  tunename = ""
  meter = "P. M. with Refrain"
  poet = "William T. Sleeper" % see https://hymnary.org/text/a_ruler_once_came_to_jesus_by_night
  composer = "George C. Stebbins" % see https://hymnary.org/tune/a_ruler_once_came_to_jesus_by_stebbins
  tagline = ##f
}

ta = { \tempo 8=140 }
tb = { \tempo 8=70 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees8 | g g g g( aes) bes | c bes a bes4 \eogbreak
  bes8 | bes aes g f g aes | aes g fis g4 \eogbreak
  ees8 | g g g g aes bes | c bes a bes4 \eogbreak
  g8 | f4 bes8 bes4 a8 | bes4. ~ \tb bes4 \fermata \ta

  << s^\markup { \small \caps "Refrain" }
  { bes8 | bes4 bes8 g8[ aes] bes | c4. ~ c4 } >>
  c8 | c4 c8 f,8[ g] aes | bes4. ~ bes4
  aes8 | g8. g16 g8 aes8. aes16 aes8 | bes bes bes c4
  \tb ees8 \fermata \ta | bes4 g8 g4 f8 | ees4. ~ \tb ees4 \fermata \ta

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  bes8 | ees ees ees ees( f) g | aes g fis g4
  g8 | g f ees d ees f | f ees ees ees4
  bes8 | ees ees ees ees f g | aes g fis g4
  ees8 | d4 f8 ees4 ees8 | d4 ees8 f4

  aes8 | g4 g8 ees[ f] g | aes4 aes8 aes4
  aes8 | aes4 aes8 d,[ ees] f | g4 f8 ees4
  d8 | ees8. ees16 ees8 d8. d16 d8 | ees ees ees ees4
  aes8 | g4 ees8 ees4 d8 | ees4 c8 bes4

}
}

notesTenor = {
\global
\relative a {

  g8 | bes bes bes bes ~ bes ees | ees ees ees ees4
  ees8 | ees bes bes bes bes bes | bes bes a bes4
  g8 | bes bes bes bes bes ees | ees ees ees ees4
  bes8 | bes4 d8 c4 c8 | bes4 g8 aes4

  d8 | ees4 ees8 bes4 ees8 | ees4 ees8 ees4
  ees8 | d4 bes8 bes4 bes8 | bes4 aes8 g4
  bes8 | bes8. bes16 bes8 bes8. bes16 bes8 | bes bes bes aes4
  c8 | ees4 bes8 bes4 aes8 | g4 aes8 g4

}
}

notesBass = {
\global
\relative f {

  ees8 | ees ees ees ees ~ ees ees | ees ees ees ees4
  ees8 | bes bes bes bes bes bes | ees ees ees ees4
  ees8 | ees ees ees ees ees ees | ees ees ees ees4
  ees8 | f4 f8 f4 f8 | bes,4 bes8 bes4_\fermata

  bes8 | ees4 ees8 ees4 ees8 | aes4 aes8 aes4
  aes,8 | bes4 bes8 bes4 bes8 | ees4 ees8 ees4
  bes8 | ees8. ees16 ees8 f8. f16 f8 | g g g aes4
  aes8_\fermata | bes4 bes8 bes,4 bes8 | ees4 ees8 ees4_\fermata

}
}

Refrain = \lyricmode {

“Ye must be born a -- gain”! %{HIDE>%} “a -- gain”! %{<HIDE%} \bar "."
“Ye must be born a -- gain”! %{HIDE>%} “a -- gain”! %{<HIDE%} \bar "."
I ver -- i -- ly, ver -- i -- ly say un -- to thee, \bar "."
“Ye must be born a -- gain”! %{HIDE>%} “a -- gain”! %{<HIDE%} \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

A ru -- ler once came to Je -- sus by night, \bar "."
To ask Him the way of sal -- va -- tion and light; \bar "."
The Sav -- iour made an -- swer in words true and plain, \bar "."
“Ye must be born a -- gain”! %{HIDE>%} “a -- gain”! %{<HIDE%} \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Ye chil -- dren of men, at -- tend to the word
So so -- lemn -- ly ut -- tered by Je -- sus the Lord,
And let not this mes -- sage to you be in vain:
“Ye must be born a -- gain”! %{HIDE>%} “a -- gain”! %{<HIDE%}

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

O ye who would { \mon } en -- ter { \moff } this glo -- ri -- ous rest,
And sing with the ran -- somed the song of the blest;
The life ev -- er -- last -- ing if ye would ob -- tain,
“Ye must be born a -- gain”! %{HIDE>%} “a -- gain”! %{<HIDE%}

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto altos \wordsA
      \context Lyrics = two   \lyricsto altos \wordsB
      \context Lyrics = three \lyricsto altos \wordsC
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

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
