\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "118"
  title = "Softly and Tenderly"
  tunename = ""
  meter = "P. M."
  poet = "Will L. Thompson"
  composer = "Will L. Thompson"
  tagline = ##f
}

ta = { \tempo 8=120 }
tb = { \tempo 8=60 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \autoBeamOff
}

patternA = { c8. bes16 aes8 aes g aes | bes aes f f ees c | }
patternB = { aes8 aes aes c8. bes16 aes8 | bes4. ~ bes4 c8 | }
patternC = { aes8 aes des c8. aes16 bes8 | aes4. ~ aes4 }

notesSoprano = {
\global
\relative c'' {

  c8. bes16 aes8 aes g aes | bes aes f f ees r |
  aes8 aes aes c8. bes16 aes8 | bes4. ~ bes4 r8 |
  c8. bes16 aes8 aes g aes | bes aes f f ees r |
  aes8 aes des c8. aes16 bes8 | aes4. ~ aes4

  \eogbreak
  << s^\markup { \small \caps "Refrain" }
  { ees8 | bes'4. ~ bes4 c8 | aes4( bes8 c4.) } >>
  bes8 bes bes8. c16 c8. d16 | \tb ees4( \fermata d8 \fermata des4) \fermata r8 |
  \ta c8. bes16 aes8 aes g aes | bes aes f f ees r |
  aes16 aes8. \tb des8 \fermata \ta c16 \tb aes8. \fermata bes8 \fermata \ta | aes4. ~ aes4 r8 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { ees des c ees des c | des des des des c r }
  \changePitch \patternB { ees ees ees d d d | ees ees r }
  \changePitch \patternA { ees des c ees des c | des des des des c r }
  \changePitch \patternC { ees ees f ees c des | c c }

  r8 | r4 g'8 g4 r8 | r4 g8 aes4. |
  g8 g bes8. a16 a8. aes16 | g4( aes8 bes4) r8 |
  \changePitch \patternA { ees, des c ees des c | des des des des c r }
  ees16 ees8. f8 ees16 c8. des8 | c4. ~ c4 r8 |

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { aes aes aes aes ees ees | f f aes aes aes r }
  \changePitch \patternB { c c c aes aes bes | g g r }
  \changePitch \patternA { aes aes aes aes ees ees | f f aes aes aes r }
  \changePitch \patternC { aes aes aes aes aes g | aes aes }

  r8 | r4 des8 des4 ees8 | c4( ees8 ees4.) |
  ees8 ees ees8. ees16 ees8. bes16 | bes4( bes8 ees4) r8 |
  \changePitch \patternA { aes, aes aes aes ees ees | f f aes aes aes r }
  aes16 aes8. aes8 aes16 aes8. g8 | aes4. ~ aes4 r8

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { aes aes aes c bes aes | des des des aes aes r }
  \changePitch \patternB { aes' aes aes f f f | ees ees r }
  \changePitch \patternA { aes, aes aes c bes aes | des des des aes aes r }
  \changePitch \patternC { c c des ees ees ees | aes, aes }

  r8 | r4 ees'8 ees4 r8 | r4 ees8 aes4. |
  bes8 bes g8. f16 f8. bes16 | ees,4( \fermata f8 \fermata g4) \fermata r8 |
  \changePitch \patternA { aes, aes aes c bes aes | des des des aes aes r }
  c16 c8. des8 \fermata ees16 ees8. \fermata ees8 \fermata | aes,4. ~ aes4 r8

}
}

Refrain = \lyricmode {

Come home, come home, \bar "."
Ye who are wear -- y, come home; \bar "."
Ear -- nest -- ly, ten -- der -- ly, Je -- sus is call -- ing, \bar "."
Call -- ing, O sin -- ner, come home! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Soft -- ly and ten -- der -- ly Je -- sus is call -- ing, \bar "."
Call -- ing for you and for me; \bar "."
Pa -- tient -- ly Je -- sus is wait -- ing and watch -- ing, \bar "."
Watch -- ing for you and for me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Why should we tar -- ry when Je -- sus is plead -- ing,
Plead -- ing for you and for me?
Why should we lin -- ger and heed not His mer -- cies,
Mer -- cies for you and for me?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

O! for the won -- der -- ful love He has prom -- ised,
Prom -- ised for you and for me;
Tho’ we have sinned, He has mer -- cy and par -- don,
Par -- don for you and for me.

}

underWords = \lyricmode {

{ \repeat unfold 36 { \skip 4 } }
Come home, come home,

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
      \context Lyrics = three \lyricsto altos \underWords
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
