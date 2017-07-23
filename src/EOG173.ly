\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 5) (#t #f))
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "173"
  title = "Long Did I Toil, and Knew No Earthly Rest"
  tunename = "Finlandia"
  meter = "6—10s."
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

patternA = { c4 c4 c4 | c2. c4 | c4 c4 c4. c8 | c4( c2.) ~ | \noBreak \noPageBreak c4 }
patternB = { c4 c4 c4 | c2. c4 | c4 c4 c4. c8 | c1 ~ \noBreak \noPageBreak c4 }

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

Long did I toil, and knew no earth -- ly rest; __ \bar "."
Far did I rove, and found no cer -- tain home; __ \bar "."
At last I sought them in His shelter -- ing breast, __ \bar "." % original has shel -- ter -- ing
Who opes His arms, and bids the wear -- y come; __ \bar "."
With Him I found a home, a rest di -- vine, __ \bar "."
And I since then am His, and He is mine. __ \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The good I have is from His stores sup -- plied; __
The ill is on -- ly what He deems the best; __
He for my friend, I’m rich with naught be -- side; __
And poor with -- out Him, though of all pos -- sessed. __
Chang -- es may come; I take, or I re -- sign; __
Con -- tent, while I am His, while He is mine. __

}

wordsC = \lyricmode {
\set stanza = "3."

While here, a -- las! I know but half His love, __
But half dis -- cern Him, and but half a -- dore; __
But when I meet Him in the realms a -- bove, __
I then will love Him bet -- ter, praise Him more, __
And feel, and tell, a -- mid the choir di -- vine, __
How ful -- ly I am His, and He is mine. __

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
