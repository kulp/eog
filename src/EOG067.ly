\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 191." } }
}

\header{
  %gospel
  hymnnumber = "67"
  title = "Christ Is Coming. Are You Ready?"
  tunename = ""
  meter = "8. 7. 8. 7. D."
  poet = "Mrs. A. H. Rule"
  composer = "F. M. Lamb"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 8=110 }
tb = { \tempo 8=55  }

patternAA = { \ta c16 c16 | c8 c8 c8 c8 | c8 c4 }
patternAB = { \ta c16 c16 | c8 c8 c8 c8 | c8 \tb c4 \ta }

patternBA = { \ta c16 c16 | c8 c8 c8 c8 | c4. }
patternBB = { \ta c16 c16 | c8 c8 c8. c16 | c4. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key des \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { aes aes | aes ges ees c | des f }
  \changePitch \patternBA { aes aes | aes ges ees f | des }
  \changePitch \patternAA { aes' aes | bes bes bes bes | bes bes }
  \changePitch \patternBB { bes bes | bes aes aes ges | f }

  \changePitch \patternAA { aes aes | des des des ees | f des }
  \changePitch \patternBA { des des | des des c bes | aes }
  \changePitch \patternAB { f ges | aes f ees des | ges ges \fermata }
  \changePitch \patternBB { f ees | f des ees des | des }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { des des | c c c aes | aes des }
  \changePitch \patternBA { des des | c c c c | aes }
  \changePitch \patternAA { f' f | ges ges ges ges | ges ges }
  \changePitch \patternBB { ges ges | ees ees ees ees | des }

  \changePitch \patternAA { f f | f f f ges | aes f }
  \changePitch \patternBA { f f | bes bes aes ges | f }
  \changePitch \patternAA { des des | des des des des | des des }
  \changePitch \patternBB { des des | des des c des | des }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { f f | aes aes aes ees | f aes }
  \changePitch \patternBA { f f | aes aes ges aes | f }
  \changePitch \patternAA { des' des | des des des des | ees ees }
  \changePitch \patternBB { ees ees | c c c aes | aes }

  \changePitch \patternAA { des des | des des des des | des des }
  \changePitch \patternBA { des des | des des des des | des }
  \changePitch \patternAA { aes ges | f aes ces ces | bes bes }
  \changePitch \patternBB { bes bes | aes f ges f | f }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { des des | aes aes aes aes | des des }
  \changePitch \patternBA { des des | aes aes aes aes | des }
  \changePitch \patternAA { des des | ges ges ges ges | ees ees }
  \changePitch \patternBB { ees ees | aes, aes aes aes | des }

  \changePitch \patternAA { des des | des des des des | des des }
  \changePitch \patternBA { des des | ges ges ges ges | des }
  \changePitch \patternAA { des des | des des des des | ges, ges_\fermata }
  \changePitch \patternBB { ges ges | aes aes aes des | des }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Christ is com -- ing. Are you read -- y? \bar "."
He is com -- ing for His own; \bar "." \eogbreak
He will call them up to meet Him, \bar "."
And will place them on His throne. \bar "." \eogbreak
He may come, we know, at mid -- night, \bar "."
When the world in slum -- ber lies, \bar "." \eogbreak
Or it may be in the morn -- ing, \bar "."
Ere the day dawns in the skies. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

“Watch ye there -- fore,” for ye know not
What the hour your Lord will come,
Wheth -- er in the morn or mid -- night,
Or _ in the e -- vening gloam.
Are your thoughts of Him when toil -- ing
Mid the bus -- y cares of day?
As the hours of night are pass -- ing,
Do you wake to think and pray?

}

wordsC = \lyricmode {
\set stanza = "3."

Is your heart a -- glow at e -- ven,
As the sun sinks in the west,
And the heav -- en’s glow -- ing splen -- dor
Brings sweet thoughts of home and rest!
Bless -- ed rest from toil and sor -- row,
Rest from suf -- f’ring, pain and woe,
And a home with Christ in heav -- en,
Hap -- py home to which we go!

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
