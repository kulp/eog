\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 6
  system-count = #(cond (is-eogsized 4) (#t #f))
  scoreTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \override #'(baseline-skip . 3.5)
      \column {
        \fill-line {
          \huge \larger \larger \bold {
            \concat { "  " \fromproperty #'header:hymnnumber }
            \mytitle
            \null
          }
        }
        \fill-line {
          \lower #4 \fromproperty #'header:poet
          \smaller \bold \mysubtitle
          \lower #4 \fromproperty #'header:composer
        }
      }
    }
  }
}

\header{
  hymnnumber = "145"
  title = "May the Grace of Christ Our Saviour"
  tunename = "Vesper Hymn"
  meter = "8. 7. 8. 7. D."
  poet = "J. Newton"
  composer = "Russian Melody, Arr. by J. A. Stevenson"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

g2 bes aes bes | g bes f bes
g2 bes aes f | ees d ees1
g2 bes aes bes | g bes f bes
g2 bes aes f | ees d ees1

ees'2 d ees bes | aes f g bes
ees2 d ees bes | aes f ees1
ees2. ees4 ees2 ees | f2. f4 f2 f
ees2. ees4 ees2 g4( f) | ees2 d ees1

\bar "|."

}
}

notesAlto = {
\global
\relative e' {

ees2 ees ees d | ees ees ees d
ees2 des c c | bes bes bes1
ees2 ees ees d | ees ees ees d
ees2 des c c | bes bes bes1

g'2 f ees ees | ees d ees d
ees2 f ees des | c d ees1
bes2. bes4 c2 c4( ees) | ees2. ees4 ees2 d
bes2. bes4 c2 c | bes bes bes1

}
}

notesTenor = {
\global
\relative a {

bes2 bes c bes | bes bes bes bes
bes2 g aes aes | g f g1
bes2 bes c bes | bes bes bes bes
bes2 g aes aes | g f g1

bes2 aes bes g | c bes bes aes
bes2 bes bes g | aes aes g1
g2. g4 g2 g | c2. c4 bes2 bes
g2. g4 g2 aes | g f g1

}
}

notesBass = {
\global
\relative f {

ees2 g f bes, | ees g bes bes,
ees2 ees aes, aes | bes bes ees1
ees2 g f bes, | ees g bes bes,
ees2 ees aes, aes | bes bes ees1

ees2 f g ees | aes, bes ees f
g2 aes g ees | aes, bes ees1
ees2 d c bes | aes a bes bes
ees d c aes | bes bes ees1


}
}

wordsA = \lyricmode {

May the grace of Christ our Sav -- iour, \bar "."
And the Fa -- ther’s bound -- less love, \bar "."
With the Ho -- ly Spi -- rit’s fa -- vor, \bar "."
Rest up -- on us from a -- bove. \bar "."
Thus may we a -- bide in un -- ion \bar "."
With each oth -- er and the Lord, \bar "."
And pos -- sess, in sweet com -- mun -- ion, \bar "."
Joys which earth can ne’er af -- ford. \bar "."

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
