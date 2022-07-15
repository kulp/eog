\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "342"
  title = "Jesus Came from Heaven"
  tunename = "Broughton"
  meter = "6. 5. 6. 5. D."
  poet = ""
  composer = "Thomas Hastings" % see https://hymnary.org/tune/broughton_hastings
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key ees \major
  \autoBeamOff
}

patternA = { c4. c8 c c | c4 c2 | }
patternB = { c4. c8 c c | c2. | }
patternC = { c8 c c4 c | c2. | }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { bes bes aes g | g f }
  \changePitch \patternB { aes aes g f | g }
  \changePitch \patternA { bes bes c d | ees bes }
  \changePitch \patternC { bes aes g f | ees }

  \changePitch \patternA { d' d c bes | bes a }
  \changePitch \patternB { c c bes a | bes }
  \changePitch \patternA { bes bes c d | ees bes }
  \changePitch \patternC { ees, f g f | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { g g f ees | ees d }
  \changePitch \patternB { f f ees d | ees }
  \changePitch \patternA { g g aes aes | g g }
  \changePitch \patternC { g f ees d | ees }

  \changePitch \patternA { f f f f | f f }
  \changePitch \patternB { ees ees d c | d }
  \changePitch \patternA { g g aes aes | g g }
  \changePitch \patternC { ees ees ees d | ees }

}
}

notesTenor = {
\global
\relative a' {

  \changePitch \patternA { ees ees bes bes | bes bes }
  \changePitch \patternB { d bes bes bes | bes }
  \changePitch \patternA { ees ees ees bes | bes ees }
  \changePitch \patternC { ees c bes aes | g }

  \changePitch \patternA { bes bes ees d | d c }
  \changePitch \patternB { a a bes c | bes }
  \changePitch \patternA { ees ees ees bes | bes ees }
  \changePitch \patternC { bes c bes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { ees ees d ees | bes bes }
  \changePitch \patternB { bes bes bes bes | ees }
  \changePitch \patternA { ees ees ees ees | ees ees }
  \changePitch \patternC { ees aes bes bes, | ees }

  \changePitch \patternA { bes' bes a bes | f f }
  \changePitch \patternB { f f f f | bes, }
  \changePitch \patternA { ees ees ees ees | ees ees }
  \changePitch \patternC { g aes bes bes, | ees }

}
}

wordsA = \markuplist {

\line { Jesus came from heaven, }
\line { { \hspace #2 } Many years ago; }
\line { Left His Father’s glory }
\line { { \hspace #2 } For this world of woe. }

}

wordsB = \markuplist {

\line { Here He lived and suffered, }
\line { { \hspace #2 } Here He also died, }
\line { On the cross of Calvary }
\line { { \hspace #2 } He was crucified. }

}

wordsC = \markuplist {

\line { ’Twas for sin He suffered, }
\line { { \hspace #2 } In the sinner’s stead, }
\line { And His Father raised Him, }
\line { { \hspace #2 } Even from the dead.}

}

wordsD = \markuplist {

\line { Now in brightest glory }
\line { { \hspace #2 } Jesus lives on high, }
\line { And His voice is calling, }
\line { { \hspace #2 } Calling from the sky. }

}

wordsE = \markuplist {

\line { “Come to Me, ye weary, }
\line { { \hspace #2 } I have rest to give”; }
\line { Hearken then unto Him, }
\line { { \hspace #2 } And your soul shall live. }

}

wordsF = \markuplist {

\line { He has peace and pardon }
\line { { \hspace #2 } For the sin-sick soul; }
\line { Come to Him believing, }
\line { { \hspace #2 } He will make you whole. }

}

% this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  342"
          "Jesus Came from Heaven"
          \null
        }
      }
    }

    \vspace #1

    \fontsize #0.3 \fill-line {
      \null

      \column {
        \line{ \bold 1 \column { \wordsA } }
        \vspace #1
        \line{ \bold 2 \column { \wordsB } }
        \vspace #1
        \line{ \bold 3 \column { \wordsC } }
      }

      \null

      \column {
        \line{ \bold 4 \column { \wordsD } }
        \vspace #1
        \line{ \bold 5 \column { \wordsE } }
        \vspace #1
        \line{ \bold 6 \column { \wordsF } }
      }

      \null
    }
  }
}

\include "common/score.ily"

\noPageBreak \markup { \vspace #1 \fill-line { "May be sung to tune No. 343." } }

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
