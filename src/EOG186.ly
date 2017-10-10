\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG186.ily"
  % need to reduce stretchability to compensate for `ragged-bottom` being false
  % (`ragged-last-bottom` doesn't appear to work for markups, so the markup
  % gets pulled down the page)
}

\header{
  %gospel
  hymnnumber = "186"
  title = "One Day!"
  tunename = ""
  meter = "P. M."
  poet = "J. Wilbur Chapman"
  composer = "Chas. H. Marsh"
  tagline = ##f
}

patternA = { c4 c4 c4 c2. c2 c4 | c4 c4 c4 c2. c2. }
patternB = { c4 c4 c4 c2. c2. | c4 c4 c4 c2. c2. }
patternC = { c4 c4 c4 c2 c4 c2. | c4 c4 c4 c2. c2. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 9/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=150
  \key des \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { aes f ges aes bes c | des c bes aes f }
  \changePitch \patternA { ges ees f ges f ges | aes aes ges f ~ f }
  \changePitch \patternA { aes f ges aes bes c | des c bes aes f }
  \changePitch \patternA { ees aes bes c bes aes | bes ees, bes' aes ~ aes }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternB { des bes des c ges | bes c bes aes f } >>
  \changePitch \patternA { aes ges f bes bes bes | des c bes ees ~ ees }
  \changePitch \patternC { des bes des c ges ges | bes c ees des aes }
  \changePitch \patternA { bes-> bes-> bes-> ees-> bes-> des-> | c-> aes-> ees'-> des-> ~ des }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { f des ees f f f | f f f f des }
  \changePitch \patternA { c c des ees d ees | c des ees des ~ des }
  \changePitch \patternA { f des ees f f f | f f f f des }
  \changePitch \patternA { c ees ees ees ees ees | des des des c( ges'!) }

  \changePitch \patternB { f f f ges c, | c c c des des }
  \changePitch \patternA { des c des des d d | f ees ees ees( ges) }
  \changePitch \patternC { f f f ges ees ees | ges ges ges f f }
  \changePitch \patternA { ges ges aes g g g | ges! ges ges f ~ f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { aes aes aes des des aes | aes aes aes des aes }
  \changePitch \patternA { aes aes aes aes aes aes | aes aes aes aes ~ aes }
  \changePitch \patternA { aes aes aes des des aes | aes aes aes des aes }
  \changePitch \patternA { aes aes g aes g aes | g g g aes ~ aes }

  \changePitch \patternB { aes aes aes aes aes | ges aes ges f aes }
  \changePitch \patternA { aes aes aes ges aes aes | g aes g aes ~ aes }
  \changePitch \patternC { aes aes aes aes c c | c ees c des des }
  \changePitch \patternA { des des d ees ees ees | ees c c | des ~ des }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { des des des des des des | des des des des des }
  \changePitch \patternA { aes aes aes c aes aes | aes bes c des ~ des }
  \changePitch \patternA { des des des des des des | des des des des des }
  \changePitch \patternA { ees c bes aes bes c | ees ees ees aes,( c) }

  \changePitch \patternB { des des des ees aes, | aes aes aes des des }
  \changePitch \patternA { f ees des ges f bes, | ees ees des c( aes) }
  \changePitch \patternC { des des des ees aes aes | aes aes aes des, des | }
  \changePitch \patternA { ges ges f ees ees ees | aes aes aes des, ~ des }

}
}

Refrain = \lyricmode {

Liv -- ing, He loved me; dy -- ing, He saved me; \bar "."
Bur -- ied, He car -- ried my sins far a -- way; \bar "."
Ris -- ing, He just -- i -- fied free -- ly for -- ev -- er: \bar "."
One day He’s com -- ing_– oh glo -- ri -- ous day! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

One day when heav -- en was filled with His prais -- es, \bar "."
When our con -- di -- tion was black as could be, \bar "."
Je -- sus Em -- man -- nuel was born of a vir -- gin, \bar "."
Dwell -- ing with men, my ex -- am -- ple is He! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

One day they led Him up Cal -- va -- ry’s moun -- tain,
One day they nailed Him to die on the tree;
Suf -- fer -- ing an -- guish, de -- spised and re -- ject -- ed;
Bear -- ing our sins, my Re -- deem -- er is He!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

One day they left Him a -- lone in the gar -- den,
One day He rest -- ed, from suf -- fer -- ing free;
An -- gels came down o’er His tomb to keep vig -- il;
Hope of the hope -- less, my Sav -- iour is He!

}

wordsD = \markuplist {

\line { One day the grave could conceal Him no longer, }
\line { { \hspace #2 } One day the stone rolled away from the door; }
\line { He had arisen, over death He had conquered; }
\line { { \hspace #2 } Now is ascended, my Lord evermore! }

}

wordsE = \markuplist {

\line { One day the trumpet will sound for His coming, }
\line { { \hspace #2 } One day the skies with His glory will shine; }
\line { Wonderful day, my belovèd ones bringing; }
\line { { \hspace #2 } Glorious Saviour, this Jesus is mine! }

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

\noPageBreak

\markup { \fill-line { \column {
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } }
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
