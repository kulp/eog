\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG123.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 7." } }
}

\header{
  %gospel
  hymnnumber = "123"
  title = "The Lamb Was Slain, His Precious Blood" % not found at hymnary.org
  tunename = "Melita" % see https://hymnary.org/tune/melita_dykes
  meter = "6—8s."
  poet = "George W. Frazer"
  composer = "John B. Dykes" % see https://hymnary.org/tune/melita_dykes
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

c2 | e2. e4 g2 g | a a g
g | c d b g | g fis g
d | f!2. f4 e2 e | g2. g4 fis2
b | g fis e a | g fis e
e | e2. e4 f2 f2 | fis2. fis4 g2
g | g a g e | d2. c4 \tb c2 \fermata \ta

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

c2 c2. c4 e2 e | f f e
g2 | g2. fis4 g2. e4 | d2 d d % original has impossible timing for second dotted half (not dotted in original)
b2 | d2. d4 c2 c | e2. e4 d2
fis2 | e2. dis4 e2. fis4 | e2 dis e
b2 | bes2. bes4 a2 c | c2. c4 b2
f'!2 | e d e c | b2. c4 c2

}
}

notesTenor = {
\global
\relative a {

e2 | g2. g4 c2. b4 | a4( b) c( d) e2
d2 | c a b d4( c) | a2 a b
g2 | g2. g4 g2 g | a2. a4 a2
b2 | b a b c | b b g
g2 | g2. g4 f2 a | a2. a4 g2
d'2 | c c c g | f!2. e4 e2

}
}

notesBass = {
\global
\relative f {

c2 | c2. c4 c2 c | f4( g) a( b) c2
b2 | a d, g b,4( c) | d2 d g
g2 | b,2. b4 c2 c | cis2. cis4 d2
dis2 | e fis g a | b b e,
e2 | c2. c4 f2 f | d2. d4 g2
b,2 | c fis, g g | g2. c4 \tb c2_\fermata \ta


}
}

wordsA = \lyricmode {
\set stanza = "1."

The Lamb was slain, His pre -- cious blood \bar "."
On Cal -- vary’s aw -- ful tree was shed; \bar "."
He for the guilt -- y sin -- ner stood, \bar "."
And bore the judg -- ment in his stead. \bar "."
He has made peace, He has made peace, \bar "."
And now He lives, who once was dead. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Pro -- claim -- er of that peace to all,
He tells of full, un -- min -- gled grace,
To high and low, who hear the call,
To old and young, of Ad -- am’s race.
He preach -- es peace, He preach -- es peace,
And love di -- vine shines in His face.

}

wordsC = \lyricmode {
\set stanza = "3."

Be -- hold Him now, ex -- alt -- ed, high,
Up -- on the throne He took His seat;
Oh won -- drous grace that we, brought nigh,
And in Him seat -- ed, are com -- plete!
He is our peace, He is our peace,
For light di -- vine He’s made us meet.

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
