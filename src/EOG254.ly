\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "254"
  title = "Not All the Blood of Beasts"
  tunename = "Boylston"
  meter = "S. M."
  poet = "Watts"
  composer = "Dr. Lowell Mason"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key c \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 | e4 f g2 a | g1
  c2 | c4 b a2 a | g1 \eogbreak
  g2 | e4 f g2 g | a4 b c2
  b2 | c4 a g2 g | g1 \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e2 | c4 d e2 f | e1
  e2 | d4 d e2 d | d1
  e2 | c4 b c2 e | f4 f e2
  g2 | g4 f d( e) f2 | e1

}
}

notesTenor = {
\global
\relative a {

  g2 | g4 c c2 c | c1
  g2 | fis4 g g2 fis4( c') | b1
  c2 | g4 g g2 c | c4 g g2
  g2 | g4 c4 b( c) d2 | c1

}
}

notesBass = {
\global
\relative f {

  c2 | c4 c c2 f | c1
  c2 d4 g c,2 d | g,1
  c2 | c4 d e2 c | f4 d c2
  g'2 | e4 f g2 g, | c1

}
}

wordsA = \lyricmode {
\set stanza = "1."

Not all the blood of beasts, \bar "."
On Jew -- ish al -- tars slain, \bar "."
Could give the guilt -- y con -- science peace, \bar "."
Or wash a -- way its stain. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

But Christ, the heav’n -- ly Lamb,
Took all our guilt a -- way,
A sac -- ri -- fice of no -- bler name,
And rich -- er blood than they.

}

wordsC = \lyricmode {
\set stanza = "3."

Our souls look back to see
The bur -- den Thou didst bear,
When hang -- ing on th’ac -- curs -- ed tree,
For all our guilt was there.

}

wordsD = \lyricmode {
\set stanza = "4."

Be -- liev -- ing, we re -- joice
To see the curse re -- move;
And bless the Lamb with cheer -- ful voice,
And sing re -- deem -- ing love.

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
