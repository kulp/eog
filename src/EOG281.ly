\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  oddFooterMarkup = \markup { \fill-line { \if \on-first-page "Alternate tune: No. 6 in Supplement." } }
  \include "override/override-EOG281.ily"
}

\header{
  hymnnumber = "281"
  title = "We Wait for Thee, O Son of God"
  tunename = "Was Gott tut" % see https://hymnary.org/tune/was_gott_tut_gastorius
  meter = "8. 7. 8. 7. 8. 7. 7."
  poet = "Philipp Friedrich Hiller, tr. by Hannah K. Burlingham" % see https://hymnary.org/text/we_wait_for_thee_o_son_of_god
  composer = "Severus Gastorius" % see https://hymnary.org/tune/was_gott_tut_gastorius
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

  g4 | e d g c, | d e8[ fis] g4
  c,4 | g' a8[ d,] e4 c | d2 g,4
  g'4 | e d g c, | d e8[ fis] g4
  c,4 | g' a8[ d,] e4 c | d2 g,4
  g'4 | c,8[ b] a4 d_\fermata d8[ c!] | b[ a] g4 c_\fermata
  g4 | a b8[ cis] d4 g, | a2 d4
  g,4 | c g' a8[ d,] e4 | c( d) g,_\fermata

}
}

notesAlign = \notesAlto

wordsA = \lyricmode {
\set stanza = "1."

We wait for Thee, O Son of God, \bar "."
And long for Thine ap -- pear -- ing; \bar "."
“A lit -- tle while,” Thou’lt come, O Lord, \bar "."
Thy wait -- ing peo -- ple cheer -- ing. \bar "."
Thus hast Thou said: we lift the head \bar "."
In joy -- ful ex -- pec -- ta -- tion, \bar "."
For Thou wilt bring sal -- va -- tion. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

We wait for Thee, con -- tent to share,
In pa -- tience, days of tri -- al;
So meek -- ly Thou the cross didst bear,
Our sin, re -- proach, de -- ni -- al.
And shall not we re -- ceive with Thee
The cup of shame and sor -- row,
Un -- til the prom -- ised mor -- row?

}

wordsC = \lyricmode {
\set stanza = "3."

We wait for Thee; for Thou, e’en here,
Hast won our hearts’ af -- fec -- tion;
In spir -- it still we find Thee near,
Our sol -- ace and pro -- tec -- tion.
In cloud -- less light, and glo -- ry bright,
We soon with joy shall greet Thee,
And in the air shall meet Thee.

}

wordsD = \lyricmode {
\set stanza = "4."

We wait for Thee— Thou wilt a -- rise
While hope her watch is keep -- ing;
For -- got -- ten then, in glad sur -- prise,
Shall be our years of weep -- ing.
Our hearts beat high, the dawn is nigh
That ends our pil -- grim sto -- ry
In Thine e -- ter -- nal glo -- ry!

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = aligned { \voiceOne << \notesAlign >> }
      \context Lyrics = one   \lyricsto aligned \wordsA
      \context Lyrics = two   \lyricsto aligned \wordsB
      \context Lyrics = three \lyricsto aligned \wordsC
      \context Lyrics = four  \lyricsto aligned \wordsD
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

\version "2.24.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
