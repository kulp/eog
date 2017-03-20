\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "252"
  title = "A Mind at “Perfect Peace” With God"
  tunename = "Evan"
  meter = "C. M."
  poet = "C. Paget"
  composer = "Wm. H. Havergal, 1847"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key aes \major
  \partial 2
  \autoBeamOff
}

patternA = { c2 | c4 c c2 c | c4 c c2 }
patternB = { c2 | c4 c c2 c | c1 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { ees | ees aes c bes | aes f ees }
  \changePitch \patternB { ees | ees aes c aes | bes } \eogbreak
  \changePitch \patternA { des | c bes aes bes | c aes f }
  \changePitch \patternB { ees | ees aes c bes | aes } \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { c | c c ees des | c des c }
  \changePitch \patternB { c | c c c c | ees }
  \changePitch \patternA { ees | ees des c ees | ees ees des }
  \changePitch \patternB { bes | c c ees des | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { aes | aes aes aes g | aes aes aes }
  \changePitch \patternB { aes | aes aes aes aes | g }
  \changePitch \patternA { bes | aes g aes g | aes aes aes }
  \changePitch \patternB { g | aes aes aes g | aes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { aes | aes aes aes ees' | f des aes }
  \changePitch \patternB { aes | aes aes' f f | ees }
  \changePitch \patternA { ees | aes ees f ees | aes c, des }
  \changePitch \patternB { ees | aes, f' ees ees | aes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

A mind at “per -- fect peace” with God, \bar "."
O, what a word is this! \bar "."
A sin -- ner, rec -- on -- ciled thro’ blood– \bar "."
This, this in -- deed is peace. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

By na -- ture and by prac -- tice far,
How ver -- y far from God!
Yet now by grace bro’t nigh to Him,
Thro’ faith in Je -- sus’ blood.

}

wordsC = \lyricmode {
\set stanza = "3."

So nigh, so ver -- y nigh to God,
I can -- not near -- er be;
For in the per -- son of His Son
I am as near as He.

}

wordsD = \lyricmode {
\set stanza = "4."

So dear, so ver -- y dear to God,
More dear I can -- not be;
The love where -- with He loves His Son,
Such is His love to me.

}

wordsE = \lyricmode {
\set stanza = "5."

Why should I ev -- er care -- ful be,
Since such a God is mine?
He watch -- es o’er me night and day,
And tells me, “Thou art mine.”

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
