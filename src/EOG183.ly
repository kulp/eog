\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "183"
  title = "O Lamb of God, Still Keep Us"
  tunename = "Missionary"
  meter = "7. 6. 7. 6. D."
  poet = "J. G. Deck"
  composer = "Dr. Lowell Mason"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=90
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees2 | g bes bes c | bes1 g2
  ees2 | d ees aes g | g1( f2)
  ees2 | g bes bes c | bes1 g2
  f2 | g c bes a | bes1.
  bes2 | ees bes aes g | c1 bes2
  d2 | ees bes aes g | g1( f2)
  ees2 | g bes bes c | bes1 g2
  ees2 | f aes g f | ees1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  bes2 | ees ees ees ees | ees1 ees2
  bes2 | bes ees d ees | ees1( d2)
  bes2 | ees ees ees ees | ees1 ees2
  d2 | ees g f ees | d1.
  ees2 | ees ees d ees | ees1 ees2
  aes2 | g g f ees | ees1( d2)
  ees2 | ees ees ees ees | ees1 ees2
  g2 | aes f bes bes, | ees1.

}
}

notesTenor = {
\global
\relative a {

  g2 | bes g g aes | g1 bes2
  bes2 | bes bes bes bes | bes1.
  g2 | bes g g aes | g1 bes2
  bes2 | bes ees d c | bes1.
  g2 | g bes bes bes | aes1 bes2
  bes2 | bes g bes bes | bes1.
  g2 | bes g g aes | g1 bes2
  bes2 | c c bes aes | g1.

}
}

notesBass = {
\global
\relative f {

  ees2 | ees ees ees ees | ees1 ees2
  g2 | aes g f ees | bes1.
  ees2 | ees ees ees ees | ees1 ees2
  bes2 | ees c f f | bes,1.
  ees2 | ees g f ees | aes1 g2
  f2 | ees ees d ees | bes1.
  ees2 | ees ees ees ees | ees1 ees2
  g2 | aes f bes bes, | ees1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

O Lamb of God, still keep us \bar "."
Close to Thy pierc -- ed side; \bar "."
’Tis on -- ly there in safe -- ty \bar "."
And peace we can a -- bide; \bar "."
With foes and snares a -- round us, \bar "."
And lusts and fears with -- in, \bar "."
The grace that sought and found us, \bar "."
A -- lone can keep us clean. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

’Tis on -- ly in Thee hid -- ing
We feel our -- selves se -- cure;
On -- ly in Thee a -- bid -- ing
The con -- flict can en -- dure:
Thine arm the vic -- t’ry gain -- eth,
O’er ev -- ’ry hate -- ful foe;
Thy love our hearts sus -- tain -- eth,
In all their cares and woes.

}

wordsC = \lyricmode {
\set stanza = "3."

Soon shall our eyes be -- hold Thee
With rap -- ture, face to face;
And rest -- ing there in glo -- ry,
We’ll sing thy power and grace:
Thy beau -- ty, Lord and glo -- ry,
The won -- ders of Thy love,
Shall be the end -- less sto -- ry
Of all Thy saints a -- bove.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
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
