\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
  indent = #0
}

\header{
  title = "’Tis the Hope of His Coming"
  tunename = "Hallelujah! ’Tis Done"
  meter = "11’s"
  poet = "Mrs. A. R. Rule"
  composer = "P. P. Bliss"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

d8. d16 | g4 g g | g a b | b a g | a2
d,4 | a' a a | a b c | c b a | b2
\repeat volta 2 { d4 | d d d | e d b | b b b | c( b) a
                  g g g | a g e }
\alternative {
  { d4 g a | \set Timing.measureLength = #(ly:make-moment 2/4) b2 }
  { \set Timing.measureLength = #(ly:make-moment 3/4) d,4 g a | g2 }
}


  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

d8. d16 | b4 b d | g fis g | g fis e | fis2
d4 | d d d | fis g fis | d d fis | g2
\repeat volta 2 { g4 | g g g | g2 g4 | g g g | g2 fis4 |
                  g g g | e e c }
\alternative {
  { b4 d fis | g2 }
  { b,4 d d | d2 }
}


}
}

notesTenor = {
\global
\relative a {

d8. d16 | d4 d d | d d d | d d cis | d2
fis,4 | fis a d | d d d | a b d | d2
\repeat volta 2 { b4 | b b b | c b d | d d d | e( d) c
                  b b b | c g g }
\alternative {
  { g4 b d | d2 }
  { g,4 b c | b2 }
}

}
}

notesBass = {
\global
\relative f {

d8. d16 | g4 g b | b a g | d d d | d2
d4 | d fis a | c b a | d, d d | g2
\repeat volta 2 { g4 | g g g | g2 g4 | g g g | g2 d4
                  e e e | c c c }
\alternative {
  { d4 d d | g2 }
  { d4 d d | g,2 }
}

}
}

wordsA = \lyricmode {
\set stanza = "1."

’Tis the hope of His com -- ing \bar "."
That glad -- dens my heart, \bar "." \break
That drives a -- way sad -- ness \bar "."
And bids care de -- part; \break \bar ".|:-||"
No dread of the mor -- row, \bar "."
No sor -- row I see, \bar "." \break
For Je -- sus is com -- ing \bar "."
He’s com -- ing for me.
com -- ing for me.

}

wordsB = \lyricmode {
\set stanza = "2."

And though clouds dark -- en o’er me,
Though storms may as -- sail,
With Je -- sus be -- side me,
I’ll wea -- ther the gale;
The storm is with -- out me,
No trou -- ble with -- in,
For Je -- sus, my Sav -- iour,
Has cleansed me from sin.
cleansed me from sin.

}

wordsC = \lyricmode {
\set stanza = "3."

Yes, He’s com -- ing, He’s com -- ing,
I nev -- er may die;
’Tis Je -- sus, my Sav -- iour,
Whose com -- ing is nigh.
I rest on His prom -- ise,
I trust His sure word;
Then quick -- ly, come quick -- ly,
O Je -- sus my Lord.
Je -- sus my Lord.

}

music = \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>

\score {
  \music
  \layout {
    \include "common/layout.ily"
  }
}

\score {
  \unfoldRepeats \music
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
