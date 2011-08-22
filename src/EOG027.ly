\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  title = "O, What a Glorious Truth is This!"
  subsubtitle = "(Mercy’s Free. 8. 6. 8. 6. 8. 6. 8. 6.)"
  %meter = "8.6.8.6.8.6.8.6."
  poet = "A. Midlane"
  composer = "D. F. E. Auber"
  %copyright = ""
  tagline = ##f
}

% TODO pull this out into a common file (at least EOG003 and EOG005 use the same tune)
patternOne   = { c4( c8) | c4 c8 c4 c8 c8[ c8] c8 | c4.( c4.) c8[ c8] c8 | c4.( c4.) c4 c8 | c4. ~ c4. }
patternTwo   = { c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. }
% TODO This is how it's expressed in the original, but the slur messes up timing
%patternTwo   = { c4. | c4( c8) c4 c8 c4 c8 | c4. ~ c4. c4. | c4 c8 c4 c8 c4 c8 | c4. ~ c4. }
patternThree = { c4. | c4 c8 c4 c8 c4 c8 | c4. c4. c4 c8 | c4. ~ c4. c4 c8 | c4. ~ c4. }
patternFour  = { c4( c8) | c4 c8 c4 c8 c8[ c8] c8 | c4.( c4.) c8[ c8] c8 | c4.( c4.) c4 c8 | c4. ~ c4. }
patternFive  = { c4. | c4 c8 c4 c8 c4 c8 | c4.( c4.) c4 c8 | c4. ~ c4. c4 c8 | c4. ~ c4. }

notesSoprano = {
\relative c' {

    \changePitch \patternOne  { c' bes | a a a a a bes c | d c c bes a | g bes a g | f f }
    \changePitch \patternOne  { c' bes | a a a a a bes c | d c c bes a | g bes a g | f f }
    \changePitch \patternTwo  { c' | c bes g d' d c | a a c | c bes g d' d c | a a }
    \changePitch \patternFour { c bes | a a a a a bes c | d c c bes a | g bes a g | f f }
\bar "|."

}
}

notesAlto = {
\relative e' {

    \changePitch \patternOne  { a g | f f f f f g a | bes f a g f | e g f e | f f }
    \changePitch \patternOne  { a g | f f f f f g a | bes f a g f | e g f e | f f }
    \changePitch \patternTwo  { f | e g e e f f | f f f | e g e e f f | f f }
    \changePitch \patternFour { a g | f f f f f g a | bes f a g f | e g f e | f f }

}
}

notesTenor = {
\relative a {

    \changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }
    \changePitch \patternThree { c | c c c c c c | bes a c c | c c c bes | a a }
    \changePitch \patternTwo   { a | g c c bes bes a | c c a | g c c bes bes a | c c }
    \changePitch \patternFive  { c | c c c c c c | bes a c c | c c c bes | a a }

}
}

notesBass = {
\relative a {

    \changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }
    \changePitch \patternThree { f | f f f f f f | bes, f' f f | c c c c | f f }
    \changePitch \patternTwo   { f | c c c c f f | f f | f c c c c f f | f f }
    \changePitch \patternFive  { f | f f f f f f | bes, f' f f | c c c c | f f }

}
}

global = {
  \autoBeamOff
  \override Staff.TimeSignature #'style = #'() \time 9/8
  \once \override Score.MetronomeMark #'transparent = ##t
  \tempo 4 = 80
  \key f \major
  \partial 4.
}

VerseOne = \lyricmode {
\set stanza = "1."

O, what a glo -- rious truth is this— \bar "."
Je -- sus died, Je -- sus died; \bar "." \break
Has o -- pened up the path to bliss; \bar "."
Je -- sus died, Je -- sus died; \bar "." \break
God loved the world, His Son He gave, \bar "."
That all who do in Him be -- lieve \bar "." \break
Should a full, gra -- cious par -- don have; \bar "."
Je -- sus died, Je -- sus died. \bar "." \break

}

VerseTwo = \lyricmode {
\set stanza = "2."

To save my soul from death and hell,
Je -- sus died, Je -- sus died;
Such love a -- maz -- ing who can tell?
Je -- sus died, Je -- sus died;
Yes, He for wretch -- ed men was slain,
That they thro’ Him might life ob -- tain,
And ev -- ver -- last -- ing glo -- ry gain;
Je -- sus died, Je -- sus died.

}

VerseThree = \lyricmode {
\set stanza = "3."

O, tell it un -- to all a -- round,
Je -- sus died, Je -- sus died;
’Tis such a pre -- cious, bless -- ed sound—
Je -- sus died, Je -- sus died;
En -- treat poor sin -- ners to re -- ly
On that which brings the guilt -- y nigh;
E’en to the blood of Christ to fly;
Je -- sus died, Je -- sus died.

}

VerseFour = \lyricmode {
\set stanza = "4."

Soon heav’n shall raise the hap -- py song,
Je -- sus died, Je -- sus died;
Which end -- less a -- ges shall pro -- long,
Je -- sus died, Je -- sus died;
By vir -- tue of that pre -- cious blood
Be -- liev -- ers are brought nigh to God;
O, spread the glo -- rious news a -- broad—
Je -- sus died, Je -- sus died.

}


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

