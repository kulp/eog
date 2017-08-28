\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "106"
  title = "O Christ, in Thee My Soul Hath Found"
  tunename = "None But Christ Can Satisfy" % from Metrical Index of Tunes
  meter = "C. M. with Refrain"
  poet = "B. E. (Arr.)"
  composer = "J. McGranahan"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=32 }

patternAA = { }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  c8[ f8] | a4 a4 a4 f8[ a8] | c4 c4 c4
  c8[ a8] | g4. g8 g4 f8[ g8] | a2.
  c,8[ f8] | a4 a4 a4 f8[ a8] | c4 c4 c4
  c8[ a8] | g4. c8 c8[ b!8] a8[ b8] | c2.

  \eogbreak
  << s^\markup { \small \caps "Refrain" }
  { c4 | c4. c8 c8[ a8] d8[ c8] | c4. bes8 a4 } >>
  f8[ g8] | a4. a8 a8[ c8] bes8[ a8] | g2.
  c,4 | f4. f8 a4. a8 | c8[ a8 bes8] c8 \tb d4 \fermata \ta
  d4 | c8[ a8] bes8[ g8] f4 e4 | f2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c8[ f8] | f4 f4 f4 f8[ a8] | f4 f4 f4
  a8[ f8] | e4. e8 e4 d8[ e8] | f2.
  c8[ f8] | f4 f4 f4 f8[ a8] | f4 f4 f4
  a8[ f8] | e4. e8 f4 f4 | e4( f4 g4)

  g4 | f4. f8 f4 f4 | f4. f8 f4
  f8[ g8] | f4. f8 f8[ a8] g8[ f8] | e2.
  c4 | c4. c8 f4. f8 | f4 f4 f4
  f4 | f4 e4 f4 c4 | c2.

}
}

notesTenor = {
\global
\relative a {

  a4 | c4 d4 c4 a8[ c8] | a4 bes4 c4
  c4 | c4. c8 c4 c4 | c2.
  a4 | c4 d4 c4 a8[ c8] | a4 bes4 c4
  c4 | c4. c8 d4 d8[ g,8] | g4( a4 bes4)

  bes4 | a4. a8 a8[ c8] bes8[ a8] | a4. bes8 c4
  a8[ bes8] | c4. c8 c4 c4 | c2.
  bes4 | a4. a8 c4. c8 | a8[ c8 bes8] a8 bes4
  bes4 | a8[ c8] g8[ bes8] a4 bes4 | a2.

}
}

notesBass = {
\global
\relative f {

  f4 | f4 f4 f4 f4 | f4 g4 a4
  f4 | c4. c8 c4 c4 | f2.
  f4 | f4 f4 f4 f4 | f4 g4 a4
  f4 | g4. g8 g4 g4 | c,2.

  c4 | f4. f8 f4 f4 | f4. f8 f4
  f4 | f4. f8 f4 e8[ f8] | c4 bes'4 a4
  g4 | f4. f8 f4. f8 | f4 f4 bes,4_\fermata
  bes4 | c4 c4 c4 c4 | f2.

}
}

Refrain = \lyricmode {

Now none but Christ can sat -- is -- fy, \bar "."
None oth -- er name for me; \bar "."
There’s love, and life, and last -- ing joy, \bar "."
Lord Je -- sus, found in Thee. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

O Christ, in Thee my soul hath found, \bar "."
And found in Thee a -- lone, \bar "."
The peace, the joy I sought so long, \bar "."
The bliss till now un -- known. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I sighed for rest and hap -- pi -- ness,
I yearned for them, not Thee;
But while I passed my Sav -- iour by,
His love laid hold on me.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

I tried the bro -- ken cis -- terns, Lord,
But, ah, the wa -- ters failed!
E’en as I stooped to drink they fled
And mocked me as I wailed.

}

wordsD = \lyricmode {
\set stanza = "4."

The pleas -- ures lost I sad -- ly mourned,
But nev -- er wept for Thee,
Till grace the sight -- less eyes re -- ceived,
Thy love -- li -- ness to see.

}

underWords = \lyricmode {

{ \repeat unfold 42 { \skip 4 } }
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
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
    >>
    \context Lyrics = five \lyricsto basses \underWords
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
