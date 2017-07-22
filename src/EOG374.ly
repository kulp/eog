\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  systems-per-page = ##f
}

\header{
  %gospel
  hymnnumber = "374"
  title = "Oh Come to Jesus, Sinner, Come"
  tunename = "None But Christ Can Satisfy"
  meter = "C. M. with Refrain"
  poet = "J. T. Armet (Arr.)"
  composer = "J. McGranahan"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=32 }

patternAA = { }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  c8[ f8] | a4 a4 a4 f8[ a8] | c4 c4 c4
  c8[ a8] | g4. g8 g4 f8[ g8] | a2.
  c,8[ f8] | a4 a4 a4 f8[ a8] | c4 c4 c4
  c8[ a8] | g4. c8 c8[ b!8] a8[ b8] | c2. \eogbreak

  << s^\markup { \small \caps "Refrain" }
  { c4 | c4. c8 c8[ a8] d8[ c8] | c4. bes8 a4 } >>
  f8[ g8] | a4. a8 a8[ c8] bes8[ a8] | g2.
  c,4 | f4. f8 a4. a8 | c8[ a8 bes8] c8 \tb d4 \fermata \ta
  d4 | c8[ a8] bes8[ g8] f4 e4 | f2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c8[ f8] | f4 f4 f4 f8[ a8] | f4 f4 f4
  a8[ f8] | e4. e8 e4 d8[ e8] | f2.
  c8[ f8] | f4 f4 f4 f8[ a8] | f4 f4 f4
  a8[ f8] | e4. e8 f4 f4 | e4( f4 g4)

  g4 | f4. f8 f4 f4 | f4. f8 f4
  f8[ g8] | f4. f8 f8[ a8] g8[ f8] | e2.
  c4 | c4. c8 f4. f8 | f4 f4 f4
  f4 | f4 e4 f4 c4 | c2.

}
}

notesTenor = {
\global
\relative a {

  a4 | c4 d4 c4 a8[ c8] | a4 bes4 c4
  c4 | c4. c8 c4 c4 | c2.
  a4 | c4 d4 c4 a8[ c8] | a4 bes4 c4
  c4 | c4. c8 d4 d8[ g,8] | g4( a4 bes4)

  bes4 | a4. a8 a8[ c8] bes8[ a8] | a4. bes8 c4
  a8[ bes8] | c4. c8 c4 c4 | c2.
  bes4 | a4. a8 c4. c8 | a8[ c8 bes8] a8 bes4
  bes4 | a8[ c8] g8[ bes8] a4 bes4 | a2.

}
}

notesBass = {
\global
\relative f {

  f4 | f4 f4 f4 f4 | f4 g4 a4
  f4 | c4. c8 c4 c4 | f2.
  f4 | f4 f4 f4 f4 | f4 g4 a4
  f4 | g4. g8 g4 g4 | c,2.

  c4 | f4. f8 f4 f4 | f4. f8 f4
  f4 | f4. f8 f4 e8[ f8] | c4 bes'4 a4
  g4 | f4. f8 f4. f8 | f4 f4 bes,4_\fermata
  bes4 | c4 c4 c4 c4 | f2.

}
}

Refrain = \lyricmode {

Oh, come to Je -- sus, sin -- ner, come! \bar "."
Come, while He of -- fers thee \bar "."
His won -- drous love, a home a -- bove \bar "."
For all e -- ter -- ni -- ty. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Oh, come to Je -- sus, sin -- ner, come, \bar "."
And have thy sins for -- giv’n. \bar "."
A man -- sion bright, a robe of white \bar "."
He of -- fers thee in heaven. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

A lov -- ing Sav -- iour He, whose blood
A -- vails to cleanse from sin.
He died the might -- y debt to pay
And give thee peace with -- in.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Come as thou art, de -- filed, un -- done;
And wait not to im -- prove,
His blood a -- lone, can e’er a -- tone
For sin, thy guilt re -- move.

}

wordsD = \markuplist {

\line { The feast is spread; e’en while we plead, }
\line { { \hspace #2 } God’s house is filling fast. }
\line { Do not delay, soon mercy’s day }
\line { { \hspace #2 } Forever will be past. }

}

wordsE = \markuplist {

\line { The Spirit and the bride say, “Come”; }
\line { { \hspace #2 } O sinner, ’tis for thee — }
\line { The Saviour’s love, a home above }
\line { { \hspace #2 } For all eternity. }

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
  \midi{
    \include "common/midi.ily"
  }
}

\markup { \fill-line { \column {
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } }
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
