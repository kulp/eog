\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG212.ily"
}

% dual-time is from http://lilypond.1069038.n5.nabble.com/multiple-timesignatures-tp25914p25915.html
#(define ((dual-time one two denom) grob)
  (grob-interpret-markup grob
    (markup #:override '(baseline-skip . 0) #:number
      (#:line ( (#:column (one denom)) (#:column (two denom)) ) )
    )
  )
)

dualTime = #(define-music-function (parser location num1 num2 denom) (string? string? string?) #{
    \once\override Staff.TimeSignature.stencil = #(dual-time num1 num2 denom)
    \once\revert TimeSignature.break-visibility
#})

\header{
  hymnnumber = "212"
  title = "Christ Returneth"
  tunename = ""
  meter = "P. M. with Refrain"
  poet = "H. L. Turner" % see https://hymnary.org/text/it_may_be_at_morn_when_the_day_is_awakin
  composer = "James McGranahan" % see https://hymnary.org/tune/it_may_be_at_morn_when_the_mcgranahan
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4 % original specifies 4/4 here too -- we specify it inline
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key d \major
  \partial 4
  \autoBeamOff
}

patternA = { c4 | c c c | c'2 c8. c16 | c4 c c | \time 4/4 c c c4 }
patternB = { c4 | \time 3/4 c c c | c4. c8 c4 | c4 c c | \time 4/4 c c c4 }
patternC = { c4 | \time 3/4 c c c | c2 c8. c16 | c4. c8 c4 | c4 c }
patternD = { c8. ~ c16 | c4. c8 c4 | c4( c) c | c2. | }
patternE = { c2  c4 | c c c | c2 c4 | c2 }
patternF = { c8. c16 | c4 c c | c2 c8. c16 | c4 c }
patternG = { c8. c16 | c4 c c8. c16 | c4 c }
patternH = { c4 | c2 c,8. c16 | c4 c c | c2 }
patternI = { c8. ~ c16 | c4. c8 c4 | c2 c4 | c2. | }

notesSoprano = {
\global
\relative c' {

  d4 | fis e d | a'2 b8. a16 | fis4 e d | \time 4/4 fis^! e^! r4
  e4 | \time 3/4 fis fis a | d4. e8 d4 | cis4 d b | \time 4/4 b-! a-! r4
  a4 | \time 3/4 a b cis | d2 cis8. d16 | e4. d8 e4 | fis4 d
  d8. ~ d16 | d4. cis8 b4 | a4( d) cis | d2. |

  \eogbreak
  << s^\markup { \small \caps "Refrain" }
  { a2  fis4 | fis g a | b2 b4 | d2 } >>
  d8. d16 | d4 cis b | a2 cis8. cis16 | d4 d
  cis8. cis16 | d4 d e8. e16 | fis4 d
  cis4 | d2 fis,8.^\markup{\italic rit.} fis16 | a4 g e | d2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  % TODO add accents to alto voice (for MIDI at least)
  \changePitch \patternA { d | d d d | d d d | d d d | d cis r }
  \changePitch \patternB { cis | d d e | fis g fis | e gis gis | a a r }
  \changePitch \patternC { g | fis g g | fis e fis | g fis g | a fis }
  \changePitch \patternI { a a | b a g | fis g | fis }

  \changePitch \patternE { fis d | d cis d | d d | g }
  \changePitch \patternF { g g | b a g | fis e e | fis fis }
  \changePitch \patternG { g g | fis fis a a | a fis }
  \changePitch \patternH { g | fis d d | d e cis | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { fis | a g fis | fis g fis | a g fis | a-! a-! r }
  \changePitch \patternB { a | a a a | b a a | a b d | d-! cis-! r }
  \changePitch \patternC { cis | d d a | a a a | cis d cis | d d }
  \changePitch \patternD { d d | d d d | d( a) a | a }

  \changePitch \patternE { d a | a a a | d d | b }
  \changePitch \patternF { b b | b cis d | d a a | a a }
  \changePitch \patternG { a a | a a cis cis | d a }
  \changePitch \patternH { a | a a a | fis a g | fis }

}
}

notesBass = {
\global
\relative f {

  % TODO add accents to bass voice (for MIDI at least)
  \changePitch \patternA { d | d d d | d d d | d d d | a a r }
  \changePitch \patternB { a | d d cis | b cis d | e e e | a, a r }
  \changePitch \patternC { a | a' g e | d e d | a a a | d d }
  \changePitch \patternI { fis fis | g g g | a a, | d }

  \changePitch \patternE { d d | d e fis | g g | g }
  \changePitch \patternF { g g | g g g | d a' a | d, d }
  \changePitch \patternG { a a | d d a' a | d, d }
  \changePitch \patternH { a | d d d | a a a | d }

}
}

Refrain = \lyricmode {

O Lord Je -- sus, how long? How long \bar "."
Ere we shout the glad song? \bar "."
Christ re -- turn -- eth; \bar "."
Hal -- le -- lu -- jah! hal -- le -- lu -- jah! \bar "."
A -- men, hal -- le -- lu -- jah! A -- men. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

It may be at morn, when the day is a -- wak -- ing, \bar "."
When sun -- light thro’ dark -- ness and shad -- ow is break -- ing, \bar "."
That Je -- sus will come in the full -- ness of glo -- ry, \bar "."
{ \mon } To re -- { \moff } ceive from the world “His own.” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

It may be at mid -- day; it may be at twi -- light;
It may be, per -- chance, that the black -- ness of mid -- night
Will burst in -- to light in the blaze of His glo -- ry,
When Je -- sus re -- ceives “His own.”

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Oh joy! oh de -- light! should we go with -- out dy -- ing,
No sick -- ness, no sad -- ness, no dread and no cry -- ing,
Caught up thro’ the clouds with our Lord in -- to glo -- ry,
When Je -- sus re -- ceives “His own.”

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \dualTime "3" "4" "4"
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
      \dualTime "3" "4" "4"
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
      \context {
        \Staff
        \override TimeSignature.break-visibility = #all-invisible
    }
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.24.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
