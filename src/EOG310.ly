\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG310.ily"
}

\header{
  %children
  hymnnumber = "310"
  title = "Come to Jesus Just Now"
  tunename = ""
  meter = "P. M."
  poet = "Edward P. Hammond" % see https://hymnary.org/text/come_to_jesus_come_to_jesus_come_to_jesu
  composer = "" % see https://hymnary.org/tune/come_to_jesus_come_to_jesus -- but evidence is weak
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f8. g16 | f4 c a'8. bes16 | a4 f
  c'8. d16 | c4 bes a | g2
  a4 | g g8[ a] bes[ g] | a4 a
  f8. a16 | g4 f e | f2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c8. c16 | c4 c f8. f16 | f4 c
  f8. f16 | f4 g f | e2
  f4 | e e8[ f] g[ e] | f4 f
  c8. f16 | d4 c c | c2

}
}

notesTenor = {
\global
\relative a {

  a8. bes16 | a4 a c8. d16 | c4 a
  a8. bes16 | a4 c c | c2
  c4 | c c c | c c
  a8. c16 | bes4 a g | a2

}
}

notesBass = {
\global
\relative f {

  f8. f16 | f4 f f8. f16 | f4 f
  f8. f16 | f4 e f | c2
  f4 | c c c | f f
  f8. f16 | bes,4 c c | f2

}
}

wordsA = \lyricmode {
\set stanza = "1."

Come to Je -- sus, come to Je -- sus, \bar "."
Come to Je -- sus just now; \bar "."
Just now come to Je -- sus, \bar "."
Come to Je -- sus just now. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He will save you, He will save you,
He will save you just now;
Just now He will save you,
He will save you just now.

}

wordsC = \lyricmode {
\set stanza = "3."

Oh, be -- lieve Him, oh, be -- lieve Him,
Oh, be -- lieve Him just now.
Just now, oh, be -- lieve Him,
Oh, be -- lieve Him just now.

}

wordsD = \lyricmode {
\set stanza = "4."

He is a -- ble, He is a -- ble,
He is a -- ble just now;
Just now He is a -- ble,
He is a -- ble just now.

}

wordsE = \markuplist {

\line { He is willing, He is willing, }
\line { { \hspace #2 } He is willing just now; }
\line { Just now He is willing, }
\line { { \hspace #2 } He is willing just now. }

}

wordsF = \markuplist {

\line { Will you trust Him? Will you trust Him? }
\line { { \hspace #2 } Will you trust Him just now? }
\line { Just now will you trust Him? }
\line { { \hspace #2 } Will you trust Him just now? }

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

\noPageBreak

\markup { \fontsize #0.3 \vcenter \column {
  \vspace #1
  \fill-line {
    \null
    \line{ \bold 5 \column { \wordsE } }
    \null
    \line{ \bold 6 \column { \wordsF } }
    \null
  }
} }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
