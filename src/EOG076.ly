\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 3) (#t #f))
  %page-count = ##f
}

\header{
  hymnnumber = "76"
  title = "“Come Unto Me, And I Will Give You Rest”"
  tunename = "Eventide"
  meter = "10s"
  poet = "H. D’A. Champney"
  composer = "W. H. Monk"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=110 }
tb = { \tempo 4=55  }

patternAA = { c2      c4 c4 | c2 c2      | c4  c4 c4 c4 | c1 }
patternAB = { c4( c4) c4 c4 | c2 c2      | c4  c4 c4 c4 | c1 }
patternAC = { c4( c4) c4 c4 | c2 c4( c4) | c4  c4 c4 c4 | c1 }
patternAD = { c2      c4 c4 | c2 c2      | c4. c8 c4 c4 | c1 }

patternBA = { c2 c4 c4 | c4 c4 c4 c4 | c2  c2 | c1 }
patternBB = { c2 c4 c4 | c4 c4 c4 c4 | c2. c4 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key e \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { gis gis fis | e b' | cis b b a | gis }
  \changePitch \patternAA { gis a b | cis b | a fis gis ais | b }
  \changePitch \patternAA { gis gis fis | e b' | b a a gis | fis }
  \changePitch \patternBA { fis gis a | gis fis e a | gis fis | e }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e dis dis | e e | e dis e fis | e }
  \changePitch \patternAA { e e e | e e | e fis e e | dis }
  \changePitch \patternAA { e dis dis | e e | e e eis eis | fis }
  \changePitch \patternBA { dis e dis | e dis e fis | e dis | e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b b a | gis e | e b' b b | b }
  \changePitch \patternAA { b a gis | a gis | cis b b e, | fis }
  \changePitch \patternAC { gis a b a | gis e' dis | cis cis cis b | a }
  \changePitch \patternBB { b b b | b a gis cis | b a | gis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { e b b | cis gis | a b cis dis | e }
  \changePitch \patternAB { e dis cis b | a e' | fis dis e cis | b }
  \changePitch \patternAD { e b b | cis gis | a b cis cis | fis }
  \changePitch \patternBA { a gis fis | e b cis a | b b e }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Come un -- to Me, and I will give you rest!” \bar "."
What bless -- ed words to wear -- y ones ad -- dressed! \bar "."
They come from Him who knew the depth of woe, \bar "."
And felt for sin -- ners as none here be -- low. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“Come un -- to Me,” Yes, come in all your sin!
Through Je -- sus’ blood the vile may en -- ter in:
May come to God, who ful -- ly knows their guilt,
As -- sured that for them -- selves that blood was spilt.

}

wordsC = \lyricmode {
\set stanza = "3."

“Come un -- to Me,” The bless -- ed Son of God
Thus told on earth, in ev -- ery step He trod.
The heart of Him who is in na -- ture love,
And is be -- seech -- ing men that love to prove.

}

wordsD = \markuplist {

\line { “Come unto Me,” Yes, God Himself says “Come!” }
\line { He sees afar, and runs to welcome home }
\line { Unworthy sinners, who have naught to plead, }
\line { But God’s own love, and their exceeding need. }

}

wordsE = \markuplist {

\line { “Come unto Me,” O, blessed open door }
\line { For those who but for Christ had hoped no more! }
\line { O, love of God told out in full extent }
\line { When Jesus to those depths of darkness went. }

}

wordsF = \markuplist {

\line { “Come unto Me,” For Christ the risen Lord }
\line { Now speaks from glory through the written word; }
\line { As Victor now He can with triumph shout, }
\line { That none who come to Him will He cast out. }

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

\noPageBreak

\markup { \fill-line { \column {
  \raise #5
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } } %\combine \null \vspace #0.4
} } }

\noPageBreak

\markup { \vspace #2 \fill-line { \line { Alternate tune: No. 6. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
