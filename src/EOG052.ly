\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 3) (#t #f))
  page-count = ##f
}

\header{
  %gospel
  hymnnumber = "52"
  title = "Hark! Hark! Hear the Glad Tidings"
  tunename = ""
  meter = "P. M."
  poet = ""
  composer = "German"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=70 }
tb = { \tempo 4=35 }

patternAA = { c4 c8 | c4 c8 | c8 c8 c8 | c4 c8 }
patternAB = { c4 c8 | c4 c8 | c8 c8 c8 | c4 c8 }
patternAC = { c4 c8 | c4 \grace c8 c8 | c8 c8 c8 | c4 c8 }
patternBA = { \grace c16 c8 c8 c8 | c8 c8 c8 | c4 c8 }
patternCA = { c4 c8 | c4 c8 | c4 c8 | c4 c8 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { b r | b r | b a b | d c }
  \changePitch \patternAB { a r | a r | a g a | b r }
  \changePitch \patternAC { b r | b b r | b a b | d c }
  \changePitch \patternBA { a a gis a | d c a | g r }
  \changePitch \patternCA { e' r | d r | c r | b r }
  \changePitch \patternBA { b a gis a | d c a | g r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { g r | g r | g d g | b a }
  \changePitch \patternAB { d, r | d r | d d fis | g r }
  \changePitch \patternAC { g r | g g r | g d g | b a }
  \changePitch \patternBA { fis fis eis fis | g d fis | g r }
  \changePitch \patternCA { c r | b r | a r | g r }
  \changePitch \patternBA { g fis eis fis | fis d fis | g r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { d r | d r | d d d | d d }
  \changePitch \patternAB { fis, r | fis r | fis e fis | g r }
  \changePitch \patternAC { d' r | d \tweak Stem.direction #DOWN d r | d d d | d d }
  \changePitch \patternBA { \tweak Stem.direction #DOWN d d d d | b a c | b r }
  \changePitch \patternCA { c r | d r | d r | d r }
  \changePitch \patternBA { \tweak Stem.direction #DOWN d d d d | a fis c' | b r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g r | g r | g fis g | fis d }
  \changePitch \patternAB { d r | d r | d d d | g, r }
  \changePitch \patternAC { g' r | g \tweak Stem.direction #DOWN g r | g fis g | fis d }
  \changePitch \patternBA { \tweak Stem.direction #DOWN d d d d | d d d | g, r }
  \changePitch \patternCA { c r | g' r | fis r | g r }
  \changePitch \patternBA { \tweak Stem.direction #DOWN g d d d | d d d | g r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Hark! Hark! Hear the glad ti -- dings, \bar "."
Soon, soon, Je -- sus will come, %{HIDE>%} \set includeGraceNotes = ##t %{<HIDE%} \bar "."
Robed, robed, in hon -- or and glo -- ry, \bar "."
To gath -- er His ran -- somed ones home. \bar "."
Yes, yes, oh, yes, to gath -- er His ran -- somed ones home. %{HIDE>%} \set includeGraceNotes = ##f %{<HIDE%} \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Joy, joy, sound it more loud -- ly,
Sing, sing, glo -- ry to God;
Soon, soon, Je -- sus is com -- ing,
Pub -- lish the ti -- dings a -- broad.
Yes, yes, oh, yes, pub -- lish the ti -- dings a -- broad.

}

wordsC = \lyricmode {
\set stanza = "3."

Now, now, thro’ a glass dark -- ly,
Shine, shine, vi -- sions to come;
Soon, soon, we shall be -- hold Him,
Cloud -- less and bright in our home.
Yes, yes, oh, yes, cloud -- less and bright in our home.

}

wordsD = \lyricmode {
\set stanza = "4."

Long, long, have we been wait -- ing,
Who, who, love His blest name;
Now, now, we are de -- light -- ing,
Je -- sus is near to pro -- claim.
Yes, yes, oh, yes, Je -- sus is near to pro -- claim.

}

wordsE = \lyricmode {
\set stanza = "5."

Still, still, rest on the prom -- ise,
Cling, cling, fast to His word;
Wait, wait, if He should %{HIDE>%} \set includeGraceNotes = ##t %{<HIDE%} tar -- ry,
We’ll pa -- tient -- ly wait for the Lord.
Yes, yes, oh, yes, we’ll pa -- tient -- ly wait for the Lord. %{HIDE>%} \set includeGraceNotes = ##f %{<HIDE%}

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
