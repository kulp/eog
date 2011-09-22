\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}


\header{
  title = "Behold, Behold the Lamb of God"
  subsubtitle = "(Mercy’s Free. 8. 6. 8. 6. 8. 6. 8. 6.)"
  %meter = "8.6.8.6.8.6.8.6."
  poet = "A. Jukes"
  composer = "D. F. E. Auber"
  %copyright = ""
  tagline = ##f
}

patternOne   = { c4( c8) | c4 c8 c4 c8 c8[ c8] c8 | c4.( c4.) c8[ c8] c8 | c4.( c4.) c4 c8 | c4. ~ c4. }
patternTwo   = { c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. }
patternThree = { c4. | c4 c8 c4 c8 c4 c8 | c4.( c4.) c4 c8 | c4.( c4.) c4 c8 | c4. ~ c4. }

notesSoprano = {
\relative c' {

    \changePitch \patternOne { c' bes | a a a a a bes c | d c c bes a | g bes a g | f f }
    \changePitch \patternOne { c' bes | a a a a a bes c | d c c bes a | g bes a g | f f }
    \changePitch \patternTwo { c' | c bes g d' d c | a a c | c bes g d' d c | a a }
    \changePitch \patternOne { c bes | a a a a a bes c | d c c bes a | g bes a g | f f }
\bar "|."

}
}

notesAlto = {
\relative e' {

    \changePitch \patternOne { a g | f f f f f g a | bes f a g f | e g f e | f f }
    \changePitch \patternOne { a g | f f f f f g a | bes f a g f | e g f e | f f }
    \changePitch \patternTwo { f | e g e e f f | f f f | e g e e f f | f f }
    \changePitch \patternOne { a g | f f f f f g a | bes f a g f | e g f e | f f }

}
}

notesTenor = {
\relative a {

    \changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }
    \changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }
    \changePitch \patternTwo   { a | g c c bes bes a | c c a | g c c bes bes a | c c }
    \changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }

}
}

notesBass = {
\relative a {

    \changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }
    \changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }
    \changePitch \patternTwo   { f | c c c c f f | f f | f c c c c f f | f f }
    \changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }

}
}

global = {
  \include "common/overrides.ily"
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'() \time 9/8
  \once \override Score.MetronomeMark #'transparent = ##t
  \tempo 4 = 80
  \key f \major
  \partial 4.
}

wordsA = \lyricmode {
\set stanza = "1."

    Be -- hold, be -- hold the Lamb of God \bar "."
    On the cross! On the cross! \bar "." \break
    For us He shed his Pre -- cious blood \bar "."
    On the cross! On the cross! \bar "." \break
    O hear the o -- ver whelm -- ing cry— \bar "."
    “E -- li la -- ma sa -- bach -- tha -- ni.” \bar "." \break
    Draw near and see the Sav -- iour die \bar "."
    On the cross! On the cross! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

    See, see His arms ex -- tend -- ed wide
    On the cross! On the cross! \bar "."
    Be -- hold His bleed -- ing hands and side
    On the cross! On the cross! \bar "."
    The sun with -- holds his rays of light,
    The heav’ns are clothed in shades of night,
    While Je -- sus wins the glo -- rious fight
    On the cross! On the cross! \bar "."

}

wordsC = \lyricmode {
\set stanza = "3."

    Come, sin -- ners, see Him lift -- ed up
    On the cross! On the cross! \bar "."
    He drinks for you the bit -- ter cup
    On the cross! On the cross! \bar "."
    The rocks do rend, the moun -- tains quake,
    While Je -- sus doth a -- tone -- ment make,
    While Je -- sus suf -- fers for our sake,
    On the cross! On the cross! \bar "."

}

wordsD = \lyricmode {
\set stanza = "4."

    Wher -- e’er I go I’ll tell the story,
    Of the cross! Of the cross! \bar "."
    In noth -- ing else my soul shall glory,
    Save the cross! Save the cross! \bar "."
    Yes; this my cons -- tant theme shall be,
    Thro’ time, and in e -- ter -- ni -- ty,
    That Je -- sus tast -- ed death for me,
    On the cross! On the cross! \bar "."

}


\score {
  \new ChoirStaff <<
    \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
    \new Staff <<
      \clef "treble"
      \repeat unfold 4 {
         s4( s8) \noBreak | s4 s8 s4 s8 s8 s8 s8 \noBreak | s4.( s4.) \noBreak
             s8 s8 s8 \noBreak | s4.( s4.) \noBreak s4 s8 \noBreak | s4. ~ s4.
             \break
      }

      \new Voice = "Soprano"  { \voiceOne \global \notesSoprano \bar "|." }
      \new Voice = "Alto" { \voiceTwo \global \notesAlto }
      \new Lyrics \lyricsto "Soprano" { \wordsA }
      \new Lyrics \lyricsto "Soprano" { \wordsB }
      \new Lyrics \lyricsto "Soprano" { \wordsC }
      \new Lyrics \lyricsto "Soprano" { \wordsD }
    >>
    \new Staff <<
      \clef "bass"
      \new Voice = "Tenor" { \voiceOne \global \notesTenor }
      \new Voice = "Bass"  { \voiceTwo \global \notesBass }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

