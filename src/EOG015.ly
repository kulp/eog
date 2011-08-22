\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

% TODO reformat this as it appears in the EOG -- without music ?

\header{
  title = "O What a Gift the Father Gave"
  subsubtitle = "(C. M. D.)"
  %meter = "C.M.D."
  %poet = ""
  composer = "Wm. G. Fischer"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
% TODO make four fermatas (in typesetting) two
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternA = { \ta c4 | c4 c4 c4. c8 | c8( c4) c8 c4. } % Line 1, 3 soprano / alto / tenor
patternB = { \ta c8 | c4 c4 c4. c8 | c2.            } % Line 2 all, Refrain line 2 all
patternC = { \ta c8 | c4 c4 c4. c8 | c1             } % Line 4 all
patternD = { \ta c4 | c4 c4 c4. c8 | c4.     c8 c4. } % Line 1, 3 bass

patternE = { \ta c4. c8 c4. c8 | c8[ c8] c4 c4. } % Refrain line 1 soprano / alto / tenor
patternF = { \ta c4 | c4. c8 c4. c8 | c8[ c8] c4 \tb c4 \fermata } % Refrain line 3 soprano / alto / tenor
patternG = { \tb c4 \fermata \ta | c4 c4 c4. c8 | c2. } % Refrain line 4 all

patternH = { \ta c4. c8 c4. c8 | c4 c4 c4. } % Refrain line 1 bass
patternI = { \ta c4 | c4. c8 c4. c8 | c4 c4 \tb c4 \fermata } % Refrain line 3 bass

global = {
  \include "common/overrides.ily"
  %\autoBeamOff
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
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
  \changePitch \patternF {         bes | bes c bes g | g f ees bes' }
  \changePitch \patternG {         c   | bes g f ees | ees          }

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
  \changePitch \patternI { ees | ees ees ees ees | ees ees bes }
  \changePitch \patternG { aes | bes bes bes ees | ees }

}
}

Refrain = \lyricmode {

O! ’twas love, ’twas won -- drous love! \bar "."
The love of God to me; \bar "." \break
It brought my Sav -- iour from a -- bove, \bar "."
To die on Cal -- va -- ry. \bar "." \break

}

wordsA = \lyricmode {
\set stanza = "1."

O what a gift the Fa -- ther gave \bar "."
When He be -- stowed His Son! \bar "." \break
To save poor ru -- ined, guil -- ty man, \bar "."
By sin de -- filed, un -- done. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

For I was lost and vile in -- deed!
To sin a will -- ing prey;
Till God in mer -- cy in -- ter -- posed
And turned my night to day.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Now I can call the Sav -- iour mine,
Though all un -- wor -- thy still;
I’m shel -- tered by His pre -- cious blood,
Be -- yond the reach of ill.

}

wordsD = \lyricmode {
\set stanza = "4."

Come all who trust in Je -- sus now,
And tell your joys a -- broad;
Let thank -- ful hymns of praise as -- cend,
For Christ, the gift of God.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      %\context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
