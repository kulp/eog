\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG344.ily"
}

\header{
  %children
  hymnnumber = "344"
  title = "Jesus, My Saviour, to Bethlehem Came"
  tunename = ""
  meter = "P. M. with Refrain"
  poet = "A. N." % see https://hymnary.org/text/jesus_my_savior_to_bethlehem_came
  composer = "E. E. Hasty (arr.)" % see https://hymnary.org/tune/jesus_my_savior_to_bethlehem_came_hasty
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \autoBeamOff
}

patternA = { c8. c16 c8 c c c | c8. c16 c8 c4. }
patternB = { c8 c c c4 c8 | c4. ~ c4 c8 }
patternC = { c8. c16 c8 c c c | c8 c c c4. }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { d c b b a g | a g e e }
  \changePitch \patternA { d g g g a b | b a g a }
  \changePitch \patternC { d c b b a g | a g e e }
  \changePitch \patternB { d g b a g | g g r }

  d8^\markup { \small \caps "Refrain" } fis a d4 c8 | b4.( g4) r8 |
  d8 fis a c4 e8 | d4.( b4) r8 |
  \changePitch \patternC { d c b b a g | a g e e }
  \changePitch \patternB { d g b a g | g g r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { g g g g fis g | e e c c }
  \changePitch \patternA { b d d d d g | g fis g fis }
  \changePitch \patternC { g g g g fis g | e e c c }
  \changePitch \patternB { b d d c b | b b r }

  d8 d fis fis4 r8 | g8 d d b4 r8 |
  d8 d fis fis4 r8 | g8 g g g4 r8 |
  \changePitch \patternC { g g g g fis g | e e c c }
  \changePitch \patternB { b d d c b | b b r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { b e d d c b | c g g g }
  \changePitch \patternA { g b b b c d | d c b d }
  \changePitch \patternC { b e d d c b | c g g g }
  \changePitch \patternB { g b g fis g | g g r }

  fis8 a a a4 r8 | g8 g g g4 r8 |
  fis8 a a a4 r8 | b8 b b d4 r8
  \changePitch \patternC { b e d d c b | c g g g }
  \changePitch \patternB { g b g fis g | g g r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g g g g g g | c, c c c }
  \changePitch \patternA { g' g g g g g | d d d d }
  \changePitch \patternC { g g g g g g | c, c c c }
  \changePitch \patternB { d d d d g, | g g r }

  d'8 d d d4 r8 | g,8 g g g4 r8 |
  d'8 d d d4 r8 | g8 g g g4 r8 |
  \changePitch \patternC { g g g g g g | c, c c c }
  \changePitch \patternB { d d d d g, | g g r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus, my Sav -- iour, to Beth -- le -- hem came, \bar "."
Born in a man -- ger to sor -- row and shame; \bar "."
Oh, it was won -- der -- ful— blest be His name! \bar "."
Seek -- ing for me, for me! \bar "."
%LYRICS Seeking for me, for me!
%LYRICS Seeking for me, for me!
%{HIDE>%} Seek -- ing for me! %{<HIDE%} \bar "."
%{HIDE>%} Seek -- ing for me! %{<HIDE%} \bar "." \eogbreak
%{HIDE>%} Seek -- ing for me! %{<HIDE%} \bar "."
%{HIDE>%} Seek -- ing for me! %{<HIDE%} \bar "."
Oh, it was won -- der -- ful— blest be His name! \bar "."
Seek -- ing for me, for me! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus, my Sav -- iour, on Cal -- va -- ry’s tree,
Paid the great debt, and my soul He set free;
Oh, it was won -- der -- ful— how could it be?
Dy -- ing for me, for me!
%LYRICS Dying for me, for me!
%LYRICS Dying for me, for me!
%{HIDE>%} Dy -- ing for me! %{<HIDE%}
%{HIDE>%} Dy -- ing for me! %{<HIDE%}
%{HIDE>%} Dy -- ing for me! %{<HIDE%}
%{HIDE>%} Dy -- ing for me! %{<HIDE%}
Oh, it was won -- der -- ful— how could it be?
Dy -- ing for me, for me!

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus, my Sav -- iour, the same as of old,
While I was wan -- d’ring a -- far from the fold,
Gen -- tly and long did He plead with my soul, % original has "Gent -- ly"
Call -- ing for me, for me!
%LYRICS Calling for me, for me!
%LYRICS Calling for me, for me!
%{HIDE>%} Call -- ing for me! %{<HIDE%}
%{HIDE>%} Call -- ing for me! %{<HIDE%}
%{HIDE>%} Call -- ing for me! %{<HIDE%}
%{HIDE>%} Call -- ing for me! %{<HIDE%}
Gen -- tly and long did He plead with my soul,
Call -- ing for me, for me!

}

wordsD = \lyricmode {
\set stanza = "4."

Je -- sus, my Sav -- iour, shall come from on high;
Sweet is the prom -- ise as wear -- y years fly; % original has "pro -- mise" and "wear -- y"
Oh, I shall see Him de -- scend from the sky,
Com -- ing for me, for me!
%LYRICS Coming for me, for me!
%LYRICS Coming for me, for me!
%{HIDE>%} Com -- ing for me! %{<HIDE%}
%{HIDE>%} Com -- ing for me! %{<HIDE%}
%{HIDE>%} Com -- ing for me! %{<HIDE%}
%{HIDE>%} Com -- ing for me! %{<HIDE%}
Oh, I shall see Him de -- scend from the sky,
Com -- ing for me, for me!

}

SopranoRefrainA = \lyricmode {

\repeat unfold 40 { \skip 4 }
for me! __ ""
\repeat unfold 3 { \skip 4 }
for me! __

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto altos \wordsA
      \context Lyrics = two   \lyricsto altos \wordsB
      \context Lyrics = three \lyricsto altos \wordsC
      \context Lyrics = four  \lyricsto altos \wordsD
    >>
    \new Lyrics \with { alignAboveContext = upper } \lyricsto sopranos \SopranoRefrainA
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
