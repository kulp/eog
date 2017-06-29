\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 7) (#t #f))
  systems-per-page = #(cond (is-eogsized 5) (#t #f))
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  %children
  hymnnumber = "330"
  title = "A Message Came from Heaven"
  tunename = ""
  meter = "P. M."
  poet = ""
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  b4 | d d b b | g2 d4
  d4 | g a b c | d2. \eogbreak
  b4 | c c a c | b2 g4
  b4 | b a a b | a2. \eogbreak
  b4 | d d b b | g2 d4
  d4 | g a b c | d2. \eogbreak
  d4 | e e c e | d2 b4
  g4 | b c b a | g2. r4 \eogbreak

  << s^\markup { \small \caps "Refrain" }
  { d4 g b2 | e4 d b2 | } >>
  d8. d16 c8. b16 c8. b16 a8. c16 | e4 d b4.
  d,8 | d8. g16 g8. a16 b4. b8 | b8. b16 c8. b16 a2 | % original has impossible number of beats per measure here, so some notes were lengthened
  d8. d16 fis8. e16 d8. c16 b8. c16 | b4 a g2 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g4 | g g g g | d2 d4
  c4 | d fis g g | g2.
  g4 | a fis fis a | g2 d4
  g4 | g g g g | fis2.
  g4 | g g g g | d2 d4
  c4 | d fis g g | g2.
  g4 | g g g g | g2 d4
  e4 | g g fis fis | d2. r4

  d4 d g2 | g4 g g2 |
  fis8. fis16 fis8. eis16 fis8. g16 fis8. fis16 | g4 g g4.
  d8 | d8. d16 d8. d16 g4. g8 | g8. g16 a8. g16 fis2 |
  fis8. fis16 a8. g16 fis8. fis16 fis8. fis16 | g4 fis d2 |


}
}

notesTenor = {
\global
\relative a {

  d4 | b b d d | b2 b4
  a4 | b d d a | b2.
  d4 | d d d d | d2 b4
  d4 | cis cis cis cis | d2.
  d4 | b b d d | b2 b4
  a4 | b d d a | b2.
  b4 | c c c c | b2 g4
  b4 | d e d c | b2. r4

  b4 b d2 | c4 b d2 |
  d8. a16 a8. gis16 a8. b16 c8. a16 | c4 b d4.
  b8 | b8. b16 b8. c16 d4. d8 | d8. d16 d8. d16 d2 |
  a8. a16 c8. c16 a8. e'16 d8. e16 | d4 c b2 |

}
}

notesBass = {
\global
\relative f {

  g4 | g g g g | g2 g4
  fis4 | g d g g | g2.
  g4 | fis d d fis | g2 g4
  g4 | a a a a, | d2.
  g4 | g g g g | g2 g4
  fis4 | g d g g | g2.
  g4 | c, c e c | g'2 g4
  e4 | d d d d | g2. r4

  g4 g g2 | g4 g g2 |
  d8. d16 d8. d16 d8. d16 d8. d16 | g4 g g4.
  g8 | g8. g16 g8. g16 g4. d8 | g8. g16 fis8. g16 d2 |
  d8. d16 d8. d16 d8. d16 d8. d16 | d4 d g2 |

}
}

Refrain = \lyricmode {

That means me, that means me, \bar "."
“Who -- so -- ev -- er will be -- lieve,” and that means me; \bar "."
I am so ve -- ry glad be -- cause the Sav -- iour said, \bar "."
“Who -- so -- ev -- er will be -- lieve,” and that means me. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1." % original does not have stanza numbers

A mes -- sage came from heav -- en \bar "."
To cheer my heart one day; \bar "."
It set the joy -- bells ring -- ing, \bar "."
And chased my gloom a -- way. \bar "."
’Twas in the ho -- ly Bi -- ble, \bar "."
John’s Gos -- pel, chap -- ter three, \bar "."
Verse six -- teen I dis -- cov -- ered \bar "."
Was writ -- ten there for me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I read the won -- drous sto -- ry
How God in heav -- en high
So loved a world of sin -- ners,
He sent His Son to die;
And that word \italicsOn who -- so -- ev -- er, \italicsOff
Be -- liev -- ing I could see,
Though meant for ev -- ery -- bod -- y,
Was most -- ly meant for me.

\Refrain

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
