\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-count = #(cond (is-eogsized 4) (#t #f))
  system-system-spacing.padding = 1
  system-system-spacing.basic-distance = 1
}

\header{
  %gospel
  hymnnumber = "56"
  title = "Oh, Blessed Gospel Sound!"
  tunename = "Happy Land"
  meter = "6. 4. 6. 4. 6. 6. 6. 4."
  poet = ""
  composer = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=120 }
tb = { \tempo 4=60  }

patternAA = { c2       c4 c4 | c4 c4 c2 }
patternAB = { c4.( c8) c4 c4 | c4 c4 c2 }

patternBA = { c2 c4. c8 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { a a g | a c c }
  \changePitch \patternBA { a a g | f } \eogbreak
  \changePitch \patternAA { a a g | a c c }
  \changePitch \patternBA { a a g | f } \eogbreak

  \changePitch \patternAA { f' f c | d c c }
  \changePitch \patternAB { a g a c | d c c } \eogbreak
  \changePitch \patternAA { f f c | d c c }
  \changePitch \patternBA { a a g | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { f f e | f f f }
  \changePitch \patternBA { f e e | f }
  \changePitch \patternAA { f f e | f f f }
  \changePitch \patternBA { f e e | f }

  \changePitch \patternAA { f f f | f f f }
  \changePitch \patternAB { f e f f | f f f }
  \changePitch \patternAA { f f f | f f f }
  \changePitch \patternBA { f e e | f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c c c | c c c }
  \changePitch \patternBA { c bes bes | a }
  \changePitch \patternAA { c c c | c c c }
  \changePitch \patternBA { c bes bes | a }

  \changePitch \patternAA { a a a | bes a a }
  \changePitch \patternAA { c c c | bes a a }
  \changePitch \patternAA { a a a | bes a a }
  \changePitch \patternBA { c bes bes | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f f c | f a a }
  \changePitch \patternBA { f c c | f }
  \changePitch \patternAA { f f c | f a a }
  \changePitch \patternBA { f c c | f }

  \changePitch \patternAA { f f f | f f f }
  \changePitch \patternAB { f c f a | bes f f }
  \changePitch \patternAA { f f f | f f f }
  \changePitch \patternBA { c c c | f }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Oh bless -- ed gos -- pel sound! \bar "."
“Yet there is room”! \bar "."
It tells to all a -- round_– \bar "."
“Yet there is room”! \bar "."
The guilt -- y may draw near; \bar "."
Tho’ vile, they need not fear; \bar "."
With joy they now may hear_– \bar "."
“Yet there is room”! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

God’s love in Christ we see_–
“Yet there is room”!
Great -- er it could not be_–
“Yet there is room”!
His on -- ly Son He gave;
He’s will -- ing now to save
All who in Him be -- lieve_–
“Yet there is room”!

}

wordsC = \lyricmode {
\set stanza = "3."

“All things are read -- y, come”!
“Yet there is room”!
Christ ev -- ’ry -- thing hath done_–
“Yet there is room”!
The work is now com -- plete,
“Be -- fore the mer -- cy -- seat”
A Sav -- iour you will meet_–
“Yet there is room”!

}

wordsD = \lyricmode {
\set stanza = "4."

God’s house is fill -- ing fast_–
“Yet there is room”!
Some guest will be the last_–
“Yet there is room”!
Yes! soon sal -- va -- tion’s day
From you will pass a -- way,
Then grace no more will say_–
“Yet there is room”!

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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
