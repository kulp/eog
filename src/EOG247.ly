\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "247"
  title = "O Gracious Saviour"
  tunename = ""
  meter = "C. M. with Refrain"
  poet = "G. Cutting and A. Mace"
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=70
  \key g \major
  \partial 8
  \autoBeamOff
}

patternA = { c8 | c4 c8 c4 c8 | c4 c8 c4 }
patternB = { c8 | c4 c8 c4 c8 | c4. ~ c4 }
patternC = { c8 | c4 c8 c4 c8 | c4. }
patternD = { c4. | c4 c8 c4 c8 | c4. ~ c4 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { d | b' a g fis | c' b a }
  \changePitch \patternB { d | d c b a | g g } \eogbreak
  \changePitch \patternA { d | b' a g fis | c' b a }
  \changePitch \patternB { d | d c b a | g g } \eogbreak

  \changePitch \patternC { b | b b b b | c }
  \changePitch \patternD { a | a a g a | b b } \eogbreak
  \changePitch \patternA { d, | b' a g fis | c' b a }
  \changePitch \patternB { d | d c b a | g g } \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d | g fis e d | e d d }
  \changePitch \patternB { fis | fis e g fis | d d }
  \changePitch \patternA { d | g fis e d | e d d }
  \changePitch \patternB { fis | fis e g fis | d d }

  \changePitch \patternC { g | d d d g | e }
  \changePitch \patternD { fis | fis fis d fis | g g }
  \changePitch \patternA { d | g fis e d | e d d }
  \changePitch \patternB { fis | fis e g fis | d d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { b | d d b g | a g fis }
  \changePitch \patternB { b | b g b c | b b }
  \changePitch \patternA { b | d d b g | a g fis }
  \changePitch \patternB { b | b g b c | b b }

  \changePitch \patternC { d | b b b d | c }
  \changePitch \patternD { d | c d b d | d d }
  \changePitch \patternA { b | d d b g | a g fis }
  \changePitch \patternB { b | b g b c | b b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g | g d e b | a b d }
  \changePitch \patternB { b | b c d d | g, g }
  \changePitch \patternA { g' | g d e b | a b d }
  \changePitch \patternB { b | b c d d | g, g }

  \changePitch \patternC { g' | g g g g | a }
  \changePitch \patternD { d, | d d d d | g g }
  \changePitch \patternA { g | g d e b | a b d }
  \changePitch \patternB { b | b c d d | g, g }

}
}

wordsA = \lyricmode {
\set stanza = "1."

O gra -- cious Sav -- iour, Thou hast giv’n \bar "."
My trem -- bling soul to know \bar "."
That, trust -- ing in Thy pre -- cious blood, \bar "."
I’m washed as white as snow. \bar "."
I’m washed as white as snow, \bar "."
I’m washed as white as snow, \bar "."
That, trust -- ing in Thy pre -- cious blood, \bar "."
I’m washed as white as snow. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Since Thou hast borne sin’s heav -- y load,
My guilt -- y fear is o’er.
Made Thine, by vir -- tue of Thy blood,
I’m sealed for -- ev -- er -- more.
I’m sealed for -- ev -- er -- more,
I’m sealed for -- ev -- er -- more,
Made Thine, by vir -- tue of Thy blood,
I’m sealed for -- ev -- er -- more.

}

wordsC = \lyricmode {
\set stanza = "3."

What wait I for, most bless -- ed Lord,
Ex -- cept Thy face to see?
If such the ear -- nest Thou hast giv’n,
What must Thy pres -- ence be?
What must Thy pres -- ence be?
What must Thy pres -- ence be?
If such the ear -- nest Thou hast giv’n,
What must Thy pres -- ence be?

}

wordsD = \lyricmode {
\set stanza = "4."

To hear Thy voice, to see Thy face,
And grieve Thy heart no more;
But drink the full -- ness of Thy grace,
Thy love for -- ev -- er -- more.
Thy love for -- ev -- er -- more,
Thy love for -- ev -- er -- more,
But drink the full -- ness of Thy grace,
Thy love for -- ev -- er -- more.

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
