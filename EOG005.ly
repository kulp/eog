\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  title = "By Faith I See the Saviour Dying"
  subsubtitle = "(Mercy’s Free. 8. 6. 8. 6. 8. 6. 8. 6.)"
  %meter = "8.6.8.6.8.6.8.6."
  poet = "Richard Jukes"
  composer = "D. F. E. Auber"
  %copyright = ""
  tagline = ##f
}

% TODO pull this out into a common file (already EOG003 uses the same tune)
patternOne   = { c4( c8) | c4 c8 c4 c8 c8 c8 c8 | c4.( c4.) c8 c8 c8 | c4.( c4.) c4 c8 | c4. ~ c4. }
patternTwo   = { c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. }
%patternTwo   = { c4. | c4( c8) c4 c8 c4 c8 | c4. ~ c4. c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. }
patternThree = { c4. | c4 c8 c4 c8 c4 c8 | c4.( c4.) c4 c8 | c4.( c4.) c4 c8 | c4. ~ c4. }

notesSoprano = {
\relative c' {

    \changePitch \patternOne { c' bes | a a a a a bes c | d c c bes a | g bes a g | f f }
    \changePitch \patternOne { c' bes | a a a a a bes c | d c c bes a | g bes a g | f f }
    \changePitch \patternTwo { c' | c bes g d' d c | a a c | c bes g d' d c | a a }
    \changePitch \patternOne { c bes | a a a a a bes c | d c c bes a | g bes a g | f f }
\bar "|."

}
}

notesAlto = {
\relative e' {

    \changePitch \patternOne { a g | f f f f f g a | bes f a g f | e g f e | f f }
    \changePitch \patternOne { a g | f f f f f g a | bes f a g f | e g f e | f f }
    \changePitch \patternTwo { f | e g e e f f | f f f | e g e e f f | f f }
    \changePitch \patternOne { a g | f f f f f g a | bes f a g f | e g f e | f f }

}
}

notesTenor = {
\relative a {

    \changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }
    \changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }
    \changePitch \patternTwo   { a | g c c bes bes a | c c a | g c c bes bes a | c c }
    \changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }

}
}

notesBass = {
\relative a {

    \changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }
    \changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }
    \changePitch \patternTwo   { f | c c c c f f | f f | f c c c c f f | f f }
    \changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }

}
}

global = {
  %\autoBeamOff
  \override Staff.TimeSignature #'style = #'() \time 9/8
  % TODO \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 4)
  \once \override Score.MetronomeMark #'transparent = ##t
  \tempo 4 = 80
  \key f \major
  \partial 4.
}

VerseOne = \lyricmode {
\set stanza = "1."

    By faith I see the Sav -- _ iour dying, \bar "|"
    On _ the tree, on the tree; \bar "|"
    To ru -- ined sin -- ners He _ is crying— \bar "|"
    Look _ to Me! look to Me! \bar "|"
    He bids the guilt -- y now draw near; \bar "|"
    Hark, hark! His pre -- cious words I hear— \bar "|"
    So soft, so sweet, they ban -- _ ish fear: \bar "|"
    Mer -- _ cy’s free, mer -- cy’s free.

}

VerseTwo = \lyricmode {
\set stanza = "2."

    Did Christ, when I was sin _ pur -- suing,
    Think _ of me, think of me?
    And did He save my soul _ from ruin?
    Can _ it be? can it be?
    O yes, He did sal -- va -- tion bring;
    He is a Proph -- et, Priest, and King;
    And now my hap -- _ py soul can sing,
    Mer -- _ cy’s free, mer -- cy’s free.

}

VerseThree = \lyricmode {
\set stanza = "3."

    Long as I live I’d still _ be crying—
    Mer -- _ cy’s free, mer -- cy’s free:
    Point to the Lamb for sin -- _ ners dying
    On _ the tree, on the tree.
    There all my foes He hath with -- stood,
    Washed all my sins a -- way in blood,
    Made man -- i -- fest the love _ of God,
    E’en _ to me, e’en to me.

}

VerseFour = \lyricmode {
\set stanza = "4."

    How sweet the tuth, ye sin -- _ ners, "hear it,"
    Mer -- _ cy’s free, mer -- cy’s free.
    Ye saints of God, to all _ de -- "clare it,"
    Mer -- _ cy’s free, mer -- cy’s free.
    Vis -- it your neigh -- bor’s dark a -- bode,
    Pro -- claim to all this love of God,
    O spread the joy -- ful news _ a -- broad,
    Mer -- _ cy’s free, mer -- cy’s free.

}

% TODO: use http://lsr.dsi.unimi.it/LSR/Snippet?id=653

\score {
  \new ChoirStaff <<
    \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
    \new Staff <<
      \clef "treble"
      \repeat unfold 4 {
         s4( s8) \noBreak | s4 s8 s4 s8 s8 s8 s8 \noBreak | s4.( s4.) \noBreak
             s8 s8 s8 \noBreak | s4.( s4.) \noBreak s4 s8 \noBreak | s4. ~ s4.
             \break
      }

      \new Voice = "Soprano"  { \voiceOne \global \notesSoprano \bar "|." }
      \new Voice = "Alto" { \voiceTwo \global \notesAlto }
      \new Lyrics \lyricsto "Soprano" { \VerseOne }
      \new Lyrics \lyricsto "Soprano" { \VerseTwo }
      \new Lyrics \lyricsto "Soprano" { \VerseThree }
      \new Lyrics \lyricsto "Soprano" { \VerseFour }
    >>
    \new Staff <<
      \clef "bass"
      \new Voice = "Tenor" { \voiceOne \global \notesTenor }
      \new Voice = "Bass"  { \voiceTwo \global \notesBass }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

