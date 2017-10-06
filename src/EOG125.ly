\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG125.ily"
}

\header{
  %gospel
  hymnnumber = "125"
  title = "Who Shall Give Me Rest?"
  tunename = ""
  meter = "P. M."
  poet = "Russian Hymn"
  composer = "From the Russian"
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

Who shall give me rest? \bar "."
In my grief I cried. \bar "."
Peace I found and hap -- pi -- ness \bar "."
At Je -- sus’ side. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Yea, in Him are found
All my joy and bliss,
Life and light, where all a -- round
But dark -- ness is.

}

wordsC = \lyricmode {
\set stanza = "3."

Now with Him a -- lone
Must my por -- tion be;
He for -- ev -- er as His own
Has pur -- chased me.

}

wordsD = \markuplist {

\line { Hear His loving voice — }
\line { { \hspace #2 } Jesus calleth still, }
\line { Waits with heaven’s divinest joys }
\line { { \hspace #2 } Your heart to fill. }

}

wordsE = \markuplist {

\line { In simplicity }
\line { { \hspace #2 } Yield to Him your heart: }
\line { Bliss with Him eternally }
\line { { \hspace #2 } Shall be your part! }

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

\markup { \column {
  \fill-line { \vcenter \column {
    \vspace #1
    \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
    \line{ \bold 5 \column { \wordsE } }
    \vspace #1
  } }
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
