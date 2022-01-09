\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "255"
  title = "Not to Ourselves We Owe"
  tunename = ""
  meter = "" % sung with S. M.
  poet = ""
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key c \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 | e4 f g2 a | g1
  c2 | c4 b a2 a | g1
  g2 | e4 f g2 g | a4 b c2
  b2 | c4 a g2 g | g1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e2 | c4 d e2 f | e1
  e2 | d4 d e2 d | d1
  e2 | c4 b c2 e | f4 f e2
  g2 | g4 f d( e) f2 | e1

}
}

notesTenor = {
\global
\relative a {

  g2 | g4 c c2 c | c1
  g2 | fis4 g g2 fis4( c') | b1
  c2 | g4 g g2 c | c4 g g2
  g2 | g4 c4 b( c) d2 | c1

}
}

notesBass = {
\global
\relative f {

  c2 | c4 c c2 f | c1
  c2 d4 g c,2 d | g,1
  c2 | c4 d e2 c | f4 d c2
  g'2 | e4 f g2 g, | c1

}
}

wordsA = \markuplist {

\line { Not to ourselves we owe }
\line { { \hspace #2 } That we, O God, are Thine; }
\line { Jesus, the Lord, our night broke through }
\line { { \hspace #2 } And gave us light divine. }

}

wordsB = \markuplist {

\line { The Father’s grace and love }
\line { { \hspace #2 } This blessèd mercy gave, }
\line { And Jesus left the throne above }
\line { { \hspace #2 } His wandering sheep to save. }

}

wordsC = \markuplist {

\line { No more the heirs of wrath—}
\line { { \hspace #2 } Thy sovereign love we see; }
\line { And, Father, in confiding faith, }
\line { { \hspace #2 } We cast our souls on Thee. }

}

wordsD = \markuplist {

\line { Our hearts look up to see }
\line { { \hspace #2 } The glory Thou hast given, }
\line { And dwell e’en now where we shall be }
\line { { \hspace #2 } With Christ, Thine heirs, in heaven. }

}

wordsE = \markuplist {

\line { With the adopted band, }
\line { { \hspace #2 } Soon shall we see Thee there: }
\line { With them and Him in glory stand, }
\line { { \hspace #2 } And all His honors share. }

}

% this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  255"
          "Not To Ourselves We Owe"
          \null
        }
      }
    }

    \vspace #1

    \fontsize #0.3 \fill-line {
      \null

      \column {
        \line{ \bold 1 \column { \wordsA } }
        \vspace #0.75
        \line{ \bold 2 \column { \wordsB } }
        \vspace #0.75
        \line{ \bold 3 \column { \wordsC } }
      }

      \null

      \center-column {
        \line \smaller { "(Sing to number 254 — opposite page)" }
        \column {
          \vspace #0.75
          \line{ \bold 4 \column { \wordsD } }
          \vspace #0.75
          \line{ \bold 5 \column { \wordsE } }
        }
      }

      \null
    }
  }
}

\include "common/score.ily"

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
