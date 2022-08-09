\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "184"
  title = "Oh, Remember" % not found at hymnary.org
  tunename = ""
  meter = "P. M."
  poet = "From the Slovak of Mária Royová" % see https://en.wikipedia.org/wiki/Mária_Royová
  composer = "Mária Royová" % see https://en.wikipedia.org/wiki/Mária_Royová
  tagline = ##f
}

patternA = { d8 e | fis4 fis fis8 g | a4 fis }
patternB = { a8 a | b a g fis fis4 e c }
patternC = { d8. e16 | fis4 fis fis8 g | a4 fis }
patternD = { c8. c16 | \bar "||" \time 4/4 c8 c c8. c16 c8 c c c | c4 c c }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered % original has `c`
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=120
  \key d \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { d e | fis fis fis g | a fis }
  \changePitch \patternB { a a | b a g fis fis e r }
  \changePitch \patternA { e gis b e, e a | cis a }
  \changePitch \patternB { fis d' | cis b a gis e | a r }
  \changePitch \patternC { a a | e' a, a d | fis d }
  \changePitch \patternD { d cis | d b a gis a fis g fis | e d r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d d | d d d e | fis d }
  \changePitch \patternB { fis fis | g fis e d d | cis r }
  \changePitch \patternA { e e | gis e e e | a e }
  \changePitch \patternB { d fis | fis fis e e d | cis r }
  \changePitch \patternC { a' a | g g fis fis | a fis }
  \changePitch \patternD { g g | g g fis eis fis d e d | cis d r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { fis g | a a a a | d a }
  d8 d | d d a a a[ gis] | a4 r
  \changePitch \patternA { gis b | d d cis cis | e cis }
  \changePitch \patternB { a b | e d cis b gis | a r }
  \changePitch \patternC { cis cis | cis cis d d | d a }
  \changePitch \patternD { b ais | b d d d d a a a | a fis r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { d d | d d d d | d d }
  \changePitch \patternB { d d | g d cis d a | a r }
  \changePitch \patternA { e' e | e gis a a | a, a }
  \changePitch \patternB { d b | cis d e e e | a, r }
  \changePitch \patternC { a' e | a, a' d a | d, d }
  \changePitch \patternD { g g | g g d d d d cis d | a d r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Oh, re -- mem -- ber! Oh, re -- mem -- ber! \bar "."
At what price the Sav -- iour bought thee; \bar "."
To re -- deem thee, home to bring thee, \bar "."
From the throne He came and sought thee. \bar "."
Glo -- ry’s splen -- dor He sur -- ren -- dered, \bar "."
Shame de -- spis -- ing for thy priz -- ing— \bar "."
Oh, re -- mem -- ber! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Oh, re -- mem -- ber! Oh, re -- mem -- ber!
What that night thy sins pre -- pared Him,
Deep a -- base -- ment, sore a -- maze -- ment,
Not one tithe of an -- guish spared Him.
Wrath’s a -- wak -- ing— God’s for -- sak -- ing—
Thou didst earn it, He has borne it—
Oh, re -- mem -- ber!

}

wordsC = \lyricmode {
\set stanza = "3."

Oh, re -- mem -- ber! Oh, re -- mem -- ber!
He Him -- self in death has giv -- en
To re -- deem thee, home to bring thee—
Child of wrath— as heir of heav -- en.
From earth’s sor -- row, judg -- ment’s mor -- row,
He has drawn thee, mer -- cy shown thee—
Oh, re -- mem -- ber!

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
