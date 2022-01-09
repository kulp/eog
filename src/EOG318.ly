\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "318"
  title = "Jesus Will Bless the Little Ones" % see https://hymnary.org/text/the_infant_children_christ_received
  tunename = ""
  meter = "C. M. with Refrain"
  poet = "John" % This abbreviated name is not a mistake -- multiple printings of the old EOG have "JOHN." as the poet.
  composer = "John G. Foote" % see https://hymnary.org/tune/the_infant_children_christ_receiv_foote
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 8
  \autoBeamOff
}

patternA = { \ta c8 | c4 c8 c4 c8 | c4 c8 c4 }
patternB = { \ta c8 | c4 c8 c4 c8 | c4. ~ c4 c8 }
patternC = { \ta c8 c c c4 c8 | c4 c8 c4. }
patternD = { \ta c8 c c c4 c8 | c4 c8 \tb c4.\fermata \ta }
patternE = { \ta c4. c4 c8 | c4 c8 c4. }
patternF = {     c8 c c c4 c8 | c4 c8     c4._\fermata }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { g | g g g ees | f g ees }
  \changePitch \patternB { g | bes bes bes f | g g } \eogbreak
  \changePitch \patternA { g | g g g ees | f g ees }
  \changePitch \patternB { f | g ees f f | ees ees r } \eogbreak

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternC { bes' bes bes g bes | bes aes aes } >>
  \changePitch \patternC { aes aes aes f aes | aes g g } \eogbreak
  \changePitch \patternD { bes bes bes g g | aes bes c }
  \changePitch \patternE { ees bes g | g f ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { ees | ees ees ees ees | d d ees }
  \changePitch \patternB { ees | d d d d | ees ees }
  \changePitch \patternA { ees | ees ees ees ees | d d c }
  \changePitch \patternB { c | ees bes d d | ees ees r }

  \changePitch \patternC { g g g ees g | g f f }
  \changePitch \patternC { f f f d f | f ees ees }
  \changePitch \patternD { g g g ees ees | ees ees ees }
  \changePitch \patternE { aes g ees | d d ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes | bes bes bes g | aes bes g }
  \changePitch \patternB { bes | bes f f bes | bes bes }
  \changePitch \patternA { bes | bes bes bes g | aes bes g }
  \changePitch \patternB { aes | ees g aes aes | g g r }

  \changePitch \patternC { ees' ees ees bes bes | bes bes bes }
  \changePitch \patternC { bes bes bes bes bes | bes bes bes }
  \changePitch \patternF { ees ees ees bes bes | aes g aes }
  \changePitch \patternE { c ees bes | bes aes g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { ees | ees ees ees ees | bes bes ees }
  \changePitch \patternB { ees | bes bes bes bes | ees ees }
  \changePitch \patternA { ees | ees ees ees ees | bes bes c }
  \changePitch \patternB { aes | bes bes bes bes | ees ees r }

  \changePitch \patternC { ees ees ees ees ees | bes bes bes }
  \changePitch \patternC { bes bes bes bes bes | ees ees ees }
  \changePitch \patternF { ees ees ees ees ees | c bes aes }
  \changePitch \patternE { aes' bes bes | bes, bes | ees }

}
}

Refrain = \lyricmode {

Je -- sus will bless the lit -- tle ones, \bar "."
Je -- sus will bless the lit -- tle ones, \bar "."
Je -- sus will bless the lit -- tle ones, \bar "."
Oh, praise His pre -- cious name. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

The in -- fant chil -- dren Christ re -- ceived, \bar "."
Oh, praise His pre -- cious name; \bar "."
He took them up in -- to His arms, \bar "."
He blessed each babe that came. \bar "." % blue book has "blest" but that is adjectival only (past participle, not past tense verb)

}

wordsB = \lyricmode {
\set stanza = "2."

An aw -- ful warn -- ing Je -- sus gave,
To those who would of -- fend;
Let none de -- spise these lit -- tle ones,
God cares for all of them.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Go, gath -- er in these lit -- tle ones
From off the field of sin:
The har -- vest great, the la -- b’rers few,
Then bring, oh, bring them in.

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
