\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-system-spacing.padding = 8
}

\header{
  %gospel
  hymnnumber = "280"
  title = "What, Sinner, Can You Do?"
  tunename = "London"
  meter = "S. M."
  poet = ""
  composer = "Arr. from Montgomery"
  tagline = ##f
}

ta = { \tempo 4=140 }
tb = { \tempo 4=70 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes4 bes2 aes4 | g2 f | ees1 |
  ees'2.( d4) | c2 bes | aes g | f1 |
  aes2 aes4 aes | aes2. aes4 | bes2 c | f,2.
  \tb aes4\fermata \ta | g2 f | ees d | ees1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g4 g2 ees4 | ees2 d | ees1 |
  ees1 | ees2 ees | d ees | d1 |
  ees2 ees4 ees | ees2. ees4 | ees2 ees | d2.
  f4 | ees2 c | bes bes | bes1 |

}
}

notesTenor = {
\global
\relative a {

  bes4 bes2 c4 | bes2. aes4 | g1 |
  bes1 | aes2 bes | bes bes | bes1 |
  aes2 aes4 aes | aes2. aes4 | g2 aes | aes2.
  bes4 | bes2 aes | g f | g1 |

}
}

notesBass = {
\global
\relative f {

  ees4 ees2 ees4 | ees2 bes | c1 |
  g'1 | aes2 g | f ees | bes1 |
  c2 c4 c | c2. c4 | bes2 aes | bes2.
  d4_\fermata | ees2 aes, | bes bes | ees1

}
}

wordsA = \lyricmode {
\set stanza = "1."

What, sin -- ner, can you do? \bar "."
Where, sin -- ner, can you fly? \bar "."
E -- ter -- nal wrath hangs o’er your head, \bar "."
And judg -- ment lin -- gers nigh. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

For God must vis -- it sin
With His dis -- pleas -- ure sore;
Since He is ho -- ly, just, and true,
And right -- eous ev -- er -- more.

}

wordsC = \lyricmode {
\set stanza = "3."

So Je -- sus died for sin–
Up -- on the cross He died;
God’s right -- eous -- ness was there dis -- played,
And just -- ice sat -- is -- fied.

}

wordsD = \lyricmode {
\set stanza = "4."

Faith is the way of life:
Be -- lieve in Christ and live:
Fly to the shel -- ter of His blood,
And peace with God re -- ceive.

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
