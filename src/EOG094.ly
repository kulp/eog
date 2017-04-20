\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "94"
  title = "Ho, Ye Thirsty, Jesus Calls You"
  tunename = "Hold the Fort"
  meter = "8. 5. 8. 5. D."
  %poet = ""
  composer = "P. P. Bliss"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 8=90 }
tb = { \tempo 8=45 }

patternAA = { c8. c16 c8  c8  | c8. c16 c8 c8 }
patternAB = { c8. c16 c8. c16 | c8  c8  c8 c8 }
patternAC = { c8. c16 c8  c8  | c8  c8  c8 c8 }

patternBA = { c8. c16 c8 c8 | c4 c4 }
patternBB = { c8. c16 c8 c8 | c2 }
patternBC = { c8. c16 c8 c8 | c4. c8 }
patternBD = { c8 c8 c8. c16 | c4. c8 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { a b a fis | d' e d b }
  \changePitch \patternBA { a b a fis | e r }
  \changePitch \patternAA { a b a fis | d' e d b }
  \changePitch \patternBB { cis d cis b | a }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAB { d d d d | d a fis a } >>
  \changePitch \patternBC { b b b d | cis r }
  \changePitch \patternAC { d d d d | e d cis b }
  \changePitch \patternBD { a a b cis | d r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { fis g fis d | fis g fis g }
  \changePitch \patternBA { fis g fis d | cis r }
  \changePitch \patternAA { fis g fis d | fis g fis fis }
  \changePitch \patternBB { e fis e d | cis }

  \changePitch \patternAB { fis fis fis fis | fis fis d fis }
  \changePitch \patternBC { g g g g | e r }
  \changePitch \patternAC { fis fis fis fis | g g g g }
  \changePitch \patternBD { fis fis g g | fis r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { d d d a | a a a d }
  \changePitch \patternBA { d d d a | a r }
  \changePitch \patternAA { d d d a | a a a b }
  \changePitch \patternBB { a a a gis | a }

  \changePitch \patternAB { a a a a | d d d d }
  \changePitch \patternBC { d d d b | a r }
  \changePitch \patternAC { a a a a | b b cis d }
  \changePitch \patternBD { d d cis e | d r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { d d d d | d d d d }
  \changePitch \patternBA { d d d d | a' r }
  \changePitch \patternAA { d, d d d | d d d d }
  \changePitch \patternBB { e e e e | a, }

  \changePitch \patternAB { d d d d | d d d d }
  \changePitch \patternBC { g g g g | a r }
  \changePitch \patternAC { d, d d d | g g g g }
  \changePitch \patternBD { a a a a | d, r }

}
}

Refrain = \lyricmode {

Who -- so -- ev -- er will may take it! \bar "."
Hear the gos -- pel cry! \bar "." \break
With -- out price and with -- out mon -- ey, \bar "."
Come to Him and buy. \bar "." \break

}

wordsA = \lyricmode {
\set stanza = "1."

Ho, ye thirst -- y, Je -- sus calls you; \bar "."
Je -- sus came to give \bar "." \break
Wine and milk of free sal -- va -- tion; \bar "."
Come to Him and live. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Where -- fore do ye spend your trea -- sure
Where there is no bread?
On -- ly by the liv -- ing Sav -- iour
Dy -- ing souls are fed.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

None can be too vile for Je -- sus,
None can be too poor;
By His blood are peace and par -- don,
Mer -- cies ev -- er sure.

}

wordsD = \markuplist {

\line { O, His tender love and pity! }
\line { Still He calls today; }
\line { Never one to Him who cometh }
\line { Shall be cast away. }

}

wordsE = \markuplist {

\line { From all sin He came to save us }
\line { Satan’s slaves to free: }
\line { To His royal feast He bids us; }
\line { Sinner, taste and see. }

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
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
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
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak

\markup { \fill-line { \column {
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
} } }

\pageBreak

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
