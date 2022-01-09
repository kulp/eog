\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG317.ily"
}

\header{
  %children
  hymnnumber = "317"
  title = "The Lord Attends When Children Pray"
  tunename = "Brown"
  meter = "C. M."
  poet = "John Burton" % see https://hymnary.org/text/the_lord_attends_when_children_pray
  composer = "William B. Bradbury" % see https://hymnary.org/tune/brown_bradbury
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key c \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 | c4. d8 e4 c | a4. b8 c4
  a4 | g g c e | d2 r4
  g,4 | e'4. d8 c4 e | d4. c8 a4
  c8[ a] | g4 c b d | c2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e4 | e4. f8 g4 g | f4. g8 a4
  f4 | e d g g | g2 r4
  g4 | g4. g8 g4 g | f4. f8 f4
  a8[ f] | e4 e d f | e2.

}
}

notesTenor = {
\global
\relative a {

  c4 | g4. g8 g4 c | c4. c8 c4
  c4 | c4 b c c | b2 r4
  b4 | c4. b8 c4 c | a4. a8 c4
  c4 | c g g g | g2.

}
}

notesBass = {
\global
\relative f {

  c4 | c4. c8 c4 e | f4. f8 f4
  f4 | g g8[ f] e4 c | g'2 r4
  g4 | c,4. d8 e4 c | f4. f8 f4
  f4 | g4 g g, g | c2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

The Lord at -- tends when chil -- dren pray, \bar "."
A whis -- per He can hear; \bar "."
He knows not on -- ly what we say, \bar "."
But what we wish or fear. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

’Tis not e -- nough to bend the knee,
And words of prayer to say;
The heart must with the lips a -- gree,
Or else we do not pray.

}

wordsC = \lyricmode {
\set stanza = "3."

He sees us when we are a -- lone,
Tho’ no one else can see;
And all our thoughts to Him are known, % original has "thot’s"
What -- ev -- er they may be.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
