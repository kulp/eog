\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG047.ily"
}

\header{
  %gospel
  hymnnumber = "47"
  title = "Rise, Dear Soul! Behold Thy Saviour"
  tunename = "Suffield" % not found at hymnary.org
  meter = "8. 7. 8. 7."
  poet = "A. P. Cecil" % see https://hymnary.org/text/trembling_soul_behold_thy_savior
  composer = "" % not found at hymnary.org
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
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
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

Rise, dear soul! be -- hold the Sav -- iour, \bar "."
Seat -- ed on the Fa -- ther’s throne; \bar "." \eogbreak
Ob -- ject of God’s high -- est fa -- vor; \bar "."
See Him— God’s be -- lov -- ed Son. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Once on earth in Beth -- l’em’s man -- ger,
As a new -- born babe He lay;
God come down a heaven -- ly stran -- ger,
Love to sin -- ners to dis -- play.

}

wordsC = \lyricmode {
\set stanza = "3."

Sin -- ner! see thy God be -- side thee,
In a ser -- vant’s form come near;
Sit -- ting, walk -- ing, talk -- ing with thee,
Si -- nai’s mount no lon -- ger fear.

}

wordsD = \lyricmode {
\set stanza = "4."

Sin -- ner! see the bleed -- ing Sav -- iour,
Pierced and nailed to Cal -- v’ry’s tree;
Sac -- ri -- fice of sweet -- est sa -- vor,
Ob -- ject of man’s en -- mi -- ty.

}

wordsE = \markuplist {

\line { See the sun at noonday hidden, }
\line { { \hspace #2 } See the rocks and mountains shake, }
\line { See the Man midst darkness smitten; }
\line { { \hspace #2 } Why did God His Son forsake? }

}

wordsF = \markuplist {

\line { Sinner—hear the wondrous story: }
\line { { \hspace #2 } Jesus died and rose for thee; }
\line { God in heaven now waits to save thee, }
\line { { \hspace #2 } Now, believing, thou art free. }

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

\markup { \fontsize #0.3 \fill-line { \column {
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } }
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
