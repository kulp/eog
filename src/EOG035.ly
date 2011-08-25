\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "Shall We Gather At His Coming?"
  subsubtitle = "(Beautiful River. 8. 7. 8. 7. and Refrain)"
  %meter = "8.7.8.7. and Refrain"
  %poet = ""
  composer = "R. Lowry, 1864"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { }

global = {
  \include "common/overrides.ily"
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

  \changePitch \patternAA { }
  \changePitch \patternAB { }
  \changePitch \patternAA { }
  \changePitch \patternAB { }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBB { } >>
  \changePitch \patternBB { }
  \changePitch \patternBC { }
  \changePitch \patternAC { }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { }
  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternAB { }

  \changePitch \patternBB { }
  \changePitch \patternBB { }
  \changePitch \patternBA { }
  \changePitch \patternAB { }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { }
  \changePitch \patternBA { }
  \changePitch \patternAB { }
  \changePitch \patternAB { }

  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternAB { }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternBA { }

  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternBA { }
  \changePitch \patternAB { }

}
}

Refrain = \lyricmode {

Yes; we’ll gath -- er at His com -- ing,
His glo -- ri -- ous, His glo -- ri -- ous com -- ing—
Gath -- er with His saints at His com -- ing,
If washed in the Sav -- iour’s blood.

}

wordsA = \lyricmode {
\set stanza = "1."

Shall we gath -- er at His com -- ing,
When the dead in Christ a - rise ?
Shall we hear the Sav -- iour’s sum -- mons
To God’s home, be -- yond the skies?

}

wordsB = \lyricmode {
\set stanza = "2."

Dai -- ly near -- er draws His com -- ing,
This makes all His own re -- joice;
Who are they that fear to meet Him?
Such as now love not His voice.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

When the Sav -- iour at His com -- ing
Shall His own in glo -- ry bring,
Will \italicsOn you \italicsOff be a -- mong the num -- ber?
Will \italicsOn you, \italicsOff too, His prais -- es sing?

}

wordsD = \lyricmode {
\set stanza = "4."

Ere the day of Je -- sus’ com -- ing,
Seek His par -- don free to know;
Be your stains of sin as scar -- let,
He will wash you white as snow.

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

%\markup { \fill-line { \column {
%  \line{ \bold 5 \column { \wordsE } } \vspace #0.4
%  \line{ \bold 6 \column { \wordsF } } \vspace #0.4
%  \line{ \bold 7 \column { \wordsG } } \vspace #0.4
%  \line{ \bold 8 \column { \wordsH } } \vspace #0.4
%} } }

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
