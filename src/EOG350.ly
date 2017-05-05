\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  hymnnumber = "350"
  title = "Hear Christ Calling, Come Unto Me"
  % TODO original has subtitle "Fishers of Men"
  tunename = ""
  meter = ""
  poet = "Harry D. Clarke"
  composer = "Harry D. Clarke"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key f \major
  \autoBeamOff
}

patternB = { c8 c4 c8 c2 | }
patternA = { c4 c c c | \patternB }
patternC = { c8 c c2 c | c2. }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { f f f g | a a gis a }
  \changePitch \patternB { g g fis g | f f d c }
  \changePitch \patternA { f f f g | a a gis } a4
  \changePitch \patternC { bes g | f e | f }
  \changePitch \patternC { a bes | c b | c }
  \changePitch \patternC { a c | f d | c } r4
  \changePitch \patternA { f, f f g | a a gis } a4
  \changePitch \patternC { bes g | f e | f } r4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { c c c c | f f f f }
  \changePitch \patternB { e e dis e | c c bes c }
  \changePitch \patternA { c c c c | f f f } f4
  \changePitch \patternC { e e | f c | c }
  \changePitch \patternC { f g | a gis | a }
  \changePitch \patternC { f g | f f | f } r4
  \changePitch \patternA { c c c c | f f f } f4
  \changePitch \patternC { e e | f c | c } r4

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a a a bes | c c b c }
  \changePitch \patternB { c c c c | a a bes a }
  \changePitch \patternA { a a a bes | c c b } c4
  \changePitch \patternC { c bes | a bes | a }
  \changePitch \patternC { c c | f f | f }
  \changePitch \patternC { c bes | bes bes | a } r4
  \changePitch \patternA { a a a bes | c c b } c4
  c8 bes | a2 g4( bes) | a2. r4

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { f f f f | f f f f }
  \changePitch \patternB { c c c c | f f f f }
  \changePitch \patternA { f f f f | f f f } f4
  \changePitch \patternC { c c | c c | f }
  \changePitch \patternC { f f | f f | f }
  \changePitch \patternC { f e | d bes | f' } r4
  \changePitch \patternA { f f f f | f f f } f4
  \changePitch \patternC { c c | c c | f } r4

}
}

wordsA = \lyricmode {
\set stanza = "1."

I will make you fish -- ers of men, \bar "."
Fish -- ers of men, fish -- ers of men, \bar "."
I will make you fish -- ers of men \bar "."
If you fol -- low me; \bar "."
If you fol -- low me, \bar "."
If you fol -- low me, \bar "."
I will make you fish -- ers of men \bar "."
If you fol -- low me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Hear Christ call -- ing, Come un -- to Me,
Come un -- to Me, Come un -- to Me;
Hear Christ call -- ing, Come un -- to Me,
I will give you rest,
I will give you rest,
I will give you rest;
Hear Christ call -- ing, Come un -- to Me,
I will give you rest.

}

extraA = \markuplist {

\line { Read your Bible, pray every day, }
\line { Pray every day, pray every day; }
\line { Read your Bible, pray every day, }
\line { And you’ll grow, grow, grow, }
\line { And you’ll grow, grow, grow, }
\line { And you’ll grow, grow, grow: }
\line { Read your Bible, pray every day, }
\line { And you’ll grow, grow, grow. }

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

% We don't use the `copyright` header field because we need the copyright to
% appear just under the last system, rather than at the bottom of the page.
\noPageBreak \markup { \fill-line { \raise #4 \wordwrap { Copyright, 1927. Renewal, 1955, by H. D. Clarke. Assigned to Hope Publishing Company. All rights reserved. Used by permission. } } }

\noPageBreak \markup { \lower #2 \fill-line { \center-column {
  "May be sung to above tune"
  \lower #2 \line { \column { \extraA } }
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
