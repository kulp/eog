\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "210"
  title = "Calvary" % see https://hymnary.org/text/on_calvarys_brow_my_savior_died
  tunename = ""
  meter = "P. M. with Refrain"
  poet = "William McKendree Darwood" % see https://hymnary.org/person/Darwood_William
  composer = "John R. Sweney" % see https://hymnary.org/tune/on_calvarys_brow_my_savior_died_sweney
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key bes \major
  \partial 2
  \autoBeamOff
}

patternA = { c16 c8. c16 | c2 ~ c8. c16 c8. c16 | c2 ~ c8. }
patternB = { c16 c8. c16 | c2 ~ c8. c16 c8. c16 | c2. }

patternC = { c4 | c'8. c16 c2 c4 | c8. c16 c2 }
patternD = { c4 | c4. c8 c c c8. c16 | c2 }

patternF = { | r8. c16 c8. c16 c4 r4 | r8. c16 c8. c16 c4 }

smallNotes = \override NoteHead.font-size = #-4
normalNotes = \override NoteHead.font-size = #0

notesSoprano = {
\global
\relative c'' {

  r8.%{^\markup{\italic Moderato. }%} % original has tempo mark but we don't have room or need
  \changePitch \patternA { d c bes | f ~ f d f bes | a ~ a }
  \changePitch \patternA { ees' d c | g g a g f | d d }
  \changePitch \patternA { d' c bes | f f d f bes | g g }
  \changePitch \patternB { ees' d cis | d d bes a c | bes }

  \eogbreak
  << s^\markup { \small \caps "Refrain" }
  { f4^\mf | c'8. b16 c2 d4^\p | bes8. g16 f2^\mf } >>
  f4 | g8 g ees' d c4^\p bes | \slashedGrace a8 c2. \fermata
  \changePitch \patternC { f,^\mf | d' c bes a^\ff | g bes ees }
  g,4^\mf | f4. bes8 a^\markup{\italic rit.} bes^\p d8. c16 | bes2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  r2 | r8. d16 d8. d16 d4 r4 | r8. ees16 ees8. ees16 ees4
  r4 | \changePitch \patternF { ees ees ees ees bes bes bes bes }
  r4 | r8. d16 d8. d16 d4 r4 r8. ees16 ees8. ees16 ees8.
  \changePitch \patternB { g f e | f f f f ees | d }

  \changePitch \patternC { f | ees d ees f | d ees d }
  d4 | ees8 ees g f g4 g | f4. e8 \tb ees4_\fermata \ta
  \changePitch \patternC { f | f ees d f | ees g g }
  \changePitch \patternD { ees | d f f f f ees | d }

}
}

notesTenor = {
\global
\relative a {

  r2 | \changePitch \patternF { bes bes bes bes f f f f }
  r4 | \changePitch \patternF { a a a a f f f f }
  r4 | \changePitch \patternF { bes bes bes bes bes bes bes bes }
  r4 | r8. bes16 bes8. bes16 bes8. d16 c8. a16 | bes2.

  \changePitch \patternC { f | a gis a f | f bes bes }
  bes4 | bes8 bes c bes ees4 c | \slashedGrace c8 a4. bes8 c4
  \changePitch \patternC { f, | bes f f bes | bes bes bes }
  \changePitch \patternD { bes | bes d ees d bes a bes }

}
}

notesBass = {
\global
\relative f, {

  r4 \smallNotes bes4 ~ | bes8. \normalNotes bes16 bes8. bes16 bes4 \smallNotes bes4 | c8. \normalNotes c16 c8. c16 c8.
  \smallNotes c16[ d8. ees16] \normalNotes | \changePitch \patternF { f f f f bes, bes bes bes }
  r4 | \changePitch \patternF { bes bes bes bes ees ees ees ees }
  r4 | r8. f16 f8. f16 f8. f16 f8. f16 | bes,2.

  \changePitch \patternC { f' | f f f f | bes, bes bes }
  bes4 | ees8 ees c d ees4 e | f4. g8 a4_\fermata
  \changePitch \patternC { f | bes, bes bes d | ees ees ees }
  \changePitch \patternD { ees | f f f f f f | < f bes, > }

}
}

Refrain = \lyricmode {

Oh Cal -- va -- ry! dark Cal -- va -- ry! \bar "."
Where Je -- sus shed His blood for me; \bar "."
Oh Cal -- va -- ry! blest Cal -- va -- ry! \bar "."
’Twas there my Sav -- iour died for me. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

On Cal -- v’ry’s brow __ my Sav -- iour died, __ \bar "."
’Twas there my Lord __ was cru -- ci -- fied; __ \bar "."
’Twas on the cross __ He bled for me, __ \bar "."
And pur -- chased there __ my par -- don free. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Mid rend -- ing rocks __ and dark -- ’ning skies, __
My Sav -- iour bows __ His head and dies; __
The o -- pened veil __ re -- veals the way __
To heav -- en’s joys __ and end -- less day.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

O Je -- sus, Lord, __ how can it be __
That Thou shouldst give __ Thy life for me; __
To bear the cross __ and ag -- o -- ny, __
In that dread hour __ on Cal -- va -- ry?

}

underWords = \lyricmode {

{ \repeat unfold 48 \skip 4 }
for me;

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
    \context Lyrics = three \lyricsto altos \underWords
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
