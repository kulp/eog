\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  systems-per-page = #(cond (is-eogsized 1) (#t #f))
}

\header{
  hymnnumber = "284"
  title = "Jesus, My Lord"
  tunename = ""
  meter = "9. 6. 9. 6."
  poet = "Mrs. A. H. Rule"
  composer = "David Baridon"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  c2 e4 g | a2 f4( a) | c2 c4 a | \afterGrace g1 e4 | % TODO make grace notes sound better in MIDI
  e2 g4 g | d2 d | e1 |
  g2 a4 f | c'( a) g( e) | d2 g4 f | e1 |
  g2 a4 d | c2 b | c1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c2 c4 e | f2 c4( f) | f2 f4 f | \afterGrace e1 c4 |
  c2 c4 c c2 b | c1 |
  e2 f4 c | f2 e4( c) | b2 d4 d | c1 |
  e2 f4 a | g2 f | e1 |

}
}

notesTenor = {
\global
\relative a {

  e2 g4 c | c2 a4( c) | a2 a4 c | \afterGrace c1 g4 |
  g2 g4 g | g2 g | g1 |
  c2 c4 a | a( c) c( g) | g2 g4 g | g1 |
  c2 c4 f | e2 d | c1 |

}
}

notesBass = {
\global
\relative f {

  c2 c4 c | f2 f | f2 f4 f | \afterGrace c1 c4 |
  c2 e4 e | g2 g, | c1 |
  c2 f4 f | f2 c4 ~ c4 | g2 b4 b | c1 |
  c2 f4 f | g2 g | c,1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus, my Lord, who died on the cross, \bar "."
Love -- ly art Thou to me; \bar "."
Sil -- ver and gold– I count them but dross; \bar "."
Naught can com -- pare with Thee. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

What are earth’s joys, so fleet -- ing and vain,
Je -- sus, my Lord, to me!
Sweet -- er by far is the heav -- en -- ly gain;
Love -- ly art Thou to me.

}

wordsC = \lyricmode {
\set stanza = "3."

Storms may as -- sail, my bark may be tossed,
Voy -- ag -- ing o’er life’s sea;
Thou, Lord, art near; I can -- not be lost,
Ref -- uge art Thou to me.

}

wordsD = \lyricmode {
\set stanza = "4."

Je -- sus, my Lord, ’t_was sin’s heav -- y load,
The curse that was borne by Thee;
Stroke up -- on stroke, as God’s wrath a -- woke,
Fell up -- on Thee for me.

}

wordsE = \lyricmode {
\set stanza = "4."

Je -- sus, my Lord, what o -- ceans of love
Stirred in Thy heart for me!
Je -- sus, my Lord, in glo -- ry a -- bove,
Love -- ly art Thou to me.

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

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
