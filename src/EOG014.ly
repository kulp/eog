\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  % decrease system-to-system padding to fit onto page with next score
  system-system-spacing.padding = 0
  system-system-spacing.basic-distance = 0
}

\header{
  %gospel
  hymnnumber = "14"
  title = "God Loved the World of Sinners Lost"
  tunename = "Wondrous Love" % from Metrical Index of Tunes
  meter = "C. M. D."
  poet = "Martha M. Stockton" % see https://hymnary.org/text/god_loved_the_world_of_sinners_lost
  composer = "William G. Fischer" % see https://hymnary.org/tune/god_loved_the_world_of_sinners_fischer
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternA = { \ta c4 | c4 c4 c4. c8 | c8( c4) c8 c4. } % Line 1, 3 soprano / alto / tenor
patternB = { \ta c8 | c4 c4 c4. c8 | c2.            } % Line 2 all, Refrain line 2 all
patternC = { \ta c8 | c4 c4 c4. c8 | c1             } % Line 4 all
patternD = { \ta c4 | c4 c4 c4. c8 | c4.     c8 c4. } % Line 1, 3 bass

patternE = { \ta c4. c8 c4. c8 | c8[ c8] c4 c4. } % Refrain line 1 soprano / alto / tenor
patternF = { \ta c4 | c4. c8 c4. c8 | c8[ c8] c4 \tb c4 } % Refrain line 3 soprano / alto / tenor
patternG = { \tb c4 \ta | c4 c4 c4. c8 | c2. } % Refrain line 4 all

patternH = { \ta c4. c8 c4. c8 | c4 c4 c4. } % Refrain line 1 bass
patternI = { \ta c4 | c4. c8 c4. c8 | c4 c4 \tb c4 } % Refrain line 3 bass

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { ees | ees g bes c | bes g f ees }
  \changePitch \patternB { ees | ees aes c c | bes         }
  \changePitch \patternA { g   | ees g bes c | bes g f ees }
  \changePitch \patternC { g   | f bes c d   | bes         }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternE { bes c bes g | g f ees bes' } >>
  \changePitch \patternB {         bes | c c ees c   | bes          }
  \changePitch \patternF {         bes | bes c bes g | g f ees bes'\fermata }
  \changePitch \patternG {   c\fermata | bes g f ees | ees          }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { bes | bes ees g aes   | g ees d ees }
  \changePitch \patternB { ees | ees ees aes aes | g           }
  \changePitch \patternA { ees | ees ees g aes   | g ees d ees }
  \changePitch \patternC { ees | d d ees f       | d           }

  \changePitch \patternE { g aes g ees | ees d ees d }
  \changePitch \patternB {         ees | ees ees ees aes | g           }
  \changePitch \patternF {         g   | g aes g ees     | ees d ees d }
  \changePitch \patternG {         ees | ees ees d ees   | ees         }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g   | g bes ees ees | ees bes aes g }
  \changePitch \patternB { g   | c c ees ees   | ees           }
  \changePitch \patternA { bes | g bes ees ees | ees bes aes g }
  \changePitch \patternC { bes | bes bes a a   | bes           }

  \changePitch \patternE { ees ees ees bes | bes aes g f }
  \changePitch \patternB {             g   | aes aes c ees   | ees         }
  \changePitch \patternF {             ees | ees ees ees bes | bes aes g f }
  \changePitch \patternG {             aes | g bes aes g     | g           }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternD { ees | ees ees ees ees | ees bes ees }
  \changePitch \patternB { ees | aes aes aes aes | ees }
  \changePitch \patternD { ees | ees ees ees ees | ees bes ees }
  \changePitch \patternC { ees | f f f f | bes, }

  \changePitch \patternH { ees ees ees ees | ees ees bes }
  \changePitch \patternB { ees | aes, aes aes aes | ees' }
  \changePitch \patternI { ees | ees ees ees ees | ees ees bes_\fermata }
  \changePitch \patternG { aes_\fermata | bes bes bes ees | ees }

}
}

Refrain = \lyricmode {

Oh! ’twas love, ’twas won -- drous love! \bar "."
The love of God to me; \bar "." \eogbreak
It brought my Sav -- iour from a -- bove, \bar "."
To die on Cal -- va -- ry. \bar "." \eogbreak

}

wordsA = \lyricmode {
\set stanza = "1."

God loved the world of sin -- ners lost \bar "."
And ru -- ined by the fall; \bar "." \eogbreak
Sal -- va -- tion full, at high -- est cost, \bar "."
He of -- fers free to all. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Love brings the glo -- rious full -- ness in,
And to the lost makes known
Sal -- va -- tion from the pow’r of sin,
Through faith in Christ a -- lone.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

E’en now by faith I claim Him mine,
The ris -- en Son of God;
Re -- demp -- tion by His death I find,
And cleans -- ing through the blood.

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
      %\context Lyrics = four  \lyricsto sopranos \wordsD
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
