\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "225"
  title = "I Left It All With Jesus"
  tunename = ""
  meter = "P. M."
  poet = "Mrs. E. H. Willis"
  composer = "Miss H. M. Warner"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d8 | b'4 b8 b[ a] b | g4. d |
  e4 g8 d4. |
  b'4 b8 b[ a] b | g4. d |
  e4 g8 d4. |
  b'4^\< b8 b[ c]\! d | e4.^\> d\!
  b4 g8 a4. |
  b4 b8 b[ c] d | e4. d
  b4 g8 a4. |
  g4 g8 g[ fis] e | d4. b |
  e4 g8 d4. |
  e4 g8 d4. |
  e4^\markup{\italic cres.} fis8 g4 a8 | b4 e8
  d4 c8 | b4.
  a8^\markup{\italic rit.}[ g] a | g4. ~ g4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  b8 | d4 d8 d4 d8 | d4. b |
  c4 c8 b4. |
  d4 d8 d4 d8 | d4. b |
  c4 c8 b4. |
  g'4 g8 g4 g8 | g4. g |
  g4 g8 fis4. |
  g4 g8 g4 g8 | g4. g |
  g4 g8 fis4. |
  d4 d8 e8[ d] c8 | b4. b |
  c4 c8 b4. |
  c4 c8 b4. |
  c4 d8 d4 d8 | d4 g8
  g4 e8 | d4.
  fis4 fis8 | d4. ~ d4

}
}

notesTenor = {
\global
\relative a {

  b8 | b4 b8 d[ c] d | b4. g |
  g4 g8 g4. |
  b4 b8 d[ c] d | b4. g |
  g4 g8 g4. |
  d'4 d8 d[ c] b | c4. b4. |
  d4 d8 d4. |
  d4 d8 d[ c] b | c4. b4. |
  d4 d8 d4. |
  b4 g8 g4 g8 | g4. g |
  g4 g8 g4. |
  g4 g8 g4. |
  g4 a8 g4 fis8 | g4 g8
  g4 g8 | g4.
  c8[ b] c | b4. ~ b4

}
}

notesBass = {
\global
\relative f {

  g8 | g4 g8 g4 g8 | g4. g, |
  c4 e8 g4. |
  g4 g8 g4 g8 | g4. g, |
  c4 e8 g4. |
  g4 g8 g4 g8 | c,4. g' |
  g4 b,8 d4. |
  g4 g8 g4 g8 | c,4. g' |
  g4 b,8 d4. |
  g4 b,8 c4 e8 | g4. g, |
  c4 e8 g4. |
  c,4 e8 g4. |
  c,4 c8 b4 d8 | g,4 c8
  b4 c8 | d4.
  d4 d8 | g4. ~ g4

}
}

wordsA = \lyricmode {
\set stanza = "1."

I left it all with Je -- sus \bar "."
Long a -- go; \bar "."
All my sins I brought Him, \bar "."
And my woe. \bar "."
When by faith I saw Him \bar "."
On the tree, \bar "."
Heard His small, still whis -- per, \bar "."
“’Tis for thee,” \bar "."
%{HIDE>%} From my heart the bur -- den \bar "."
Rolled a -- way– \bar "."
Hap -- py day! \bar "." %{<HIDE%}
From my heart the bur -- den \bar "."
Rolled a -- way– \bar "."
Hap -- py day! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I leave it all with Je -- sus,
For He knows
How to steal the bit -- ter
From life’s woes;
How to gild the tear -- drop
With His smile,
Make the des -- ert gar -- den
Bloom a -- while:
%{HIDE>%} When my weak -- ness lean -- eth
On His might,
All seems light; %{<HIDE%}
When my weak -- ness lean -- eth
On His might,
All seems light.

}

wordsC = \lyricmode {
\set stanza = "3."

I leave it all with Je -- sus
Day by day;
Faith can firm -- ly trust Him
Come what may.
Hope has dropped her an -- chor,
Found her rest
In the calm, sure ha -- ven
Of His breast:
%{HIDE>%} Love es -- teems it heav -- en
To a -- bide
At His side; %{<HIDE%}
Love es -- teems it heav -- en
To a -- bide
At His side.

}

wordsD = \lyricmode {
\set stanza = "4."

O, leave it \italicsOn all \italicsOff with Je -- sus,
Droop -- ing soul!
Tell not \italicsOn half \italicsOff thy sto -- ry,
But the whole.
Worlds on worlds are hang -- ing
On His hand,
Life and death are wait -- ing
His com -- mand;
%{HIDE>%} Yet His ten -- der bos -- om
Makes \italicsOn thee \italicsOff room–
O, come home! %{<HIDE%}
Yet His ten -- der bos -- om
Makes \italicsOn thee \italicsOff room–
O, come home!

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
