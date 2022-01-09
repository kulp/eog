\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  \include "override/override-EOG057.ily"
}

\header{
  %gospel
  hymnnumber = "57"
  title = "Almost Persuaded"
  tunename = ""
  meter = "P. M."
  poet = "Philip P. Bliss" % see https://hymnary.org/text/almost_persuaded_now_to_believe_almost_p
  composer = "Philip P. Bliss" % see https://hymnary.org/tune/almost_persuaded_bliss
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4.   c4 c8 | c4. c4. }
patternAB = { c4 c8 c4 c8 | c4. c4. }
patternAC = { c4. \tb c4 \ta c8 | c4. c4. }
patternBA = { c4. c4 c8 | c4 c8 c4. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { b c c | b g | g a a | b ~ b }
  \changePitch \patternAA { b c c | b g | a b a | g ~ g }
  \changePitch \patternBA { c c c | c b b }
  \changePitch \patternBA { d a c | c b b }
  \changePitch \patternBA { g g g | g a b }
  \changePitch \patternAC { b b \fermata a | g ~ g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d e e | d b | e fis fis | g ~ g }
  \changePitch \patternAA { d e e | d b | d d c | b ~ b }
  \changePitch \patternBA { e e e | e d d }
  \changePitch \patternBA { fis fis a | a g g }
  \changePitch \patternBA { b, c d | e e d }
  \changePitch \patternAB { d( g) fis fis | g ~ g }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g g g | g g | b d d | d ~ d }
  \changePitch \patternAA { g, g g | g g | fis g fis | g ~ g }
  \changePitch \patternBA { g g g | g g g }
  \changePitch \patternBA { a d d | d d d }
  \changePitch \patternBA { g, g g | g g g }
  \changePitch \patternAB { g( b) d c | b ~ b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g g g | g g | e d d | g ~ g }
  \changePitch \patternAA { g g g | g g | d d d | g, ~ g }
  \changePitch \patternBA { c c e | g g g }
  \changePitch \patternBA { d d fis | g g g }
  \changePitch \patternBA { g, a b | c c g }
  \changePitch \patternAC { d' d_\fermata d | g, ~ g }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Al -- most per -- suad -- ed” now to be -- lieve; \bar "."
“Al -- most per -- suad -- ed” Christ to re -- ceive; \bar "."
Seems now some soul to say, \bar "."
“Go, Spir -- it, go Thy way, \bar "."
Some more con -- ve -- nient day \bar "."
On Thee I’ll call.” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“Al -- most per -- suad -- ed,” come, come to -- day;
“Al -- most per -- suad -- ed,” turn not a -- way;
Je -- sus in -- vites you here,
List to His voice so clear
Now fall -- ing on thine ear;
“Come, wan -- derer, come!”

}

wordsC = \lyricmode {
\set stanza = "3."

“Al -- most per -- suad -- ed,” har -- vest is past!
“Al -- most per -- suad -- ed,” doom comes at last!
“Al -- most” can -- not a -- vail;
“Al -- most” is but to fail!
Sad, sad, that bit -- ter wail—
“Al -- most”— but lost!

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
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
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
