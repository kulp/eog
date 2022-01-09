\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG351.ily"
}

\header{
  %children
  hymnnumber = "351"
  title = "One Door and Only One" % see https://hymnary.org/text/one_door_and_only_one_and_yet_its_sides_
  tunename = ""
  meter = "P. M."
  poet = ""
  composer = "" % see https://hymnary.org/tune/one_door_and_only_one
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \autoBeamOff
}

patternA = { c4 c8. c16 c8. c16 c8. c16 | c8. c16 c8. c16 c2 | }
patternB = { c4 c8. c16 c4 c8. c16 | c4 c8. c16 c2 | }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { g d d g g d d | g a b c d | }
  \changePitch \patternB { e c e d b g | b a b a | }
  \changePitch \patternA { g d d g g d d | g a b c d | }
  \changePitch \patternB { e-> c e d b g | b b a g | }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d d d d d d d | d d g g g | }
  \changePitch \patternB { g g g g g g | g e e fis | }
  \changePitch \patternA { d d d d d d d | d fis g a b | }
  \changePitch \patternB { c g c b g g | g g fis g | }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { b b b b b b b | b c d d d | }
  \changePitch \patternB { c c c b d d | d cis cis d | }
  \changePitch \patternA { b b b b b b b | b d d d d | }
  \changePitch \patternB { c e c d d e | d d c b | }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g g g g g g g | g g g a b | }
  \changePitch \patternB { c c, c g' g g | g a a d, | }
  \changePitch \patternA { g g g g g g g | g d g g g | }
  \changePitch \patternB { c c c g g c, | d d d g | }

}
}

wordsA = \lyricmode {

One door and on -- ly one, \bar "."
And yet its sides are two— \bar "."
In -- side and out -- side; \bar "."
On which side are you? \bar "."

One door and on -- ly one, \bar "."
And yet its sides are two. \bar "."
I’m on the in -- side; \bar "."
On which side are you? \bar "."

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
