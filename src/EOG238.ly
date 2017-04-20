\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  hymnnumber = "238"
  title = "Love Not the World"
  tunename = ""
  meter = "8. 4. 8. 4. D."
  poet = "Mrs. A. H. Rule"
  composer = "Mrs. A. H. Rule"
  tagline = ##f
}

ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key bes \major
  \partial 4
  \autoBeamOff
}

patternA = { \ta c4 | c4. c8 c4 c4 | c4 c4 c4. }
patternB = { \ta c8 | c2. c4 | c2. }
patternC = { \ta c4 | c4. c8 c4 c8[ c] | c4. c8 c4. }
patternD = { \ta c4 | c4. c8 c4 c4 | c4. c8 c4. }
patternE = { \ta c8 | c2. \tb c4 \ta | c2. }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { f^\markup{\italic Andante.} | bes bes a g | g bes f }
  \changePitch \patternB { f | bes bes c } \eogbreak
  \changePitch \patternA { f, | bes bes a g | g bes f }
  \changePitch \patternB { f | c' d | bes } \eogbreak
  \changePitch \patternC { f | c' c c d c | bes bes bes }
  f8 | g2 bes4( g) | f2. \eogbreak
  \changePitch \patternA { f | c' c c c | ees d c }
  \changePitch \patternE { bes | d c\fermata | bes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d | d d f ees | ees ees d }
  \changePitch \patternB { d | d d | f }
  \changePitch \patternA { ees | d d f ees | ees ees d }
  \changePitch \patternB { d | ees f | d }
  \changePitch \patternC { f | ees ees ees f ees | d d d }
  d8 | ees2 ees | d2.
  \changePitch \patternA { d | f f f f | g f g }
  \changePitch \patternE { g | f ees | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes | f f bes bes | bes g bes }
  \changePitch \patternB { bes | f f | a }
  \changePitch \patternA { a | bes bes bes bes | bes g bes }
  \changePitch \patternB { bes | a a | f }
  \changePitch \patternD { f | a a a a | bes bes bes }
  bes8 | bes2 g4( bes) | bes2.
  \changePitch \patternA { bes | a a a a | c b c }
  \changePitch \patternE { c | bes a | bes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { bes | bes bes d ees | ees ees bes }
  \changePitch \patternB { bes | bes bes | f' }
  \changePitch \patternA { f | bes, bes d ees | ees ees bes }
  \changePitch \patternB { bes | f' f | bes, }
  \changePitch \patternD { f' | f f f f | bes, bes bes }
  bes8 | ees2 ees | bes2.
  \changePitch \patternA { bes | f' f f f | c d ees }
  \changePitch \patternE { e | f f\fermata | bes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Love not the world: its smiles, its hopes \bar "."
May lure thee on; \bar "."
But cup of joy, and dream of bliss, \bar "."
Will soon be gone. \bar "."
Those dreams will fade, as mist in morn; \bar "."
Those hopes will die; \bar "."
And in that cup of seem -- ing joy, \bar "."
Deep sor -- rows lie. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Love not the world: it, with its lusts,
Must pass a -- way;
Its pleas -- ures sweet, its hopes so bright,
Must all de -- cay.
Its glo -- ries, too, must have an end,
Must pale and die,
And all its emp -- ty bub -- bles burst;
They’re Sa -- tan’s lie.

}

wordsC = \lyricmode {
\set stanza = "3."

But he who does the will of God,
For aye will live,
And drink the streams of heav’n’s de -- lights,
Which Christ will give.
He’ll weep no more on that blest shore;
No mar -- vel this,
For joys well up, and fill his cup,
There’s naught but bliss.

}

wordsD = \lyricmode {
\set stanza = "4."

Dear fel -- low -- pil -- grim in the path,
Look up! look on!
There waits a -- bove, a home of love,
Where Christ is gone
And pleas -- ures bright in courts of light
Will sat -- is -- fy
A heart at rest, su -- preme -- ly blest,
With Je -- sus nigh.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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
