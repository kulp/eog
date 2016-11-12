\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  system-count = #6
  systems-per-page = #5
  page-count = ##f
}

\header{
  hymnnumber = "130"
  title = "To God Be the Glory"
  tunename = ""
  meter = "11. 11. 11. 11. with Refrain"
  poet = "F. J. Crosby"
  composer = "W. H. Doane"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=100 }
tb = { \tempo 4=50 }

patternAA = { c4 | c2      c8 c8 | c4 c4 c4 | c4 c4 c4 | c2 }
patternAB = { c4 | c4( c4) c8 c8 | c4 c4 c4 | c4 c4 c4 | c2 }

patternBA = { c4 | c4 c4 c4 | c4 c4 c4 | c4 c4 c4      | c2 }
patternBB = { c4 | c4 c4 c4 | c4 c4 c4 | c4 c4 c8[ c8] | c2 }

patternCA = { c8. c16 | c2 c8. c16 | c2 }
patternCB = { c8. c16 | c4 c4 c4 | c2 }
patternCC = { c8  c8  | c4 c4 c4 | c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees | ees f g | aes ees aes | bes ees, bes' | c }
  \changePitch \patternBA { c des f, des' | c aes c | c bes f | bes }
  \changePitch \patternAA { ees, | ees f g | aes ees aes | bes ees, bes' | c }
  \changePitch \patternBA { c | ees des bes | aes g aes | c c bes | aes }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { c des | ees c des | ees } >>
  \changePitch \patternCB { ees c | aes bes c | bes }
  \changePitch \patternCA { bes c | des bes c | des }
  \changePitch \patternCC { des bes | ees ees des | c }
  \changePitch \patternAA { ees, | ees f g | aes ees aes | bes ees, bes' | c }
  \changePitch \patternBA { c | ees des bes | aes g aes | c c bes | aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { c | c ees des des | c c ees | ees des ees | ees }
  \changePitch \patternBA { ees | f des f | ees ees ees | d d f | ees }
  \changePitch \patternAB { des! | c ees des des | c c ees | ees ees ees | ees }
  \changePitch \patternBA { ges | f f f | ees ees ees | ees ees des | c }

  \changePitch \patternCA { ees ees | ees aes g | aes }
  \changePitch \patternCB { ees ees | ees ees ees | ees }
  \changePitch \patternCA { ees ees | ees ees ees | ees }
  \changePitch \patternCC { ees ees | ees ees ees | ees }
  \changePitch \patternAB { des! | c ees des des | c c ees | ees ees ees | ees }
  \changePitch \patternBA { ges | f f f | ees ees ees | ees ees des | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { aes | aes g ees | ees aes aes | g g g | aes }
  \changePitch \patternBB { aes | aes aes aes | aes aes aes | f f bes aes | g }
  \changePitch \patternAA { g | aes g ees | ees aes aes | g g g | aes }
  \changePitch \patternBA { aes | aes bes des | c bes c | aes aes g | aes }

  \changePitch \patternCA { aes bes | c aes bes | c }
  \changePitch \patternCB { c aes | aes g aes | g }
  \changePitch \patternCA { g aes | bes g aes | bes }
  \changePitch \patternCC { bes g | aes aes g | aes }
  \changePitch \patternAA { g | aes g ees | ees aes aes | g g g | aes }
  \changePitch \patternBA { aes | aes bes des | c bes c | aes aes g | aes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAB { aes | aes c | ees ees | aes, aes c | ees ees ees | aes, }
  \changePitch \patternBA { aes | des des des | aes c aes | bes bes d | ees }
  \changePitch \patternAB { ees | aes, c ees ees | aes, aes c | ees ees ees | aes, }
  \changePitch \patternBA { aes | des des des | ees ees ees | ees ees ees | aes, }

  \changePitch \patternCA { aes' aes | aes aes aes | aes }
  \changePitch \patternCB { aes aes, | c bes aes | ees' }
  \changePitch \patternCA { ees ees | ees ees ees | ees }
  \changePitch \patternCC { ees des | c c bes | aes }
  \changePitch \patternAB { ees' | aes, c ees ees | aes, aes c | ees ees ees | aes, }
  \changePitch \patternBA { aes | des des des | ees ees ees | ees ees ees | aes, }

}
}

Refrain = \lyricmode {

Praise the Lord! praise the Lord! \bar "."
Let the earth hear His voice! \bar "."
Praise the Lord! praise the Lord! \bar "."
Let His peo -- ple re -- joice! \bar "."
O, come to the Fa -- ther thro’ Je -- sus the Son; \bar "."
And give Him the glo -- ry– great things He hath done! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

To God be the glo -- ry! great things He hath done: \bar "."
So loved He the world that He gave us His Son; \bar "."
Who yield -- ed His life an a -- tone -- ment for sin, \bar "."
And o -- pen’d the Life -- gate that all may go in. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

O, per -- fect re -- demp -- tion, the pur -- chase of blood,
To ev -- ’ry be -- liev -- er the pro -- mise of God;
The vi -- lest of -- fend -- er who tru -- ly be -- lieves,
That mo -- ment from Je -- sus a par -- don re -- ceives.

{ \break }
\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Great things He hath taught us, great things He hath done,
And great our re -- joic -- ing thro’ Je -- sus the Son;
But pur -- er, and high -- er, and great -- er will be
Our won -- der, our trans -- port, when Je -- sus we see.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto altos \wordsA
      \context Lyrics = two   \lyricsto altos \wordsB
      \context Lyrics = three \lyricsto altos \wordsC
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
