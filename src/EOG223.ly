\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  %gospel
  hymnnumber = "223"
  title = "I See the Crowd in Pilate’s Hall"
  tunename = ""
  meter = ""
  poet = ""
  composer = ""
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \partial 4
  \autoBeamOff
}

patternA = { \ta c4 | c8. c16 c4 c | c8. c16 c4 }
patternD = { \ta c4 | c8. c16 c4 c | c8. c16 \tb c4\fermata }
patternB = { \ta c4 | c8. c16 c4 c | c2 }
patternC = { \ta c4 | c8. c16 c4 c | c4( c) }

notesSoprano = {
\global
\relative c'' {

  a4 | a8. a16 a4 d | fis,8. fis16 fis4
  a4 | d,8. d16 d4 e | fis2
  a4 | a8. a16 a4 d | fis,8. fis16 fis4
  a4 | d,8. d16 d4 e | fis2

  \changePitch \patternA { a | g fis e g | fis g a }
  \changePitch \patternC { d | e cis a g | g fis }
  \changePitch \patternD { e | fis g a fis | b cis d }
  \changePitch \patternB { b | a g fis e | d }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { fis | fis fis fis fis | d d d }
  \changePitch \patternB { d | d d b cis | d }
  \changePitch \patternA { fis | fis fis fis fis | d d d }
  \changePitch \patternB { d | d d b cis | d }

  \changePitch \patternA { fis | e d cis e | d e fis }
  \changePitch \patternC { fis | g e cis e | e d }
  \changePitch \patternA { cis | d d d d | d e d }
  \changePitch \patternB { g | fis e d cis | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a | d d d a | a a a }
  \changePitch \patternB { fis | fis fis fis a | a }
  \changePitch \patternA { a | d d d a | a a a }
  \changePitch \patternB { fis | fis fis fis a | a }

  \changePitch \patternA { a | a a a a | a a a }
  \changePitch \patternB { a | a a a a | a }
  a4 | a8. a16 a4 a8[ d] | d8. a16 a4
  d4 | d8. b16 a4 a8[ g] | fis2

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { d | d d d d | d d d }
  \changePitch \patternB { d | b b b a | d }
  \changePitch \patternA { d | d d d d | d d d }
  \changePitch \patternB { d | b b b a | d }

  \changePitch \patternA { d | a a a a | d d d }
  \changePitch \patternB { d | a a a a | d }
  \changePitch \patternA { a | d e fis d | g g fis }
  \changePitch \patternB { g | d g a a, | d }

}
}

wordsA = \markuplist {

\line { I see the crowd in Pilate’s hall; }
\line { { \hspace #2 } Their furious cries I hear; }
\line { Their shouts of “Crucify!” appall, }
\line { { \hspace #2 } Their curses fill my ear. }
\line { And of that shouting multitude }
\line { { \hspace #2 } I feel that I am one, }
\line { And in that din of voices rude }
\line { { \hspace #2 } I recognize my own. }

}

wordsB = \markuplist {

\line { I see the scourgers rend the flesh }
\line { { \hspace #2 } Of God’s belovèd Son; }
\line { And as they smite I feel afresh }
\line { { \hspace #2 } That I of them am one. }
\line { Around the cross the throng I see }
\line { { \hspace #2 } That mock the Sufferer’s groan, }
\line { Yet still my voice it seems to be, }
\line { { \hspace #2 } As if I mocked alone. }

}

wordsC = \markuplist {

\line { ’Twas my sins shed the sacred blood, }
\line { { \hspace #2 } That nailed Him to the tree; }
\line { I crucified the Christ of God, }
\line { { \hspace #2 } I joined the mockery. }
\line { Yet not the less that blood avails }
\line { { \hspace #2 } To cleanse me from my sins, }
\line { And not the less that cross prevails }
\line { { \hspace #2 } To give me peace within. }

}

% this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  223"
          "I See the Crowd In Pilate’s Hall"
          \null
        }
      }
    }

    \vspace #1

    \fill-line {
      \null
      \line{ \bold 1 \column { \wordsA } }
      \null
      \line{ \bold 2 \column { \wordsB } }
      \null
    }

    \vspace #1

    \fill-line {
      \hcenter-in #35
      \center-column {
        \vspace #2.1
        \center-column {
          \line{ \smaller { May be sung to } }
          \line{ \smaller { tune No. 222 } }
          \line{ \smaller { on opposite page } }
        }
      }
      \line{ \bold 3 \column { \wordsC } }
      \null
    }
  }
}

\include "common/score.ily"

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
