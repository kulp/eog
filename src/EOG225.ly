\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "225"
  title = "I Left It All with Jesus"
  tunename = ""
  meter = "P. M."
  poet = "Ellen H. Willis" % see https://hymnary.org/text/i_left_it_all_with_jesus_long_ago
  composer = "Miss H. M. Warner" % see https://hymnary.org/tune/i_left_it_all_with_jesus_warner
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

I left it all with Je -- sus long a -- go; \bar "."
All my sins I brought Him, and my woe. \bar "."
When by faith I saw Him on the tree, \bar "."
Heard His small, still whis -- per, “’Tis for thee,” \bar "."
From my heart the bur -- den rolled a -- way— hap -- py day! \bar "."
From my heart the bur -- den rolled a -- way— hap -- py day! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I leave it all with Je -- sus, for He knows
How to steal the bit -- ter from life’s woes;
How to gild the tear -- drop with His smile,
Make the des -- ert gar -- den bloom a -- while;
When my weak -- ness lean -- eth on His might, all seems light;
When my weak -- ness lean -- eth on His might, all seems light.

}

wordsC = \lyricmode {
\set stanza = "3."

I leave it all with Je -- sus day by day;
Faith can firm -- ly trust Him, come what may.
Hope has dropped her an -- chor, found her rest
In the calm, sure ha -- ven of His breast;
Love es -- teems it heav -- en to a -- bide at His side;
Love es -- teems it heav -- en to a -- bide at His side.

}

wordsD = \lyricmode {
\set stanza = "4."

Oh, leave it \italicsOn all \italicsOff with Je -- sus, droop -- ing soul!
Tell not \italicsOn half \italicsOff thy sto -- ry, but the whole;
Worlds on worlds are hang -- ing on His hand,
Life and death are wait -- ing His com -- mand;
Yet His ten -- der bos -- om makes \italicsOn thee \italicsOff room— oh, come home!
Yet His ten -- der bos -- om makes \italicsOn thee \italicsOff room— oh, come home!

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
