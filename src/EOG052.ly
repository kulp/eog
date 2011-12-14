\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = 3
  page-count = ##f
}

\header{
  title = "Hark! Hark! Hear the Glad Tidings"
  subsubtitle = "(P. M.)"
  %meter = "P.M."
  %poet = ""
  composer = "German"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=70 }
tb = { \tempo 4=35 }

patternAA = { c4 r8 | c4 r8 | c8 c8 c8 | c4 c8 }
patternAB = { c4 r8 | c4 r8 | c8 c8 c8 | c4 r8 }
patternAC = { c4 r8 | c4 \grace c8 r8 | c8 c8 c8 | c4 c8 \grace c16 } % TODO prints a measure bar before last c16
patternBA = { c8 c8 c8 | c8 c8 c8 | c4 r8 }
patternCA = { c4 r8 | c4 r8 | c4 r8 | c4 \grace c8 r8 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 3/8
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { b | b | b a b | d c }
  \changePitch \patternAB { a | a | a g a | b r }
  \changePitch \patternAC { b | b b | b a b | d c a }
  \changePitch \patternBA { a gis a | d c a | g r }
  \changePitch \patternCA { e' | d | c | b b r }
  \changePitch \patternBA { a gis a | d c a | g r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { g | g g d g | b a }
  \changePitch \patternAB { d, | d | d d fis | g r }
  \changePitch \patternAC { g | g g | g d g | b a fis }
  \changePitch \patternBA { fis eis fis | g d fis | g r }
  \changePitch \patternCA { c | b | a | g g r }
  \changePitch \patternBA { fis eis fis | fis d fis | g r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { d | d | d d d | d d }
  \changePitch \patternAB { fis, | fis | fis e fis | g r }
  \changePitch \patternAC { d' | d d | d d d | d d d }
  \changePitch \patternBA { d d d | b a c | b r }
  \changePitch \patternCA { c | d | d | d d r }
  \changePitch \patternBA { d d d | a fis c' | b r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g | g | g fis g | fis d }
  \changePitch \patternAB { d | d | d d d | g, r }
  \changePitch \patternAC { g' | g g | g fis g | fis d d }
  \changePitch \patternBA { d d d | d d d | g, r }
  \changePitch \patternCA { c | g' | fis | g g r }
  \changePitch \patternBA { d d d | d d d | g r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Hark! hark! hear the glad ti -- dings,
Soon, soon, Je -- sus will come,
\set includeGraceNotes = ##t
Robed, robed in hon -- or and glo -- ry,
To gath -- er His ran -- somed ones home.
Yes, yes, O yes,
To gath -- er His ran -- somed ones home.
\set includeGraceNotes = ##f

}

wordsB = \lyricmode {
\set stanza = "2."

% measure bars put on second verse instead of first due to unusual line
% splitting
Joy, joy, sound it more loud -- ly, \bar "."
Sing, sing, glo -- ry to God: \bar "." \break
Soon, soon, Je -- sus is com -- ing, \bar "."
Pub -- lish the ti -- dings a -- broad. \bar "." \break
Yes, yes, O yes, \bar "."
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

Still, still, rest on the prom -- ise,
Cling, cling, fast to His word;
Wait, wait, if He should
\set includeGraceNotes = ##t
tar -- ry,
We’ll pa -- tient -- ly wait for the Lord.
Yes, yes, O yes,
We’ll pa -- tient -- ly wait for the Lord.
\set includeGraceNotes = ##f

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
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

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
