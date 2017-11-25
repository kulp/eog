\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "304"
  title = "How Loving Is Jesus"
  tunename = "Gordon"
  meter = "11. 11. 11. 11."
  poet = "Randall H. Ballantyne" % see https://hymnary.org/text/how_loving_is_jesus_who_came_from_the_sk
  composer = "Adoniram J. Gordon" % see https://hymnary.org/tune/my_jesus_i_love_thee_gordon
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f4 | a2 bes4 bes | a4.( g8) f4
  a4 | g2 e4 e | f2. \eogbreak
  f4 | a2 bes4 bes | a4.( g8) f4
  a4 | g2 e4 e | f2. \eogbreak

  a4 | c2 d4 c | bes\(( a) g\)
  c,4 | a'( c) bes g | f2( e4) \eogbreak
  f4 | a2 bes4 bes | a4.( g8) f4
  a4 | c( bes) a g | f2. \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c4 | f2 f4 f | f4.( c8) c4
  f4 | c2 c4 c | c2.
  c4 | f2 f4 f | f4.( c8) c4
  f4 | c2 c4 c | c2.

  c4 | f2 f4 f | e( f) c
  c4 | c2 d4 d | c2.
  c4 | f2 f4 f | f4.( c8) c4
  f4 | f( e) e e | f2.

}
}

notesTenor = {
\global
\relative a {

  a4 | c2 d4 d | c4.( bes8) a4
  c4 | bes2 g4 g | a2.
  a4 | c2 d4 d | c4.( bes8) a4
  c4 | bes2 g4 g | a2.

  f4 | a2 bes4 a | g( f) e
  c4 | f( a) g bes | a2( g4)
  a4 | c2 d4 d | c4.( bes8) a4
  c4 | a( g) c bes | a2.

}
}

notesBass = {
\global
\relative f {

  f4 | f2 f4 f | f2 f4
  f4 | c2 c4 c | f2.
  f4 | f2 f4 f | f2 f4
  f4 | c2 c4 c | f2.

  r4 | r1 | r2.
  r4 | r1 | r2.
  f4 | f2 f4 f | f2 f4
  f4 | c2 c4 c | f2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

How lov -- ing is Je -- sus, \bar "."
Who came from the sky, \bar "."
In ten -- der -- est pit -- y, \bar "."
For sin -- ners to die! \bar "."
His hands and His feet __ _ \bar "."
Were nailed to the tree, \bar "."
And all this He suf -- fered \bar "."
For sin -- ners like me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

How pre -- cious is Je -- sus,
To all who be -- lieve!
And out of His full -- ness
What grace they re -- ceive!
When weak He sup -- ports them,
When err -- ing He guides,
And ev -- ’ry -- thing need -- ful
He kind -- ly pro -- vides.

}

wordsC = \lyricmode {
\set stanza = "3."

How glad -- ly does Je -- sus
Free par -- don im -- part
To all who re -- ceive Him
By faith in their heart;
And glo -- ry is for them,
Their home is a -- bove;
Soon Je -- sus will fetch them
To dwell in His love.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
