\include "common/global.ily"
\paper {
  \include "common/paper-additional.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  hymnnumber = "4"
  tunename = "Saved by Grace"
  meter = "L. M. D."
  composer = "Geo. C. Stebbins"
  alternate = \markup { "Alternate tune for No. 144." }
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=140
  \key f \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a8 a bes | a4. g8 c, g' | f4. \bar "."
  f8 e f | bes4. a8 g8. d16 | g4. \bar "."
  a8 a bes | a4. g8 c, g' | f4. \bar "."
  a8 g a | c bes a4. g8 | f4. \bar "."

  a8 a c | c4. d8 a c | c4. \bar "."
  c8 c bes | bes c e4. d8 | c4. \bar "."
  a8 a c | c4. d8 a c | c4. \bar "."
  c8 c f, | f bes a4.^\markup{rit.} g8 | f4. \bar "|." % original has dots after rit.
  % TODO ritard. in MIDI

}
}

notesAlto = {
\global
\relative e' {

  c8 c d | c4. bes8 bes bes | a4.
  a8 g a | d4. c8 b8. b16 | bes4.
  c8 c d | c4. bes8 bes bes | a4.
  c8 bes c | d des c4. bes8 | a4.

  f'8 f a | a4. a8 f a | bes4.
  a8 a g | g a bes4. bes8 | a4.
  f8 f a | a4. a8 f f | e4.
  e8 ees ees | d d c8[ f e] c | c4.


}
}

notesTenor = {
\global
\relative a, {

  r8 r4 | r8 c8[ f] r8 r4 | r8 c8[ f]
  r8 r4 | r8 bes,8[ f'] r8 f4 | e8[ g e]
  r8 r4 | r8 c8[ f] r8 r4 | r8 c8[ f]
  r8 r4 | f8[ g] a[ f e e] | f4.

  c'8 c f | f4. f8 c f | e4.
  c8 c c | c c c4. e8 | f4.
  c8 c f | f4. f8 c a | bes4.
  bes8 a c | bes f f8[ a c] bes | a4.

}
}

notesBass = {
\global
\relative f, {

  r8 r4 | f4. r8 r4 | f4.
  r8 r4 | f4. r8 d'4 | c4.
  r8 r4 | f,4. r8 r4 | f4.
  r8 r4 | bes4 c2 | f,4.

  f'8 f f | f c f f f f | g c, g'
  f8 c c | c c c4. c8 | f4.
  f8 f f | f c f f f f | g c, g'
  g8 f a, | bes bes c4. c8 | f4.

}
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
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
