\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "248"
  title = "Oh Happy Day, That Fixed My Choice"
  tunename = ""
  meter = "L. M. with Refrain"
  poet = "P. Doddridge"
  composer = "From E. F. Rimbault"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key g \major
  \partial 2.
  \autoBeamOff
}

patternA = { c4 c c | c2. }
patternB = { c4 c c | c2. c4 c c | c1 }
patternC = { c4. c8 | c1 c4. c8 | c2. }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { d g a | b d, g a | b }
  \changePitch \patternA { b c b | a g b a | g } \eogbreak
  \changePitch \patternA { d g a | b d, g a | b }
  \changePitch \patternB { b c b | a g b a | g } \eogbreak

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternC { b c | d g, a | b } >>
  \changePitch \patternA { b c b | a g b a | g } \eogbreak
  \changePitch \patternA { d' d d | d d e d | b }
  \changePitch \patternB { d d d | d d e d | b } \eogbreak
  \changePitch \patternC { b c | d g, a | b }
  \changePitch \patternA { b c b | a g b a | g } \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d d fis | g d d fis | g }
  \changePitch \patternA { g g g | fis g g fis | g }
  \changePitch \patternA { d d fis | g d d fis | g }
  \changePitch \patternB { g g g | fis g g fis | g }

  \changePitch \patternC { g g | g g fis | g }
  \changePitch \patternA { g g g | fis g g fis | g }
  \changePitch \patternA { g g g | g g g g | g }
  \changePitch \patternB { g g g | g g g g | g }
  \changePitch \patternC { g g | g g fis | g }
  \changePitch \patternA { g g g | fis g g fis | g }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { b b d | d b b d | d }
  \changePitch \patternA { d e d | c b d c | b }
  \changePitch \patternA { b b d | d b b d | d }
  \changePitch \patternB { d e d | c b d c | b }

  \changePitch \patternC { d a | b b d | d }
  \changePitch \patternA { b b d | d b b d | d }
  \changePitch \patternA { b b b | b b c b | d }
  \changePitch \patternB { b b b | b b c b | d }
  \changePitch \patternC { d a | b b d | d }
  \changePitch \patternA { b b d | d b b d | d }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g g d | g g g d | g }
  \changePitch \patternA { g g g | d d d d | g, }
  \changePitch \patternA { g' g d | g g g d | g }
  \changePitch \patternB { g g g | d d d d | g, }

  \changePitch \patternC { g' g | g g d | g, }
  \changePitch \patternA { g' g g | d d d d | g, }
  \changePitch \patternA { g' g g | g g g g | g }
  \changePitch \patternB { g g g | g g g g | g }
  \changePitch \patternC { g g | g g d | g, }
  \changePitch \patternA { g' g g | d d d d | g, }

}
}

Refrain = \lyricmode {

Hap -- py day! hap -- py day! \bar "."
When Je -- sus washed my sins a -- way; \bar "."
He taught me how to watch and pray, \bar "."
And live re -- joi -- cing ev -- ’ry day; \bar "."
Hap -- py day! hap -- py day! \bar "."
When Je -- sus washed my sins a -- way; \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Oh hap -- py day, that fixed my choice \bar "."
On Thee, my Sav -- iour and my God! \bar "."
Well may this glow -- ing heart re -- joice, \bar "."
And tell its rap -- tures all a -- broad. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

’Tis done, the great trans -- ac -- tion’s done;
I am my Lord’s, and He is mine;
He drew me, and I fol -- lowed on,
Glad to con -- fess the One di -- vine.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Now rest, my long -- di -- vi -- ded heart,
Fixed on that bless -- ed cen -- ter, rest;
Nor ev -- er from thy Lord de -- part,
With Him of ev -- ’ry good pos -- sessed.

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
