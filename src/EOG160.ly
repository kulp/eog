\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  \include "override/override-EOG160.ily"
}

\header{
  hymnnumber = "160"
  title = "Though in a Foreign Land"
  tunename = "Franconia" % see https://hymnary.org/tune/franconia_konig
  meter = "S. M."
  poet = "Augustus M. Toplady" % see https://hymnary.org/text/though_in_a_foreign_land_we_are_not_far_
  composer = "Johann B. König" % see https://hymnary.org/tune/franconia_konig
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees2 | f g aes bes | g1.
  bes2 | c ees aes, g | f1.
  bes2 | ees d c bes | c c bes
  bes2 | ees, g f f | ees1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  bes2 | d ees ees d | ees1.
  ees2 | ees ees d ees | d1.
  d2 | ees f ees d | g f4( ees) d2
  ees2 | ees ees ees d | ees1.

}
}

notesTenor = {
\global
\relative a {

  g2 | bes bes aes f | g1.
  g2 | aes bes aes bes | bes1.
  bes2 | bes bes a bes | bes a bes
  g2 | g bes c bes4( aes) | g1.

}
}

notesBass = {
\global
\relative f {

  ees2 | bes ees c bes | ees1.
  ees2 | aes g f ees | bes1.
  bes'2 | g bes f g | ees f bes,
  ees2 | c g aes bes | ees1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

Though in a for -- eign land, \bar "."
We are not far from home; \bar "." \break
And near -- er to our rest a -- bove \bar "."
We ev -- ery mo -- ment come. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Se -- cure with -- in the veil
Christ is our an -- chor strong;
While power su -- preme and love di -- vine
Still guide us safe a -- long.

}

wordsC = \lyricmode {
\set stanza = "3."

And should the sur -- ges rise,
Should sore af -- flic -- tions come,
Blest is the sor -- row, kind the storm,
That drives us near -- er home.

}

wordsD = \markuplist {

\line { God’s grace will to the end }
\line { { \hspace #2 } Clearer and brighter shine; }
\line { Nor present things, nor things to come, }
\line { { \hspace #2 } Can change His love divine. }

}

wordsE = \markuplist {

\line { Soon shall our pains and fears }
\line { { \hspace #2 } Forever pass away; }
\line { For we shall soon the Saviour see }
\line { { \hspace #2 } In everlasting day. }

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
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\markup { \fontsize #0.3 \fill-line { \vcenter \column {
  \vspace #1
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } }
  \vspace #1
} } }

\noPageBreak

\markup { \fill-line { \line { Alternate tune: No. 121. } } }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
