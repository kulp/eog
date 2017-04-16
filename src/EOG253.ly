\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "253"
  title = "O! Why Did Jesus Leave His Home?"
  tunename = "Munhall"
  meter = "C. M."
  poet = ""
  composer = "Alex. Arbuckle"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key g \major
  \partial 4
  \autoBeamOff
}

%smallNotes = \override NoteHead.font-size = #-4
normalNotes = \override NoteHead.font-size = #0
smallNotes = { \normalNotes } % TODO use smallNotes when we can mix on the same stem
smallNote = \once \smallNotes

notesSoprano = {
\global
\relative c'' {

  d4 | e( d) c | b( a) g | c( b) a | b2
  b4 | b( a) g | g( fis) g | a2
  b4 | b( d) e | d( c) b | a( g) a | b2
  d,4 | d( g) c | b2 a4 | g2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g4 | g2 g4 | g( fis) d | e( d) fis | g2
  d4 | d2 d4 | d2 d4 | d2
  d4 | g2 g4 | g( fis) g | fis( g) fis | g2
  d4 | d2 g4 | g2 fis4 | g2

}
}

notesTenor = {
\global
\relative a {

  b4 | c( b) e | d( c) b | g2 d'4 | d2
  g,4 | g( fis) g | d'( c) b | fis2
  g4 | d'( b) c | b( a) d | c( b) d | d2
  b4 | b2 e4 | d2 c4 | b2

}
}

notesBass = {
\global
\relative f {

  % TODO make chords with different note-head sizes, like original
  g4 | g2 g4 | g2 g4 | c,( d) d | <<g2 \smallNote g,2>>
  g'4 | d( c) b | << \normalNotes { b( a) } \smallNotes { b' a }>> <<g, \smallNote g'>> | \normalNotes d2
  g4 | g2 c,4 | d2 d4 | d2 d4 | <<g2 \smallNote g,2>>
  g'4 | g2 c,4 | d2 d4 | <g g,>2

}
}

wordsA = \lyricmode {
\set stanza = "1."

O! why did Je -- sus leave His home \bar "."
A -- bove the bright blue sky, \bar "."
And all the joy and trans -- ports there, \bar "."
To come to earth to die? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

’Twas love, pure love, which bro’t Him from
A -- bove the bright blue sky;
’Twas love, pure love, which made hime come
To suf -- fer, bleed, and die.

}

wordsC = \lyricmode {
\set stanza = "3."

And now He’s gone, and lives a -- gain
A -- bove the bright blue sky;
And all who taste His sav -- ing grace
Shall live with Him on high.

}

wordsD = \lyricmode {
\set stanza = "4."

O, bless -- ed home of end -- less rest,
The home of peace and joy!
How sweet will be the song of praise
A -- bove the bright blue sky!

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
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
