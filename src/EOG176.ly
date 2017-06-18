\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  systems-per-page = ##f
  system-count = #(cond (is-eogsized 2) (#t #f))
  system-system-spacing.padding = 11
}

\header{
  hymnnumber = "176"
  title = "Oh What a Debt We Owe"
  tunename = "Silchester"
  meter = "S. M."
  poet = "G. V. Wigram"
  composer = "Dr. Malan"
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
\relative c'' {

  bes2 | bes g4( aes) bes2 c | bes1.
  bes2 | c4( ees) d( c) bes2 aes | g1.
  ees'2 | ees d4( c) bes2. aes4 | g( aes) bes( c) bes2. bes4 |
  c2 c d d | ees1.
  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g2 | g ees ees ees | ees1.
  ees2 | ees ees4( f) g( ees) f( d) | ees1.
  g2 | g bes4( aes) g2. f4 | ees4( f) g( aes) g2. g4 |
  aes2 aes f f | g1.

}
}

notesTenor = {
\global
\relative a' {

  ees2 | bes bes bes aes | g1.
  g2 | aes4( c) bes( aes) g2 bes | bes1.
  bes2 | bes bes4( c8[ d]) ees2. bes4 | bes2 bes bes2. ees4 |
  c2 c bes bes | bes1.

}
}

notesBass = {
\global
\relative f {

  ees2 | ees ees4( f) g2 aes | ees1.
  ees2 | aes, aes bes bes | ees1.
  ees2 | ees ees ees2. ees4 | ees2 ees ees2. ees4 |
  aes2 f bes bes, | ees1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

Oh what a debt we owe \bar "."
To Him who shed His blood, \bar "."
And cleansed our souls and gave us power \bar "."
To stand be -- fore His God. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Sav -- iour and Lord! we own
The rich -- es of Thy grace;
For we can call Thy God, our God–
Can bow be -- fore His face.

}

wordsC = \lyricmode {
\set stanza = "3."

Thy Fa -- ther, too, a -- bove,
We wor -- ship as our own,
Who gave with Thee the Spir -- it’s cry,
To us His sons fore -- known.

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

\markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 254. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
