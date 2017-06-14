\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  %gospel
  hymnnumber = "108"
  title = "O Precious Blood"
  tunename = "He Leadeth Me"
  meter = "L. M. with Refrain"
  poet = "A. A. P."
  composer = "Wm. B. Bradbury"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternAA = { \ta c2 | c2. c4 c2 c2 | c2 c2 c2 }
patternAB = { \ta c2 | c2. c4 c2 c2 | c2 c2 \tb c2 }

patternBA = { \ta c2 | c2. c4 c2 c4( c4) | c2 c2 c2 }
patternBB = { \ta c2 | c2. c4 c2 c2      | c2 c2 c2 }

patternCA = { \ta c4( c4) | c2 c2 c4( c4) c4( c4) | c2. c4 c2 }
patternCB = { \ta c2      | c2 c2 c2      c2      | c2. c4 c2 }
patternCC = { \ta c2      | c2 c2 c4( c4) c4( c4) | c2. c4 \tb c2 }

patternDA = { \ta c2 | c2 c2 c2 c2 | c2 c4( c4) c2 }
patternDB = { c2 }

patternEA = { \ta c2 | c2 c2 c4( c4) c4( c4) | c2 c2 \tb c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2 % says 3/2 in the original, but this is inconsistent with the music
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { a | fis e d a' | b g g }
  \changePitch \patternBA { b | a fis fis e( d) | fis fis e }
  \changePitch \patternAB { a | fis e d a' | b g d' \fermata }
  \changePitch \patternCA { cis( b) | a fis fis( e) d( e) | fis e d }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternDA { a' | a d cis e | d cis( b) a } >>
  \changePitch \patternEA { b | a fis fis( e) d( e) | fis fis e \fermata }
  \changePitch \patternDA { a | a d cis e | d cis( b) a }
  \changePitch \patternCC { b | a fis fis( e) d( e) | fis e d \fermata }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { fis | d a a d | d d d }
  \changePitch \patternBA { g | fis d d cis( d) | d d cis }
  \changePitch \patternAA { cis | d a a d | d g b }
  \changePitch \patternCA { a( g) | fis d d( cis) b( cis) | d cis d }

  \changePitch \patternDA { fis | fis fis e a | a a( g) fis }
  \changePitch \patternEA { g | fis d d( cis) b( cis) d d cis }
  \changePitch \patternDA { cis | d d e a | a a( g) fis }
  \changePitch \patternCC { g | fis d d( cis) b( cis) | d cis d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { a | a g fis fis | g b b }
  \changePitch \patternBA { d | d a a g( fis) | d fis a }
  \changePitch \patternAA { a | a g fis fis | g b d }
  \changePitch \patternCB { d | d a b fis | a g fis }

  \changePitch \patternDB { a | d a a cis | d d d }
  \changePitch \patternDB { g, | a a b fis | fis d a' }
  \changePitch \patternDA { g | fis a a cis | d g,( b) d }
  \changePitch \patternCB { g, a a b fis | a g fis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { d | d d d d | g g g }
  \changePitch \patternBB { g | d d d d | a a a }
  \changePitch \patternAA { a | d d d d | g g g_\fermata }
  \changePitch \patternCB { g | d d b b | a a d }

  \changePitch \patternDB { d | d fis a g | fis g d }
  \changePitch \patternDB { d | d d b b | a a a_\fermata }
  \changePitch \patternDB { a | d fis a g | fis g d }
  \changePitch \patternCB { d | d d b b | a a d_\fermata }

}
}

Refrain = \lyricmode {

O pre -- cious blood! O liv -- ing way, \bar "."
By which the chief of sin -- ners may, \bar "."
Ac -- cept -- ed stand be -- fore his God! \bar "."
O pre -- cious re -- con -- cil -- ing blood. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

O pre -- cious blood, on Cal -- v’ry shed \bar "."
For sin -- ful souls in tres -- pass dead! \bar "."
O crim -- son flood that makes a path \bar "."
Of sure es -- cape from com -- ing wrath! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

O pre -- cious blood, the peace di -- vine
The cross has pur -- chased now is mine;
No more of judg -- ment then a -- fraid
Since all my guilt on Christ was laid.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

O pre -- cious blood, the sub -- tle foe
Its all pre -- vail -- ing pow’r shall know
As saints o’er -- come him by its might,
And si -- lence ev -- ’ry voice of night.

}

wordsD = \lyricmode {
\set stanza = "4."

O pre -- cious blood, the ran -- somed throng
Ex -- tol its worth in thrill -- ing song;
And seat -- ed on the throne is He
Whose pre -- cious blood a -- toned for me.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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
