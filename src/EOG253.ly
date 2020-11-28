\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "253"
  title = "Oh! Why Did Jesus Leave His Home?" % not found at hymnary.org
  tunename = "Munhall" % not found at hymnary.org
  meter = "C. M."
  poet = ""
  composer = "Alex. Arbuckle" % not found at hymnary.org
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

  g4 | g2 g4 | g2 g4 | c,( d) d | <g \tweak font-size #-4 g,>2
  g4 | d( c) b | <b \tweak font-size #-4 b'>( <a \tweak font-size #-4 a'>) <g \tweak font-size #-4 g'> | d'2
  g4 | g2 c,4 | d2 d4 | d2 d4 | <g \tweak font-size #-4 g,>2
  g4 | g2 <c, \tweak font-size #-4 c'>4 | d2 d4 | <g g,>2

}
}

wordsA = \lyricmode {
\set stanza = "1."

Oh! why did Je -- sus leave His home \bar "."
A -- bove the bright blue sky, \bar "."
And all the joy and trans -- ports there, \bar "."
To come to earth to die? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

’Twas love, pure love, which brought Him from
A -- bove the bright blue sky;
’Twas love, pure love, which made Him come
To suf -- fer, bleed and die.

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

Oh, bless -- ed home of end -- less rest,
The home of peace and joy!
How sweet will be the song of praise
A -- bove the bright blue sky.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
