\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG360.ily"
}

\header{
  %children
  hymnnumber = "360"
  title = "There Is a City Bright"
  tunename = "City Bright"
  meter = "6. 6. 5. 5. 6."
  poet = "Mary Anne S. Gibson Deck" % see https://hymnary.org/text/there_is_a_city_bright_closed_are_its_ga
  composer = "James Sherman Tyler" % see https://hymnary.org/tune/city_bright_tyler
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key g \major
  \autoBeamOff
}

patternA = { c2 c4 c c2 c | c\breve | }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { b d c b a | g }
  \changePitch \patternA { a b d c b | a }
  \changePitch \patternA { b b c d b }
  \changePitch \patternA { a a b c a }
  \changePitch \patternA { g fis g b a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { g g a g fis | g }
  \changePitch \patternA { d g b a g | fis }
  \changePitch \patternA { g g g g g }
  \changePitch \patternA { e e d c e }
  \changePitch \patternA { d d d d c | b }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { d d e d c | b }
  \changePitch \patternA { d d d e e | d }
  \changePitch \patternA { d d a b d }
  \changePitch \patternA { c c gis a c }
  \changePitch \patternA { b c b fis fis | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g b, c d dis | e }
  \changePitch \patternA { fis g g c, cis | d }
  \changePitch \patternA { g g g g g }
  \changePitch \patternA { e e e a, a }
  \changePitch \patternA { d d d d d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

There is a ci -- ty bright, \bar "."
Closed are its gates to sin; \bar "."
Naught that de -- fil -- eth, \bar "."
Naught that de -- fil -- eth, \bar "."
Can ev -- er en -- ter in. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Sav -- iour, I come to Thee!
O Lamb of God, I pray—
Cleanse me and save me,
Cleanse me and save me,
Take all my sins a -- way.

}

wordsC = \lyricmode {
\set stanza = "3."

Lord, make me from this hour,
Thy lov -- ing child to be,
Kept by Thy pow -- er,
Kept by Thy pow -- er,
From all that griev -- eth Thee.

}

wordsD = \lyricmode {
\set stanza = "4."

There in the snow -- y dress
Of Thy re -- deemed I’ll stand,
Fault -- less and stain -- less,
Fault -- less and stain -- less,
Safe in that hap -- py land.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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
