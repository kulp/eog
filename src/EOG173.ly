\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized #f) (#t 4))
  system-count = #(cond (is-eogsized 5) (#t #f))
  page-count = ##f
}

\header{
  hymnnumber = "173"
  title = "Long Did I Toil, and Knew No Earthly Rest"
  tunename = "Finlandia"
  meter = "6-10s."
  poet = "H. F. Lyte"
  composer = "Jan Sibelius"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key f \major
  \partial 2.
  \autoBeamOff
}

patternA = { c4 c4 c4 | c2. c4 | c4 c4 c4. c8 | c4( c2.) ~ | c4 }
patternB = { c4 c4 c4 | c2. c4 | c4 c4 c4. c8 | c1 ~ c4 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { a g a bes a g a f g g a a }
  \changePitch \patternB { a g a bes a g a f g a a }
  \changePitch \patternA { c c c d a a c c g g bes bes }
  \changePitch \patternB { bes a g a f f g g a a a }
  \changePitch \patternA { c c c d a a c c g g bes bes }
  \changePitch \patternB { bes a g a f f g g f f f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { f e f e f e f d e e f f }
  \changePitch \patternB { f e f e f e f d e f f }
  \changePitch \patternA { f f f f f f f f e e g g }
  \changePitch \patternB { g fis g f! f f f e e e e }
  \changePitch \patternA { a f f f f f f f e e g g }
  \changePitch \patternB { g fis g f! c f f e f f f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { c c c c c c c bes bes c c c }
  \changePitch \patternB { c c c c c c c bes bes c c }
  \changePitch \patternA { a a a a d d c c c c d d }
  \changePitch \patternB { d c d c c d d d cis cis cis }
  \changePitch \patternA { c! a a a d d c c c c d d }
  \changePitch \patternB { d c d c a a bes bes a a a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { f bes a g f bes a bes g g f f }
  \changePitch \patternB { f bes a g f bes a bes g f f }
  \changePitch \patternA { f f e d d d a a c c g g }
  \changePitch \patternB { g a bes c a' bes bes bes a a a }
  \changePitch \patternA { f f e d d d a' a c c g g }
  \changePitch \patternB { g, a bes c c c c c f f f }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Long did I toil, and knew no earth -- ly rest; \bar "."
Far did I rovel and found no cer -- tain home; \bar "."
At last I sought them in His shelter -- ing breast, \bar "." % original has shel -- ter -- ing
Who opes His arms, and bids the wea -- ry come: \bar "."
With Him I found a home, a rest di -- vine, \bar "."
And I since then am His, and He is mine. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The good I have is from His stores sup -- plied;
The ill is on -- ly what He deems the best;
He for my friend, I’m rich with nought be -- side;
And poor with -- out Him, though of all pos -- sessed.
Chan -- ges may come; I take, or I re -- sign;
Con -- tent, while I am His, while He is mine.

}

wordsC = \lyricmode {
\set stanza = "3."

While here a -- las, I know but half His love,
But half dis -- cern Him, and but half a -- dore;
But when I meet Him in the realms a -- bove,
I then will love Him bet -- ter, praise Him more,
And feel, and tell, a -- mid the choir di -- vine,
How ful -- ly I am His, and He is mine.

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
