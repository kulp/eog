\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = ##f
}

\header{
  title = "Come, Weary, Anxious, Laden Soul"
  subsubtitle = "(Troyte. 8. 8. 8. 6.)"
  %meter = "8.8.8.6."
  %poet = ""
  composer = "A. D. H. Troyte"
  %copyright = ""
  tagline = ##f
}

patternA = { c2 c4 c4 | c2. c4 | c2 c2 | c1 } % Line 1, 2, 3
patternB = { c2 c4 c4 | c2 c2  | c1    }      % Line 4

global = {
  %\autoBeamOff
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  % TODO \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 4)
  \once \override Score.MetronomeMark #'transparent = ##t
  \tempo 2 = 86
  \key f \major
  %\partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { a a a       | a a     | a bes | c } 
  \changePitch \patternA { bes bes bes | bes bes | a g   | a } 
  \changePitch \patternA { a a a       | a a     | a g   | f } 
  \changePitch \patternB { g g g       | f e     | f     } 
	\bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { f f f | f f | f e | f } 
  \changePitch \patternA { e e e | e e | f e | f } 
  \changePitch \patternA { f f f | f f | e e | d } 
  \changePitch \patternB { d d d | c c | c   } 

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { c c c       | c c | c c | c } 
  \changePitch \patternA { c c c       | c c | c c | c } 
  \changePitch \patternA { c c c       | c c | a a | a } 
  \changePitch \patternB { bes bes bes | a g | a   } 

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { f f f       | f f | f g     | a } 
  \changePitch \patternA { g g g       | g g | f c     | f } 
  \changePitch \patternA { f f f       | f f | cis cis | d } 
  \changePitch \patternB { bes bes bes | c c | f       } 

}
}

wordsA = \lyricmode {
\set stanza = "1."

  Come, wear -- y, anx -- ious, la -- den soul, \bar "|"
  To Je -- sus come, and be made whole; \bar "|" \break
  On Him your heav -- y bur -- den roll— \bar "|"
  Come, anx -- ious sin -- ner, come! \bar "|"

}

wordsB = \lyricmode {
\set stanza = "2."

  Be -- hold the cross on which He died;
  Be -- hold His wound -- ed, bleed -- ing side:
  Come, in His pre -- cious love con -- fide—
  Come, anx -- ious sin -- ner, come!

}

wordsC = \lyricmode {
\set stanza = "3."

  True joy the world can ne’er af -- ford,
  ’Tis found a -- lone in Christ the Lord,
  In Him for wretch -- ed sin -- ners stored—
  Come, anx -- ious sin -- ner, come!

}

wordsD = \lyricmode {
\set stanza = "4."

  God loves to hear the con -- trite cry,
  He loves to see the tear -- ful eye,
  To read the spir -- it’s deep -- felt sigh—
  Come, anx -- ious sin -- ner, come!

}

wordsE = \lyricmode {
\set stanza = "5."

  O, if to Je -- sus you re -- pair,
  You’ll find e -- ter -- nal com -- fort there,
  And soon shall heav’n -- ly glo -- ry share—
  Come, anx -- ious sin -- ner, come!

}

% TODO: use http://lsr.dsi.unimi.it/LSR/Snippet?id=653

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
