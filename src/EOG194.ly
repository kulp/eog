\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "194"
  title = "Take the Name of Jesus with You"
  tunename = ""
  meter = "8. 7. 8. 7. with Refrain"
  poet = "Lydia Baxter" % see https://hymnary.org/text/take_the_name_of_jesus_with_you_child_of
  composer = "W. Howard Doane" % see https://hymnary.org/text/take_the_name_of_jesus_with_you_child_of
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered % original has `c`
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \autoBeamOff
}

patternA = { c4 c c8. c16 c8. c16 | c2 c }
patternB = { c4 c c8. c16 c8. c16 | c2. }

notesSoprano = {
\global
\relative c' {

  ees4 aes c8. bes16 aes8. bes16 | aes2 ees
  \changePitch \patternB { f aes g f aes f | ees } r4
  \changePitch \patternA { ees bes' aes g aes bes | c aes }
  \changePitch \patternB { bes ees, c' bes aes g | aes }

  << s^\markup { \small \caps "Refrain" }
  { aes8. g16 | f2. aes8 f | ees2. } >>
  aes8 bes | c4 ees, aes c | bes2.
  c8. bes16 | aes2. aes8 g | f2( \tb aes4) \fermata \ta
  aes8 bes | c4 aes c bes | aes2. r4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { c c ees des c des | c c }
  \changePitch \patternB { des f ees des f des | c } r4
  \changePitch \patternA { ees ees ees ees ees ees | ees ees }
  \changePitch \patternB { ees ees ees ees ees des | c }

  c8. ees16 | des2. f8 des | c2.
  ees8 ees | ees4 c ees aes | g2.
  ees8. des16 | c2. c8 ees | des2( f4)
  f8 fes | ees4 ees ees des | c2. r4

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { aes aes aes aes aes aes | aes aes }
  \changePitch \patternB { aes aes aes aes aes aes | aes } r4
  \changePitch \patternA { g des' c bes c g | aes c }
  \changePitch \patternB { des g, aes des c bes | aes }

  r4 | r4 aes8 aes aes4 r4 | r4 aes8 aes aes4
  aes8 g | aes4 aes c ees | ees2.
  r4 | r4 aes,8 aes aes4 aes8 aes | aes4 aes aes
  aes8 aes | aes4 c aes g | aes2. r4

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { aes aes aes aes aes aes | aes aes }
  \changePitch \patternB { des des des des des des | aes } r4
  \changePitch \patternA { ees' ees ees ees ees ees | aes, aes }
  \changePitch \patternB { ees' ees ees ees ees ees | aes, }

  r4 | r4 des8 des des4 r4 | r4 aes8 aes aes4
  c8 ees | aes4 aes aes aes, | ees'2.
  r4 | r4 aes,8 aes aes4 aes8 c | des4 des des_\fermata
  des8 des | ees4 ees ees ees | aes,2. r4

}
}

Refrain = \lyricmode {

Pre -- cious name, oh, how sweet, \bar "."
Hope of earth and joy of heaven; \bar "."
Pre -- cious name, oh, how sweet, \bar "."
Hope of earth and joy of heaven. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Take the name of Je -- sus with you, \bar "."
Child of sor -- row and of woe; \bar "."
It will joy and com -- fort give you, \bar "."
Take it then wher -- e’er you go. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Take the name of Je -- sus ev -- er,
As a shield from ev -- ’ry snare;
If temp -- ta -- tions round you gath -- er,
Breathe that ho -- ly name in prayer.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Oh! the pre -- cious name of Je -- sus;
How it thrills our souls with joy,
When His lov -- ing arms re -- ceive us,
And His songs our tongues em -- ploy!

}

wordsD = \lyricmode {
\set stanza = "4."

At the name of Je -- sus bow -- ing,
Fall -- ing pro -- strate at His feet,
Lord and Christ our hearts will own Him,
When our jour -- ney is com -- plete.

}

underWords = \lyricmode {

{ \repeat unfold 30 \skip 4 }
Pre -- cious name, oh, how sweet!
{ \repeat unfold 7 \skip 4 }
Pre -- cious name, oh, how sweet, how sweet!

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
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
    >>
    \context Lyrics = three \lyricsto tenors \underWords
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
