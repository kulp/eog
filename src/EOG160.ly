\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
}

\header{
  hymnnumber = "160"
  title = "Though In a Foreign Land"
  tunename = "Franconia"
  meter = "S. M."
  poet = "Toplady"
  composer = "German Melody"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
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
While power su -- preme, and love di -- vine
Still guide us safe a -- long.

}

wordsC = \lyricmode {
\set stanza = "3."

And should the sur -- ges rise,
Should sore af -- flict -- ions come,
Blest is the sor -- row, kind the storm,
That drives us near -- er home.

}

wordsD = \markuplist {

\line { God’s grace will to the end }
\line { Clearer and brighter shine; }
\line { Nor present things, nor things to come, }
\line { Can change His love divine. }

}

wordsE = \markuplist {

\line { Soon shall our pains and fears }
\line { Forever pass away; }
\line { For we shall soon the Saviour see }
\line { In everlasting day. }

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

\markup { \raise #3 \fill-line {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } }
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
} }

\noPageBreak

\markup { \fill-line { \lower #4 \line { Alternate tune: No. 121. } } }

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond: