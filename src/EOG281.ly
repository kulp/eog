\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "281"
  title = "We Wait For Thee, O Son of God"
  tunename = "Jena"
  meter = "8. 7. 8. 7. 8. 7. 7."
  poet = "Tr. by H. K. Burlingham"
  composer = "S. Gastorius"
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
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d4 | g a b e | d c b
  e4 | d c b c | a2 g4
  d4 | g a b e | d c b
  e4 | d c b c | a2 g4
  d'4 | e e \tb a,\fermata \ta a | d d \tb g,\fermata \ta
  b4 | a g fis g | e2 d4
  d'4 | e d c b | a2 \tb g4\fermata \ta

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | e4 fis g g | fis e8[ d] d4
  g4 | g e8[ fis] g4 g | g( fis) g
  d4 | e4 fis g g | fis e8[ d] d4
  g4 | g e8[ fis] g4 g | g( fis) g
  g4 | g a8[ g] fis4 d | d g8[ f] e4
  d4 | e d8[ e] d4 d | d( cis) d
  g4 | g g e8[ fis] g4 | e( d8)[ c] b4

}
}

notesTenor = {
\global
\relative a {

  b4 | b d d c | a g8[ a] g4
  c4 | b a g e' a,( d8)[ c] b4
  b4 | b d d c | a g8[ a] g4
  c4 | b a g e' a,( d8)[ c] b4
  b4 | c cis d fis, | g b c
  d4 | d8[ cis] b[ a] a4 b | e,( a8)[ g] fis4
  b4 | c b a g | g( fis) g

}
}

notesBass = {
\global
\relative f {

  g4 | e d g c, | d e8 fis] g4
  c,4 | g' a8[ d,] e4 c | d2 g,4
  g'4 | e d g c, | d e8 fis] g4
  c,4 | g' a8[ d,] e4 c | d2 g,4
  g'4 | c,8[ b] a4 d d8[ c!] | b[ a] g4 c
  g4 | a b8[ cis] d4 g, | a2 d4
  g,4 | c g' a8[ d,] e4 | c( d) g,_\fermata

}
}

wordsA = \lyricmode {
\set stanza = "1."

We wait for Thee, O Son of God, \bar "."
And long for Thine ap -- pear -- ing; \bar "."
“A lit -- tle while,” Thou’lt come, O Lord, \bar "."
Thy wait -- ing peo -- ple cheer -- ing. \bar "."
Thus hast Thou said; we lift the head \bar "."
In joy -- ful ex -- pec -- ta -- tion, \bar "."
For Thou wilt bring sal -- va -- tion. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

We wait for Thee, con -- tent to share,
In pa -- tience, days of tri -- al;
So meek -- ly Thou the cross didst bear,
Our sin, re -- proach, de -- ni -- al,
And shall not we re -- ceive with Thee
The cup of shame and sor -- row,
Un -- til the prom -- ised mor -- row?

}

wordsC = \lyricmode {
\set stanza = "3."

We wait for Thee; for Thou, e’en here,
Hast won our heart’s af -- fec -- tion;
In spir -- it still we find Thee near,
Our sol -- ace and pro -- tec -- tion.
In cloud -- less light, and glo -- ry bright,
We soon with joy shall greet Thee,
And in the air shall meet Thee.

}

wordsD = \lyricmode {
\set stanza = "4."

We wait for Thee– Thou wilt a -- rise
Whilst hope her watch is keep -- ing;
For -- got -- ten then, in glad sur -- prise,
Shall be our years of weep -- ing.
Our hearts beat high, the dawn is nigh,
That ends our pil -- grim sto -- ry,
In Thine e -- ter -- nal glo -- ry.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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
