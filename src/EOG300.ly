\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG300.ily"
}

\header{
  %children
  hymnnumber = "300"
  title = "If Little Children Knew the Love"
  tunename = "Arnold"
  meter = "C. M."
  poet = ""
  composer = "Dr. S. Arnold"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key e \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  b4 | b( gis) b | a( fis) a | gis( a) gis | fis2
  fis4 | gis4( a) b | cis( b) gis | fis2
  b4 | cis( e) cis | b( gis) b | cis( e) cis | b2
  b4 | cis( dis) e | a,( gis) fis | e2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  gis4 | gis( e) gis | fis( dis) fis | e( fis) e | dis2
  dis4 | e2 e4 | a( gis) e | dis2
  e4 | e2 e4 | e2 e4 | e2 e4 | e2
  gis4 | a2 gis4 | e2 dis4 | e2

}
}

notesTenor = {
\global
\relative a' {

  e4 | e( b) e | dis( b) dis | e( b) b | b2
  b4 | b( a) gis | e'( b) b | b2
  gis4 | a( cis) a | gis( b) gis | a( cis) a | gis2
  e'4 | e( fis) b, | cis( b) a | gis2

}
}

notesBass = {
\global
\relative f {

  e4 | e2 e4 b2 b4 | e( dis) e | b2
  b4 | e( cis) b | a( e') e | b2
  e4 | a,2 a4 | e'2 e4 | a,2 a4 | e'2
  e4 | a( fis) gis | a( b) b, | e2

}
}

wordsA = \lyricmode {
\set stanza = "1."

If lit -- tle chil -- dren knew the love \bar "."
Which dwells in Je -- sus’ breast, \bar "."
How would they come to Him by faith, \bar "."
All anx -- ious to be blest! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“Come un -- to Me,” He sweet -- ly cries;
“Come, lit -- tle chil -- dren, come!
Come to My o -- pen arms and heart,
Come to My hap -- py home!”

}

wordsC = \lyricmode {
\set stanza = "3."

Thus Je -- sus speaks. Who makes re -- ply,
“O Lord, I come to Thee;
Thy pre -- cious love hath won my heart,
Thine hence -- forth I will be”?

}

wordsD = \lyricmode {
\set stanza = "4."

Oh, pre -- cious choice! If such be thine,
Then thou in -- deed art blest;
Peace thy com -- pan -- ion here shall be,
There, ev -- er -- last -- ing rest!

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\noPageBreak \markup { \fill-line { \line { Alternate tune: No. 151. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
