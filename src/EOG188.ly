\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG188.ily"
}

\header{
  hymnnumber = "188"
  title = "Our Lord Is Now Rejected"
  tunename = ""
  meter = "P. M. with Refrain"
  poet = "Daniel W. Whittle" % see https://hymnary.org/text/our_lord_is_now_rejected
  composer = "James McGranahan" % see https://hymnary.org/tune/our_lord_is_now_rejected_mcgranahan
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternA = { c8 | c8 c c c c4 c8 }
patternC = { c16 ~ c16 | c8 c c c c4 c8 }
patternB = { c8 | c8 c c8. c16 c4. }
patternD = { c8 | c8 c c c c4. }
patternE = { c8 | c8 c c c c4 }
patternF = { c8 c | c c c c c16 c8. c8. c16 | c2. }

patternG = { aes8 aes | aes des des des des16 f4. }
patternH = { f16 | f ees8. ees c16 ees4 }
patternI = { c8 bes | aes8. aes16 aes8 aes aes4 g8 }
patternJ = { aes8 | bes8. a16 bes8 c bes4 }
patternK = { ees8 des | c8. des16 ees8 c aes4 aes8 }
patternL = { g8 | f16 aes8. aes f16 ees4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { ees | ees aes aes bes c bes }
  \changePitch \patternB { aes | f aes aes f ees }
  \changePitch \patternC { ees ~ ees | ees aes aes bes c c }
  \changePitch \patternD { des | ees c c aes bes }
  \changePitch \patternA { bes | bes des c bes aes aes }
  \changePitch \patternE { g | f aes g f ees }
  \changePitch \patternF { aes bes | c ees des f ees c bes aes | aes }

  \eogbreak

  << s^\markup { \small \caps "Refrain" }
  { aes8 aes | aes des des des des16 f4. } >>
  f16 | f ees8. ees c16 ees4
  c8 bes | aes8. aes16 aes8 aes aes4 g8
  aes8 | bes8. a16 bes8 c bes4
  \tb ees8 \fermata \ta des | c8. des16 ees8 c aes4 aes8
  g8 | f16 aes8. aes f16 ees4
  aes8 bes | c ees des f ees16 c8. bes aes16 | aes2. r8

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { c | c c c des ees des }
  \changePitch \patternB { c | des des des des | c }
  \changePitch \patternC { c ~ c | c c ees ees ees ees }
  \changePitch \patternD { aes | aes aes aes aes g }
  \changePitch \patternA { g | g bes aes g f f }
  \changePitch \patternE { e | f f ees des c }
  \changePitch \patternF { ees ees | aes aes aes aes aes aes g ees | ees }

  \changePitch \patternG { ees ees | f f f f f aes }
  \changePitch \patternH { es | aes aes aes aes aes }
  \changePitch \patternI { aes g | f f f f f e }
  \changePitch \patternJ { f | g fis g aes! g }
  \changePitch \patternK { g bes | aes aes aes ees ees ees }
  \changePitch \patternL { ees | des f f des c }
  \changePitch \patternF { ees ees | aes aes aes aes aes aes g ees | ees r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { aes | aes ees ees aes aes aes }
  \changePitch \patternB { aes | aes f f aes aes }
  \changePitch \patternC { aes ~ aes | aes ees aes g aes aes }
  \changePitch \patternD { bes | c ees ees ees ees }
  \changePitch \patternA { ees | ees ees ees des c c }
  \changePitch \patternE { bes | aes des des aes aes }
  \changePitch \patternF { c des | ees c f des c ees des c | c }

  \changePitch \patternG { c c | des aes aes aes aes des }
  \changePitch \patternH { des | des c c ees c }
  \changePitch \patternI { ees des | c c c c c c }
  \changePitch \patternJ { c | ees ees ees ees ees }
  \changePitch \patternK { bes ees | ees des c aes c c }
  \changePitch \patternL { bes | aes des des aes aes }
  \changePitch \patternF { c des | ees c f des c ees des c | c r }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { aes | aes aes aes aes aes aes }
  \changePitch \patternB { aes | des des des des aes }
  \changePitch \patternC { aes ~ aes | aes aes c ees aes aes }
  \changePitch \patternD { aes | aes aes aes c, ees }
  \changePitch \patternA { ees | ees ees ees ees f f }
  \changePitch \patternE { c | des des des des aes }
  \changePitch \patternF { aes' aes | aes aes des, des ees ees ees ees | < aes aes, > }

  \changePitch \patternG { aes aes | des, des des des des des }
  \changePitch \patternH { des | aes' aes aes aes aes }
  \changePitch \patternI { aes ees | f f f f f c }
  \changePitch \patternJ { f | ees ees ees ees ees }
  \changePitch \patternK { ees_\fermata ees | aes aes aes aes aes aes }
  \changePitch \patternL { c, | des des des des aes }
  \changePitch \patternF { aes' aes | aes aes des, des ees ees ees ees | aes, r }

}
}

Refrain = \lyricmode {

Oh, the crown -- ing day is com -- ing, \bar "."
Is com -- ing by and by! \bar "."
When our Lord shall come in “pow -- er” \bar "."
And “glo -- ry” from on high! \bar "."
Oh, the glo -- rious sight will glad -- den \bar "."
Each wait -- ing, watch -- ful eye, \bar "."
In the crown -- ing day that’s com -- ing \bar "."
By and by. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Our Lord is now re -- ject -- ed, \bar "."
And by the world dis -- owned; \bar "."
{ \mon } By the { \moff } man -- y still neg -- lect -- ed, \bar "."
And by the few en -- throned: \bar "."
But soon He’ll come in glo -- ry— \bar "."
The hour is draw -- ing nigh; \bar "."
For the crown -- ing day is com -- ing \bar "."
By and by. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The heavens shall glow with splen -- dor,
But bright -- er far than they
The saints shall shine in glo -- ry,
As Christ shall them ar -- ray.
The beau -- ty of the Sav -- iour
Shall daz -- zle ev -- ’ry eye,
In the crown -- ing day that’s com -- ing
By and by.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Let all that look for, “hast -- en”
The com -- ing joy -- ful day,
By ear -- nest con -- se -- cra -- tion
To walk the nar -- row way;
By gath -- ering in the lost ones
For whom our Lord did die,
For the crown -- ing day that’s com -- ing
By and by.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
