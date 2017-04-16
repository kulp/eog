\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "325"
  title = "Suffer Little Children"
  tunename = ""
  meter = "P. M."
  %poet = ""
  composer = "Mrs. Page"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=96 }
tb = { \tempo 4=48 }

patternAA = { c4 c4 c4 c4 | c2 c4 }
patternBA = { c4 | c4 c4 c4 c4 | c2. }
patternCA = { c4 | c4 c4 c4 c4 | c4 c4 c4 }
patternDA = { c4 | c4 c4 c4 c4 | c1 }
patternEA = { c4. c8 c4 c4 | c4 c4 c2 }
patternFA = { c4 c4 c4 c4 | c4 c4 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d fis a b | a fis } \bar "."
  \changePitch \patternBA { fis | e a b gis | a } \bar "." \break
  \changePitch \patternCA { a | d a a a | b d a } \bar "."
  \changePitch \patternDA { fis | a g e a | fis } \bar "." \break
  \changePitch \patternEA { d fis g e | a ais b } \bar "."
  \changePitch \patternFA { b b a fis | g e d } \bar "." \break

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d fis g | fis d }
  \changePitch \patternBA { d | cis e d d | cis }
  \changePitch \patternCA { e | fis fis fis fis | g g fis }
  \changePitch \patternDA { d | e e cis cis | d }
  \changePitch \patternEA { d d cis cis | d d d }
  \changePitch \patternFA { g g fis d | cis cis d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { fis a d d | d a }
  \changePitch \patternBA { a | a a gis b | a }
  \changePitch \patternCA { a | a d d d | d b d }
  \changePitch \patternDA { a | a a a a | a }
  \changePitch \patternEA { fis a a a | fis d' d }
  \changePitch \patternFA { d d d a | a g fis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { d d d g | d d }
  \changePitch \patternBA { d | a cis e e | a, }
  \changePitch \patternCA { cis | d d d d | g g d }
  \changePitch \patternDA { d | cis cis a a | d }
  \changePitch \patternEA { d d e a, | d fis g }
  \changePitch \patternFA { g g d d | a a d }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Suf -- fer lit -- tle chil -- dren,
So kind -- ly Je -- sus said,
And gen -- tly then He placed His hands
Up -- on each lit -- tle head;
Full of ten -- der -- ness and grace,
Love was beam -- ing in His face.

}

wordsB = \lyricmode {
\set stanza = "2."

Come, then lit -- tle chil -- dren,
And lis -- ten to His love,
For He is still the same to -- day,
Tho’ now He dwells a -- bove;
Tho’ your hearts are full of sin,
Je -- sus’ blood can make you clean.

}

wordsC = \lyricmode {
\set stanza = "3."

Hap -- py are the chil -- dren
Who trust in Je -- sus’ name;
Al -- tho’ they can -- not see His face,
He watch -- es o -- ver them.
Safe -- ly on their Shep -- herd’s breast
All His lit -- tle lambs may rest.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
