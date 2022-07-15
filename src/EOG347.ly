\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG347.ily"
}

\header{
  %children
  hymnnumber = "347"
  title = "Jesus, When He Left the Sky" % hymnary.org has "Little Ones Like Me"
  tunename = ""
  meter = "7. 7. 7. 5."
  poet = "" % see https://hymnary.org/text/jesus_when_he_left_the_sky
  composer = "" % not found at hymnary.org
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a2 c bes a | g2. a4 f1 |
  g2 a bes a | a2. g4 g1 |
  a2 c d c | c bes f( g) |
  a2. f4 a2 g | f\breve % original has f1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 f f f | e2. e4 f1 |
  g2 f e f | f2. f4 e1 |
  f2 f f f | f f f1 |
  f2. f4 e2 e | f\breve |

}
}

notesTenor = {
\global
\relative a {

  c2 a d c | bes2. c4 a1 |
  c2 c c c | b2. b4 c1 |
  c2 a bes a | ees' d d1 |
  c2. a4 c2 bes | a\breve |

}
}

notesBass = {
\global
\relative f {

  f2 f f f | c2. c4 f1 |
  e2 f g f | g2. g4 c,1 |
  f2 f f f | bes, bes bes2( b) |
  c2. c4 c2 c | f\breve |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus, when He left the sky, \bar "."
And for sin -- ners came to die, \bar "."
In His mer -- cy passed not by \bar "."
Lit -- tle ones like me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Moth -- ers then the Sav -- iour sought,
In the pla -- ces where He taught,
And to Him their chil -- dren brought—
Lit -- tle ones like me.

}

wordsC = \lyricmode {
\set stanza = "3."

Did the Sav -- iour say them nay?
No; He kind -- ly bade them stay—
Suf -- fered none to turn a -- way
Lit -- tle ones like me.

}

wordsD = \lyricmode {
\set stanza = "4."

’Twas for them His life He gave,
To re -- deem them from the grave:
Je -- sus a -- ble is to save
Lit -- tle ones like me.

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
