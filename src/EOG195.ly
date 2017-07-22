\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 150." } }
}

\header{
  hymnnumber = "195"
  title = "The Lord Himself Shall Come"
  tunename = "Diademata"
  meter = "S. M. with Refrain"
  poet = "J. Montgomery"
  composer = "Geo. J. Elvey"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=90
  \key e \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e2 e4 e gis2 gis | cis1.
  cis2 | b e, a gis | fis1.
  fis2 | gis b cis b | ais gis4( fis) b2
  e2 | dis e cis cis | b1.

  << s^\markup { \small \caps "Refrain" }
  { b2 | b gis fis e | cis'1. } >>
  cis2 | cis ais gis fis | dis'1.
  dis2 | e2. dis4 cis2 b | a fis gis
  b | a gis fis fis | e\breve

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  b2 b4 b e2 e | e1.
  e2 | e e dis e | dis1.
  dis2 | e fis e e | cis cis fis
  e | fis gis cis, fis | dis1.

  dis2 | e e dis e | e1.
  eis2 | fis fis e fis | fis1.
  fis2 | e e e e | e dis e
  e2 | e e e dis | e\breve

}
}

notesTenor = {
\global
\relative a {

  gis2 gis4 gis gis2 gis | a1.
  a2 | b cis a b | b1.
  b2 | b b gis gis | ais ais b
  ais!2 | b b b ais! | b1.

  b2 | b b a b | cis1.
  b2 | ais cis b cis | b1.
  b2 | b b a b | cis b b
  b | cis b b2. a4 | gis\breve

}
}

notesBass = {
\global
\relative f {

  e2 e4 e cis2 cis | a1.
  a'2 | gis a fis e | b1.
  b2 | e dis cis e | fis e dis
  cis | b e fis fis | b1.

  a2 | gis e fis gis | a1.
  gis2 | fis fis gis ais | b1.
  a2 | gis gis a gis | fis b e,
  gis,2 | a e' b b | e\breve

}
}

Refrain = \lyricmode {

That res -- ur -- rec -- tion word, \bar "."
That shout of vic -- to -- ry_– \bar "." \eogbreak
Once more: “For -- ev -- er with the Lord.” \bar "."
A -- men, so let it be. \bar "." \eogbreak

}

wordsA = \lyricmode {
\set stanza = "1."

The Lord Him -- self shall come \bar "."
And shout a quick -- ening word: \bar "." \eogbreak
Thou -- sands shall an -- swer from the tomb: \bar "."
“For -- ev -- er with the Lord.” \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Then as we up -- ward fly,
The res -- ur -- rec -- tion word
Shall be our shout of vic -- to -- ry,
“For -- ev -- er with the Lord.”

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

There with un -- wear -- ied gaze
Our eyes on Him we’ll rest,
And sat -- is -- fy with end -- less praise
A heart su -- preme -- ly blest.

}

wordsD = \lyricmode {
\set stanza = "4."

“Know -- ing as we are known,”
How shall we love that word;
How oft re -- peat be -- fore the throne,
“For -- ev -- er with the Lord.”

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
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
