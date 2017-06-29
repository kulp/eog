\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  %children
  hymnnumber = "323"
  title = "There’s a Friend For Little Children"
  tunename = "Watcher"
  meter = "7. 6. 7. 6. D."
  poet = "A. Midlane"
  composer = "Edward L. White"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key d \major
  \partial 4
  \autoBeamOff
}

patternA = { c8 c | c4 c c c | c2 c4 }
patternB = { c4 | c4. c8 c4 c | c2. }
patternC = { c8 ~ c8 | c4. c8 c4 c | c2. }
patternD = { c4 | c c c c | c2 c4 }
patternE = { c4 | c c c c | c2. }
patternF = { c4 | c4. c8 c4 c | c2 c4 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { d e | fis e fis g | a a }
  \changePitch \patternB { a | g fis g a | fis } \eogbreak
  \changePitch \patternA { d( e) | fis e fis g | a a }
  \changePitch \patternC { a a | g fis g a | fis } \eogbreak
  \changePitch \patternD { d | d b' b b | b b }
  \changePitch \patternE { b | b d cis b | a } \eogbreak
  \changePitch \patternF { a | d fis, fis g | a a }
  \changePitch \patternB { a | g fis g e | d }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d cis | d cis d e | fis fis }
  \changePitch \patternB { fis | e d e fis | d }
  \changePitch \patternA { d( cis) | d cis d e | fis fis }
  \changePitch \patternC { fis fis | e d e fis | d }
  \changePitch \patternD { d | d g g g | g g }
  \changePitch \patternE { g | g b a g | fis }
  \changePitch \patternF { fis | fis d d d | d fis }
  \changePitch \patternB { fis | e d e cis | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { fis g | a a a a | a a }
  \changePitch \patternB { a | a a a a | a }
  \changePitch \patternA { fis( g) | a a a a | a a }
  \changePitch \patternC { a a | a a a a | a }
  \changePitch \patternD { a | b d d d | d d }
  \changePitch \patternE { d | d d d d | d }
  \changePitch \patternF { d | a a a b | a a }
  \changePitch \patternB { a | a a a g | fis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { d a | d a d d | d d }
  \changePitch \patternB { d | a a a a | d }
  \changePitch \patternA { d( a) | d a d d | d d }
  \changePitch \patternC { d d | a a a a | d }
  \changePitch \patternD { fis | g g g g | g g }
  \changePitch \patternE { g | g g g g | d }
  \changePitch \patternF { d | d d d g | fis d }
  \changePitch \patternB { d | a a a a | d }

}
}

wordsA = \lyricmode {
\set stanza = "1."

There’s a \italicsOn Friend \italicsOff for lit -- tle chil -- dren \bar "."
A -- bove the bright blue sky; \bar "."
A Friend who nev -- er chang -- es, \bar "."
Whose love can nev -- er die. \bar "."
Un -- like our friends by na -- ture, \bar "."
Who change from year to year, \bar "."
This Friend is al -- ways wor -- thy \bar "."
And He is al -- ways near. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

There’s a \italicsOn rest \italicsOff for lit -- tle chil -- dren
A -- bove the bright blue sky;
Who love the bless -- ed Sav -- iour,
And “Ab -- ba, Fa -- ther,” cry;
A rest from ev -- ’ry tur -- moil,
From sin and dan -- ger free;
Where ev -- ’ry lit -- tle pil -- grim
Shall rest e -- ter -- nal -- ly.

}

wordsC = \lyricmode {
\set stanza = "3."

There’s a \italicsOn home \italicsOff for lit -- tle chil -- dren
A -- bove the bright blue sky;
Where Je -- sus reigns in glo -- ry,
A home of peace and joy.
No home on earth is like it,
Or can with it com -- pare;
For ev -- ’ry -- one is hap -- py,
Nor could be hap -- pier there.

}

wordsD = \lyricmode {
\set stanza = "4."

There’s a \italicsOn crown \italicsOff for lit -- tle chil -- dren
A -- bove the bright blue sky;
And all who look for Je -- sus
Shall wear it by and by. % original has by-and-by, but "by -- and -- by" might be unfortunately compacted without hyphens TODO figure out hard hyphens
A crown of bright -- est glo -- ry,
Which He will then be -- stow
On all who’ve found His fa -- vor,
And loved His name be -- low.

}

wordsE = \markuplist {

\line { There’s a \italic song for little children }
\line { { \hspace #2 } Above the bright blue sky; }
\line { A song that will not weary, }
\line { { \hspace #2 } Though sung eternally; }
\line { A song which even angels }
\line { { \hspace #2 } Can never, never sing; }
\line { They know not Christ as \italic Saviour, }
\line { { \hspace #2 } But worship Him as \italic King. }

}

wordsF = \markuplist {

\line { There’s a \italic robe for little children }
\line { { \hspace #2 } Above the bright blue sky; }
\line { And a \italic harp of sweetest music, }
\line { { \hspace #2 } And a \italic palm of victory; }
\line { All, all above is treasured }
\line { { \hspace #2 } And found in Christ alone; }
\line { Oh, come, dear little children, }
\line { { \hspace #2 } That all may be your own. }

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

\noPageBreak

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
  \line{ \bold 6 \column { \wordsF } }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
