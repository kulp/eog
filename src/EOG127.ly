\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "127"
  title = "Let Us Sing of His Love Once Again"
  tunename = ""
  meter = ""
  poet = ""
  composer = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8.  c16  | c4 c8 c8 c4 c8. c16 c2. }
patternAB = { c8.( c16) | c4 c8 c8 c4 c8  c8  c2. }

patternBA = { c8. c16 | c2. c8. c16 c2. }
patternBB = { c8 c8 | c4 c8 c8 c4 c8 c8 | c2. }

patternCA = { c4 | c4 c8. c16 c4 c8. c16 | c4 c8 c8 c4 }
patternCB = { c8 c8 | c4 c8 c8 c4 c8 c8 | c4 c8 c8 c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g a | b a g a g e | d }
  \changePitch \patternAA { g a | b b b d d b | a }
  \changePitch \patternAA { g a | b a g a g e | d }
  \changePitch \patternAB { g a | b a g a g fis | g }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBA { b c | d d b a } >>
  \changePitch \patternBB { a b | c c c c b a | b }
  \changePitch \patternBA { b c | d b a g }
  \changePitch \patternBB { fis e | d g b a g fis | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d | d d d e e c | b }
  \changePitch \patternAA { d d | d d d d d g | fis }
  \changePitch \patternAA { d d | d d d e e c | b }
  \changePitch \patternAB { d d | d d d e d d | d }

  \changePitch \patternBA { g a | b b g | fis }
  \changePitch \patternBB { fis g | a a a a g fis | g }
  \changePitch \patternBA { g a | b d, d | e }
  \changePitch \patternBB { d c | b d d d d d | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b c | d c b c c g | g }
  \changePitch \patternAA { b c | d d d b b d | d }
  \changePitch \patternAA { b c | d c b c c g | g }
  \changePitch \patternAB { b c | d c b c b a | b}

  \changePitch \patternCA { r | r d d d d d | d d d d }
  \changePitch \patternCB { d d | d d d d d d | d d d d }
  \changePitch \patternCA { r | r d d d d g, | g c c c }
  \changePitch \patternBB { g g | g b d c b a | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g g | g g g c, c e | g }
  \changePitch \patternAA { g g | g g g g g g | d }
  \changePitch \patternAA { g g | g g g c, c e | g }
  \changePitch \patternAB { g g | g g g c, d d | <g g,> }

  \changePitch \patternCA { r | r g g g g g | d d d d }
  \changePitch \patternCB { d d | d d d d d d | g g g g }
  \changePitch \patternCA { r | r g g g g b, | c c c c }
  \changePitch \patternBB { c c | d d d d d d | <g g,> }

}
}

wordsA = \markuplist {

\line { Let us sing of His love once again, }
\line { { \hspace #2 } Of the love that can never decay, }
\line { Of the blood of the Lamb who was slain, }
\line { { \hspace #2 } Till we praise Him again in that day. }

}

Refrain = \markuplist {

\line { { \hspace #2 } In the sweet by-and-by }
\line { { \hspace #2 } We shall meet in the home of our Lord. }

}

wordsB = \markuplist {

\line { There are cleansing and healing for all }
\line { { \hspace #2 } Who will wash in the life-giving flood; }
\line { There is life everlasting, and joy }
\line { { \hspace #2 } In the presence of God through the blood. }

}

wordsC = \markuplist {

\line { Even now while we taste of His love, }
\line { { \hspace #2 } We are filled with delight at His name; }
\line { But what will it be when above }
\line { { \hspace #2 } We shall join in the song of the Lamb! }

}

% this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  127"
          "Let Us Sing of His Love Once Again"
          \null
        }
      }
    }

    \fill-line {
      \column {
        \vspace #2 \line { \bold 1 \column { \wordsA } }
        \vspace #2 \line { \column { \italic { Refrain: } \column { \Refrain } } }
        \vspace #2 \line { \bold 2 \column { \wordsB } }
        \vspace #2 \line { \bold 3 \column { \wordsC } }
      }
    }
    \vspace #2 \fill-line { \smaller { "May be sung to tune No. 126." } }
  }
}

#(cond ((ly:get-option 'eog-midi-permitted) #{ \score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
} #}))

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
