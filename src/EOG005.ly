\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "5"
  title = "By Faith I See the Saviour Dying"
  tunename = "Mercy’s Free"
  meter = "8. 6. 8. 6. 8. 6. 8. 6."
  poet = "Richard Jukes"
  composer = "D. F. E. Auber"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \autoBeamOff
  \override Staff.TimeSignature.style = #'numbered \time 9/8
  \once \override Score.MetronomeMark.transparent = ##t
  \tempo 4 = 80
  \key f \major
  \partial 4.
}

% TODO pull this out into a common file (already EOG003 uses the same tune)
patternOne   = { c4( c8) | c4 c8 c4 c8 c8[ c8] c8 | c4. c4. c8[ c8] c8 | c4.( c4.) c4 c8 | c4. ~ c4. }
patternTwo   = { c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. }
% TODO This is how it's expressed in the original, but the slur messes up timing
%patternTwo   = { c4. | c4( c8) c4 c8 c4 c8 | c4. ~ c4. c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. }
patternThree = { c4. | c4 c8 c4 c8 c4 c8 | c4. c4. c4 c8 | c4. ~ c4. c4 c8 | c4. ~ c4. }
patternFour  = { c4( c8) | c4 c8 c4 c8 c8[ c8] c8 | c4.( c4.) c8[ c8] c8 | c4.( c4.) c4 c8 | c4. ~ c4. }
patternFive  = { c4. | c4 c8 c4 c8 c4 c8 | c4.( c4.) c4 c8 | c4. ~ c4. c4 c8 | c4. ~ c4. }

notesSoprano = {
\global
\relative c' {

    \changePitch \patternOne  { c' bes | a a a a a bes c | d c c bes a | g bes a g | f f }
    \changePitch \patternOne  { c' bes | a a a a a bes c | d c c bes a | g bes a g | f f }
    \changePitch \patternTwo  { c' | c bes g d' d c | a a c | c bes g d' d c | a a }
    \changePitch \patternFour { c bes | a a a a a bes c | d c c bes a | g bes a g | f f }

    \bar "|."

}
}

notesAlto = {
\global
\relative e' {

    \changePitch \patternOne  { a g | f f f f f g a | bes f a g f | e g f e | f f }
    \changePitch \patternOne  { a g | f f f f f g a | bes f a g f | e g f e | f f }
    \changePitch \patternTwo  { f | e g e e f f | f f f | e g e e f f | f f }
    \changePitch \patternFour { a g | f f f f f g a | bes f a g f | e g f e | f f }

}
}

notesTenor = {
\global
\relative a {

    \changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }
    \changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }
    \changePitch \patternTwo   { a | g c c bes bes a | c c a | g c c bes bes a | c c }
    \changePitch \patternFive  { c | c c c c c c | bes a c c | c c c bes | a a }

}
}

notesBass = {
\global
\relative a {

    \changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }
    \changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }
    \changePitch \patternTwo   { f | c c c c f f | f f | f c c c c f f | f f }
    \changePitch \patternFive  { f | f f f f f f | bes, f' f f | c c c c | f f }

}
}

wordsA = \lyricmode {
\set stanza = "1."

    By faith I see the Sav -- iour dy -- ing, \bar "."
    On the tree, on the tree; \bar "."
    To ru -- ined sin -- ners He is cry -- ing— \bar "."
    Look to Me! look to Me! \bar "."
    He bids the guilt -- y now draw near; \bar "."
    Hark, hark! His pre -- cious words I hear— \bar "."
    So soft, so sweet, they ban -- ish fear: \bar "."
    Mer -- cy’s free, mer -- cy’s free.

}

wordsB = \lyricmode {
\set stanza = "2."

    Did Christ, when I was sin pur -- su -- ing,
    Think of me, think of me?
    And did He save my soul from ru -- in?
    Can it be? can it be?
    O yes, He did sal -- va -- tion bring;
    He is a Proph -- et, Priest, and King;
    And now my hap -- py soul can sing,
    Mer -- cy’s free, mer -- cy’s free.

}

wordsC = \lyricmode {
\set stanza = "3."

    Long as I live I’d still be cry -- ing—
    Mer -- cy’s free, mer -- cy’s free:
    Point to the Lamb for sin -- ners dy -- ing
    On the tree, on the tree.
    There all my foes He hath with -- stood,
    Washed all my sins a -- way in blood,
    Made man -- i -- fest the love of God,
    E’en to me, e’en to me.

}

wordsD = \lyricmode {
\set stanza = "4."

    How sweet the tuth, ye sin -- ners, hear it,
    Mer -- cy’s free, mer -- cy’s free.
    Ye saints of God, to all de -- clare it,
    Mer -- cy’s free, mer -- cy’s free.
    Vis -- it your neigh -- bor’s dark a -- bode,
    Pro -- claim to all this love of God,
    O spread the joy -- ful news a -- broad,
    Mer -- cy’s free, mer -- cy’s free.

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

