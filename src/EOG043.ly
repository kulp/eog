\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "43"
  title = "“Behold the Lamb” Enthroned on High"
  tunename = ""
  meter = "" % sung with P. M.
  poet = ""
  composer = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tc = { \tempo 4=70 }

patternAA = { \ta c8   | c4 c8 c4 c8 | c4 c8 c4. }
patternAB = { \ta        c4 c8 c4 c8 | c4.   c4  }
patternAC = { \ta c8   | c4 c8 c4 c8 | c4 c8 c4. }
patternAD = { \ta        c4 c8 c4 c8 | c4.   c4. }
patternAE = { \ta c8   | c4 c8 c4 c8 | c4 c8 c4. }

patternBA = { \ta c8 c8 c8 c4 c8 | c4 c8 c4. }
patternBB = { \ta c4    c8 c4 c8 | c4 c8 c4. }
patternBC = { \ta c8 c8 c8 c4 c8 | c4 c8 c4  }
patternBD = { \ta c4    c8 c4 c8 | c4 c8 c4  }

% \tc for ritardando
patternCA = { \tc c4 c8 c4 c8 | c4. c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { bes^\markup { \dynamic p } | bes g ees f | g aes bes }
  \changePitch \patternAB { bes ees, g ees | f ees }
  \changePitch \patternAC { bes' | bes g ees f | g aes bes }
  \changePitch \patternAD { bes ees, g ees | f ees }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBA { bes' c d ees bes | d c bes } >>
  \changePitch \patternBC { bes c d ees bes | d c bes }
  \changePitch \patternAE { bes bes g ees f | g aes bes }
  \changePitch \patternCA { bes^\markup { \italic rit. } ees, g ees | f ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { g | g ees bes d | ees f g }
  \changePitch \patternAB { g bes, ees bes | d ees }
  \changePitch \patternAC { g | g ees bes d | ees f g }
  \changePitch \patternAD { g bes, ees bes | d ees }

  \changePitch \patternBB { g | g g g | bes aes g }
  \changePitch \patternBD { g | g g g | bes aes g }
  \changePitch \patternAE { g g ees bes d | ees f g }
  \changePitch \patternCA { g bes, ees bes | d ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes | bes bes g bes | bes bes bes }
  \changePitch \patternAB { bes g bes g | aes g }
  \changePitch \patternAC { bes | bes bes g bes | bes bes bes }
  \changePitch \patternAD { bes g bes g | aes g }

  \changePitch \patternBB { bes bes bes ees | ees ees ees }
  \changePitch \patternBD { bes bes bes ees | ees ees ees }
  \changePitch \patternAE { ees ees bes g bes | bes bes bes }
  \changePitch \patternCA { bes g bes g | aes g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees | ees ees ees bes | ees ees ees }
  \changePitch \patternAB { ees ees ees ees | bes ees }
  \changePitch \patternAC { ees | ees ees ees bes | ees ees ees }
  \changePitch \patternAD { ees ees ees ees | bes ees }

  \changePitch \patternBB { ees ees ees ees | aes aes ees }
  \changePitch \patternBD { ees ees ees ees | aes aes ees }
  \changePitch \patternAE { ees ees ees ees bes | ees ees ees }
  \changePitch \patternCA { ees ees ees ees | bes ees }

}
}

wordsA = \markuplist {

\line { “Behold the Lamb” enthroned on high, }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }
\line { In Him we are to God brought nigh, }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }
\line { He who on Calvary’s cross has bled, }
\line { He who was numbered with the dead, }
\line { Exalted now o’er all as Head, }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }

}

wordsB = \markuplist {

\line { “Complete in Him” at God’s right hand, }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }
\line { Before the throne we boldly stand, }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }
\line { The blood-besprinkled mercy-seat, }
\line { His piercèd side, His hands, and feet, }
\line { Proclaim redemption’s work complete. }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }

}

wordsC = \markuplist {

\line { God finds eternal rest in Him, }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }
\line { That rest which was disturbed by sin, }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }
\line { We too by faith on Him repose, }
\line { Who did the Father’s heart disclose, }
\line { From which this full salvation flows. }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }

}

wordsD = \markuplist {

\line { As one with Him we rest secure, }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }
\line { Unchanging doth His work endure, }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }
\line { Now seated on the Father’s throne, }
\line { Elect and precious cornerstone, }
\line { On Him we rest—on Him alone. }
\line { { \hspace #2 } Jesus, Jesus, Jesus. }

}

% this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  43"
          "“Behold the Lamb” Enthroned on High"
          \null
        }
      }
    }

    \vspace #0.7

    \fill-line \smaller { "Sing to previous tune and refrain" }

    \vspace #1

    \fontsize #0.3 \fill-line {
      \null

      \column {
        \line{ \bold 1 \column { \wordsA } }
        \vspace #2
        \line{ \bold 2 \column { \wordsB } }
      }

      \null

      \column {
        \line{ \bold 3 \column { \wordsC } }
        \vspace #2
        \line{ \bold 4 \column { \wordsD } }
      }

      \null
    }
  }
}

\include "common/score.ily"

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
