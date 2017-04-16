\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 2) (#t #f))
  %page-count = ##f
}

\header{
  hymnnumber = "62"
  title = "Behold the Lamb Whose Precious Blood"
  tunename = "St. Louis"
  meter = "C. M."
  poet = ""
  composer = "Southern Air"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  { c4( e4) | g2 g2 g2 g4( a4) | bes2 bes2 a2. }
  { g4 | a2 c2 c4( a4) g4( a4) | c1. }
  { c4( d4) | e2 c2 c2 a2 | g2 f2 e2 }
%  { c4( d4) | e4( g4) a4 g4( e4) | d2 c1 } % this is how it looks in my probably-mismarked photocopy
  { c4( d4) | e4( g2) a4 g4( e4) d2 | c1. } % I changed the c1 to a c1. at the end to make it fit, and moved the barcheck

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  { c2 | e2 f2 g2 ees2 | d2 f2 f2. }
  { e4 | a2 g2 f2 f2 | e2( f2 g2) }
  { a2 | g2 e4( f4) g2 g4( f4) | e4( d4) c4( b4) c2 }
  { c2 | c2( e4) d4 e4( c4) b2 | c1. }

}
}

notesTenor = {
\global
\relative a {

  { e4( g4) | c2 b2 c2 c2 | bes2 d2 c2. }
  { c4 | c2 c2 a2 b2 | c1. }
  { c2 | c2 c2 c2 c2 | c2 g2 g2 }
  { e4( f4) | g4( c2) c4 c4( g4) f2 | e1. }

}
}

notesBass = {
\global
\relative f {

  { c2 | c2 d2 e2 f2 | bes,2 bes2 f'2. }
  { c4 | f2 e2 d2 g2 | c,2( d2 e2) }
  { f2 | c2 c4( d4) e2 f2 | g2 g,2 c2 }
  { c2 | c2. fis,4 g2 g2 | c1. }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Be -- hold the Lamb whose pre -- cious blood, \bar "."
Drawn from His riv -- en side, \bar "." \break
Had power to make our peace with God, \bar "."
Nor lets one spot a -- bide. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

The dy -- ing thief be -- held that Lamb
Ex -- pi -- ring by his side,
And proved the val -- ue of the name
Of Je -- sus cru -- ci -- fied.

}

wordsC = \lyricmode {
\set stanza = "3."

His soul, by vir -- tue of the blood,
To pa -- ra -- dise re -- ceived;
Re -- demp -- tion’s ear -- liest tro -- phy stood,
From sin and death re -- trieved.

}

wordsD = \lyricmode {
\set stanza = "4."

We too the clean -- sing power have known
Of the a -- ton -- ing blood,
By grace have learnt His name to own,
Which brings us back to God.

}

wordsE = \lyricmode {
\set stanza = "5."

To Him, then, let our songs as -- cend,
Who stooped in grace so low:
To Christ, the Lamb, the sin -- ner’s Friend,
Let cease -- less prai -- ses flow.

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
