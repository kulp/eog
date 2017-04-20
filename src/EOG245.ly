\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "245"
  title = "O Blessed, Precious Saviour"
  tunename = ""
  meter = "P. M."
  poet = "A. H. Rule"
  composer = "A. A. Spottiswoode"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key c \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e8.^\markup{\italic Moderato.}[ d16] | c4. c8 c'4. b8 | b8 a4. ~ a4.
  a8 | g4. e8 e8( d4) c8 | d2.
  e8.( d16) | c4. c8 c'4. b8 | b8 a4. ~ a4.
  a8 | g4. e8 \slashedGrace e8 d4. c8 | c2.

  g'4 | c4. c8 d4. d8 | e2.
  g,4 | c4. c8 d4. d8 | e2.
  e8. d16 | c4. b8 a8( c4) a8 | g8 e4. ~ e4 r8
  e16. d32 | c8( c'4) e,8 e4. d8 | c2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c8.[ b16] | c4. c8 e4. g8 | g f4. ~ f4.
  f8 | e4. c8 c4. c8 | b2. \eogbreak
  b8. ~ b16 | c4. c8 e4. g8 | g f4. ~ f4.
  dis8 | e4. c8 b4. c8 | c2. \eogbreak

  e4 | e4. g8 g4. g8 | g2.
  e4 | e4. g8 g4. g8 | g2. \eogbreak
  g8. f16 | e4. g8 f8( a4) f8 | e8 c4. ~ c4 r8
  b16. b32 | c4. c8 c4. b8 | c2. \eogbreak

}
}

notesTenor = {
\global
\relative a {

  g8.[ f16] | e4. e8 g4. c8 | c8 c4. ~ c4.
  c8 | c4. g8 fis4. fis8 | g2.
  g8.( f16) | e4. e8 g4. c8 | c8 c4. ~ c4.
  c8 | c4. g8 f4. e8 | e2.

  g4 | g4. c8 b4. b8 | c2.
  c4 | g4. c8 b4. b8 | c2.
  c8. g16 | g4. c8 c4. c8 | c8 g4. ~ g4 r8
  g16. f32 | e4. fis8 g4. f8 | e2.

}
}

notesBass = {
\global
\relative f {

  c4 | c4. c8 c4. e8 | f8 f4. ~ f4.
  f8 | c4. c8 a4. a8 | g2.
  g8. ~ g16 | c4. c8 c4. e8 | f8 f4. ~ f4.
  fis8 | g4. g8 g,4. c8 | c2.

  c4 | c4. e8 g4. g8 | c2.
  c,4 | c4. e8 g4. g8 | c2.
  c,8. c16 | c4. e8 f4. f8 | c8 c4. ~ c4 r8
  g16. g32 | a4. a8 g4. g8 | c2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

O bless -- ed, pre -- cious Sav -- iour, \bar "."
How great Thy love to me! \bar "."
{ \mon } Thou for { \moff } me, the guilt -- y sin -- ner, \bar "."
Hast died up -- on the tree,– \bar "."
Hast died up -- on the tree, \bar "."
That I may dwell with Thee: \bar "."
O, my bless -- ed Lord and Sav -- iour, \bar "."
Thou art all in all to me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Thy beau -- ty, O, my Sav -- iour,
Is far be -- yond com -- pare;
{ \mon } Thou art { \moff } chief -- est of ten thou -- sand,
Than sons of men more fair,
Than sons of men more fair;
Thy beau -- ty now I see:
O, my bless -- ed Lord and Sav -- iour,
Thou art all in all to me.

}

wordsC = \lyricmode {
\set stanza = "3."

Soon Thou wilt come, my Sav -- iour,
And take me where Thou art,
To gaze up -- on Thy glo -- ry,
And nev -- er from Thee part,
And nev -- er from Thee part,
Thine, ev -- er Thine to be:
O, my bless -- ed Lord and Sav -- iour,
Thou art all in all to me.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
