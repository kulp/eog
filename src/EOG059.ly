\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 3) (#t #f))
  %page-count = ##f
}

% TODO this song is compatible with EOG058's tune as well, and we probably
% shouldn't be engraving music for it at all

\header{
  hymnnumber = "59"
  title = "Why Wilt Thou Linger"
  tunename = ""
  meter = "P. M."
  poet = "I. Fleming"
  composer = "P. P. Bliss"
  %copyright = ""
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
  \override Staff.TimeSignature.style = #'()
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  %\partial 4
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
  \changePitch \patternAC { d' d \fermata d | g, ~ g }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Why wilt thou lin -- ger?
Why wilt thou die?
God’s wrath up -- on thee,
Judg -- ment so nigh.
Now in sal -- va -- tion’s day
Tread the blood -- sprink -- led way;
Sin -- ner, no more de -- lay,
Je -- sus will come.

}

wordsB = \lyricmode {
\set stanza = "2."

Soon will the Sav -- iour
Close fast the door,
Ti -- dings of mer -- cy
Sound nev -- er -- more;
Time’s course will soon be run. % XXX comma ?
Stop then, thou Christ -- less one,
Think of the great white throne,
Judg -- ment will fall.

}

wordsC = \lyricmode {
\set stanza = "3."

Then the dread sen -- tence,
“De -- part from Me,”
Room for re -- pent -- ance,
Gone, gone for aye.
End -- less the sin -- ner’s doom,
Dark -- ness and dis -- mal gloom;
Now in God’s house there’s room,
Je -- sus will save.

}

wordsD = \lyricmode {
\set stanza = "4."

Glo -- ry be -- fore thee,
Pil -- grim, press on;
Share now the sor -- row,
Share soon the crown.
Tell forth the Sav -- iour’s fame,
Hon -- or His ho -- ly name,
Bear now His cross and shame,
Pil -- grim, press on.

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

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
