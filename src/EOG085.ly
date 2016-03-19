\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "85"
  title = "Just As Thou Art — Without One Trace"
  tunename = "St. Agnes — Blow"
  meter = "8. 8. 8. 6."
  %poet = ""
  composer = "William Blow"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=90 }
tb = { \tempo 2=45 }

patternAA = { c2 c2 c2 | c1 c2 | c2( c2) c2 | c1 }
patternAB = { c2 c2 c2 | c1 c2 | c1      c2 | c1 }

patternBA = { c2 | c2( c2) c2 | c1 c2 | c1      c2 | c1 }
patternBB = { c2 | c2( c2) c2 | c1 c2 | c2( c2) c2 | c1 }
patternBC = { c2 | c1      c2 | c1 c2 | c1      c2 | c1 }

patternCA = { c2 | c2( c2) c2 | c1 c2 | c1. }
patternCB = { c2 | c1      c2 | c1 c2 | c1. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key e \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { gis a gis | fis fis | fis gis fis | e }
  \changePitch \patternBA { e | e fis gis | a gis | cis fis, | b }
  \changePitch \patternBB { b | b a gis | a a | a gis fis | e }
  \changePitch \patternCA { e | gis fis cis | e dis | e }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { e e e | e e | dis dis | e }
  \changePitch \patternBA { e | e dis d | cis e | e dis | e }
  \changePitch \patternBA { e | e dis e | fis fis | e dis | e }
  \changePitch \patternCB { e | cis cis | b b | b }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b cis b | ais ais | a b a | gis }
  \changePitch \patternBA { gis | gis b b | a b | a b | b }
  \changePitch \patternBC { b | b b | b b | b a | gis }
  \changePitch \patternCA { b | b a fis | gis fis | gis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { e e e | cis cis | b b | cis }
  \changePitch \patternBA { cis | cis b e | a, e' | a a | gis }
  \changePitch \patternBA { gis | gis fis e | dis dis | e b | cis }
  \changePitch \patternCB { gis | a a | b b | e }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Just as thou art— with -- out one trace \bar "."
Of love, or joy or in -- ward grace, \bar "."
Or meet -- ness for the heaven -- ly place— \bar "."
O guilt -- y sin -- ner come ! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Bur -- den’d with guilt, wouldst thou be blest?
Trust not the world; it gives no rest;
Christ brings re -- lief to hearts op -- pressed—
O wea -- ry sin -- ner come!

}

wordsC = \lyricmode {
\set stanza = "3."

Come, leave thy bur -- den at the cross;
Count all thy gains but emp -- ty dross;
His grace o’er -- pays all earth -- ly loss—
O need -- y sin -- ner come!

}

wordsD = \markuplist {

\line { Come, hither bring thy boding fears, }
\line { Thine aching heart, thy bursting tears; }
\line { ’Tis mercy’s voice salutes thine ears; }
\line { O trembling sinner, come! }

}

wordsE = \markuplist {

\line { “The Spirit and the bride say, Come.” }
\line { Rejoicing saints re-echo, “Come.” }
\line { Who faints, who thirsts, who will, may come, }
\line { The Saviour bids thee, Come! }

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

\noPageBreak

\markup {
	\raise #5
	\line { Alternate tune: No. 44. }
}

\noPageBreak

\markup { \fill-line { \column {
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } } %\combine \null \vspace #0.4
} } }

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
