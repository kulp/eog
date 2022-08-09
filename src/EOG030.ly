\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "30"
  title = "Passing Onward, Quickly Passing"
  tunename = "Zion" % see https://hymnary.org/tune/zion_hastings
  meter = "8. 7. 8. 7. 4. 7. 4. 7." % original has 8. 7. 8. 7. 4. 7.
  poet = "Albert Midlane" % see https://hymnary.org/text/passing_onward_quickly_passing
  composer = "Thomas Hastings" % see https://hymnary.org/tune/zion_hastings
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8. c16 | c4 c4 c8. c16 | c4 c4 }

patternBA = { c8. c16 | c8. c16 c4 c4 | c2 }
patternBB = { c4 | \once \override MultiMeasureRest.staff-position = #-8 R1*3/4 | c2 }

patternCA = { c8. c16 | c4 c4 }
patternCB = { c4 | c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { a a | a fis d' a | b a }
  \changePitch \patternBA { d d | e e d cis  | d   }
  \changePitch \patternAA { a a | a fis d' a | b a }
  \changePitch \patternBA { d d | e e d cis  | d   }

  \changePitch \patternCA { fis, fis | fis d     }
  \changePitch \patternBA { fis fis  | e e d cis | d   }
  \changePitch \patternCA { a' a     | a fis     }
  \changePitch \patternBA { a a      | g g fis e | fis }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { fis fis | fis d fis fis | g fis }
  \changePitch \patternBA { a a     | g g fis e     | fis   }
  \changePitch \patternAA { fis fis | fis d fis fis | g fis }
  \changePitch \patternBA { a a     | g g fis e     | fis   }

  \changePitch \patternCB { r       | r         }
  \changePitch \patternBB { r       |           | r } % middle rest is explicit in patternBB
  \changePitch \patternCA { fis fis | fis d     }
  \changePitch \patternBA { fis fis | e e d cis | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { d d | d a a d | d d }
  \changePitch \patternBA { d d | b b a a | a   }
  \changePitch \patternAA { d d | d a a d | d d }
  \changePitch \patternBA { d d | b b a a | a   }

  \stemUp % prevent note/rest collision
  \changePitch \patternCA { a a  | a fis     }
  \changePitch \patternBA { a a  | g g fis e | fis }
  \changePitch \patternCA { d' d | d a       }
  \changePitch \patternBA { d d  | b b a a   | a   }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { d d | d d d d | g d }
  \changePitch \patternBA { fis fis | g g a a, | d }
  \changePitch \patternAA { d d | d d d d | g d }
  \changePitch \patternBA { fis fis | g g a a, | d }

<<
  { b4 \rest | b2 \rest }
\\
  \override NoteHead.font-size = #-4 { \skip 4 | d,2 ~ }
>>

<<
  % TODO find extra-offset such that eogsized and letter both have aesthetic rest placement
  { b'4 \rest | \once \override Rest.extra-offset = #'(15 . 0) b1*3/4 \rest | \once \override Rest.extra-offset = #'(1.7 . 0) b2 \rest }
\\
  \override NoteHead.font-size = #-4 { d,4 g4 a4 a4 | d4 d,4 }
>>

  \changePitch \patternCA { d' d | d d }
  \changePitch \patternBA { d d | g g a a, | d }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Pass -- ing on -- ward, quick -- ly pass -- ing, \bar "."
Yes, but whith -- er, whith -- er bound? \bar "."
Is it to the man -- y man -- sions \bar "."
Where e -- ter -- nal rest is found? \bar "." \break
Pass -- ing on -- ward— \bar "."
Yes, but whith -- er, whith -- er bound? \bar "."
Pass -- ing on -- ward— \bar "."
Yes, but whith -- er, whith -- er bound? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Pass -- ing on -- ward, quick -- ly pass -- ing,
Naught the wheels of time can stay;
Sweet the thought that some are go -- ing
To the realms of per -- fect day;
Pass -- ing on -- ward—
Christ their lead -- er, Christ their way.
Pass -- ing on -- ward—
Christ their lead -- er, Christ their way.

}

wordsC = \lyricmode {
\set stanza = "3."

Pass -- ing on -- ward, quick -- ly pass -- ing,
Man -- y on the down -- ward road;
Care -- less of their souls im -- mor -- tal,
Heed -- ing not the call of God,
Pass -- ing on -- ward—
Tramp -- ling on the Sav -- iour’s blood.
Pass -- ing on -- ward—
Tramp -- ling on the Sav -- iour’s blood.

}

wordsD = \lyricmode {
\set stanza = "4."

Pass -- ing on -- ward, quick -- ly pass -- ing,
Time its course will quick -- ly run;
Still we hear the fond en -- treat -- y
Of the ev -- er -- gra -- cious One—
“Come and wel -- come,
’Tis by { \italicsOn } Me { \italicsOff } that life is won.”
“Come and wel -- come,
’Tis by { \italicsOn } Me { \italicsOff } that life is won.”

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
