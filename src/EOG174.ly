\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  system-count = #(cond (is-eogsized 3) (#t #f))
}

\header{
  hymnnumber = "174"
  title = "Glory To God On High!"
  tunename = "National Anthem"
  meter = "6. 6. 4. 6. 6. 6. 4."
  poet = "T. Kelly"
  composer = "Unknown"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 g a | fis2. g4 a2 |
  b2 b c | b2. a4 g2 |
  a2 g fis | \afterGrace g1. { a4 b c }
  d2 d d | d2. c4 b2 |
  c2 c c | c2. b4 a2 |
  b2 c4( b) a( g) | b2. c4 d2 |
  e4( c) b2 a | g1. |
  
  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 d e | d2. cis4 d2 |
  g2 g a | g2. fis4 g2 |
  e2 d d | d1. |
  g2 g fis | g2. fis4 g2 |
  fis2 a fis | fis2. g4 fis2 |
  g2 fis4( g) d2 | g2. fis4 g2 |
  g4( a) g2 fis | g1. |

}
}

notesTenor = {
\global
\relative a {

  b2 g c | a2. a4 a2 |
  d2 e e | d2. c4 b2 |
  c2 b a | b1. |
  b2 d c | b2. a4 g2 |
  d'2 d d | d2. d4 d2 |
  d2 d d | d2. c4 b2 |
  c4( e) d2 d4( c) | b1.

}
}

notesBass = {
\global
\relative f {

  g2 b, c | d2. e4 fis2 |
  g2 e c | d2. dis4 e2 |
  c2 d d | g,1. |
  << { g'2 b a } \\ \override NoteHead.font-size = #-3 { g,2 b d } >> | g2. d4 g2 |
  d2 fis a | d,2. g4 d2 |
  g2 a4( g) fis( e) | d( c) b( a) g2 |
  c2 d d | g,1. |

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Glo -- ry to God on high! \bar "."
Peace up -- on earth and joy, \bar "."
Good will to man.” \bar "."
We who God’s bless -- ing prove, \bar "."
His name all names a -- bove, \bar "."
Sing now the Sav -- iour’s love, \bar "."
Too vast to scan. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Mer -- cy and truth u -- nite,
O! ’tis a won -- drous sight,
All sights a -- bove!
Je -- sus the curse sus -- tains!
Guilt’s bit -- ter cup He drains!
Noth -- ing for us re -- mains–
Noth -- ing but love.

}

wordsC = \lyricmode {
\set stanza = "3."

Love that no tongue can teach,
Love that no thought can reach,
No love like His.
God is its bless -- ed source,
Death ne’er can stop its course,
Noth -- ing can stay its force;
Match -- less it is.

}

wordsD = \lyricmode {
\set stanza = "4."

Blest in this love, we sing;
To God our prais -- es bring;
All sins for -- given.
Je -- sus, our Lord to Thee
Hon -- or and ma -- jes -- ty,
Now and for -- ev -- er be,
Here and in heaven.

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

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
