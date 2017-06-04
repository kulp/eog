\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "209"
  title = "Bright in the Glory"
  tunename = ""
  meter = "P. M."
  poet = ""
  composer = ""
  tagline = ##f
}

patternAA = { c4. c8 c8 c | c4 c c | }
patternAB = { c8 c c4. c8 | c8 c c4 c | }
patternAC = \patternAA
patternAD = { c8. c16 c4 c, | c2 c4 | }

patternBA = { c8 c c4. c8 | c4 c c | }
patternBB = { c,8. c16 c4. c8 | c8. c16 c4 ~ c8 c | }
patternBC = { c8 c c4. c8 | c4 c ~ c8 c | }
patternBD = { c8 c c4 c | c2 c4 | }

patternCA = { c4 c c8 c | c4 c c | }
patternCB = { c8 c c4. c8 | c c c4 c | }
patternCC = \patternCA
patternCD = { c,8 c c'4 c | c2. | }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes4. r8 aes8 g | g4 f r |
  f8 g aes4. g8 | aes8 c bes4 r |
  bes4. r8 aes8 g | g4 f r |
  f8. g16 aes4 bes, | ees2 r4 |

  g8 bes ees4. d8 | d4 c r |
  f,8. f16 bes4. aes8 | g8. c16 bes4 ~ bes8 r |
  g8 bes ees4. d8 | d4 c ~ c8 r |
  bes8 bes bes4 g | ees2 r4 |

  g4 g r8 g | aes4 aes r |
  f8 f bes4. aes8 | g c bes4 r |
  g4 g r8 g | aes4 aes r |
  bes,8 bes g'4 f | ees2. |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees r ees ees | ees d r }
  \changePitch \patternAB { d ees d ees | ees ees ees r }
  \changePitch \patternAC { ees r ees ees | ees d r }
  \changePitch \patternAD { d ees f bes, | bes r }

  \changePitch \patternBA { ees ees g bes | bes aes r }
  \changePitch \patternBB { d, d d f | ees ees ees ees r }
  \changePitch \patternBC { ees ees g g | bes aes aes r }
  \changePitch \patternBD { ees ees ees d | bes r }

  \changePitch \patternCA { ees ees r ees | d d r }
  \changePitch \patternCB { d d d f | ees ees ees r }
  \changePitch \patternCC { ees ees r ees | d d r }
  \changePitch \patternCD { bes bes ees d | bes }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g r c bes | bes bes r }
  \changePitch \patternAB { bes bes bes bes | c aes g r }
  \changePitch \patternAC { g r c bes | bes bes r }
  \changePitch \patternAD { bes bes bes aes | g r }

  \changePitch \patternBA { bes g bes ees | ees ees r }
  \changePitch \patternBB { bes bes bes bes | bes aes g g r }
  \changePitch \patternBC { bes g bes ees | ees ees ees r }
  \changePitch \patternBD { g, g g aes | g r }

  \changePitch \patternCA { bes bes r bes | bes bes r }
  \changePitch \patternCB { bes bes bes bes | bes aes g r }
  \changePitch \patternCC { bes bes r bes | bes bes r }
  \changePitch \patternCD { bes bes bes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees r ees ees | bes bes r }
  \changePitch \patternAB { bes ees f ees | ees ees ees r }
  \changePitch \patternAC { ees r ees ees | bes bes r }
  \changePitch \patternAD { bes bes bes bes | ees r }

  \changePitch \patternBA { ees ees ees g | aes aes r }
  \changePitch \patternBB { bes, bes bes d | ees ees ees ees r }
  \changePitch \patternBC { ees ees ees ees aes aes aes r }
  \changePitch \patternBD { bes, bes bes bes | ees r }

  \changePitch \patternCA { ees ees r ees | f f r }
  \changePitch \patternCB { bes, bes bes d | ees ees ees r }
  \changePitch \patternCC { ees ees r ees | f f r }
  \changePitch \patternCD { bes, bes bes bes | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Bright in the glo -- ry, \bar "."
Where my Lord has gone be -- fore; \bar "."
Safe in the glo -- ry, \bar "."
To go out no more. \bar "."
I shall soon have en -- tered, \bar "."
In His like -- ness sat -- is -- fied, \bar "."
All my thoughts con -- cen -- tred \bar "."
In the Glo -- ri -- fied. \bar "."
Je -- sus, Lord Je -- sus, \bar "."
Thou art all in all to me \bar "."
Je -- sus, Lord Je -- sus, \bar "."
I would live to Thee. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

There, in the glo -- ry,
I shall see my Lord who died;
Throned in the glo -- ry,
Lives the Cru -- ci -- fied.
Light -- ly weighs life’s bur -- den,
As I glad -- ly jour -- ney on,
Pre -- cious is my guer -- don,
Christ, the Ris -- en One.
Je -- sus, Lord Je -- sus,
Praise and glo -- ry be to Thee;
Je -- sus, Lord Je -- sus,
All my joy’s in Thee.

}

wordsC = \lyricmode {
\set stanza = "3."

Soon, in the glo -- ry,
We shall gath -- er ev -- ’ry one;
Loud in the glo -- ry,
Raise the joy -- ful song.
Un -- to Him who loves us,
Ne -- ver -- ceas -- ing praise be given,
Sing we Hal -- le -- lu -- jah,
To the Lord of heaven.
Je -- sus, Lord Je -- sus,
Soon for -- ev -- er -- more with Thee;
Je -- sus, Lord Je -- sus,
We Thy face shall see.

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
