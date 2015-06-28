\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = ##f
}

\header{
  title = "Rise, Dear Soul! Behold Thy Saviour"
  subsubtitle = "(Suffield. 8. 7. 8. 7.)"
  %meter = "8.7.8.7"
  poet = "A. P. Cecil"
  %composer = ""
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=120 }
tb = { \tempo 4=60  }

patternAA = { c2 c4( c4) | c2 c2 | c2 c4( c4) | c2 c2 }
patternAB = { c2 c4( c4) | c2 c2 | c2 c2      | c2 c2 }
patternAC = { c2 c2      | c2 c2 | c2 c2      | c2 c2 }
patternAD = { c2 c2      | c2 c2 | c2 c4( c4) | c2 c2 }

patternBA = { c2 c4( c4) | c2 c2 | c4( c4) c4( c4) | c1 }
patternBB = { c2 c4( c4) | c2 c2 | c4( c4) c2      | c1 }
patternBC = { c2 c2      | c2 c2 | c2      c4( c4) | c1 }
patternBD = { c2 c2      | c2 c2 | c2      c2      | c1 }

patternCA = { c2 c4( c4) | c2 c4( c4) | c2 c4( c4) | c2 c2 }
patternCB = { c2 c4( c4) | c2 c2      | c2 c4( c4) | c2 c2 }
patternCC = { c2 c2      | c2 c4( c4) | c2 c2      | c2 c2 }
patternCD = { c2 c2      | c2 c2      | c2 c2      | c2 c2 }

patternDA = { c2 c4( c4) | c4( c2) c4   | c2 c2 | c1 }
patternDB = { c2 c4( c4) | c2.   c4   | c2 c2 | c1 }
patternDC = { c2 c2      | c2.   c4   | c2 c2 | c1 }
patternDD = { c2 c2      | c2( c4) c4 | c2 c2 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { aes bes c | aes ees | f des' bes | aes g }
  \changePitch \patternBA { aes bes c | aes f | ees c' bes g | aes }
  \changePitch \patternCA { ees' c aes | bes c des | ees c aes | c bes }
  \changePitch \patternDA { aes g f | ees ees' des | c bes | aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { c des ees | c c | des f | ees ees }
  \changePitch \patternBB { c des ees | c des | c ees des | c }
  \changePitch \patternCB { ees ees c | ees ees | ees ees c | ees ees }
  \changePitch \patternDB { c ees des | c f | ees des | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAC { aes aes | aes aes | aes bes | c bes }
  \changePitch \patternBC { aes aes | aes aes | aes g bes | aes }
  \changePitch \patternCC { c aes | g aes bes | c aes | aes g }
  \changePitch \patternDC { aes aes | aes aes | aes g | aes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAD { aes aes | aes aes | des bes des | ees ees }
  \changePitch \patternBD { aes, aes | aes des | ees ees | aes, }
  \changePitch \patternCD { aes' aes | ees ees | aes aes | ees ees }
  \changePitch \patternDD { aes, aes | aes c des | ees ees | aes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Rise, dear soul! be -- hold thy Sav -- iour, \bar "."
Seat -- ed on the Fa -- ther’s throne; \bar "." \break
Ob -- ject of God’s high -- est fa -- vor; \bar "."
See Him— God’s be -- lov -- ed Son. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Once on earth in Beth -- le’m’s man -- ger,
As a help -- less babe He lay;
God come down a heav’n -- ly stran -- ger,
Love to sin -- ners to dis -- play.

}

wordsC = \lyricmode {
\set stanza = "3."

Sin -- ner! see they God be -- side thee,
In a ser -- vant’s form come near,
Sit -- ting, walk -- ing, talk -- ing with thee,
Si -- nai’s mount no lon -- ger fear.

}

wordsD = \lyricmode {
\set stanza = "4."

Sin -- ner! see they bleed -- ing Sav -- iour,
Pierced and nailed to Cal -- v’ry’s tree;
Sac -- ri -- fice of sweet -- est sa -- vor,
Ob -- ject of man’s en -- mi -- ty.

}

wordsE = \markuplist {

\line { See the sun at noon-day hidden, }
\line { See the rocks and mountains shake, }
\line { See the Man ’midst darkness smitten, }
\line { Why did God his Son forsake? }

}

wordsF = \markuplist {

\line { Sinner—hear the wondrous story }
\line { Jesus died and rose for thee; }
\line { God in heaven now waits to save thee, }
\line { Now, believing, thou art free. }

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

\markup { \fill-line { \column {
  \line{ \bold 5 \column { \wordsE } \bold 6 \column { \wordsF } }
} } }

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
