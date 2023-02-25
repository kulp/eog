\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  oddFooterMarkup = \markup { \fill-line { \if \on-first-page "Alternate tune: No. 6." } }
  \include "override/override-EOG076.ily"
}

\header{
  %gospel
  hymnnumber = "76"
  title = "“Come Unto Me, and I Will Give You Rest”"
  tunename = "Eventide" % see https://hymnary.org/tune/eventide_monk
  meter = "10. 10. 10. 10."
  poet = "H. D’Arcy Champney" % not found at hymnary.org
  composer = "William H. Monk" % see https://hymnary.org/tune/eventide_monk
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

“Come un -- to Me!” Yes, come in all your sin!
Through Je -- sus’ blood the vile may en -- ter in:
May come to God, who ful -- ly knows their guilt,
As -- sured that for them -- selves that blood was spilt.

}

wordsC = \lyricmode {
\set stanza = "3."

“Come un -- to Me!” The bless -- ed Son of God
Thus told on earth, in ev -- ery step He trod,
The heart of Him who is in na -- ture love,
And is be -- seech -- ing men that love to prove.

}

wordsD = \markuplist {

\line { “Come unto Me!” Yes, God Himself says, “Come!” }
\line { He sees afar, and runs to welcome home }
\line { Unworthy sinners, who have naught to plead, }
\line { But God’s own love, and their exceeding need. }

}

wordsE = \markuplist {

\line { “Come unto Me!” Oh, blessèd open door }
\line { For those who, but for Christ, had hoped no more! }
\line { Oh love of God told out in full extent }
\line { When Jesus to those depths of darkness went. }

}

wordsF = \markuplist {

\line { “Come unto Me!” For Christ the risen Lord }
\line { Now speaks from glory through the written Word; }
\line { As Victor now He can with triumph shout, }
\line { That none who come to Him will He cast out. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\noPageBreak

\markup { \fontsize #0.3 \fill-line { \vcenter \column {
  \vspace #1
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } }
  \vspace #1
} } }

\version "2.24.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
