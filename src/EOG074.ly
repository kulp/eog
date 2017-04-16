\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "74"
  title = "Come to the Blood-Stained Tree"
  tunename = "Maker"
  meter = "P. M."
  composer = "R. C. Maker"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=104 }
tb = { \tempo 4=52  }

patternAA = { c2 c4 c4 | c4. c8 c4 }
patternBA = { c4 | c4 c4 c4 c4 | c1 }
patternCA = { c4 | c4 c4 c4 c4 | c1 }
patternDA = { c2 c2 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g g g | g f f }
  \changePitch \patternBA { g | aes aes g f | g }
  \changePitch \patternAA { c c c | c bes bes }
  \changePitch \patternBA { aes | g g f ees | f }

  \changePitch \patternAA { ees ees f | g g g }
  \changePitch \patternCA { aes | bes bes aes g | c }
  \changePitch \patternAA { d c bes | ees ees, ees }
  \changePitch \patternCA { f | g g aes d, | ees }
  \changePitch \patternDA { ees aes | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees ees ees | ees d d }
  \changePitch \patternBA { ees | ees ees ees d | ees }
  \changePitch \patternAA { ees ees ees | ees ees ees }
  \changePitch \patternBA { f | ees ees c c | d }

  \changePitch \patternAA { ees ees ees | ees ees ees }
  \changePitch \patternCA { d | ees ees d ees | ees }
  \changePitch \patternAA { f d d | ees ees ees }
  \changePitch \patternCA { ees | ees ees c bes | bes }
  \changePitch \patternDA { ees ees | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes bes bes | bes bes bes }
  \changePitch \patternBA { bes | c c bes bes | bes }
  \changePitch \patternAA { aes aes aes | aes g g }
  \changePitch \patternBA { bes | bes bes a a | bes }

  \changePitch \patternAA { g g aes | bes bes bes }
  \changePitch \patternCA { bes | bes bes bes bes | aes }
  \changePitch \patternAA { bes bes bes | bes bes bes }
  \changePitch \patternCA { c | bes g f aes | g }
  \changePitch \patternDA { c c | bes }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees ees ees | ees bes bes }
  \changePitch \patternBA { ees | aes, aes bes bes | ees }
  \changePitch \patternAA { aes, aes c | ees ees ees }
  \changePitch \patternBA { d | ees ees f f | bes, }

  \changePitch \patternAA { ees ees ees | ees ees ees }
  \changePitch \patternCA { f | g g f ees | aes, }
  \changePitch \patternAA { aes' aes aes | g bes, bes }
  \changePitch \patternCA { aes | bes bes bes bes | ees }
  \changePitch \patternDA { aes aes, | ees' }

}
}

wordsA = \markuplist {

\line { Come to the blood-stained tree; }
\line { { \hspace #2 } The Victim bleeding lies; }
\line { God sets the sinner free, }
\line { { \hspace #2 } Since Christ a ransom dies: }
\line { The Spirit will apply }
\line { { \hspace #2 } His blood to cleanse each stain, }
\line { O burdened soul, draw nigh, }
\line { { \hspace #2 } For none can come in vain— }
\line { { \hspace #4 } Come, come, come. }

}

wordsB = \markuplist {

\line { Dark though thy guilt appear, }
\line { { \hspace #2 } And deep its crimson dye, }
\line { There’s boundless mercy here, }
\line { { \hspace #2 } Do not from mercy fly: }
\line { Oh, do not doubt His word, }
\line { { \hspace #2 } There’s pardon full and free, }
\line { For Justice smote the Lord, }
\line { { \hspace #2 } And sheathes her sword for thee— }
\line { { \hspace #4 } Come, come, come. }

}

wordsC = \markuplist {

\line { Look not within for peace, }
\line { { \hspace #2 } Within there’s nought to cheer; }
\line { Look up and find release }
\line { { \hspace #2 } From sin, and self, and fear; }
\line { If gloom thy soul enshroud, }
\line { { \hspace #2 } If tears faith’s eye bedim, }
\line { If doubts around thee crowd, }
\line { { \hspace #2 } Come, tell them all to Him. }
\line { { \hspace #4 } Come, come, come. }

}

% TODO this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  74"
          "Come to the Blood-Stained Tree"
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
          \line{ \smaller { tune No. 73. } }
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
