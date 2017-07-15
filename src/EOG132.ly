\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "132"
  title = "We Have Heard the Joyful Sound"
  tunename = "Jesus Saves"
  meter = "7. 6. 7. 6. 7. 7. 7. 6."
  poet = "Priscilla J. Owens"
  composer = "William Kirkpatrick"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternAA = { c4. c8 | c2. c4 c4. c8 | c1 }
patternAB = { c4. c8 | c2. c4 c4  c4 | c1 }

patternBA = { c4. c8 | c1 c4. c8 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d d | g d g a | b }
  \changePitch \patternBA { d d | d b g | a }
  \changePitch \patternAA { d, d | g d g a | b }
  \changePitch \patternBA { d d | d a b | g }

  \changePitch \patternAA { g g | c c c c | c }
  \changePitch \patternAB { g a | b b d b | a }
  \changePitch \patternAA { d d | d b c d | e }
  \changePitch \patternBA { d d | d a b | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { b b | b b d d | d }
  \changePitch \patternBA { g fis | g d cis | d }
  \changePitch \patternAA { c c | b b d d | d }
  \changePitch \patternBA { d d | fis fis fis | g }

  \changePitch \patternAA { f f | e e g e | g }
  \changePitch \patternAB { g fis | g g d e | fis }
  \changePitch \patternAA { fis fis | g g g f | e }
  \changePitch \patternBA { g g | fis fis fis | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g g | d g g fis | g }
  \changePitch \patternBA { b c | d g, g | fis }
  \changePitch \patternAA { fis fis | g g g fis | g }
  \changePitch \patternBA { g g | a c c | b }

  \changePitch \patternAA { b b | c g c c | e }
  \changePitch \patternAB { d c | d d d cis | d }
  \changePitch \patternAA { c c | b d c b | c }
  \changePitch \patternBA { g b | c c c | b }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { g g | g g b d | g }
  \changePitch \patternBA { g a | b g e | d }
  \changePitch \patternAA { d d | g, g b d | g }
  \changePitch \patternBA { b, b | d d d | g }

  \changePitch \patternAA { g g | c, c e g | c }
  \changePitch \patternAB { b a | g g b g | d }
  \changePitch \patternAA { a' a | g f e d | c }
  \changePitch \patternBA { b g | d' d d | g }

}
}

wordsA = \lyricmode {
\set stanza = "1."

We have heard the joy -- ful sound, \bar "."
Je -- sus saves! Je -- sus saves! \bar "." \eogbreak
Tell the mes -- sage all a -- round, \bar "."
Je -- sus saves! Je -- sus saves! \bar "." \eogbreak
Bear the news to ev -- ’ry land, \bar "."
Climb the steeps and cross the waves; \bar "." \eogbreak
On -- ward! ’tis our Lord’s com -- mand, \bar "."
Je -- sus saves! Je -- sus saves! \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Waft it on the roll -- ing tide,
Je -- sus saves! Je -- sus saves!
Tell to sin -- ners far and wide,
Je -- sus saves! Je -- sus saves!
Sing, ye is -- lands of the sea,
Ech -- o back, ye o -- cean caves;
Earth shall keep her ju -- bi -- lee;
Je -- sus saves! Je -- sus saves!

}

wordsC = \lyricmode {
\set stanza = "3."

Sing a -- bove the bat -- tle strife,
Je -- sus saves! Je -- sus saves!
By His death and end -- less life,
Je -- sus saves! Je -- sus saves!
Sing it soft -- ly thro’ the gloom,
When the heart for mer -- cy craves;
Sing in tri -- umph o’er the tomb,
Je -- sus saves! Je -- sus saves!

}

wordsD = \lyricmode {
\set stanza = "4."

Give the winds a might -- y voice,
Je -- sus saves! Je -- sus saves!
Let the na -- tions now re -- joice,
Je -- sus saves! Je -- sus saves!
Shout sal -- va -- tion full and free,
Through the Lamb of Cal -- va -- ry;
This our song of vic -- to -- ry,
Je -- sus saves! Je -- sus saves!

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
