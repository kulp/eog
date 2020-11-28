\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "377"
  title = "“Revive Thy Work, O Lord!”"
  tunename = "Festal Song"
  meter = "S. M."
  poet = "Albert Midlane" % see https://hymnary.org/text/revive_thy_work_o_lord_thy_mighty_arm
  composer = "William H. Walter" % see https://hymnary.org/tune/festal_song_walter
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key bes \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f2 | bes f d f | g1.
  f2 | g4( a) bes2 a g | f1. \eogbreak
  c'2 | d c4( d) ees2 d | c bes a
  f2 | g4( a) bes2 bes a | bes1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 | bes f d d | ees1.
  d2 | ees f f e | f1.
  f2 | f f ees f | g g f
  f2 | ees f f ees | d1.

}
}

notesTenor = {
\global
\relative a {

  f2 | bes f d bes' | bes1.
  bes2 | bes4( c) d2 c bes | a1.
  a2 | bes c bes bes | ees d c
  bes2 | bes4( c) d2 c c | bes1.

}
}

notesBass = {
\global
\relative f {

  f2 | bes f d bes | ees1.
  bes2 | ees bes c c | f1.
  f2 | bes a g f | ees e f
  d2 | ees d4( ees) f2 f | bes,1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Re -- vive Thy work, O Lord!” \bar "."
Thy might -- y arm make bare; \bar "."
Speak with the voice which wakes the dead, \bar "."
And make Thy peo -- ple hear. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“Re -- vive Thy work, O Lord!”
Cre -- ate soul -- thirst for Thee;
And hung -- { \mon } er -- ing { \moff } for the bread of life,
Oh, may our spir -- its be!
}

wordsC = \lyricmode {
\set stanza = "3."

“Re -- vive Thy work, O Lord!”
Ex -- alt Thy pre -- cious name;
And, by the Ho -- ly Ghost, our love
For Thee and Thine in -- flame.

}

wordsD = \markuplist {

\line { “Revive Thy work, O Lord!” }
\line { { \hspace #2 } Give power unto Thy Word, }
\line { Grant that Thy blessèd gospel may }
\line { { \hspace #2 } In living faith be heard. }

}

wordsE = \markuplist {

\line { “Revive Thy work, O Lord!” }
\line { { \hspace #2 } And give refreshing showers; }
\line { The glory shall be all Thine own, }
\line { { \hspace #2 } The blessing, Lord, be ours! }

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

\markup { \fontsize #0.3 \vcenter \column { \vspace #1 \fill-line {
  \null
  \line{ \bold 4 \column { \wordsD } }
  \null
  \line{ \bold 5 \column { \wordsE } }
  \null
  }
  \vspace #1
  \fill-line { \line { Alternate tune: No. 169. } }
} }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
