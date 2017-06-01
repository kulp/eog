\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
  system-system-spacing.padding = 11
}

\header{
  hymnnumber = "316"
  title = "Children Once to Israel’s King"
  tunename = "Hendon"
  meter = "7. 7. 7. 7."
  poet = ""
  composer = "Dr. Malan"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 g | g4( d) g( b) | d2 c | b1 |
  b2 b | b4( a) c( a) | g2 fis4( a) | g1 | \eogpagebreak
  b2 b | a a4( b) | c2 d | c( b) |
  d2 d | e d | d4( c) c( b) | b2( a) |
  g2 a | b c4( a) | g2 fis | g1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 d | d d | d d | d1 |
  d2 e | e e | d d | d1 |
  g2 g | fis fis4( g) | a2 b | a( g) |
  g2 g | g g | a g | g( fis) |
  e2 fis | g g4( e) | d2 d | d1 |

}
}

notesTenor = {
\global
\relative a {

  b2 b | b b | b a | g1 |
  g2 g | c c | b a4( c) | b1 |
  d2 d | d d | d d | d1 | % original has small notes here -- only for spacing ?
  b2 b | c b | d d | d1 |
  b2 d | d e4( c) | b2 a | b1 |
}
}

notesBass = {
\global
\relative f {

  g2 g | g g | d d | g1 |
  g2 e | c a | d d | g,1 |
  g'2 g | d d | d d | g1 |
  g2 g | c, g' | fis g | d1 |
  e2 d | g c, | d d | g,1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Chil -- dren once to Is -- rael’s King \bar "."
Did their sweet ho -- san -- nas bring; \bar "."
Chil -- dren now who love the Lord, \bar "."
%{HIDE>%} Join to praise with one ac -- cord, %{<HIDE%} \bar "."
Join to praise with one ac -- cord. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He who reigns in heav’n a -- bove,
Once for sin -- ners died in love;
Came from off the throne on high,
%{HIDE>%} On the cross to bleed and die, %{<HIDE%}
On the cross to bleed and die.

}

wordsC = \lyricmode {
\set stanza = "3."

Life e -- ter -- nal He can give,
’Tis in Him be -- liev -- ers live;
He up -- holds them by His hand,
%{HIDE>%} And can make the fee -- ble stand, %{<HIDE%}
And can make the fee -- ble stand.

}

wordsD = \lyricmode {
\set stanza = "4."

What a day of joy ’t_will be,
When His glo -- rious face they see!
When His im -- age they will bear,
%{HIDE>%} And His throne of glo -- ry share, %{<HIDE%}
And His throne of glo -- ry share.

}

wordsE = \lyricmode {
\set stanza = "5."

Till that day the Lord will keep
Safe -- ly all His lambs and sheep;
He will guard them night and day,
%{HIDE>%} Keep them walk -- ing in His way, %{<HIDE%}
Keep them walk -- ing in His way.

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
