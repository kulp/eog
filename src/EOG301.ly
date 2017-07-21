\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  %children
  hymnnumber = "301"
  title = "Here’s a Message of Love"
  tunename = "Waters"
  meter = "5. 5. 8. D."
  poet = ""
  composer = "Mrs. W. Page"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key aes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees8.( f16) | ees4 des c' | bes2
  ees,4 | f ees bes' | aes2
  c8 ~ c8 | ees4 c aes | g f des' | c2. ~ | c4 r
  ees,8 ~ ees | f4 ees bes' | aes2 \eogbreak
  c4 | des aes bes | c2
  ees,8 ~ ees | f4 aes des | c ees, bes' | aes2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c8. ~ c16 | c4 bes g' | g2
  des4 | c c ees | ees2
  aes8 ~ aes | aes4 aes ees | ees des f | ees2. ~ | ees4 r
  c8 ~ c | des4 des des | c2
  ees4 | aes f fes | ees2
  c8 ~ c | des4 f fes | ees4 ees ees | ees2

}
}

notesTenor = {
\global
\relative a {

  aes8. ~ aes16 |  g4 g ees' | des2
  g,4 | aes aes des | c2
  ees8 ~ ees | c4 ees aes, | aes aes aes | aes2. ~ | aes4 r
  aes8 ~ aes | aes4 g g | aes2
  aes4 | f' des des | c2
  aes8 ~ aes | aes4 des aes | aes c des | c2

}
}

notesBass = {
\global
\relative f, {

  aes8. ~ aes16 | ees'4 ees ees | ees2
  ees4 | aes, aes aes' | aes2
  aes8 ~ aes | aes4 aes c, | des des des | aes'2. ~ | aes4 r
  aes8 ~ aes | des,4 ees ees | aes,2
  aes'4 | aes aes aes | aes2
  aes,8 ~ aes | des4 des des | ees ees ees | aes,2

}
}

wordsA = \lyricmode {
\set stanza = "1."

{ \mon } Here’s a { \moff } mes -- sage of love \bar "."
Come down from a -- bove \bar "."
{ \mon } To in -- { \moff } vite lit -- tle chil -- dren to heaven; \bar "."
In God’s bless -- ed book \bar "."
Lost sin -- ners may look, \bar "."
And see how all sins are for -- giv’n. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

For there they may read
How Je -- sus did bleed
And die for His dear lit -- tle ones;
How clean He makes them,
And af -- ter takes them
To be God’s own daught -- ers and sons.

}

wordsC = \lyricmode {
\set stanza = "3."

And then if they die,
He takes them on high,
{ \mon } To be { \moff } with Him in heav -- en a -- bove;
So kind is His heart,
He nev -- er will part
{ \mon } From a { \moff } child that has trust -- ed His love.

}

wordsD = \lyricmode {
\set stanza = "4."

And oh, what de -- light,
In heav -- en so bright,
To see the kind Sav -- iour’s blest face!
{ \mon } On His { \moff } beau -- ty to gaze
And sing to His praise
For -- ev -- er in that hap -- py place.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
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
      \partcombine #'(2 . 9) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak \markup { \vspace #1 \fill-line { \raise #3 \line { Alternate tune: No. 48. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
