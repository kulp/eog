\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 5) (#t #f))
}

\header{
  %gospel
  hymnnumber = "375"
  title = "O Soul, Are You Weary"
  tunename = ""
  meter = ""
  poet = "Helen Howarth Lemmel"
  composer = "Helen Howarth Lemmel"
  copyright = \markup { \wordwrap { Copyright 1922. Renewal 1950 by H. H. Lemmel. Assigned to Singspiration, Inc. All rights reserved. Used by permission. } }
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=110
  \key f \major
  \partial 4
  \autoBeamOff
}

patternSopranoVerse = {
  a4 | a gis a | c bes a | a2. | g2
  d4 | f e f | a g c, | a'2. ~ | a4 r
  a8 ~ a | a4 gis a | d c a | a2. | g4 r
  g4 | a( b) c | e, f d | c2. | R1*3/4 |
}

patternSopranoRefrainA = {
  a'2 a4 | c4. a8 g4 | f2. | f4 r
  f4 | bes bes bes | d bes a | g2. ~ | g4 r
}
patternSopranoRefrainB = {
  a8 bes | c2 c4 | c a g | f2 f4 | f4 r
  f8 g | a4. g8 a4 | bes4 a g | f2. ~ | f4 r
}

notesSoprano = {
\global
\relative c'' {

  a4 | a gis a | c bes a | a2. | g2
  d4 | f e f | a g c, | a'2. ~ | \noBreak a4 r
  a8 ~ a | a4 gis a | d c a | a2. | g4 r
  g4 | a( b) c | e, f d | c2. | \noBreak R1*3/4 |

  a'2^\markup { \small \caps "Refrain" } a4 | c4. a8 g4 | f2. | f4 r
  f4 | bes bes bes | d^^ bes a | g2. ~ | g4 r
  a8 bes | c2 c4 | c a g | f2 f4 | f4 r
  f8 g | a4. g8 a4 | bes4 a g | f2. ~ | f4 r

  \bar "|."

}
}

notesLeftHand = {
\global
\relative c' {

  \override NoteHead.font-size = #-4
  \repeat unfold 43 { \skip 4 }
  c2 <b d>4 | << { c4 _~ c e } { e f g } >>
}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternSopranoVerse {
    f | f f f | f f ees | d | d
    d | c c c | e e c | c ~ | c
    f f | f f f | f f f | d | e
    e | f( g) ees | e d b | c
  } | R1*3/4

  \changePitch \patternSopranoRefrainA {
    f f | e e e | f ees
    ees | d d d | d d d
  } | e4( c4 d4 | e4) r4
  \changePitch \patternSopranoRefrainB {
    f f | f f | f f e | d ees | d
    d d | c e f | e e e | f | f
  } r4

}
}

notesTenor = {
\global
\relative a {

  c4 | c b c | a f f | f2( fis4) | g2
  bes4 | a g a | c bes e, | f2. ~ | f4 r
  c'8 ~ c | c4 b c | bes a c | b2. | c4 r
  c4 | c4( d) a | c b f | e2. | s2.

  \changePitch \patternSopranoRefrainA {
    c' c | g c bes | a | a
    a | f f f | f g f |
  } e2( f4 | g4) r4
  \changePitch \patternSopranoRefrainB {
    c c | c c | c c bes | a a | bes
    a bes | f c' c | d c bes | a | a
  } r4
}
}

notesBass = {
\global
\relative f {

  \changePitch \patternSopranoVerse {
    f | f f f | f d c | bes | bes
    bes | c c c | c c c | f, | f
    f' f | f f f | f f f | f | e
    c | f f fis | g g g, |
  } c2. ~ | c

  \changePitch \patternSopranoRefrainA {
    f f | c c c | d c
    f | bes, bes bes | bes bes b | c | c
  } r4
  \changePitch \patternSopranoRefrainB {
    f g | a a | a f c | d c | bes
    d bes | c c c | c c c | <f f,> <f f,>
  } r4

}
}

notesRightHand = {
\global
\relative f {

  \override NoteHead.font-size = #-4
  \repeat unfold 43 { \skip 4 }
  e2 f4 | g4 a c

}
}

Refrain = \lyricmode {

Turn your eyes up -- on Je -- sus, \bar "."
Look full in His won -- der -- ful face; \bar "."
And the things of earth will grow strange -- ly dim \bar "."
In the light of His glo -- ry and grace. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

O soul, are you wear -- y and troub -- led? \bar "." % original has "wea -- ry"
No light in the dark -- ness you see? \bar "."
There’s light for a look at the Sav -- iour, \bar "."
And { \mon } life more { \moff } a -- bun -- dant and free! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Thro’ death in -- to life ev -- er -- last -- ing
He passed, and we fol -- low Him there;
{ \mon } O -- ver { \moff } us sin no more hath do -- min -- ion–
For more than con -- qu’rors we are!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

His word shall not fail you– He prom -- ised;
Be -- lieve Him, and all will be well:
Then go to a world that is dy -- ing,
His { \mon } per -- fect { \moff } sal -- va -- tion to tell!

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
      \context Voice = righthand { \voiceFour << \notesLeftHand >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
      \context Voice = lefthand { \voiceThree << \notesRightHand >> }
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
