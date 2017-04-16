\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 3) (#t #f))
  page-count = ##f
}

\header{
  hymnnumber = "52"
  title = "Hark! Hark! Hear the Glad Tidings"
  tunename = ""
  meter = "P. M."
  %poet = ""
  composer = "German"
  %copyright = ""
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
  %\partial 4
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
  \changePitch \patternAC { d' r | d d r | d d d | d d }
  \changePitch \patternBA { d d d d | b a c | b r }
  \changePitch \patternCA { c r | d r | d r | d r }
  \changePitch \patternBA { d d d d | a fis c' | b r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g r | g r | g fis g | fis d }
  \changePitch \patternAB { d r | d r | d d d | g, r }
  \changePitch \patternAC { g' r | g g r | g fis g | fis d }
  \changePitch \patternBA { d d d d | d d d | g, r }
  \changePitch \patternCA { c r | g' r | fis r | g r }
  \changePitch \patternBA { g d d d | d d d | g r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Hark! hark! hear the glad ti -- dings,
Soon, soon, Je -- sus will come, %{HIDE>%} \set includeGraceNotes = ##t %{<HIDE%}
Robed, robed in hon -- or and glo -- ry,
To gath -- er His ran -- somed ones home.
Yes, yes, O yes,
To gath -- er His ran -- somed ones home.  %{HIDE>%} \set includeGraceNotes = ##f %{<HIDE%}

}

wordsB = \lyricmode {
\set stanza = "2."

% measure bars put on second verse instead of first due to unusual line
% splitting
Joy, joy, sound it more loud -- ly, \bar "."
Sing, sing, glo -- ry to God: \bar "." \break
Soon, soon, Je -- sus is com -- ing,
Pub -- lish the ti -- dings a -- broad. \bar "." \break
Yes, yes, O yes,
Pub -- lish the ti -- dings a -- broad. \bar "." \break

}

wordsC = \lyricmode {
\set stanza = "3."

Now, now, thro’ a glass dark -- ly,
Shine, shine, vi -- sions to come;
Soon, soon, we shall be -- hold Him,
Cloud -- less and bright in our home.
Yes, yes, O yes,
Cloud -- less and bright in our home.

}

wordsD = \lyricmode {
\set stanza = "4."

Long, long, have we been wait -- ing,
Who, who, love His blest name;
Now, now, we are de -- light -- ing,
Je -- sus is near to pro -- claim.
Yes, yes, O yes,
Je -- sus is near to pro -- claim.

}

wordsE = \lyricmode {
\set stanza = "5."

% measure bars put partly on fifth verse due to grace notes
Still, still, rest on the prom -- ise,
Cling, cling, fast to His word;
Wait, wait, if He should %{HIDE>%} \set includeGraceNotes = ##t %{<HIDE%} tar -- ry, \bar "."
We’ll pa -- tient -- ly wait for the Lord.
Yes, yes, O yes, \bar "."
We’ll pa -- tient -- ly wait for the Lord. %{HIDE>%} \set includeGraceNotes = ##f %{<HIDE%}

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \clef bass
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
