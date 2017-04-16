\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "277"
  title = "We Speak of the Mercy of God"
  tunename = "Celeste"
  meter = "4-8s."
  poet = ""
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key a \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e2 | a a4 a | a( b) cis b | a2
  gis4( a) | b2 b4 b | b( cis) d b | cis2 \eogbreak
  a4( cis) | e2 e4 e | e2 d4 cis | b2
  e,2 | fis d'4 d | cis( b) a gis | a2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e2 | e e4 e | e2 e4 e | e2
  e2 | e e4 e | e2 e4 e | e2
  e4( a) | a2 a4 a | a2 gis4 a | gis2
  e2 | d2 fis4 e | e( fis) e d | cis2

}
}

notesTenor = {
\global
\relative a {

  cis2 | cis cis4 cis | cis4( d) e d | cis2
  b4( a) | gis2 gis4 gis | gis( a) b gis | a2
  cis4( e) | e2 e4 e | e2 e4 e | e2
  a,2 | a a4 gis | a( d) cis b | a2

}
}

notesBass = {
\global
\relative f {

  a2 | a a4 a | e2 e4 e | a,2
  e'2 | e e4 e | e2 e4 e | a,2
  a'2 | cis2 cis4 cis | cis2 b4 a | e2
  cis2 | d b4 b | cis( d) e e | a,2

}
}

wordsA = \markuplist {

\line { We speak of the mercy of God, }
\line { So boundless, so rich, and so free! }
\line { But what will it profit thy soul, }
\line { Unless ’tis relied on by thee? }

}

wordsB = \markuplist {

\line { We speak of salvation and love, }
\line { By the Father in Jesus made known; }
\line { But if thou wouldst live unto God, }
\line { By faith thou must make it thine own. }

}

wordsC = \markuplist {

\line { We speak of the Saviour’s blest name, }
\line { By which God can sinners receive; }
\line { Yet still art thou lost and undone, }
\line { Unless in that name thou’lt believe. }

}

wordsD = \markuplist {

\line { We speak of the blood of the Lamb, }
\line { Which frees from pollution and sin; }
\line { But its virtues by thee must be proved, }
\line { Or thou wilt be ever unclean. }

}

wordsE = \markuplist {

\line { We speak of the glory to come, }
\line { Of the heaven so bright and so fair; }
\line { But unless thou in Jesus believe, }
\line { Thou shalt not, thou canst not be there. }

}

% TODO this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  277"
          "We Speak of the Mercy of God"
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
        \line{ \bold 3 \column { \wordsC } }
      }

      \null

      \column {
        \line \smaller { "(Sing to above tune)" }
        \vspace #1
        \line{ \bold 4 \column { \wordsD } }
        \vspace #1
        \line{ \bold 5 \column { \wordsE } }
      }

      \null
    }
  }
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
    >>
    \context Staff = men <<
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
