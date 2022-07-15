\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  \include "override/override-EOG086.ily"
}

\header{
  %gospel
  hymnnumber = "86"
  title = "Hark! The Saviour’s Voice from Heaven"
  tunename = "Even Me" % see https://hymnary.org/text/hark_the_saviors_voice_from_heaven
  meter = "8. 7. 8. 7. with Refrain"
  poet = "James Montgomery" % see https://hymnary.org/text/hark_the_saviors_voice_from_heaven
  composer = "William B. Bradbury" % see https://hymnary.org/text/hark_the_saviors_voice_from_heaven
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=140 }
tb = { \tempo 4=70  }

patternAA = { \ta c2 c4 }

patternBA = { \ta c2 c4 c2 c4 | c2 c4 c2. }

patternCA = { \ta c2 c4 c2. | c2 c4 \tb c2. \ta }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { b c d g, | c b b a }
  \changePitch \patternBA { a b c a | g fis g }
  \changePitch \patternAA { b c d g, | c b b a }
  \changePitch \patternBA { a b c a | g fis g }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { d' b d | b g b \fermata } >>
  \changePitch \patternBA { b c d g, | b a g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d d d | d d d d }
  \changePitch \patternBA { d d e e | d d d }
  \changePitch \patternAA { d d d d | d d d d }
  \changePitch \patternBA { d d e e | d d d }

  \changePitch \patternCA { g d g | d d g }
  \changePitch \patternBA { d e d e | g fis d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g a b b | a g g fis }
  \changePitch \patternBA { fis g g c | b a b }
  \changePitch \patternAA { g a b b | a g g fis }
  \changePitch \patternBA { fis g g c | b a b }

  \changePitch \patternCA { b g b | d b d }
  \changePitch \patternBA { g, g g g | d' c b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g g g g | fis g d d }
  \changePitch \patternBA { d | g c, c | d d g, }
  \changePitch \patternAA { g' g g g | fis g d d }
  \changePitch \patternBA { d g c, c | d d g, }

  \changePitch \patternCA { g' g g | < g g, > < g g, > < g g, >_\fermata }
  \changePitch \patternBA { g e b c | d d g, }

}
}

Refrain = \lyricmode {

E -- ven thee, e -- ven thee, \bar "."
Bound -- less mer -- cy flows for thee. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Hark! the Sav -- iour’s voice from heav -- en \bar "."
Speak -- ing par -- don full and free; \bar "."
Come, and thou shalt be for -- giv -- en; \bar "."
Bound -- less mer -- cy flows for thee. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

See the heal -- ing foun -- tain spring -- ing
From the Sav -- iour on the tree;
Par -- don, peace and cleans -- ing bring -- ing,
Lost one, loved one, ’tis for thee.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Hear His love and mer -- cy speak -- ing,
Come and trust thy soul with Me;
Though thy heart for sin be break -- ing,
I have rest and peace for thee.

}

wordsD = \lyricmode {
\set stanza = "4."

Ev -- ery sin shall be for -- giv -- en,
Thou, thro’ grace, a child shalt be;
Child of God, and heir of heav -- en,
Yes, a man -- sion waits for thee.

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
    >>
  >>
  \layout {
    \include "common/layout.ily"
    % ameliorate aesthetic spacing oddity caused by bass clef stems
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #3
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
