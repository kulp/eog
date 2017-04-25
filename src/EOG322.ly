\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "322"
  title = "O! Come to Jesus, Children, Come"
  tunename = "Don’t Delay"
  meter = "8. 6. 8. 6. 8. 8. 8. 6."
  poet = ""
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  c4 | f f g g | a4. bes8 c4
  c8. bes16 | a2. a8. g16 | f2. \break % not \eogbreak -- verified in letter version
  c4 | f f g g | a4. bes8 c4
  c8. bes16 | a2. a8. g16 | f2. \break

  a8[ bes] | c4 c c bes8.[ a16] | bes4 bes bes
  a8.[ g16] | a8[ g] a[ bes] c4 a | bes a g \break
  c,4 | f f g g | a4. bes8 c4
  c8. bes16 | a2. a8. g16 | f2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c4 | c c e e | f4. f8 f4
  g8. g16 | f2. e8. e16 | f2.
  c4 | c c e e | f4. f8 f4
  g8. g16 | f2. e8. e16 | f2.

  f4 | f a a g8.[ f16] | g4 g g
  f8.[ e16] | f8[ e] f[ g] a4 f | g f e
  c4 | c c e e | f4. f8 f4
  g8. g16 | f2. e8. e16 | f2.

}
}

notesTenor = {
\global
\relative a, {

  c4 | a' a c c | c4. c8 c4
  bes8. bes16 | c2. c8. bes16 a2.
  c4 | a a c c | c4. c8 c4
  bes8. bes16 | c2. c8. bes16 a2.

  c4 | c f f c | c c c
  c4 | c c f c | c c c
  c4 | a a c c | c4. c8 c4
  bes8. bes16 | c2. c8. bes16 a2.

}
}

notesBass = {
\global
\relative f {

  c4 | f f c c | f4. g8 a4
  bes8. bes16 | c2. c,8. c16 | f2.
  c'4 | f, f c c | f4. g8 a4
  bes8. bes16 | c2. c,8. c16 | f2.

  f8[ g] | a4 f f f | e e e
  c4 | f f f f | e f c
  c4 | f f c c | f4. g8 a4
  bes8. bes16 | c2. c,8. c16 | f2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

O! come to Je -- sus, chil -- dren, come, \bar "."
Don’t de -- lay, don’t de -- lay, \bar "."
Se -- cure a place in heav’n’s bright home, \bar "."
While ’tis day, while ’tis day; \bar "."
That bless -- ed home is fill -- ing fast, \bar "."
And mer -- cy’s day will soon be past, \bar "."
Soon earth will hear the trump -- et’s blast; \bar "."
Come a -- way, come a -- way. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

O sad, if thou shouldst be too late–
Don’t de -- lay, don’t de -- lay,
A -- rise, and en -- ter mer -- cy’s gate,
While ’tis day, while ’tis day;
A lov -- ing Sav -- iour will ap -- pear
To meet thee, and to bless thee, there;
Draw nigh and His sal -- va -- tion share;
Come a -- way, come a -- way.

}

wordsC = \lyricmode {
\set stanza = "3."

His blood can wash the vil -- est clean,
Don’t de -- lay, don’t de -- lay,
O come, con -- fess -- ing what thou’st been,
While ’tis day, while ’tis day;
A full sal -- va -- tion, vast and free,
Wrought out, by Christ, a -- wait -- eth thee;
Come then at once, and hap -- py be;
Come a -- way, come a -- way.

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