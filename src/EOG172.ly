\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "172"
  title = "Lamb of God, We Bow Before Thee"
  tunename = "Rousseau"
  meter = "8. 7. 8. 7. 4. 7."
  poet = "Elizabeth Darkey"
  composer = "J. J. Rousseau"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 2/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a2 a4( g) | f2 f | g g | a f |
  c'2 c4( bes) | a2 a | g4( f) g( a) | f1
  a2 a4( bes) | c2 c | d d | c a |
  a2 a4( bes) | c2 c | d d | c1 |
  a2 a4( g) | f2 f | g g | a f |
  c'2 c4( bes) | a2 a | g4( f) g( a) | f1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 e | f c4( f) | f2 e | f c |
  f2 g | f f | e4( f) e2 | f1 |
  f2 f | f f | f f | f f |
  f2 f | e f | f f | e1 |
  c4( f) e2 | f c4( f) | f2 e | f c |
  f2 g | f f | e4( f) e2 | f1 |

}
}

notesTenor = {
\global
\relative a {

  c2 c4( bes) | a2 c | d c | c a |
  c2 c | c c | bes4( a) bes( c) | a1 |
  c2 c | c a | bes bes | a c |
  c2 d | g, a | bes bes | g1 |
  f4( a) c4( bes) | a2 c | d c | c a |
  a4( c) c2 | c c | bes4( a) bes( c) | a1 |

}
}

notesBass = {
\global
\relative f {

  f2 c | d a | bes c | f f |
  a2 e | f a, | c c | f1 |
  f2 f4( g) | a2 f | bes bes, | f' f |
  f2 d | c f | bes bes, | c1 |
  f2 c | d a | bes c | f f |
  a2 e | f a, | c c | f1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Lamb of God, we bow be -- fore Thee, \bar "."
Cal -- vary’s tale cre -- a -- tion awed; \bar "."
Well may Thy re -- deemed a -- dore Thee, \bar "."
While we sound this note a -- broad— \bar "."
Cal -- vary’s Vic -- tim
%{HIDE>%} Cal -- vary’s Vic -- tim %{<HIDE%} \bar "."
Vin -- di -- cates the throne of God. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Rock of A -- ges, rent a -- sun -- der,
Riv -- en ’neath the wrath of God;
Safe with -- in those clefts we won -- der,
While we sound this note a -- broad—
Cal -- vary’s Vic -- tim
%{HIDE>%} Cal -- vary’s Vic -- tim %{<HIDE%}
Re -- con -- ciles our souls to God.

}

wordsC = \lyricmode {
\set stanza = "3."

Sav -- iour God, the al -- tar’s crav -- ing
Thou hast sat -- is -- fied with blood;
Now in heaven, fresh in -- cense wav -- ing,
Sweet -- ly sounds this note a -- broad—
Cal -- vary’s Vic -- tim
%{HIDE>%} Cal -- vary’s Vic -- tim %{<HIDE%}
Fills with joy the heart of God.

}

wordsD = \lyricmode {
\set stanza = "4."

Man of sor -- rows, God of glo -- ry,
Won -- drous path Thy foot hath trod;
Cross and crown re -- hearse the sto -- ry,
Joy -- ous sound this note a -- broad—
Cal -- vary’s Vic -- tim
%{HIDE>%} Cal -- vary’s Vic -- tim %{<HIDE%}
Now a -- dorns the throne of God.

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

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
