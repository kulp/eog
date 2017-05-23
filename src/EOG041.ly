\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  hymnnumber = "41"
  title = "The Heavenly Bridegroom Soon Will Come"
  tunename = ""
  meter = "8. 8. 6. and Refrain"
  %poet = ""
  %composer = ""
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=78 }
tb = { \tempo 4=26 }

patternAA = { \ta c8 | c4 c4 c4 c8[ c8] | c4 c4 c4 }
patternAB = { \ta c8 | c4 c4 c4 c4      | c4 c4 c4 }
patternBA = { \ta c8[ c8] | c4 c4 c4 c8[ c8] | c4 c4 c4 }
patternBB = { \ta c4      | c4 c4 c4 c8[ c8] | c4 c4 c4 }
patternBC = { \ta c4      | c4 c4 c4 c4      | c4 c4 c4 }
patternCA = { \ta c4 | c4. c8 c4 c4 | c2 ~ c8[ c8] }
patternCB = { \ta c4 | c4. c8 c4 c4 | c2.          }
patternDA = { \ta c8 c8 | c4 c8 c8 c8 \tb c8 \ta }
patternDB = { \ta c8 c8 | c4 c8 c8 c8 c8 }
patternEA = { \ta c8 c8 | c4 c4 c4. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d | g g g b a | g d d }
  \changePitch \patternBA { fis g | a a a g a | b g g }
  \changePitch \patternCA { b | a g fis e | d d c }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternDA { b d | g g a g fis \fermata } >>
  \changePitch \patternDA { fis g | a a b a g \fermata }
  \changePitch \patternDB { b c | d d e d c }
  \changePitch \patternEA { b c | b a g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { d | b c b c | b c b }
  \changePitch \patternBB { c | c fis fis d fis | g c, b }
  \changePitch \patternCA { d | d d d cis | d d c }

  \changePitch \patternDA { b c | b b c b d }
  \changePitch \patternDA { d d | fis fis g c, b }
  \changePitch \patternDB { g' g | g g g g fis }
  \changePitch \patternEA { d e | g fis d }

}
}

notesTenor = {
\global
\relative a, {

  \changePitch \patternAB { d | d e d fis | g fis g }
  \changePitch \patternBA { a g | fis c' c b d | d e d }
  \changePitch \patternCB { g, | fis b a g | fis }

  \changePitch \patternDA { g a | g d' d d c }
  \changePitch \patternDA { c b | c c d d d }
  \changePitch \patternDB { d d | d d c b a }
  \changePitch \patternEA { g g | b c b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { d | g, g g d' | g, a g }
  \changePitch \patternBC { d' | d d d d | g g g }
  \changePitch \patternCB { g, | a g a a | d }

  \changePitch \patternDA { g fis | g g fis g d_\fermata }
  \changePitch \patternDA { d d | d d d d g_\fermata }
  \changePitch \patternDB { g a | b b c g d }
  \changePitch \patternEA { g, c | d d < g g, > }

}
}

Refrain = \lyricmode {

Trim your lamps and be read -- y, \bar "."
Trim your lamps and be read -- y, \bar "."
Trim your lamps and be read -- y, \bar "."
For the Bride -- groom’s nigh. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

The heav’n -- ly Bride -- groom soon will come, \bar "."
To claim His bride, and take her home, \bar "."
To dwell with Him on high __ \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The Bride -- groom comes, let no man doubt,
A -- las, for those whose lamps are out!
They’ll find no oil to buy __

}

wordsC = \lyricmode {
\set stanza = "3."

Who read -- y are shall en -- ter in;
The mar -- riage feast will then be -- gin,
And ev -- ’ry tear be dry __

\Refrain

}

wordsD = \lyricmode {
\set stanza = "4."

The right -- eous, saved for -- ev -- er -- more,
Their God shall cease -- less -- ly a -- dore,
In bliss be -- yond the sky __

}

wordsE = \lyricmode {
\set stanza = "5."

O sin -- ner! ere it be too late,
Flee thou to mer -- cy’s o -- pen gate,
And join Christ’s wait -- ing band __

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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

%\markup { \fill-line { \column {
%  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
%  \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
%  \line{ \bold 7 \column { \wordsG } } \combine \null \vspace #0.4
%  \line{ \bold 8 \column { \wordsH } } \combine \null \vspace #0.4
%} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
