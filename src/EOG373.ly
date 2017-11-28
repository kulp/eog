\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG373.ily"
}

\header{
  %gospel
  hymnnumber = "373"
  title = "The Master Is Come"
  tunename = "He Hideth My Soul"
  meter = "P. M." % something like 11. 8. 11. 8. 11. 8. 8.
  poet = "W. E. Cullum" % not found at hymnary.org
  composer = "William J. Kirkpatrick" % see https://hymnary.org/tune/a_wonderful_savior_is_jesus_kirkpatrick
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=120
  \key d \major
  \partial 8
  \autoBeamOff
}

patternZ = { c8      | c8. c16 c8 c c c | c8. c16 c8 c4 }
patternA = { c16[ c] | c8. c16 c8 c c c | c8. c16 c8 c4 }
patternB = { c16[ c] | c8. c16 c8 c c c | c4. ~ c4 }
patternC = { c16[ c] | c8. c16 c8 c4 c16 c | c8. c16 c8 c4 }
patternD = { c16[ c] | c8 c c c c c | c4. ~ c4 }
patternE = { c16[ c] | c8. c16 c8 c8. c16 c8 | c4. ~ c4 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternZ { a | a g fis fis e d | b' b b a }
  \changePitch \patternB { a a | a g fis fis g fis | e e }
  \changePitch \patternA { a a | a g fis fis e d | b' b b d }
  \changePitch \patternB { b b | a a a a g e | d d }
  \changePitch \patternC { a' a | cis cis cis cis b cis | d cis b a }
  \changePitch \patternD { a a | g fis g e b' a | fis fis }
  \changePitch \patternC { a a | d d d d d d | e d d d }
  \changePitch \patternB { b b | a a a a a a | a a }
  \changePitch \patternE { b b | a fis d g cis, cis | d d }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternZ { fis | fis e d d d d | g g g fis }
  \changePitch \patternB { fis fis | fis e d d e d | cis cis }
  \changePitch \patternA { g' g | fis e d d d d | g g g g }
  \changePitch \patternB { g g | fis fis d cis cis cis | d d }
  \changePitch \patternC { a' a | g g g g g g | fis a g fis }
  \changePitch \patternD { fis fis | e dis e cis cis cis | d d }
  \changePitch \patternC { fis fis | fis fis fis fis fis fis | g g g g }
  \changePitch \patternB { g g | fis fis fis e fis g } fis4( g8 a4)
  \changePitch \patternE { g g | fis d d cis a a | a a }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternZ { a | a a a a g fis | d' d d d }
  \changePitch \patternB { a a | a a a a a a | a a }
  \changePitch \patternA { cis cis | d a a a g fis | d' d d b }
  \changePitch \patternB { d d | d a fis e e g | fis fis }
  \changePitch \patternC { a a | e' e e e a, a | a a d d }
  \changePitch \patternD { a a | a a a a a a | a a }
  \changePitch \patternC { a a | a a a a a a | b b b b }
  \changePitch \patternB { d d | d d d cis d e } | d4( cis8 d4)
  \changePitch \patternE { d d | d a fis e g g | fis fis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternZ { d | d d d d d d | g, g g d' }
  \changePitch \patternB { d d | d d d d cis d | a a }
  \changePitch \patternA { a a | d d d d d d | g, g g g }
  \changePitch \patternB { g g | a a a a a a | d d }
  \changePitch \patternC { a' a | a a a a a a | d, d d d }
  \changePitch \patternD { d d | a a a a a a | d d }
  \changePitch \patternC { d d | d d d d d d | g g g g }
  \changePitch \patternB { g g | a a a a, a a | } d4( e8 fis4)
  \changePitch \patternE { g, g | a a a a a a | d d }

}
}

wordsA = \lyricmode {
\set stanza = "1."

The Mas -- ter is come. O thou lost one, a -- rise, \bar "."
And hear His soft breath -- ing to you. \bar "."
Oh, list to His voice, He has come from the skies \bar "."
Your soul with His mer -- cies to strew. \bar "."
{ \mon } He has { \moff } come with a balm for the wound -- ed and sore, \bar "."
{ \mon } For the { \moff } wear -- y and bur -- dened be -- low; \bar "."
{ \mon } He has { \moff } come His bright ban -- ner your soul to spread o’er, \bar "."
That you to the Fa -- ther may go, \bar "."
That you to the Fa -- ther may go. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He has come and has shed His own pre -- cious blood,
The lost and the ru -- ined to save; % original has "ruin -- ed"
{ \mon } He has { \moff } shown His great love to His Fa -- ther and God
{ \mon } By ac -- { \moff } cept -- ing the cross and the grave.
{ \mon } O my { \moff } soul, He has come to en -- cir -- cle thee round
{ \mon } With a { \moff } bless -- ing too won -- drous to tell,
And thou shalt for -- ev -- er re -- joice in the sound
That “Je -- sus hath done all things well,”
That “Je -- sus hath done all things well.”

}

wordsC = \lyricmode {
\set stanza = "3."

The Mas -- ter has come, He has gone, and once more
{ \mon } He shall { \moff } come in His glo -- ry a -- gain,
{ \mon } In His { \moff } love to take up His re -- deemed ones be -- fore
His judg -- ments shall fall up -- on men.
The Mas -- ter has come_– He is com -- ing a -- gain_–
He shall in His glo -- ry ap -- pear:
Then bow to Him, man, as the Lamb that was slain,
{ \mon } And His { \moff } love shall cast out ev -- ery fear,
{ \mon } And His { \moff } love shall cast out ev -- ery fear.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      % allow longer-stretching part-combining to fit five systems on this page
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      % allow longer-stretching part-combining to fit five systems on this page
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
    \context {
      \Lyrics
      % Compensate for wide lyrics by squashing things a bit
      \override LyricSpace.minimum-distance = #0.2
      \override LyricText.font-size = #-0.25
    }
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
