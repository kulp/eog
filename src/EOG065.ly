\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = ##f
}

\header{
  title = "Christ Is the Only Saviour"
  subsubtitle = "(The Lifeboat. P. M.)"
  %meter = "P.M."
  poet = "H. D'A. Champney"
  composer = "P. P. Bliss"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4 c8. c16 c8 c8 c8 c8 | c4 c8. c16 c2 }
patternAB = { c4 c8. c16 c8 c8 c8 c8 | c4 c8  c8  c2 }
patternAC = { c4 c8. c16 c4 c8.  c16 | c4 c8. c16 c2 }
patternAD = { c4 c8. c16 c8 c8 c8 c8 | c8 c8 c8 c8 c2 }
patternAE = { c8 c8 c8. c16 c8 c8 c8 c8 | c4 c8. c16 c2 }

patternBA = { c8 c8 c8 c8 c8 c8 c8 c8 | c4 c8. c16 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d b' c b a b d | g, b b a }
  \changePitch \patternAE { a a a gis a b c d | e d c b } % patternAA in the original, but nonsensical
  \changePitch \patternAB { d, b' c b a b d | g, a b c }
  \changePitch \patternBA { c b a gis a b c e | d fis, fis g }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAC { } >>
  \changePitch \patternAA { }
  \changePitch \patternAD { }
  \changePitch \patternBA { }

  \bar "|."

}
}

notesRightHand = {
\global
\override Stem #'direction = #UP
\relative e' {

r4 < b d g >4 < b d g >4 < b d g >4 | r4 < b d g >4 < a d fis >2
r4 < a d fis >4 < a d fis >4 < a d fis >4 | r4 < c d fis >4 < b d g >2
r4 < b d g >4 < b d g >4 < b d g >4 | r4 < b d f >4 < g c e >2
r4 < c e g >4 < c e g >4 < c e g >4 | r4 < a c d fis >4 < b d g >2

}
}

notesLeftHand = {
\global
\override Stem #'direction = #UP
\clef bass
\relative f, {

< g g' >2. r4 | < g g' >4 r4 < d d' >2 
< d d' >2. r4 | < d d' >4 r4 < g g' >2 
< g g' >2. r4 | < g g' >4 r4 < c, c' >2 
< c c' >2. r4 | < d d' >4 r4 < g g' >2 

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAC { }
  \changePitch \patternAA { }
  \changePitch \patternAD { }
  \changePitch \patternBA { }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAC { }
  \changePitch \patternAA { }
  \changePitch \patternAD { }
  \changePitch \patternBA { }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAC { }
  \changePitch \patternAA { }
  \changePitch \patternAD { }
  \changePitch \patternBA { }

}
}

Refrain = \lyricmode {

}

wordsA = \lyricmode {
\set stanza = "1."

Christ is the on -- ly Sav -- iour might -- y to save,
He who suf -- fered once for sins, and sank neath the wave,
Sing how the wrath of God on Calv’ry’s cross he bore;
How by death He con -- quered death and lives ev -- er -- more.

}

wordsB = \lyricmode {
\set stanza = "2."

Christ in that hour of darn -- ness, lost ones to save,
Brav’d Him -- self the o -- cean depths, and bat -- tled the wave;
Though all Je -- ho -- vah’s bil -- lows rolled o’er His head,
Son of Man and Son of God, He rose from the dead.

}

wordsC = \lyricmode {
\set stanza = "3."

O, what a might -- y Sav -- iour, Je -- sus who died!
Strong e -- nough to bear His own above the an -- gry tide; % a -- bove ?
Not e’en the feeb -- lest saint will Christ ev -- er fail,
Nev -- er will the gates of hell a -- gainst Him pre -- vail.

}

wordsD = \lyricmode {
\set stanza = "4."

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      %\context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context PianoStaff = men <<
      \context Voice  = righthand { \voiceTwo << \notesRightHand >> }
      %\context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = lefthand { \voiceTwo << \notesLeftHand >> }
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
