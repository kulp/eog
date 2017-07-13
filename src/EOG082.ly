\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 34." } }
}

\header{
  %gospel
  hymnnumber = "82"
  title = "Ere God Had Built the Mountains"
  tunename = "Aurelia"
  meter = "7. 6. 7. 6. D."
  poet = "W. Cowper"
  composer = "S. S. Wesley"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternAA = { c2 | c2 c2 c2 c2 | c1 c2 }

patternBA = { c2 | c2 c2 c2 c2 | c1. }
patternBB = { c2 | c2. c4 c2 c2 | c1. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g | g g aes g | g f }
  \changePitch \patternBA { ees | ees c' bes aes | g }
  \changePitch \patternAA { aes | bes ees ees d | d c }
  \changePitch \patternBA { bes | aes bes g ees | f }

  \changePitch \patternAA { f | g aes bes c | c bes }
  \changePitch \patternBB { ees | ees d c g | aes }
  \changePitch \patternAA { f | g g aes g | g f }
  \changePitch \patternBA { ees | ees f ees d | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees | ees ees ees ees | ees d }
  \changePitch \patternBA { ees | c ees ees d | ees }
  \changePitch \patternAA { d | ees ees ees f | f ees }
  \changePitch \patternBA { g | g f ees ees | d }

  \changePitch \patternAA { d | ees d ees ees | ees ees }
  \changePitch \patternBB { g | g g g g | f }
  \changePitch \patternAA { f | ees ees ees ees | c c }
  \changePitch \patternBA { c | c c bes bes | bes }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes | bes bes c bes | bes bes }
  \changePitch \patternBA { bes | f f g bes | bes }
  \changePitch \patternAA { bes | bes bes b b | b c }
  \changePitch \patternBA { d | ees f bes, a | bes }

  \changePitch \patternAA { bes | bes bes bes aes | aes bes }
  \changePitch \patternBB { c | c b c c | c }
  \changePitch \patternAA { bes | bes bes c bes | bes aes }
  \changePitch \patternBA { aes | aes aes f aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees | ees ees ees ees | bes aes }
  \changePitch \patternBA { g | aes aes bes bes | ees }
  \changePitch \patternAA { f | g g g g, | aes aes }
  \changePitch \patternBA { bes | c d ees c | bes }

  \changePitch \patternAA { bes | ees f g aes | aes g }
  \changePitch \patternBB { c, | g' f ees e | f }
  \changePitch \patternAA { d | ees ees ees ees | aes, aes }
  \changePitch \patternBA { aes | f f bes bes | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Ere God had built the moun -- tains, \bar "."
Or raised the fruit -- ful hills; \bar "." \eogbreak
Be -- fore He filled the foun -- tains \bar "."
That feed the run -- ning rills; \bar "." \eogbreak
In Thee, from ev -- er -- last -- ing, \bar "."
The won -- der -- ful I AM \bar "." \eogbreak
Found pleas -- ures nev -- er wast -- ing, \bar "."
And Wis -- dom is Thy name. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

When, like a tent to dwell in,
He spread the skies a -- broad,
And swathed a -- bout the swell -- ing
Of o -- cean’s might -- y flood,
He wrought by weight and meas -- ure;
And Thou wast with Him then:
Thy -- self the Fa -- ther’s pleas -- ure,
And Thine, the sons of men.

}

wordsC = \lyricmode {
\set stanza = "3."

And couldst Thou be de -- light -- ed
With crea -- tures such as we,
Who, when we saw Thee, slight -- ed
And nailed Thee to a tree?
Un -- fath -- om -- a -- ble won -- der!
And mys -- ter -- y di -- vine!
The voice that speaks in thun -- der
Says, “Sin -- ner, I am thine!”

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
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
