\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "154"
  title = "The Atoning Work Is Done"
  tunename = "Lenox"
  meter = "6. 6. 6. 6. 8. 8."
  %poet = ""
  composer = "Lewis Edson"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=88
  \key bes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes4 | bes bes f g | f2.
  f4 | bes c d c | bes2.
  bes4 | d f d bes | c2.
  c4 | d bes c a | bes2.
  f4 | bes bes bes f | g g g
  bes | c c c d | bes bes bes
  f | g g g bes | c2 a | bes2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | d d f ees | c2.
  d4 | d f f ees | d2.
  d4 | f f f f | f2.
  f4 | f g g f | f2.
  f4 | d d d f | ees ees ees
  d | f f f f | d d d
  f | ees ees ees f | g2 f | f2.

}
}

notesTenor = {
\global
\relative a {

  f4 | f f bes bes | a2.
  a4 | g a bes a | bes2.
  bes4 | bes c bes bes | a2.
  a4 | bes bes ees c | d2.
  f,4 | f f f bes | bes bes bes
  bes | a a a bes | bes bes bes
  bes | bes bes bes bes | ees2 c | d2.

}
}

notesBass = {
\global
\relative f, {

  bes4 | bes bes d ees | f2.
  d4 | g f bes f | bes,2.
  bes4 | bes' a bes d, | f2.
  f4 | bes g ees f | bes,2.
  f'4 | bes, bes bes d | ees ees ees
  bes | f' f f d | g g g
  d | ees ees ees d | c2 f | bes,2.

}
}

wordsA = \markuplist {

\line { Th’atoning work is done, }
\line { { \hspace #2 } The Victim’s blood is shed, }
\line { And Jesus now is gone }
\line { { \hspace #2 } His people’s cause to plead: }
\line { He sits in heaven their great High Priest, }
\line { And bears their names upon His breast. }

}

wordsB = \markuplist {

\line { See “sprinkled with the blood }
\line { { \hspace #2 } The mercy seat” above; }
\line { For Justice had withstood }
\line { { \hspace #2 } The purposes of Love; }
\line { But Justice now withstands no more, }
\line { And Mercy yields her boundless store. }

}

wordsC = \markuplist {

\line { And though awhile He be }
\line { { \hspace #2 } Hid from the eyes of men, }
\line { His people look to see }
\line { { \hspace #2 } Their great High Priest again. }
\line { In brightest glory He will come, }
\line { And take His waiting people home. }

}

% this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  154"
          "The Atoning Work Is Done"
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
          \line{ \smaller { tune No. 153. } }
        }
      }
      \line{ \bold 3 \column { \wordsC } }
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
      \set Staff.autoBeaming = ##f
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
