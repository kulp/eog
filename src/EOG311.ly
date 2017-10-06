\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG311.ily"
}

\header{
  %children
  hymnnumber = "311"
  title = "Children, Can You Tell Me Why?"
  tunename = "Pilot"
  meter = "6—7s."
  poet = ""
  composer = "J. E. Gould"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key bes \major
  \partial 4
  \autoBeamOff
}

% rewrote voices as chords to work around unfortunate interactions between
% \partcombine and \tuplet

notesSoprano = {
\global
\relative c'' {

  d8. c16 | bes4. a8 << { \voiceOne \tuplet 3/2 { c8[ bes] g } } \new Voice { \voiceTwo \tuplet 3/2 { ees4 ees8 } } >> f2
  ees'8. d16 | d4. c8 bes a | bes2
  c8. c16 | c4. f,8 g f | bes2
  c8. c16 | c4. f,8 g f | bes2
  d8. c16 | bes4. a8 << { \voiceOne \tuplet 3/2 { c8[ bes] g } } \new Voice { \voiceTwo \tuplet 3/2 { ees4 ees8 } } >> f2
  ees'8. d16 | d4. c8 bes a | bes2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f8. ees16 | d4. d8 s4 | d2 % s4 stands in for \tuplet 3/2 { ees4 ees8 }
  f8. f16 | g4. g8 f ees | d2
  ees8. ees16 | ees4. ees8 ees ees | d([ g] f4)
  ees8. ees16 | ees4. ees8 ees ees | d([ ees] d4)
  f8. ees16 | d4. d8 s4 | d2 % s4 stands in for \tuplet 3/2 { ees4 ees8 }
  f8. f16 | g4. g8 f ees | d2

}
}

notesTenor = {
\global
\relative a {

  bes8. f16 | f4. fis8 g8. bes16 | bes2
  a8. bes16 | bes4. ees8 d c | bes2
  a8. a16 | a4. a8 bes a | bes8([ ees] d4)
  a8. a16 | a4. a8 bes a | bes8([ g] f4)
  f8. f16 | f4. fis8 g8. bes16 | bes2
  a8. bes16 | bes4. ees8 d c | bes2

}
}

notesBass = {
\global
\relative f, {

  bes8. bes16 | bes4. bes8 bes8. bes16 | bes2
  c8. d16 | ees4. ees8 f f | bes,2
  f'8. f16 | f4. f8 f f | bes,2
  f'8. f16 | f4. f8 f f | bes,2
  bes8. bes16 | bes4. bes8 bes8. bes16 | bes2
  c8. d16 | ees4. ees8 f f | bes,2

}
}

wordsA = \lyricmode {
\set stanza = "1."

Chil -- dren, can you tell me why \bar "."
Je -- sus came to bleed and die? \bar "."
He was hap -- py high a -- bove, \bar "."
Dwell -- ing in His Fa -- ther’s love, \bar "."
Yet He left His joy and bliss, \bar "."
For a wick -- ed world like this. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Chil -- dren, I will tell you why
Je -- sus left His home on high;
He is gra -- cious, full of love,
Kind, and gen -- tle as a dove,
So He would not live a -- lone,
Though He sat up -- on a throne.

}

wordsC = \lyricmode {
\set stanza = "3."

We were all by sin un -- done,
Yet He loved us, ev -- ’ry one;
So to earth He kind -- ly came,
On the cross to bear our shame,
And to wash a -- way our guilt
In the pre -- cious blood He spilt.

}

wordsD = \lyricmode {
\set stanza = "4."

He who for our sins was slain,
Lives and dwells a -- bove a -- gain,
Where He’s wait -- ing to re -- ceive
All who will His love be -- lieve;
This, dear chil -- dren, this is why
Je -- sus came to bleed and die.

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
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
