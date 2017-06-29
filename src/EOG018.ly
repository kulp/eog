\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "18"
  title = "How Precious and Pure is the Truth"
  tunename = "De Fleury"
  meter = "8. 8. 8. 8. D."
  poet = ""
  composer = "German"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=70 }
tb = { \tempo 4=35 }

patternAA = { c4.     | c8 c8 c8 c8 c8 c8 | c4. } % All except line 6 tenor
patternAB = { c4( c8) | c8 c8 c8 c8 c8 c8 | c4. } % Line 6 tenor

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d  | g d g b g b | d }
  \changePitch \patternAA { c  | b d b a g a | g }
  \changePitch \patternAA { d  | g d g b g b | d }
  \changePitch \patternAA { c  | b d b a g a | g }

  \changePitch \patternAA { d' | d b d d b d | e }
  \changePitch \patternAA { c  | b c d d c b | a }
  \changePitch \patternAA { d, | g d g b g b | d }
  \changePitch \patternAA { c  | b d b a g a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d   | d d d d d d     | g   }
  \changePitch \patternAA { a   | g b g fis g fis | g   }
  \changePitch \patternAA { d   | d d d d d d     | f   }
  \changePitch \patternAA { a   | g b g fis g fis | g   }

  \changePitch \patternAA { g   | g g g g g g     | g   }
  \changePitch \patternAA { fis | g g g g fis g   | fis }
  \changePitch \patternAA { c   | d d d d d d     | f   }
  \changePitch \patternAA { a   | g b g fis g fis | g   }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b   | b b b b b b | b }
  \changePitch \patternAA { e   | d d d c b c | b }
  \changePitch \patternAA { b   | b b b b b b | b }
  \changePitch \patternAA { e   | d d d c b c | b }

  \changePitch \patternAA { b   | b g b b g b | c }
  \changePitch \patternAB { a d | d d d d d d | d }
  \changePitch \patternAA { a   | b b b b b b | b }
  \changePitch \patternAA { e   | d d d c b c | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g   | g g g g g g | g  }
  \changePitch \patternAA { c,  | d d d d d d | g, }
  \changePitch \patternAA { g'  | g g g g g g | g  }
  \changePitch \patternAA { c,  | d d d d d d | g, }

  \changePitch \patternAA { g'  | g g g g g g | c, }
  \changePitch \patternAA { d   | g a b b a g | d  }
  \changePitch \patternAA { fis | g g g g g g | g  }
  \changePitch \patternAA { c,  | d d d d d d | g,  }

}
}

wordsA = \lyricmode {
\set stanza = "1."

How pre -- cious and pure is the truth! \bar "."
How sim -- ple and love -- ly its words! \bar "." \break
’Tis suit -- ed for age and for youth, \bar "."
As shown in this type of the birds. \bar "." \break
A bird of the air was to die, \bar "."
In -- stead of the lep -- er un -- clean; \bar "." \break
And Je -- sus, whose home was on high, \bar "."
De -- scend -- ed to suf -- fer for sin. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

The bird must be clean of its kind,
Or else ’twere un -- fit to be slain;
And none could in Je -- sus e’er find
A blem -- ish, a spot or a stain.
The bird in a ves -- sel of earth
Must yield up its blood and its breath;
And Je -- sus, of heav -- en -- ly birth,
In form as a man suf -- fered death.

}

wordsC = \lyricmode {
\set stanza = "3."

The blood of the bird that was slain
The liv -- ing one bore to the sky;
So Je -- sus, in ris -- ing a -- gain,
The worth of His blood took on high.
The lep -- er, with blood sev -- en times
Was sprin -- kled to ren -- der him clean;
So sin -- ners are cleansed from their crimes
In blood which a -- toned for their sin.

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
      %\context Lyrics = four  \lyricsto sopranos \wordsD
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
