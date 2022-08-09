\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  %children
  hymnnumber = "296"
  title = "Awake! Awake! In Happy Song" % not found at hymnary.org
  tunename = "Warwick"
  meter = "C. M."
  poet = ""
  composer = "Samuel J. Stanley" % see https://hymnary.org/tune/warwick_stanley
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key d \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d4 | fis8[ a] d[ b] a4 b | a8[ fis] e4 d
  fis4 | a b8[ cis16 d] cis8[ b] a[ gis] | a2.
  a4 | b8[ g] d'[ b] a4 fis | g8[ e] a[ g] fis4
  a4 | b8[ cis] d[ e] d4 cis | d2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | d d d d | fis8[ d] cis4 d
  d4 | e fis e e | e2.
  d4 | d g fis d | e cis8[ e] d4
  d4 | d8[ e] a[ g] fis4 e | fis2.

}
}

notesTenor = {
\global
\relative a {

  fis4 | a8[ fis] b[ g] fis4 d' | d8[ a] g4 fis
  a4 | a a a8[ d] cis[ b] | cis2.
  fis,4 | g8[ b] b[ d] d4 a | a a a
  d4 | d8[ a] a[ b] a4 a | a2.

}
}

notesBass = {
\global
\relative f {

  d4 | d d d g, | a a d
  d4 | cis d e e | a,2.
  d4 | d d d d | cis a d
  fis4 | g fis8[ g] a4 a, | d2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

A -- wake! a -- wake! in hap -- py song, \bar "."
Ye chil -- dren great and small, \bar "."
And join to sing the prais -- es sweet \bar "."
Of Him who died for all. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He left His bright and hap -- py home
To seek and save the lost,
A babe in Beth -- l’em’s man -- ger lay,
A -- wak -- ing heaven -- ly host.

}

wordsC = \lyricmode {
\set stanza = "3."

He trod this earth, a low -- ly man,
For three -- and -- thir -- ty years,
And then was nailed on Cal -- v’ry’s tree,
To still our guilt -- y fears.

}

wordsD = \lyricmode {
\set stanza = "4."

And now He’s gone to heaven a -- gain,
And sits on glo -- ry’s throne—
With o -- pen arms and lov -- ing smile,
He wel -- comes all who come.

}

wordsE = \markuplist {

\line { It is because the Shepherd good, }
\line { { \hspace #2 } For sheep and lambs did die, }
\line { That those who trust His precious blood }
\line { { \hspace #2 } Shall dwell with Him on high. }

}

wordsF = \markuplist {

\line { Oh! may we all, a joyous band, }
\line { { \hspace #2 } Give praises pure and sweet, }
\line { To please His heart, to make Him glad, }
\line { { \hspace #2 } Till round His throne we meet. }

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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
    \line{ \bold 5 \column { \wordsE } }
    \null
    \line{ \bold 6 \column { \wordsF } }
    \null
  }
} }

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
