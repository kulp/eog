\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG180.ily"
}

\header{
  hymnnumber = "180"
  title = "Whom Have We, Lord, But Thee?"
  tunename = "Dover" % see https://hymnary.org/tune/dover_williams
  meter = "S. M."
  poet = "Mary Bowley" % see https://hymnary.org/text/whom_have_we_lord_but_thee
  composer = "Aaron Williams" % see https://hymnary.org/tune/dover_williams
  tagline = ##f
}

patternAA = { c2 | c4 c4 c2 c2 | c1 }
patternAB = { c2 | c4 c4 c2 c4( c4) | c1 }
patternBA = { c2 | c4 c4 c2 c2 | c4 c4 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=70
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { bes | g c bes d | ees }
  \changePitch \patternAA { ees | d ees d c | bes } \break
  \changePitch \patternBA { g | aes bes c bes | aes g f }
  \changePitch \patternAA { d' | ees aes, g f | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees | ees ees ees f | g }
  \changePitch \patternAA { g | f g f ees | d }
  \changePitch \patternBA { ees | ees ees ees ees | d ees d }
  \changePitch \patternAA { f | ees ees ees d | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g | bes aes g bes | bes }
  \changePitch \patternAA { bes | bes bes bes a | bes }
  \changePitch \patternBA { bes | aes g aes bes | bes bes bes }
  \changePitch \patternAB { bes | bes c bes bes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees | ees aes, bes bes | ees }
  \changePitch \patternAA { ees | bes ees f f | bes, }
  \changePitch \patternBA { ees | c ees aes g | f ees bes' }
  \changePitch \patternAA { aes | g aes bes bes, | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Whom have we, Lord, but Thee, \bar "."
Soul -- thirst to sat -- is -- fy? \bar "."
Ex -- haust -- less spring! The wa -- ters free! \bar "."
All oth -- er streams are dry. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Our hearts by Thee are set
On bright -- er things a -- bove;
Strange that we ev -- er should for -- get
Thine own most faith -- ful love.

}

wordsC = \lyricmode {
\set stanza = "3."

Yet oft we cre -- dit not
He free -- ly gives as God,
Though well we know our hap -- py lot
In trust -- ing to His blood.

}

wordsD = \markuplist {

\line { None like the ransomed host }
\line { { \hspace #2 } That precious blood have known; }
\line { Redemption gives faith’s holy boast }
\line { { \hspace #2 } To draw so near the throne. }

}

wordsE = \markuplist {

\line { Higher and higher yet! }
\line { { \hspace #2 } Pleading that same lifeblood; }
\line { We taste the love that knows no let, }
\line { { \hspace #2 } Of Abba, as of God. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\markup { \fontsize #0.3 \vcenter \column {
  \vspace #1
  \fill-line {
    \null
    \line{ \bold 4 \column { \wordsD } }
    \null
    \line{ \bold 5 \column { \wordsE } }
    \null
  }
} }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
