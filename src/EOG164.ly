\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG164.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tunes: No.’s 144, 248." } }
}

\header{
  hymnnumber = "164"
  title = "Have I an Object, Lord, Below" % not found at hymnary.org
  tunename = "Mother’s Prayer" % see https://hymnary.org/tune/i_never_can_forget_the_day_weeden
  meter = "L. M. D."
  poet = "George W. Frazer"
  composer = "Winfield S. Weeden" % see https://hymnary.org/tune/i_never_can_forget_the_day_weeden
  tagline = ##f
}

patternAA = { c4 | c4. c8 c2. c4 | c4. c8 c2. }
patternAB = { c4 | c4. c8 c2. c4 | c4  c4 c2. }
patternAC = { c4 | c4. c8 c2. c4 | c8 c4. c2. }

patternBA = { c4 | c4  c4 c2. c4 | c8 c4. c2. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=70
  \key des \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { f | f ges aes des, | c des ees }
  \changePitch \patternAA { ges | ges ges c bes | bes aes aes }
  \changePitch \patternAB { f | f ees des des | ges bes aes }
  \changePitch \patternBA { aes | bes des f, des | f ees des } \eogbreak

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAA { des' | des c c bes | bes aes aes } >>
  \changePitch \patternAA { des | des c c bes | aes g aes }
  \changePitch \patternAB { ges | f ees des des | ges bes des }
  \changePitch \patternAC { des | c bes aes des, | f ees des }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { des | des ees f aes, | aes aes c }
  \changePitch \patternAA { ees | ees ees ges ges | ges f f }
  \changePitch \patternAB { des | des c des des | des ges f }
  \changePitch \patternBA { f | ges ges des des | des c des }

  \changePitch \patternAA { f | ges ges ges des | des des des }
  \changePitch \patternAA { des | des ees ees ees | ees ees ees }
  \changePitch \patternAB { ees | des des des des | ees ges ges }
  \changePitch \patternAC { bes | aes ges f des | des c des }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { aes | aes aes des f, | ees f aes }
  \changePitch \patternAA { aes | aes aes aes c | des des des }
  \changePitch \patternAB { aes | aes ges f f | ges des' des }
  \changePitch \patternBA { des | des bes aes f | aes ges f }

  \changePitch \patternAA { aes | bes aes aes ges | ges f f }
  \changePitch \patternAA { f | bes aes aes des | c bes c }
  \changePitch \patternAB { aes | aes ges f f | ges des' bes }
  \changePitch \patternAC { des | des des des f, | aes ges f }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { des | des des des des | aes aes aes }
  \changePitch \patternAA { aes | aes' aes aes aes | des, des des }
  \changePitch \patternAB { des | aes a bes ces | bes ges des' }
  \changePitch \patternBA { des | ges ges aes aes, | aes aes des }

  \changePitch \patternAA { des | des des des des | des des des }
  \changePitch \patternAA { des | bes ees ees ees | ees ees aes, }
  \changePitch \patternAB { aes | des des des ces | bes ges ges }
  \changePitch \patternAC { ges' | ges ges aes aes, | aes aes des }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Have I an ob -- ject, Lord, be -- low \bar "."
Which would di -- vide my heart with Thee, \bar "."
Which would di -- vert its e -- ven flow \bar "."
In an -- swer to Thy con -- stan -- cy? \bar "."
Oh, teach me quick -- ly to re -- turn, \bar "."
And cause my heart a -- fresh to burn. \bar "."
%{HIDE>%} Oh, teach me quick -- ly to re -- turn, \bar "."
And cause my heart a -- fresh to burn. %{<HIDE%} \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Have I a hope, how -- ev -- er dear,
Which would de -- fer Thy com -- ing, Lord,
Which would de -- tain my spir -- it here
Where naught can last -- ing joy af -- ford?
From it, my Sav -- iour, set me free,
To look and long and wait for Thee.
%{HIDE>%} From it, my Sav -- iour, set me free,
To look and long and wait for Thee. %{<HIDE%}

}

wordsC = \lyricmode {
\set stanza = "3."

Be Thou the ob -- ject bright and fair
To fill and sat -- is -- fy the heart;
My hope to meet Thee in the air,
And nev -- er -- more from Thee to part:
That I may un -- dis -- tract -- ed be
To fol -- low, serve and wait for Thee.
%{HIDE>%} That I may un -- dis -- tract -- ed be
To fol -- low, serve and wait for Thee. %{<HIDE%}

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
