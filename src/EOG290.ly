\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "290"
  title = "Praise the Saviour"
  tunename = "Acclaim"
  meter = "8. 8. 8. 5."
  poet = "T. Kelly"
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key aes \major
  \partial 4
  \autoBeamOff
}

patternA = { c8. c16 | c4 c }
patternB = { c8. c16 | c2 c4 | c2 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { ees ees | aes aes g aes | bes bes }
  \changePitch \patternA { aes bes | c c bes aes | bes bes }
  \changePitch \patternA { c des | ees ees c aes | f f }
  \changePitch \patternB { bes des | ees, g | aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { des des | c c ees ees | ees ees }
  \changePitch \patternA { ees ees | ees ees f f | ees ees }
  \changePitch \patternA { aes g | aes aes ees ees | des des }
  \changePitch \patternB { f f | ees ees | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g g | aes aes bes aes | g g }
  \changePitch \patternA { aes g | aes aes aes bes | g g }
  \changePitch \patternA { ees' ees | ees ees aes, aes | aes aes }
  \changePitch \patternB { bes bes | c des | c }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { ees ees | aes, aes ees' ees | ees ees }
  \changePitch \patternA { c ees | aes aes, des d | ees ees }
  \changePitch \patternA { aes bes | c c aes c, | des des }
  \changePitch \patternB { des bes | ees ees | aes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Praise the Sav -- iour, ye who know Him! \bar "."
Who can tell how much we owe Him? \bar "."
Glad -- ly let us ren -- der to Him \bar "."
All we have and are. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus is the name that charms us,
He for con -- flict fits and arms us,
Noth -- ing moves and noth -- ing harms us,
While we trust in Him.

}

wordsC = \lyricmode {
\set stanza = "3."

Trust in Him, ye saints, for -- ev -- er;
He is faith -- ful, chang -- ing nev -- er;
Nei -- ther force nor guile can sev -- er
Those He loves from Him.

}

wordsD = \lyricmode {
\set stanza = "4."

Keep us Lord, O! keep us cleav -- ing
To Thy -- self, and still be -- liev -- ing,
Till the hour of our re -- ceiv -- ing
Prom -- ised joys with Thee.

}

wordsE = \lyricmode {
\set stanza = "5."

Then we shall be where we would be,
Then we shall be what we should be,
Things which are not now, nor could be,
Soon shall be our own.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \clef bass
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
