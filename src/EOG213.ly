\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "213"
  title = "Close to Thee"
  tunename = ""
  meter = "8. 7. 8. 7. and Refrain"
  poet = "F. J. Crosby"
  composer = "S. J. Vail"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \partial 4
  \autoBeamOff
}

patternA = { c8. c16 | c4. c8 c8. c16 | c4 c }
patternB = { c8. c16 | c4. c8 c8. c16 | c2 }
patternC = { c8. c16 | c2 }

notesSoprano = {
\global
\relative c' {

  d8. g16 | b4. g8 fis8. a16 | g4 d
  \changePitch \patternB { g b | d b g b | a }
  \changePitch \patternA { d, g | b b b d | d c }
  \changePitch \patternB { b a | g b b a | g }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternC { fis g | a c fis, | g } >>
  \changePitch \patternC { b c | d d b | a }
  \changePitch \patternA { d, g | b b b d | d c }
  \changePitch \patternB { b a | g b b a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d d | g d d d | d d }
  \changePitch \patternB { d d | g g g g | fis }
  \changePitch \patternA { d d | g g g f | e e }
  \changePitch \patternB { e e | d g fis fis | g }

  \changePitch \patternC { d d | fis fis d | d }
  \changePitch \patternC { g a | b b g | fis }
  \changePitch \patternA { d d | g g g f | e e }
  \changePitch \patternB { e e | d g fis fis | g }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { b b | d b a c | b b }
  \changePitch \patternB { b b | b d d d | d }
  \changePitch \patternA { b b | d d d g, | g g }
  \changePitch \patternB { g a | b d d c | b }

  \changePitch \patternC { a b | c a c | b }
  \changePitch \patternC { d d | d d d | d }
  \changePitch \patternA { b b | d d d g, | g g }
  \changePitch \patternB { g a | b d d c | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g g | g g d d | g g }
  \changePitch \patternB { g g | g g b g | d }
  \changePitch \patternA { g g | g g g b, | c c }
  \changePitch \patternB { c c | d d d d | g, }

  \changePitch \patternC { d' d | d d d | g }
  \changePitch \patternC { g g | g g g | d }
  \changePitch \patternA { g g | g g g b, | c c }
  \changePitch \patternB { c c | d d d d | g, }

}
}

RefrainA = \lyricmode {

Close to Thee, close to Thee, \bar "."
Close to Thee, close to Thee; \bar "."
All a -- long my pil -- grim jour -- ney, \bar "."
Sav -- iour, Thou wilt walk with me. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Thou my ev -- er -- last -- ing por -- tion, \bar "."
More than friend or life to me, \bar "."
All a -- long my pil -- grim jour -- ney, \bar "."
Sav -- iour, Thou wilt walk with me. \bar "."

\RefrainA

}

RefrainB = \lyricmode {

Close to Thee, close to Thee,
Close to Thee, close to Thee;
Glad -- ly will I toil and suf -- fer,
Keep me walk -- ing, Lord, with Thee.

}

wordsB = \lyricmode {
\set stanza = "2."

Not for ease or world -- ly pleas -- ure,
Not for fame my prayer shall bel
Glad -- ly will I toil and suf -- fer,
Keep me walk -- ing, Lord, with Thee.

\RefrainB

}

RefrainC = \lyricmode {

Close to Thee, close to Thee,
Close to Thee, close to Thee;
Then the gate of life e -- ter -- nal,
I shall en -- ter, Lord, with Thee.

}

wordsC = \lyricmode {
\set stanza = "3."

Lead me thro’ the vale of shad -- ows,
Bear me o’er life’s fit -- ful sea:
Then the gate of life e -- ter -- nal,
I shall en -- ter, Lord, with Thee.

\RefrainC

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
