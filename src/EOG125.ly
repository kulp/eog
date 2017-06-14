\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 2) (#t #f))
  system-system-spacing.padding = 11
}

\header{
  %gospel
  hymnnumber = "125"
  title = "Who Shall Give Me Rest?"
  tunename = ""
  meter = "P. M."
  poet = "Russian Hymn"
  composer = "From the Russian"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { c4 c c c | c2. c4 }

patternBA = { c4 c c c | c c c c | c2 c2      | c1 }
patternBB = { c4 c c c | c c c c | c2 c4( c4) | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g g b b | a r }
  \changePitch \patternAA { a a c c | b r }
  \changePitch \patternBA { b b d d | e e d c | b a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d g g | fis r }
  \changePitch \patternAA { fis fis a a | g r }
  \changePitch \patternBA { g g g g | g g g a | g fis | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b b d d | d r }
  \changePitch \patternAA { d d d d | d r }
  \changePitch \patternBB { d d d d | c c d e | d d( c) | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g g g g | d r }
  \changePitch \patternAA { d d fis fis | g r }
  \changePitch \patternBA { g g b b | c c b c | d d, | <g, g'> }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Who shall give me rest?
In my grief I cried.
Peace I found and hap -- pi -- ness at Je -- sus’ side.

}

wordsB = \lyricmode {
\set stanza = "2."

Yea, in Him are found \bar "."
All my joy and bliss, \bar "."
Life and light where all a -- round but dark -- ness is.

}

wordsC = \lyricmode {
\set stanza = "3."

Now with Him a -- lone
Must my por -- tion be;
He for -- ev -- er as His own has pur -- chased me.

}

wordsD = \markuplist {

\line { Hear His loving voice— }
\line { { \hspace #2 } Jesus calleth still, }
\line { Waits with heaven’s divinest } \line { { \hspace #2 } joys your heart to fill. }

}

wordsE = \markuplist {

\line { In simplicity }
\line { { \hspace #2 } Yield to Him your heart: }
\line { Bliss with Him eternally } \line { { \hspace #2 } shall be your part! }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
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

\noPageBreak

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } }
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
