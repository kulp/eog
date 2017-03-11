\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "120"
  title = "The Father Sent the Son"
  tunename = "Anywhere With Jesus"
  meter = "6. 6. 8. 4. D. with Refrain."
  poet = "J. G. Deck"
  composer = "D. B. Towner"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternAA = { c4 c2 }

patternBA = { c4 c2 c4 | c2. c2. | c2. ~ c2  }
patternBB = {       c4 | c2. c2. | c2. ~ c2  }
patternBC = {       c4 | c2. c2. | c2. ~ c2. }

patternCA = { c4 c8 c4. | c4 c8 c4. | c4 c8 c4 c8 | c4. ~ c4. }
patternCB = \patternCA % grace notes

patternDA = { c4 c8 c4 c8 | c4 c8 c4 c8 | c4. c4. | c4. ~ c4. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \time 6/4

  \changePitch \patternAA { a | a a b b | a }
  \changePitch \patternBA { fis d e | fis g | a a } \break
  \changePitch \patternAA { g | g fis e fis | g a cis }
  \changePitch \patternBB { b | a g | fis fis } \break

  \changePitch \patternAA { a | a a b b | a }
  \changePitch \patternBA { fis d e | fis g | a a } \break
  \changePitch \patternAA { a | d d d a | cis b a }
  \changePitch \patternBC { g | fis e | d d } \break

  \pageBreak
  \time 6/8

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { e fis g | fis g a | b b a gis | a a  } >> \break
  \changePitch \patternDA { d d d a | cis b a g | fis e | d d }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { fis | fis fis g g | fis }
  \changePitch \patternBA { d d d | d e | fis fis }
  \changePitch \patternAA { e | e d cis d | e e g }
  \changePitch \patternBB { g | fis e | d d }

  \changePitch \patternAA { fis | fis fis g g | fis }
  \changePitch \patternBA { d d d | d e | fis fis }
  \changePitch \patternAA { fis | fis g a fis | a g fis }
  \changePitch \patternBC { e | d cis | d d }

  \changePitch \patternCA { cis d e | d e fis | fis fis e d | cis cis }
  \changePitch \patternDA { fis g a fis | a g fis e | d cis | d d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { d | d d d d | d }
  \changePitch \patternBA { a fis g | a a | d d }
  \changePitch \patternAA { a | a a a a | a cis e }
  \changePitch \patternBB { cis | d cis | d d }

  \changePitch \patternAA { d | d d d d | d }
  \changePitch \patternBA { a fis g | a a | d d  }
  \changePitch \patternAA { d | a a d d | d d d }
  \changePitch \patternBC { b | a g | fis fis }

  \changePitch \patternCB { a a a | a a d | d d cis b | a a  }
  \changePitch \patternDA { a a d d | d d d b | a g | fis fis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { d | d d d d | d }
  \changePitch \patternBA { d d d | d d | d d }
  \changePitch \patternAA { a' | a a a a | a a a }
  \changePitch \patternBB { a | a, a | d d }

  \changePitch \patternAA { d | d d d d | d }
  \changePitch \patternBA { d d d | d d | d d }
  \changePitch \patternAA { d | d e fis d | g g g }
  \changePitch \patternBC { g | a a, | d d }

  %\changePitch \patternCB { a a a \grace { b8[ cis8] } | d d d \grace { e8[ fis8] } | b b e e | a, a }
  a4 a8 \afterGrace a4. { b8[ cis8] } | d4 d8 \afterGrace d4. { e8[ fis8] } | b,4 b8 e4 e8 | a,4. ~ a4.
  \changePitch \patternDA { d e fis d | g g g g | a a, | d d }

}
}

Refrain = \lyricmode {

Look to Christ, sac -- ri -- ficed on the cross for thee: \bar "."
Own Him now, be -- fore Him bow, He’ll set you free! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

The Fa -- ther sent the Son \bar "."
A ru -- ined world to save; \bar "."
Man me -- ted to the Sin -- less One \bar "."
The cross— the grave; \bar "."
Blest Sub -- sti -- tute from God, \bar "."
Wrath’s aw -- ful cup He drained; \bar "."
Laid down His life, and e’en the tomb’s \bar "."
Re -- proach sus -- tained. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The new and liv -- ing Way
Stands o -- pen now to heaven;
Thence, where the blood is seen al -- way,
God’s gift is given.
The riv -- er of His grace
Thro’ right -- eous -- ness sup -- plied,
Is flow -- ing o’er the bar -- ren place
Where Je -- sus died!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

The Lord shall come a -- gain!
The Con -- quer -- or must reign! % "Conquerer" (not "Conqueror") is the spelling in the original
No tongue but shall con -- fess Him then,
The Lamb once slain:
Je -- sus is wor -- thy now
All hom -- age to re -- ceive;
O, sin -- ner, to the Sav -- iour bow,
The truth be -- lieve!

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
