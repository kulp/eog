\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  hymnnumber = "200"
  title = "’Tis the Hope of His Coming"
  tunename = "Hallelujah! ’Tis Done"
  meter = "6—11s."
  poet = "Mrs. A. H. Rule" % original has A. R. Rule, but Messages of Love Hymn Book shows A. H. Rule to be correct
  composer = "P. P. Bliss"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
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

d8. d16 | g4 g g | g a b | b a g | a2 \eogbreak
d,4 | a' a a | a b c | c b a | b2 \eogbreak
\repeat volta 2 { d4 | d d d | e d b | b b b | c( b) \eogbreak a
                  g g g | a g }
\alternative {
  { e4 | d g a | b2 }
  { e,4 | d4 g a | g2 }
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
                  g g g | e e }
\alternative {
  { c4 | b d fis | g2 }
  { c,4 | b d d | d2 }
}


}
}

notesTenor = {
\global
\relative a {

d8. d16 | d4 d d | d d d | d d cis | d2
fis,4 | fis a d | d d d | a b d | d2
\repeat volta 2 { b4 | b b b | c b d | d d d | e( d) c
                  b b b | c g }
\alternative {
  { g4 | g b d | d2 }
  { g,4 | g4 b c | b2 }
}

}
}

notesBass = {
\global
\relative f {

d8. d16 | g4 g b | b a g | d d d | d2
d4 | d fis a | c b a | d, d d | g2
\repeat volta 2 { g4 | g g g | g2 g4 | g g g | g2 d4
                  e e e | c c }
\alternative {
  { c4 | d d d | g2 }
  { c,4 | d d d | g,2 }
}

}
}

wordsA = \lyricmode {
\set stanza = "1."

’Tis the hope of His com -- ing \bar "."
That glad -- dens my heart, \bar "."
That drives a -- way sad -- ness \bar "."
And bids care de -- part; \bar ".|:-||"
No dread of the mor -- row, \bar "."
No sor -- row I see, \bar "."
For Je -- sus is com -- ing_– \bar "."
He’s com -- ing for me. %{HIDE>%} He’s com -- ing for me. %{<HIDE%} \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

And though clouds dark -- en o’er me,
Though storms may as -- sail,
With Je -- sus be -- side me,
I’ll wea -- ther the gale;
The storm is with -- out me,
No troub -- le with -- in,
For Je -- sus, my Sav -- iour,
Has cleansed me from sin. %{HIDE>%} Has cleansed me from sin. %{<HIDE%}

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
O Je -- sus, my Lord. %{HIDE>%} O Je -- sus, my Lord. %{<HIDE%}

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
}

\include "score-EOG200.ily"

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
