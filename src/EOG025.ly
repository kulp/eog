\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  \include "override/override-EOG025.ily"
}

\header{
  %gospel
  hymnnumber = "25"
  title = "Oh, Have You Not Heard of That Wonderful Love?"
  markuptitle = \markup \center-column { "Oh, Have You Not Heard of That" "Wonderful Love?" \vspace #0.5 }
  tunename = ""
  meter = "P. M. with Refrain"
  poet = "" % not found at hymnary.org
  composer = "J. C. Englebrecht" % see https://hymnary.org/tune/i_think_when_i_read_englebrecht
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 8=120 }
tb = { \tempo 8=60  }

patternAA = { c8 | c8. c16 c8 c8( c8) c8 | c8 c8 c8 c4        }
patternAB = { c8 | c8. c16 c8 c8( c8) c8 | c8. c16 c8 c8 ~ c8 }
patternAC = { c8 | c8. c16 c8 c8 ~ c8 c8 | c8 c8 c8 c4        }
patternAD = { c8 | c8. c16 c8 c8 ~ c8 c8 | c8. c16 c8 c8 ~ c8 }

patternBA = { c8 | c8. c16 c8 c8( c8) c8 | c4. ~ c4 }
patternBB = { c8 | c8. c16 c8 c8  c8  c8 | c4. ~ c4 }

patternCA = { c8 | c4 c8 c8 c8 c8 c4. ~ c4 }

patternDA = { c8 | c8. c16 c8 c8[ c8] c8 | c8. c16 c8 c4 }
patternDB = { c8 | c8. c16 c8 c4      c8 | c8. c16 c8 c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees  | aes aes aes aes g aes | bes aes g aes }
  \changePitch \patternBA { aes  | c bes aes aes g aes   | bes bes       }
  \changePitch \patternAB { ees, | aes aes aes c bes c   | des f, f f f  }
  \changePitch \patternBB { f    | ees ees ees ees f g   | aes aes       }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { ees  | bes' bes bes aes bes | c c        } >>
  \changePitch \patternCA { ees, | bes' bes bes aes bes | c c        }
  \changePitch \patternDA { ees, | aes aes aes c bes c  | des f, f f }
  \changePitch \patternCA { f    | ees ees ees f g      | aes aes    }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c   | c c c c bes c         | des c des c       }
  \changePitch \patternBA { c   | ees des c ees ees ees | ees ees           }
  \changePitch \patternAB { ees | c c c ees des ees     | f des des des des }
  \changePitch \patternBB { des | c c c des des des     | c c               }

  \changePitch \patternCA { c   | ees ees ees ees ees   | ees ees           }
  \changePitch \patternCA { c   | ees ees ees ees ees   | ees ees           }
  \changePitch \patternDA { ees | c c c ees des ees     | f des des des     }
  \changePitch \patternCA { des | c c des des des       | c c               }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAC { aes | ees ees ees ees ees aes | g aes bes aes       }
  \changePitch \patternBA { ees | aes aes aes c bes aes   | g g                 }
  \changePitch \patternAD { ees | ees ees ees aes aes aes | aes aes aes aes aes }
  \changePitch \patternBB { aes | aes aes aes g aes bes   | aes aes             }

  \changePitch \patternCA { aes | g g g f g               | aes aes             }
  \changePitch \patternCA { aes | g g g f g               | aes aes             }
  \changePitch \patternDB { ees | ees ees ees aes aes     | aes aes aes aes     }
  \changePitch \patternCA { aes | aes aes g aes bes       | aes aes             }

}
}

notesBass = {
\global
\relative a, {

  \changePitch \patternAC { aes  | aes aes aes aes aes aes  | ees' ees ees aes,   }
  \changePitch \patternBA { aes  | aes aes aes aes bes c    | ees ees             }
  \changePitch \patternAD { ees  | aes, aes aes aes aes aes | des des des des des }
  \changePitch \patternBB { des  | ees ees ees ees ees ees  | aes, aes            }

  \changePitch \patternCA { aes' | ees ees ees ees ees      | aes aes             }
  \changePitch \patternCA { aes  | ees ees ees ees ees      | aes aes             }
  \changePitch \patternDB { ees  | aes, aes aes aes aes     | des des des des     }
  \changePitch \patternCA { des  | ees ees ees ees ees      | aes, aes            }

}
}

Refrain = \lyricmode {

Be -- lieve that won -- der -- ful love, \bar "."
Be -- lieve that won -- der -- ful love, \bar "."
The gos -- pel is free, \bar "." God sends it to thee, \bar "."
Be -- lieve God’s won -- der -- ful love. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Oh, have you not { \mon } heard of { \moff } that won -- der -- ful love, \bar "."
That flows from God’s heart so free, \bar "."
Which led Him to { \mon } give for { \moff } a per -- ish -- ing world \bar "."
His Son to be nailed to the tree? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Poor sin -- ners un -- done, and sin -- ful, and lost,
This love of our { \mon } God now { \moff } re -- ceive;
No heart is too sad this love to make glad,
When once on God’s Word we be -- lieve.

\bar "."

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Oh, sweet is its { \mon } rest to { \moff } the wear -- y and worn,
Who deep feel the { \mon } bur -- den { \moff } of sin;
It seeks for no { \mon } mer -- it { \moff } its bliss to { \mon } in -- her -- it, { \moff }
No good -- ness with -- out or with -- in.

}

wordsD = \lyricmode {
\set stanza = "4."

Then will you not prove this won -- der -- ful love,
That flows from God’s heart so free,
Which led Him to give, that sin -- ners might live,
His Son to be nailed to the tree?

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
