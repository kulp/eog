\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "111"
  title = "Once Again the Gospel Message"
  tunename = "Come Believing"
  meter = "8. 7. 8. 7. with Refrain"
  poet = "El Nathan"
  composer = "J. McGranahan"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g8. a16 | b4. b8 d4 g,4 | g fis2
  a8 b | c4. b8 c4 d | b2. \eogbreak
  g8 a | b4. b8 d4 g,4 | g fis2
  a8 b | c4. c8 b4 a | g2. \eogbreak

  << s^\markup { \small \caps "Refrain" }
  { g8. b16 | a4 a2 a8. c16 | b4 b2 } >>
  b8. d16 | cis4. cis8 b4 a | d2. \fermata
  g,8. a16 | b4 b2 d8. g,16 | g4 fis2
  a8 b | c4. c8 b4 a | g2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d8. fis16 | g4. g8 g4 d | d d2
  d8 g | fis4. fis8 fis4 fis | g2.
  d8 fis | g4. g8 g4 d | d d2
  d8 g | fis4. fis8 g4 d | d2.

  d8. g16 | fis4 fis2 fis8. a16 g4 g2
  g8. g16 | g4. g8 g4 g | fis g \tb a \fermata \ta
  g8. g16 | g4 g2 g8. d16 | d4 d2
  d8 f | e4. e8 d4 d | d2.

}
}

notesTenor = {
\global
\relative a {

  b8. c16 | d4. d8 b4 b | b a2
  d8 d | d4. d8 d4 d | d2.
  b8 c | d4. d8 b4 b | b a2
  d8 d | d4. d8 d4 c | b2.

  b8. d16 | d4 d d d8. d16 | d4 d d
  d8. b16 | a4. a8 a4 a | a b c
  b8. c16 | d4 d d b8. b16 | b4 a a
  fis8 g | g4. g8 g4 fis8[ c'] | b2.

}
}

notesBass = {
\global
\relative f {

  g8. g16 | g4. g8 g4 g | d4 d2
  c'8 b | a4. gis8 a4 d, | g2.
  g8 g | g4. g8 g4 g | d4 d2
  c'8 b | a4. a8 d,4 d | g2.

  g8. g16 | d4 d d d8. d16 | g4 g g
  g8. g16 | e4. e8 a4 a | d,4 d d_\fermata
  g8. g16 | g4 g g g8. g16 | d4 d d
  d8 g | c,4. c8 d4 d | << g2. g,2. >>

}
}

Refrain = \lyricmode {

Come be -- liev -- ing! Come be -- liev -- ing! \bar "."
Come to Je -- sus! Look, and live! \bar "."
Come be -- liev -- ing! Come be -- liev -- ing! \bar "."
Come to Je -- sus! Look, and live! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Once a -- gain the gos -- pel mes -- sage \bar "."
From the Sav -- iour you have heard; \bar "."
Will you heed the in -- vi -- ta -- tion? \bar "."
Will you turn and seek the Lord? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Man -- y sum -- mers you have wast -- ed,
Rip -- ened har -- vests you have seen;
Win -- ter snows by spring have melt -- ed,
Yet you lin -- ger in your sin.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus for your choice is wait -- ing;
Tar -- ry not; at once de -- cide!
While the Spir -- it now is striv -- ing,
Yield, and seek the Sav -- iour’s side.

}

underWords = \lyricmode {

{ \repeat unfold 34 { \skip 4 } }
come!
{ \repeat unfold 4 { \skip 4 } }
come!
{ \repeat unfold 4 { \skip 4 } }
look! Oh, look and live!
{ \repeat unfold 4 { \skip 4 } }
come!
{ \repeat unfold 4 { \skip 4 } }
come!

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
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
    >>
    \context Lyrics = three \lyricsto tenors \underWords
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
