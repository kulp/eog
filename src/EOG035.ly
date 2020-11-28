\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "35"
  title = "Shall We Gather at His Coming?"
  tunename = "Beautiful River"
  meter = "8. 7. 8. 7. with Refrain"
  poet = ""
  composer = "Robert Lowry" % see https://hymnary.org/tune/shall_we_gather_at_the_river_lowry
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { c4 c4 c8. c16 c8. c16 | c2 c2   }
patternAB = { c4 c4 c8. c16 c8. c16 | c2( c2) }
patternAC = { c4 c4 c8. c16 c8. c16 | c1      }
patternAD = { c4 c4 c8. c16 c8. c16 | c2 c4   }
patternAE = { c4 c4 c8. c16 c8. c16 | c2 c4.  }

patternBA = { c8 c8 | c4 c8[ c8] c4 c8[ c8] | c1 }
patternBB = { c8 c8 | c4 c4      c4 c8[ c8] | c1 }
patternBC = { c8 c8 | c4 c4      c4 c4      | c1 }

patternCA = { c8 | c8. c16 c8. c16 c8. c16 c8[ c8] | c2 c2 }
patternCB = { c8 | c8. c16 c8. c16 c8. c16 c4      | c2 c2 }

patternDA = { c8. c16 c8. c16 c8.[ c16] c8. c16 | c2 c4 }
patternDB = { c8. c16 c8. c16 c4        c8. c16 | c2 c4 }

patternEA = { c4 | c4 c8. c16 c4 c8[ c8] | c1 }
patternEB = { c4 | c4 c8. c16 c4 c4      | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g g g f g aes | bes g }
  \changePitch \patternAB { aes aes aes bes aes g | f bes }
  \changePitch \patternAD { g g g f g aes | bes g }
  \changePitch \patternBA { g aes | f f g aes g f | ees }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAE { c' c ees d ees c | bes g } >>
  \changePitch \patternCA { g^\markup { \dynamic p } | aes g aes g aes g aes f | g bes }
  \changePitch \patternDA { c c c c ees d ees c | bes g }
  \changePitch \patternEA { g | f f g aes g f | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees ees ees ees ees f | g ees }
  \changePitch \patternAC { f f f g f ees | d }
  \changePitch \patternAD { ees ees ees ees ees f | g ees }
  \changePitch \patternBA { ees f | d d ees f ees d | ees }

  \changePitch \patternAE { aes aes aes aes aes aes | g ees }
  \changePitch \patternCA { ees | f ees f ees f ees f d | ees g }
  \changePitch \patternDB { aes aes aes aes aes aes aes | g ees }
  \changePitch \patternEA { ees | d d ees f ees d | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes bes bes aes bes bes | ees bes }
  \changePitch \patternAC { bes bes bes bes bes bes | bes }
  \changePitch \patternAD { bes bes bes aes bes bes | ees bes }
  \changePitch \patternBB { bes bes | bes bes bes bes aes | g }

  \changePitch \patternAE { ees' ees c b c ees | ees bes }
  \changePitch \patternCB { bes | bes bes bes bes bes bes bes | bes ees }
  \changePitch \patternDA { ees ees ees ees c b c ees | ees bes }
  \changePitch \patternEA { bes | bes bes bes bes bes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees ees ees ees ees ees | ees ees }
  \changePitch \patternAC { bes bes bes bes bes bes | bes }
  \changePitch \patternAD { ees ees ees ees ees ees | ees ees }
  \changePitch \patternBC { ees ees | bes bes bes bes | ees }

  \changePitch \patternAE { aes aes aes aes aes aes | ees ees }
  \changePitch \patternCB { ees | bes bes bes bes bes bes bes | ees ees }
  \changePitch \patternDB { aes aes aes aes aes aes aes | ees ees }
  \changePitch \patternEB { ees | bes bes bes bes bes | ees }

}
}

Refrain = \lyricmode {

Yes, we’ll gath -- er at His com -- ing, \bar "."
His glo -- ri -- ous, His glo -- ri -- ous com -- ing, \bar "."
Gath -- er with His saints at His com -- ing, \bar "."
If cleansed by the Sav -- iour’s blood. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Shall we gath -- er at His com -- ing, \bar "."
When the dead in Christ a -- rise? \bar "."
Shall we hear the Sav -- iour call us \bar "."
To His home be -- yond the skies? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Dai -- ly near -- er draws His com -- ing;
This makes all His own re -- joice;
Who are they that fear to meet Him?
Those who now love not His voice.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

When the Sav -- iour at His com -- ing
Shall His own in glo -- ry bring,
Will { \italicsOn } you { \italicsOff } be a -- mong the num -- ber?
Will { \italicsOn } you { \italicsOff } too His prais -- es sing?

}

wordsD = \lyricmode {
\set stanza = "4."

Now be -- fore the Sav -- iour’s com -- ing,
Seek His par -- don free to know;
Be your stains of sin as scar -- let,
He will make you white as snow.

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
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
