\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "263"
  title = "The Glory Shines Before Me!"
  tunename = ""
  meter = "7. 6. 7. 6. D."
  poet = "H. K. Burlingham"
  composer = "Miss S. M. Walker"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \autoBeamOff
}

patternA = { c8 c c c4 c8 | c4. c4. }
patternB = { c8 c c c4 c8 | c4 c8 c4. }
patternC = { c4. c4. }

notesSoprano = {
\global
\relative c'' {

  c8 b c d4 a8 | c4. bes4. |
  bes8 a bes c4 g8 | a4. ~ a4. |
  c8 b c f4 e8 | e4. d4. |
  d8 c bes c4 bes8 | a4. ~ a4. |

  \changePitch \patternB { a gis a d c | bes bes g }
  \changePitch \patternA { g fis g c bes | a ~ a }
  \changePitch \patternA { a g a g f | f' d }
  \changePitch \patternA { c b c d c | f, ~ f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { a gis a bes f | a g }
  \changePitch \patternA { g fis g a e | f ~ f }
  \changePitch \patternA { a gis a a c | bes bes }
  \changePitch \patternA { bes a g a g | f ~ f }

  \changePitch \patternB { f gis f f a | g g e }
  \changePitch \patternA { e dis e e g | f ~ f }
  \changePitch \patternA { c bes c d d | f bes }
  \changePitch \patternA { a gis a f e | <c a> ~ <c a> }

}
}

notesTenor = {
\global
\override NoteHead.font-size = #-4
<<
\relative a {

  { f4. bes, | c c }
  { c c | s s } % moved to chord below
  { f f | bes, bes }
  { c c | s s } % moved to chord below

  { f bes, | c c }
  { c c | s s } % moved to chord below
  { f bes, | bes bes }
  c4. bes4 c8 | s4. s % moved to chord below

}

\relative f, {

  { f4. \new Voice { \override NoteHead.font-size = #-4 \voiceFour bes } | c, c }
  { c c | <f _~ f' ^~ > <f f'> }
  { f f | \new Voice { \override NoteHead.font-size = #-4 \voiceFour bes bes } }
  { c, c | <f _~ f' ^~ > <f f'> }

  { f bes, | c c }
  { c c | <f _~ f' ^~ > <f f'> }
  { f bes, | bes bes }
  c4. bes4 c8 | <f _~ f' ^~ >4. <f f'>

}
>>
}

wordsA = \lyricmode {
\set stanza = "1."

The glo -- ry shines be -- fore me! \bar "."
I can -- not lin -- ger here! \bar "."
Tho’ clouds may dark -- en o’er me, \bar "."
My Fa -- ther’s house is near. \bar "."
If thro’ this bar -- ren wil -- der -- ness \bar "."
A lit -- tle while I roam, \bar "."
The glo -- ry shines be -- fore me, \bar "."
I am not far from home! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Be -- yond the storms I’m go -- ing,
Be -- yond this vale of tears,
Be -- yond the floods o’er -- flow -- ing,
Be -- yond the chang -- ing years.
I’m go -- ing to the bet -- ter land,
By faith long since pos -- sessed,
The glo -- ry shines be -- fore me,
For this is not my rest.

}

wordsC = \lyricmode {
\set stanza = "3."

The Lamb is there the glo -- ry!
The Lamb is there the light!
There shall be no more weep -- ing,
And there is no more night.
The voice of Je -- sus call -- eth me,
My race will soon be run,
The glo -- ry shines be -- fore me!
The prize will soon be won!

}

wordsD = \lyricmode {
\set stanza = "4."

The glo -- ry shines be -- fore me!
I know that all is well!
My Fa -- ther’s care is o’er me,
His prais -- es I would tell.
The love of Christ con -- strain -- eth me,
His blood hath washed me white,
Where Je -- sus is in glo -- ry–
’Tis home, and love, and light!

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
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
      \context Voice = tenors { \voiceOne << \notesTenor >> }
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
