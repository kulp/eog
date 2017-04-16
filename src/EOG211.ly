\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "211"
  title = "Christian, Walk Carefully"
  tunename = ""
  meter = "P. M."
  poet = "Words Arranged"
  composer = "G. C. Stebbins"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key g \major
  \autoBeamOff
}

patternA = { c4 c c | c4. c8 c4 | c c c | c2. }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { d g b | b a g | a g fis | g }
  \changePitch \patternA { d g b | d c b | b a g | a }
  \changePitch \patternA { c b a | b a g | a g fis | g }
  \changePitch \patternA { e fis g | d g b | a g fis | g }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternA { d' b c | d c b } >>
  \changePitch \patternA { c a b | c b a }
  \changePitch \patternA { d b c | d c b | a g fis | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { b b d | d d d | e d d | d }
  \changePitch \patternA { d d g | g fis g | d d cis | d }
  \changePitch \patternA { d d d | d c b | d d c | b }
  \changePitch \patternA { c d e | d d d | e d c | b }

  \changePitch \patternA { b' g a | b a g }
  \changePitch \patternA { a fis g | a g fis }
  \changePitch \patternA { b g a | b a g | e d c | b }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g g g | g fis g | c b a | b }
  \changePitch \patternA { b b d | d d d | d a a | fis }
  \changePitch \patternA { a g fis | g g g | c b a | g }
  \changePitch \patternA { g g g | g b d | c b a | g }

  \changePitch \patternA { d' d d | d d d }
  \changePitch \patternA { d d d | d d d }
  \changePitch \patternA { d d d | d d d | c b a | g }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { g g g | g a b | c d d | g }
  \changePitch \patternA { g g g | b a g | g fis e | d }
  \changePitch \patternA { d d d | g, g g | d' d d | e }
  \changePitch \patternA { c c c | b g g | c d d | g, }

  \changePitch \patternA { g' g g | g g g }
  \changePitch \patternA { d d d | d d d }
  \changePitch \patternA { g g g | g g g | c, d d | g, }

}
}

RefrainA = \lyricmode {

Chris -- tian, walk \italicsOn care -- ful -- ly, \italicsOff \bar "."
Chris -- tian, walk \italicsOn care -- ful -- ly, \italicsOff \bar "."
Chris -- tian, walk \italicsOn care -- ful -- ly, \italicsOff dan -- ger is near! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Chris -- tian, walk \italicsOn care -- ful -- ly, \italicsOff dan -- ger is near; \bar "."
On in thy jour -- ney with trem -- bling and fear. \bar "."
Snares from with -- out and temp -- ta -- tions with -- in, \bar "."
Seek to en -- tice thee once more in -- to sin. \bar "."

\RefrainA

}

RefrainB = \lyricmode {

Chris -- tian, walk \italicsOn cheer -- ful -- ly, \italicsOff
Chris -- tian, walk \italicsOn cheer -- ful -- ly, \italicsOff
Chris -- tian, walk \italicsOn cheer -- ful -- ly, \italicsOff thro’ the fierce storm.

}

wordsB = \lyricmode {
\set stanza = "2."

Chris -- tian, walk \italicsOn cheer -- ful -- ly, \italicsOff thro’ the fierce storm,
Dark tho’ the sky with its threat of a -- larm;
Soon will the clouds and the tem -- pest be o’er,
Then with thy Sav -- iour thou’lt rest ev -- er -- more.

\RefrainB

}

RefrainC = \lyricmode {

Chris -- tian, walk \italicsOn prayer -- ful -- ly, \italicsOff
Chris -- tian, walk \italicsOn prayer -- ful -- ly, \italicsOff
Chris -- tian, walk \italicsOn prayer -- ful -- ly, \italicsOff fear lest thou fall.

}

wordsC = \lyricmode {
\set stanza = "3."

Chris -- tian, walk \italicsOn prayer -- ful -- ly, \italicsOff oft wilt thou fall
If thou for -- get on thy Sav -- iour to call;
Safe thou shalt walk thro’ each tri -- al and care,
If thou art clad in the ar -- mor of prayer.

\RefrainC

}

RefrainD = \lyricmode {

Chris -- tian, walk \italicsOn hope -- ful -- ly, \italicsOff
Chris -- tian, walk \italicsOn hope -- ful -- ly, \italicsOff
Chris -- tian, walk \italicsOn hope -- ful -- ly, \italicsOff rest thou shalt gain.

}

wordsD = \lyricmode {
\set stanza = "4."

Chris -- tian, walk \italicsOn hope -- ful -- ly, \italicsOff sor -- row and pain
Cease when the ha -- ven of rest thou shalt gain;
Then from the lips of the Judge, thy re -- ward:
“En -- ter thou in -- to the joy of thy Lord.”

\RefrainD

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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
