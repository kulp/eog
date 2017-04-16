\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "192"
  title = "Simply Trusting Every Day"
  tunename = ""
  meter = "7s."
  poet = "E. Page"
  composer = "Ira D. Sankey"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=130
  \key aes \major
  \autoBeamOff
}

patternA = { c4 bes8 des4 c8 | c4 bes8 aes4. }
patternB = { c4 bes8 des4 c8 | c8[ c8] bes8 aes4. }
patternC = { c8[ c8] bes8 des4 c8 | c4 bes8 aes4. }
patternD = { c4 bes8 des4 c8 | c4 bes8 aes4( c8) }
patternE = { c4 bes8 c8[ c] c8 | c4 bes8 aes4. }

notesSoprano = {
\global
\relative c'' {

  c4 bes8 des4 c8 | c4 bes8 aes4.
  \changePitch \patternB { aes f aes f | ees aes c bes }
  \changePitch \patternA { c bes des c | bes aes f }
  \changePitch \patternC { ees aes c ees c | c bes aes }

  << s^\markup { \small \caps "Refrain" }
  { \changePitch \patternA { ees' c ees c c bes bes } } >>
  \changePitch \patternA { c g aes aes | bes f g }
  \changePitch \patternA { aes aes bes bes | c c des }
  \changePitch \patternE { ees f ees c aes | c bes aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { ees des f ees | ees des c }
  \changePitch \patternA { f des f des | c ees ees }
  \changePitch \patternA { ees des f ees | f f des }
  \changePitch \patternA { c ees aes ees | ees des c }

  \changePitch \patternA { aes' ees aes ees | ees ees ees }
  \changePitch \patternA { e e f f | d d ees }
  \changePitch \patternA { ees c ees ees | ees ges f }
  \changePitch \patternA { ees aes aes aes | aes g aes }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { aes aes aes aes | g g aes }
  \changePitch \patternA { aes aes aes aes | aes aes g }
  \changePitch \patternA { aes aes aes aes | aes aes aes }
  \changePitch \patternC { aes ees aes c aes | g g aes }

  \changePitch \patternA { c aes c aes | aes g g }
  \changePitch \patternA { g c c c | bes bes bes }
  \changePitch \patternA { aes aes g g | aes aes aes }
  \changePitch \patternE { aes aes c ees c | ees des c }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { aes aes aes aes | ees' ees aes, }
  \changePitch \patternA { des des des des | aes aes ees' }
  \changePitch \patternA { aes, aes aes aes | des des des }
  \changePitch \patternA { aes aes aes' aes | ees ees aes, }

  \changePitch \patternA { aes' aes aes aes, | ees' ees ees }
  \changePitch \patternD { c c f f | bes, bes ees des }
  \changePitch \patternA { c aes ees' ees | aes aes, des }
  \changePitch \patternA { c des ees f | ees ees aes, }

}
}

Refrain = \lyricmode {

Trust -- ing as the mo -- ments fly, \bar "."
Trust -- ing as the days go by; \bar "."
Trust -- ing Him what -- e’er be -- fall; \bar "."
Trust -- ing Je -- sus, that is all. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Simp -- ly trust -- ing eve -- ry day, \bar "."
Trust -- ing thro’ a storm -- y way; \bar "."
E -- ven when my faith is small, \bar "."
Trust -- ing Je -- sus, that is all. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Bright -- ly doth His Spi -- rit shine
In -- to this poor heart of mine;
While He leads I can -- not fall,
Trust -- ing Je -- sus, that is all.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Sing -- ing if my way be clear;
Pray -- ing if the path be drear:
If in dan -- ger, for Him call;
Trust -- ing Je -- sus, that is all.

}

wordsD = \lyricmode {
\set stanza = "4."

Trust -- ing Him while life shall last,
Trust -- ing Him till earth is past,
Till with -- in the jas -- per wall–
Trust -- ing Je -- sus, that is all.

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
