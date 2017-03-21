\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "254"
  title = "Not To Ourselves We Owe"
  tunename = "Boylston"
  meter = "S. M."
  poet = ""
  composer = "Dr. Lowell Mason"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
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
  c2 | c4 b a2 a | g1 \eogbreak
  g2 | e4 f g2 g | a4 b c2
  b2 | c4 a g2 g | g1 \eogbreak

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
\line { That we, O God, are Thine; }
\line { Jesus, the Lord, our night broke through }
\line { And gave us light divine. }

}

wordsB = \markuplist {

\line { The Father’s grace and love }
\line { This blessed mercy gave, }
\line { And Jesus left the throne above }
\line { His wand’ring sheep to save. }

}

wordsC = \markuplist {

\line { No more the heirs of wrath– }
\line { Thy sov’reign love we see; }
\line { And, Father, in confiding faith, }
\line { We cast our souls on Thee. }

}

wordsD = \markuplist {

\line { Our hearts look up to see }
\line { The glory Thou hast given, }
\line { And dwell e’en now where we shall be }
\line { With Christ, Thine heirs, in heaven. }

}

wordsE = \markuplist {

\line { With the adopted band, }
\line { Soon shall we see Thee there: }
\line { With them and Him in glory stand, }
\line { And all His honors share. }

}

% TODO this markup is all empirical, and brittle
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

    \fill-line {
      \null

      \column {
        \line{ \bold 1 \column { \wordsA } }
        \vspace #1
        \line{ \bold 2 \column { \wordsB } }
        \vspace #1
        \line{ \bold 3 \column { \wordsB } }
      }

      \null

      \column {
        \line \smaller { "(Sing to number 254 – opposite page)" }
        \vspace #1
        \line{ \bold 4 \column { \wordsC } }
        \vspace #1
        \line{ \bold 5 \column { \wordsD } }
      }

      \null
    }
  }
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
