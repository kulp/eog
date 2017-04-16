\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "182"
  title = "O Jesus! Friend Unfailing!"
  tunename = "Joyful Pilgrims"
  meter = "7. 6. 7. 6. D."
  poet = "H. K. Burlingham"
  composer = "J. R. Sweney (adapted)"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a4 | a4. a8 g[ f] g[ a] | f2 c4
  c'4 | c4. c8 b[ c] d[ c] | c2( a4)
  a4 | g4. g8 g[ a] bes[ c] | a4( c) f
  f4 | e4. d8 c4 b | c2.
  a4 | a4. a8 g[ f] g[ a] | f2 c4
  c'4 | c4. c8 b[ c] d[ c] | c2( a4)
  a4 | g4. g8 g[ a] bes[ c] | a4( c) f
  d4 | c4. c8 c4 e, | f2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f4 | f4. f8 f4 f | f2. % instead of f2 f4, avoid overlap
  a4 | a4. a8 gis[ a] gis[ a] | a2( f4)
  f4 | e4. e8 e[ f] g[ e] | f2 a4
  a4 | g4. << f8 a >> << e4 g >> << d f >> | e2.
  f4 | f4. f8 e4 e | f2. % instead of f2 f4, avoid overlap
  a4 | a4. a8 gis[ a] gis[ a] | a2( f4)
  f4 | e4. e8 e[ f] g[ e] | f2 f4
  f4 | f4. ees8 e4 c | c2.

}
}

notesTenor = {
\global
\relative a {

  c4 | c4. c8 bes[ a] bes[ c] | a2.
  c4 | c4. c8 d[ c] b[ c] | c2.
  c4 | c4. c8 c4 c | c2 c4
  c4 | c4. f8 e4 d | c2.
  c4 | c4. c8 bes[ a] bes[ c] | a2.
  c4 | c4. c8 d[ c] b[ c] | c2.
  c4 | c4. c8 c4 c | c2 d4
  bes4 | a4. fis8 g4 bes | a2.

}
}

notesBass = {
\global
\relative f {

  f4 | f4. f8 f4 f | f2.
  f4 | f4. f8 f4 f | f2.
  f4 | c4. c8 bes'8[ a] g[ c,] | f2 f4
  f4 | g4. g8 g4 g | c,2.
  f4 | f4. f8 c4 c | f2.
  f4 | f4. f8 f4 f | f2.
  f4 | c4. c8 bes'8[ a] g[ c,] | f2 bes4
  bes,4 | c4. c8 c4 c | f2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

O Je -- sus, Friend un -- fail -- ing, \bar "."
How dear art Thou to me! \bar "."
Are cares or fears as -- sail -- ing? \bar "."
I find my strength in Thee. \bar "."
Why should my feet grow wear -- y \bar "."
Of this my pil -- grim way? \bar "."
Rough though the path and drear -- y, \bar "."
It ends in per -- fect day. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Nought, nought I court as pleas -- ure,
Com -- pared, O Christ with Thee,
Thy sor -- row with -- out meas -- ure
Earned peace and joy for me!
I love to own, Lord Je -- sus,
Thy claims o’er me di -- vine,
Bought with Thy blood most pre -- cious,
Whose can I be but Thine?

}

wordsC = \lyricmode {
\set stanza = "3."

What fills my heart with glad -- ness?
’Tis Thine a -- bound -- ing grace;
Where can I look in sad -- ness,
But, Sav -- iour, on Thy face?
My all is Thy pro -- vid -- ing–
Thy love can ne’er grow cold;
In Thee, my ref -- uge, hid -- ing–
No good wilt Thou with -- hold.

}

wordsD = \lyricmode {
\set stanza = "4."

O world -- ly pomp and glo -- ry,
Your charms are spread in vain!
I’ve heard a sweet -- er sto -- ry,
I’ve found a tru -- er gain:
Where Christ a place pre -- par -- eth,
There is my loved a -- bode;
There shall I gaze on Je -- sus,
There shall I dwell with God.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\noPageBreak \markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 155. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
