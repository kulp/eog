\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 131." } }
}

\header{
  %gospel
  hymnnumber = "116"
  title = "See Mercy, Mercy from on High"
  tunename = "Dusseldorf"
  meter = "L. M."
  poet = "R. Sandeman"
  composer = "From Geistliche Lieder"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=100 }
tb = { \tempo 4=50 }

patternAA = { \ta c4 | c2 c4 | c2 c4 | c2 c4 | \tb c2 \fermata }
patternAB = { \ta c4 | c2 c4 | c2 c4 | c2 c4 | \tb c2          }

patternBA = { \ta c4 | c2 c4 | c2 c4 | c4( c4) c4 | \tb c2     }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key bes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { f | bes a | bes g | f ees | d } \eogbreak
  \changePitch \patternAA { d' | c c | c bes | a g | f } \eogbreak
  \changePitch \patternAA { f | f a | bes d | ees d | c } \eogbreak
  \changePitch \patternAA { c | f c | d bes | bes a | bes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { d | f f | d ees | d c | bes }
  \changePitch \patternAB { f' | f g | a g | f e | f }
  \changePitch \patternAB { c | c f | f f | ees f | f }
  \changePitch \patternAB { f | a f | f g | f f | f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { bes | d c | bes bes | bes a | bes }
  \changePitch \patternAB { bes | c c | f d | c bes | a }
  \changePitch \patternBA { a | a c | bes bes | g( a) bes | a }
  \changePitch \patternAB { a | c a | bes ees | d c | d }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { bes | bes f' | g ees | f f | bes, }
  \changePitch \patternAA { bes' | a e | f bes, | c c | f }
  \changePitch \patternAA { f | f ees | d bes | c d | f }
  \changePitch \patternAA { f | f f | bes ees, | f f | bes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

See mer -- cy, mer -- cy from on high, \bar "."
De -- scend to reb -- els doomed to die; \bar "."
’Tis mer -- cy free, which knows no bound; \bar "."
How sweet, how pleas -- ant is the sound! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Soon as the reign of sin be -- gan
The light of mer -- cy dawned on man,
When God an -- nounced the bless -- ed news,
“The wo -- man’s seed thy head shall bruise.”

}

wordsC = \lyricmode {
\set stanza = "3."

Bright -- ly it beamed on men for -- lorn
When Christ, the ho -- ly child, was born;
And bright -- er still in splen -- dor shone
When Je -- sus, dy -- ing, cried, ’Tis done!

}

wordsD = \markuplist {

\line { Complete in power, when He arose }
\line { And burst the bands of all His foes; }
\line { Then captive led captivity, }
\line { And took for us His seat on high. }

}

wordsE = \markuplist {

\line { Till we around Him there shall throng, }
\line { This mercy shall be still our song; }
\line { For God shall every scheme confound }
\line { Of all that seek its course to bound! }

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
