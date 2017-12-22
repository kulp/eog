\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG243.ily"
}

\header{
  hymnnumber = "243"
  title = "My Heart Is Fixed, Eternal God"
  tunename = "Christ for Me"
  meter = "8. 6. 8. 6. 8. 8. 8. 6."
  poet = "Richard Jukes" % see https://hymnary.org/text/my_heart_is_fixed_eternal_immortal_god
  composer = "R. George Halls" % see https://hymnary.org/tune/whom_have_i_lord_in_heaven_halls
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternA = { \ta c4 c8. c16 c4 c | c c c2 }
patternB = { \ta c4 c4 c2 }
patternC = { \ta c4 c8 c c4 c | c4 c c2 }
patternD = { \ta c4 c8 c c4 c8[ c8] | c4 c c2 }
patternE = { \ta c4 c4 c2 | c4 c4 c2 }
patternF = { \ta c4 c4 c2 | c4 c4 \tb c2 \ta }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { d^\markup{\italic{Moderato–bold.}} cis b a b | d, e fis }
  \changePitch \patternB { a a b | cis cis d }
  \changePitch \patternC { d cis b a b | d, e fis }
  \changePitch \patternB { a a b | cis cis d }

  \changePitch \patternA { a^\mf fis g a d | b d a }
  \changePitch \patternD { a g fis e fis g | b a fis }
  \changePitch \patternC { fis fis g a d | b d a }
  \changePitch \patternF { a^\f a b | cis cis d\fermata }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d d d d d | d cis d }
  \changePitch \patternB { fis\staccato fis\staccato g | g\staccato e\staccato fis }
  \changePitch \patternC { d d d d d | d cis d }
  \changePitch \patternB { fis\staccato fis\staccato g | g\staccato e\staccato fis }

  \changePitch \patternA { fis d e fis fis | g g fis }
  \changePitch \patternD { e e d cis d e | d d d }
  \changePitch \patternC { d d e fis fis | g g fis }
  \changePitch \patternB { fis\staccato fis\staccato g | g\staccato e\staccato fis }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { fis a g fis g | a a a }
  \changePitch \patternB { d\staccato d\staccato d | a\staccato a\staccato a }
  \changePitch \patternC { fis a g fis g | a a a }
  \changePitch \patternB { d\staccato d\staccato d | a\staccato a\staccato a }

  \changePitch \patternA { d a a d d | d d d }
  \changePitch \patternC { cis a a a a | g fis a }
  \changePitch \patternC { a a a d d | d d d }
  \changePitch \patternB { d\staccato d\staccato d | a\staccato a\staccato a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { d d d d g | fis e d }
  \changePitch \patternB { d d g | a a, d }
  \changePitch \patternC { d d d d g | fis e d }
  \changePitch \patternB { d d g | a a, d }

  \changePitch \patternA { d d d d d | g, b d }
  \changePitch \patternC { a' cis, d a a | d d d }
  \changePitch \patternC { d d d d d | g, b d }
  \changePitch \patternE { d d g | a a, d_\fermata }

}
}

wordsA = \lyricmode {
\set stanza = "1."

My heart is fixed, e -- ter -- nal God, \bar "."
Fixed on Thee, fixed on Thee; \bar "."
And my im -- mor -- tal choice is made, \bar "."
Christ for me, Christ for me. \bar "."
He is the Proph -- et, Priest and King, \bar "."
Who did for me sal -- va -- tion bring; \bar "."
And while I live I mean to sing, \bar "."
Christ for me, Christ for me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

In Him I see the God -- head shine,
Christ for me, Christ for me;
He is the Ma -- jes -- ty di -- vine,
Christ for me, Christ for me.
The Fa -- ther’s well -- be -- lov -- ed Son,
Co -- part -- ner of His roy -- al throne,
Who did for hu -- man guilt a -- tone,
Christ for me, Christ for me.

}

wordsC = \lyricmode {
\set stanza = "3."

Let oth -- ers boast of heaps of gold,
Christ for me, Christ for me;
His rich -- es nev -- er can be told,
Christ for me, Christ for me.
Your gold will waste and wear a -- way,
Your hon -- ors per -- ish in a day;
My por -- tion nev -- er can de -- cay,
Christ for me, Christ for me.

}

wordsD = \lyricmode {
\set stanza = "4."

In pin -- ing sick -- ness, or in health,
Christ for me, Christ for me;
In deep -- est pov -- er -- ty or wealth,
Christ for me, Christ for me.
And in that all -- im -- port -- ant day
When I the sum -- mons shall o -- bey,
And pass from this dark world a -- way,
Christ for me, Christ for me.

}

wordsE = \lyricmode {
\set stanza = "5."

At home, a -- broad, by night and day,
Christ for me, Christ for me;
Wher -- e’er I speak, or sing, or pray;
Christ for me, Christ for me.
Him first, Him last, Him all day long,
My hope, my sol -- ace and my song;
He sweet -- ly leads my soul a -- long,
Christ for me, Christ for me.

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
