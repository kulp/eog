\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  %gospel
  hymnnumber = "15"
  title = "Oh What a Gift the Father Gave"
  tunename = ""
  meter = "" % sung with C. M. D.
  composer = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternA = { \ta c4 | c4 c4 c4. c8 | c8( c4) c8 c4. } % Line 1, 3 soprano / alto / tenor
patternB = { \ta c8 | c4 c4 c4. c8 | c2.            } % Line 2 all, Refrain line 2 all
patternC = { \ta c8 | c4 c4 c4. c8 | c1             } % Line 4 all
patternD = { \ta c4 | c4 c4 c4. c8 | c4.     c8 c4. } % Line 1, 3 bass

patternE = { \ta c4. c8 c4. c8 | c8[ c8] c4 c4. } % Refrain line 1 soprano / alto / tenor
patternF = { \ta c4 | c4. c8 c4. c8 | c8[ c8] c4 \tb c4 \fermata } % Refrain line 3 soprano
patternJ = { \ta c4 | c4. c8 c4. c8 | c8[ c8] c4 \tb c4 } % Refrain line 3 alto / tenor
patternG = { \tb c4 \fermata \ta | c4 c4 c4. c8 | c2. } % Refrain line 4 soprano / bass
patternK = { \tb c4          \ta | c4 c4 c4. c8 | c2. } % Refrain line 4 alto / tenor

patternH = { \ta c4. c8 c4. c8 | c4 c4 c4. } % Refrain line 1 bass
patternI = { \ta c4 | c4. c8 c4. c8 | c4 c4 \tb c4 \fermata } % Refrain line 3 bass

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { ees | ees g bes c | bes g f ees }
  \changePitch \patternB { ees | ees aes c c | bes         }
  \changePitch \patternA { g   | ees g bes c | bes g f ees }
  \changePitch \patternC { g   | f bes c d   | bes         }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternE { bes c bes g | g f ees bes' } >>
  \changePitch \patternB {         bes | c c ees c   | bes          }
  \changePitch \patternF {         bes | bes c bes g | g f ees bes' }
  \changePitch \patternG {         c   | bes g f ees | ees          }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { bes | bes ees g aes   | g ees d ees }
  \changePitch \patternB { ees | ees ees aes aes | g           }
  \changePitch \patternA { ees | ees ees g aes   | g ees d ees }
  \changePitch \patternC { ees | d d ees f       | d           }

  \changePitch \patternE { g aes g ees | ees d ees d }
  \changePitch \patternB {         ees | ees ees ees aes | g           }
  \changePitch \patternJ {         g   | g aes g ees     | ees d ees d }
  \changePitch \patternK {         ees | ees ees d ees   | ees         }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g   | g bes ees ees | ees bes aes g }
  \changePitch \patternB { g   | c c ees ees   | ees           }
  \changePitch \patternA { bes | g bes ees ees | ees bes aes g }
  \changePitch \patternC { bes | bes bes a a   | bes           }

  \changePitch \patternE { ees ees ees bes | bes aes g f }
  \changePitch \patternB {             g   | aes aes c ees   | ees         }
  \changePitch \patternJ {             ees | ees ees ees bes | bes aes g f }
  \changePitch \patternK {             aes | g bes aes g     | g           }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternD { ees | ees ees ees ees | ees bes ees }
  \changePitch \patternB { ees | aes aes aes aes | ees }
  \changePitch \patternD { ees | ees ees ees ees | ees bes ees }
  \changePitch \patternC { ees | f f f f | bes, }

  \changePitch \patternH { ees ees ees ees | ees ees bes }
  \changePitch \patternB { ees | aes, aes aes aes | ees' }
  \changePitch \patternI { ees | ees ees ees ees | ees ees bes }
  \changePitch \patternG { aes | bes bes bes ees | ees }

}
}

wordsA = \markuplist {

\line { Oh, what a gift the Father gave }
\line { { \hspace #2 } When He bestowed His Son! }
\line { To save poor, ruined, guilty man, }
\line { { \hspace #2 } By sin defiled, undone. }

}

wordsB = \markuplist {

\line { For I was lost and vile indeed! }
\line { { \hspace #2 } To sin a willing prey; }
\line { Till God in mercy interposed, }
\line { { \hspace #2 } And turned my night to day. }

}

wordsC = \markuplist {

\line { Now I can call the Saviour mine, }
\line { { \hspace #2 } Though all unworthy still; }
\line { I’m sheltered by His precious blood, }
\line { { \hspace #2 } Beyond the reach of ill. }

}

wordsD = \markuplist {

\line { Come all who trust in Jesus now, }
\line { { \hspace #2 } And tell your joys abroad; }
\line { Let thankful hymns of praise ascend }
\line { { \hspace #2 } For Christ, the gift of God. }

}

% this markup is all empirical, and brittle
\markup {
  \column {
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          "  15"
          "Oh What a Gift the Father Gave"
          \null
        }
      }
    }

    \vspace #0.5

    \fill-line \smaller { "Sing to above tune and refrain" }

    \vspace #0.5

    \fill-line {
      \null

      \column {
        \line{ \bold 1 \column { \wordsA } }
        \vspace #1
        \line{ \bold 2 \column { \wordsB } }
      }

      \null

      \column {
        \line{ \bold 3 \column { \wordsC } }
        \vspace #1
        \line{ \bold 4 \column { \wordsD } }
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
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
