\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG327.ily"
}

\header{
  %children
  hymnnumber = "327"
  title = "When Mothers of Salem"
  tunename = "Salem"
  meter = "P. M."
  poet = "William M. Hutchings" % see https://hymnary.org/text/when_mothers_of_salem_their_children_bro
  composer = "German Melody, arr. by A. Rhodes" % see https://hymnary.org/tune/salem_methfessel
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=130
  \key c \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 | c2 b4 a | g2 g4 g | a g a b | c2 g4 \eogbreak
  g4 | a g f e | a g f e | d4 ~ d g4. g8 | g2. \eogbreak
  g4 | e g g g | a g g
  g4 | e g g g | a g g2 |
  c2 d4 d | e4.( d8) c4 c | d2 c4 b | c2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e4 | e2 g4 f | e2 e4 e | f c c f | e2 e4
  e4 | f c b c | c c b c | b ~ b b4. b8 | b2.
  e4 | c e e e | f e e
  e4 | c e e e | f e e2 |
  g2 f4 f | e4.( f8) g4 g | a2 g4 f | e2.

}
}

notesTenor = {
\global
\relative a {

  c4 | g2 g4 a | c2 c4 c | f, c' c g | g2 c4
  c4 | f, g g g | f g g g | g ~ g g4. g8 | g2.
  g4 | c c c c | c c c
  g4 | g g g g | a g g2 |
  c2 b4 b | c4.( b8) c4 c | c2 e4 d | c2.

}
}

notesBass = {
\global
\relative f {

  c4 | c2 c4 c | c2 c4 c | f e f d | c2 c4
  c4 | f e d c | f e d c | g' ~ g g,4. g8 | g2.
  c4 | c c c c | c c c
  c4 | c c c c | c c c2 |
  e2 g4 g | c,4.( d8) e4 e | f2 g4 g, | c2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

When moth -- ers of Sa -- lem their chil -- dren brought to Je -- sus, \bar "."
The stern dis -- ci -- ples drove them back and bade them de -- part; \bar "."
But Je -- sus saw them ere they fled, \bar "."
And took them in His arms and said, \bar "."
“Suf -- fer the chil -- dren to come un -- to Me.” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“For I will re -- ceive them and fold them to My bos -- om;
I’ll be a shep -- herd to these lambs— oh, { \mon } drive them { \moff } not a -- way;
For if their hearts to Me they give,
They shall with Me in glo -- ry live;
Suf -- fer the chil -- dren to come un -- to Me.”

}

wordsC = \lyricmode {
\set stanza = "3."

How kind was the Sav -- iour to bid these chil -- dren wel -- come!
But there are man -- y thou -- sands who have { \mon } nev -- er { \moff } heard His name;
The Bi -- ble they have nev -- er read;
They know not that the Sav -- iour said,
“Suf -- fer the chil -- dren to come un -- to Me.”

}

wordsD = \lyricmode {
\set stanza = "4."

And still the kind Sav -- iour bids lit -- tle chil -- dren wel -- come,
For Je -- sus’ lov -- ing, ten -- der heart to { \mon } chil -- dren { \moff } is the same;
Tho’ here His voice is no more heard,
From heaven He tells us in His Word,
“Suf -- fer the chil -- dren to come un -- to Me.”

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
