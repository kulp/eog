\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

% TODO don't duplicate the music ? it's not duplicated in the original EOG ...
% but on the other hand, the music had to be adapted to these words, so
% EOG043's music is not identical to EOG042's.

\header{
  hymnnumber = "43"
  title = "“Behold the Lamb” Enthroned on High"
  tunename = ""
  meter = "P. M."
  %poet = ""
  composer = "Arr. by J. H. Stockton"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }
tc = { \tempo 4=70 }

patternAA = { \ta c8   | c4 c8 c4 c8 | c4 c8 c4. }
patternAB = { \ta        c4 c8 c4 c8 | c4.   c4  }
patternAC = { \ta c8   | c4 c8 c4 c8 | c4 c8 c4. }
patternAD = { \ta        c4 c8 c4 c8 | c4.   c4. }
patternAE = { \ta c8   | c4 c8 c4 c8 | c4 c8 c4. }

patternBA = { \ta c8 c8 c8 c4 c8 | c4 c8 c4. }
patternBB = { \ta c4    c8 c4 c8 | c4 c8 c4. }
patternBC = { \ta c8 c8 c8 c4 c8 | c4 c8 c4  }
patternBD = { \ta c4    c8 c4 c8 | c4 c8 c4  }

% \tc for ritardando
patternCA = { \tc c4 c8 c4 c8 | c4. c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { bes^\markup { \dynamic p } | bes g ees f | g aes bes \fermata }
  \changePitch \patternAB { bes ees, g ees | f ees }
  \changePitch \patternAC { bes' | bes g ees f | g aes bes }
  \changePitch \patternAD { bes ees, g ees | f ees }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBA { bes' c d ees bes | d c bes } >>
  \changePitch \patternBC { bes c d ees bes | d c bes }
  \changePitch \patternAE { bes bes g ees f | g aes bes }
  \changePitch \patternCA { bes^\markup { \italic rit. } ees, g ees | f ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { g | g ees bes d | ees f g }
  \changePitch \patternAB { g bes, ees bes | d ees }
  \changePitch \patternAC { g | g ees bes d | ees f g }
  \changePitch \patternAD { g bes, ees bes | d ees }

  \changePitch \patternBB { g | g g g | bes aes g }
  \changePitch \patternBD { g | g g g | bes aes g }
  \changePitch \patternAE { g g ees bes d | ees f g }
  \changePitch \patternCA { g bes, ees bes | d ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes | bes bes g bes | bes bes bes }
  \changePitch \patternAB { bes g bes g | aes g }
  \changePitch \patternAC { bes | bes bes g bes | bes bes bes }
  \changePitch \patternAD { bes g bes g | aes g }

  \changePitch \patternBB { bes bes bes ees | ees ees ees }
  \changePitch \patternBD { bes bes bes ees | ees ees ees }
  \changePitch \patternAE { ees ees bes g bes | bes bes bes }
  \changePitch \patternCA { bes g bes g | aes g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees | ees ees ees bes | ees ees ees \fermata }
  \changePitch \patternAB { ees ees ees ees | bes ees }
  \changePitch \patternAC { ees | ees ees ees bes | ees ees ees }
  \changePitch \patternAD { ees ees ees ees | bes ees }

  \changePitch \patternBB { ees ees ees ees | aes aes ees }
  \changePitch \patternBD { ees ees ees ees | aes aes ees }
  \changePitch \patternAE { ees ees ees ees bes | ees ees ees }
  \changePitch \patternCA { ees ees ees ees | bes ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Be -- hold the Lamb” en -- throned on high, \bar "."
Je -- sus, Je -- sus, Je -- sus. \bar "." \break
In Him we are to God brought nigh, \bar "."
Je -- sus, Je -- sus, Je -- sus. \bar "." \break
He who on Cal -- vry’s cross has bled, \bar "."
He who was num -- bered with the dead, \bar "." \break
Ex -- al -- ted now o’er all as Head, \bar "."
Je -- sus, Je -- sus, Je -- sus. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

“Com -- plete in Him” at God’s right hand,
Je -- sus, Je -- sus, Je -- sus.
Be -- fore the throne we bold -- ly stand,
Je -- sus, Je -- sus, Je -- sus.
That blood -- be -- sprink -- led mer -- cy seat,
His pier -- ced side, His hands, and feet,
Pro -- claim re -- demp -- tion’s work com -- plete,
Je -- sus, Je -- sus, Je -- sus.

}

wordsC = \lyricmode {
\set stanza = "3."

God finds e -- ter -- nal rest in Him,
Je -- sus, Je -- sus, Je -- sus.
That rest which was dis -- turbed by sin,
Je -- sus, Je -- sus, Je -- sus.
We too by faith on Him re -- pose,
Who did the Fa -- ther’s heart dis -- close,
From which this full sal -- va -- tion flows.
Je -- sus, Je -- sus, Je -- sus.


}

wordsD = \lyricmode {
\set stanza = "4."

As one with Him we rest se -- cure,
Je -- sus, Je -- sus, Je -- sus.
Un -- chang -- ing doth His work en -- dure,
Je -- sus, Je -- sus, Je -- sus.
Now seat -- ed on the Fa -- ther’s throne,
E -- lect and pre -- cious cor -- ner -- stone,
On Him we rest— on Him a -- lone.
Je -- sus, Je -- sus, Je -- sus.

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

%\markup { \fill-line { \column {
%  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
%  \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
%  \line{ \bold 7 \column { \wordsG } } \combine \null \vspace #0.4
%  \line{ \bold 8 \column { \wordsH } } \combine \null \vspace #0.4
%} } }

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
