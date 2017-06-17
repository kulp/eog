\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "332"
  title = "Christ The Saviour of Sinners Came"
  tunename = "Wonderful Words of Life"
  meter = "P. M."
  poet = "I. Fleming"
  composer = "P. P. Bliss"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \autoBeamOff
}

patternA = { c4 c8 c c c | c4 c8 c4. }
patternB = { c8 c c c4 c8 | c4. c }
patternC = { c4 c8 c8[ c] c | c4. c }
patternD = { c4 c8 c4 c8 | c4. c }
patternE = { c8 c c c4. }
patternF = { c8 c c c4 c8 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { b b b c b | b a a }
  \changePitch \patternB { d a a b a | g( d) }
  \changePitch \patternA { b' b b c b | b a a }
  \changePitch \patternB { d a a b a | g ~ g }
  \changePitch \patternC { b b b c d | e d }
  \changePitch \patternC { b b b c d | e d } \bar ".|:-||"

  \repeat volta 2 {
    \changePitch \patternE { d^\markup { \small \caps "Refrain" } c c c | c b b b }
    \changePitch \patternF { b a g a fis | }
  } \alternative {
    { g4( b8 d4.) }
    { g,4. ~ g }
  }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d d d e d | d c c }
  \changePitch \patternB { c c c d c | b ~ b }
  \changePitch \patternA { d d d e d | d c c }
  \changePitch \patternB { c c c d c | b ~ b }
  \changePitch \patternC { g' g g a b | c b }
  \changePitch \patternC { g g g a b | c b }

  \repeat volta 2 {
    \changePitch \patternE { b a a a | a g g g }
    \changePitch \patternF { d d d d d | }
  } \alternative {
    { d4.( g) }
    { d4. ~ d }
  }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g g g g g | g fis fis }
  \changePitch \patternB { fis fis fis fis fis | g ~ g }
  \changePitch \patternA { g g g g g | g fis fis }
  \changePitch \patternB { fis fis fis fis fis | g ~ g }
  \changePitch \patternD { g g g g | g g }
  \changePitch \patternD { g g g g | g g }

  \repeat volta 2 {
    \changePitch \patternE { d' d d d | d d d d }
    \changePitch \patternF { d c b c a | }
  } \alternative {
    { b4. ~ b }
    { b4. ~ b }
  }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g g g g g | d d d }
  \changePitch \patternB { d d d d d | g ~ g }
  \changePitch \patternA { g g g g g | d d d }
  \changePitch \patternB { d d d d d | g ~ g }
  \changePitch \patternD { g g g g | g g }
  \changePitch \patternD { g g g g | g g }

  \repeat volta 2 {
    \changePitch \patternE { d d d d | g g g g }
    \changePitch \patternF { d d d d d | }
  } \alternative {
    { g4. ~ g }
    { g4. ~ g }
  }

}
}

Refrain = \lyricmode {

Je -- sus a -- lone, Je -- sus a -- lone, \bar "."
Je -- sus a -- lone can save.  %{HIDE>%} save. %{<HIDE%}
%LYRICS Je -- sus a -- lone, Je -- sus a -- lone,
%LYRICS Je -- sus a -- lone can save.

}

wordsA = \lyricmode {
\set stanza = "1."

Christ the Sav -- iour of sin -- ners came \bar "." % original does not have line-end bars
In -- to the world to save; \bar "."
Sing His glo -- ry, His worth, His fame: \bar "."
Je -- sus a -- lone can save. \bar "."
No name else is giv -- en, \bar "."
Search through earth and heav -- en–

}

wordsB = \lyricmode {
\set stanza = "2."

Ten -- der were _ His works of grace,
Je -- sus a -- lone can save;
Where -- so -- ev -- er His steps we trace,
Je -- sus a -- lone can save.
Death and woe dis -- pell -- ing,
God’s great mer -- cy tel -- ling–

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Tears can nev -- er for -- give -- ness gain,
Je -- sus a -- lone can save;
God will ev -- er dead works dis -- dain;
Je -- sus a -- lone can save.
Hear his blest voice call -- ing,
Bless -- ings rich are fall -- ing–

}

wordsD = \lyricmode {
\set stanza = "4."

Call the chil -- dren, for -- bid them not,
Je -- sus a -- lone can save;
He can cleanse them from ev -- ery spot;
Je -- sus a -- lone can save.
Now His work’s com -- plet -- ed,
Now in glo -- ry seat -- ed–

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
}

\score {
  \unfoldRepeats \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice = altos { \voiceTwo << \notesAlto >> }
    >>
    \context Staff = men <<
      \context Voice = tenors { \voiceOne << \notesTenor >> }
      \context Voice = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
