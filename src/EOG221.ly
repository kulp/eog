\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  hymnnumber = "221"
  title = "I Am Thine, O Lord"
  tunename = ""
  meter = "P. M."
  poet = "F. J. Crosby"
  composer = "W. H. Doane"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \partial 4
  \autoBeamOff
}

patternA = { c8. c16 | c4 c c c8. c16 | c4 c c }
patternB = { c8. c16 | c4 c c c8.[ c16] | c2 c4 }
patternG = { c8. c16 | c4 c c c | c2 c4 }
patternC = { c8 c | c4 c c c | c2 c4 }
patternD = { c8. c16 | c2 c | c8 c c c c4 }
patternE = { c8. c16 | c4 c8 r c4 c8 r | c8 c c c c4 }
patternF = { c8. c16 | c4 c c4. c8 | c2 c4 }

notesSoprano = {
\global
\relative c'' {

  c8. des16 | c4 bes bes bes8. c16 | bes4 aes aes
  aes8. g16 | f4 f f aes8.[ f16] | ees2 r4
  c'8. des16 | c4 bes bes bes8. c16 | bes4 aes aes
  bes8 c | des4 des g, g | aes2 r4

  << s^\markup { \small \caps "Refrain" }
  { c8. des16 | ees2 c | bes8 aes g f ees4 } >>
  aes8 g | f4 aes des c | bes2 r4
  c8. des16 | ees4 ees8 r c4 c8 r | bes8 aes g f \tb des'4\fermata \ta
  c8. bes16 | aes4 aes c4. bes8 | aes2 r4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { ees f | ees des des des ees | des c c }
  \changePitch \patternG { ees ees | des des des des | c r }
  \changePitch \patternA { ees f | ees des des des ees | des c c }
  \changePitch \patternC { des ees | f f ees ees | ees r }

  \changePitch \patternD { ees ees | aes ees | f f ees des c }
  \changePitch \patternC { ees ees | des ees ees ees | ees r }
  \changePitch \patternE { ees ees | aes aes aes aes | f f ees des f }
  \changePitch \patternF { f f | ees ees ees des | c r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { aes aes | aes g g g g | g aes aes }
  \changePitch \patternB { aes aes | aes aes aes f aes | aes r }
  \changePitch \patternA { aes aes | aes g g g g | g aes aes }
  \changePitch \patternC { aes aes | aes bes bes des | c r }

  \changePitch \patternE { aes bes | c c aes aes | aes aes aes aes aes }
  \changePitch \patternC { aes aes | aes aes g aes | g r }
  \changePitch \patternE { aes bes | c c aes aes | aes aes aes aes aes }
  \changePitch \patternF { ees' des | c c aes g | aes r }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { aes aes | aes ees' ees ees ees | ees aes, aes }
  \changePitch \patternG { c c | des des des des | aes r }
  \changePitch \patternA { aes aes | aes ees' ees ees ees | ees aes, aes }
  \changePitch \patternC { aes aes | des bes ees ees | aes, r }

  \changePitch \patternE { aes' aes | aes aes aes, aes | des des des des | aes }
  \changePitch \patternC { c c | des c bes aes | ees' r }
  \changePitch \patternE { aes aes | aes aes aes, aes | des des des des des\fermata }
  \changePitch \patternF { des des | ees ees ees ees | aes, r }

}
}

Refrain = \lyricmode {

\break
Draw me near -- er, near -- er bless -- ed Lord, \bar "."
To the cross where Thou hast died; \bar "."
\break
Draw me near -- er, near -- er, near -- er bless -- ed Lord, \bar "."
To Thy pre -- cious, woun -- ded side. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

I am Thine, O Lord; I have heard Thy voice, \bar "."
And it told Thy love to me; \bar "." \break
But I long to rise in the arms of faith, \bar "."
And be clo -- ser drawn to Thee. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Con -- se -- crate me now to Thy ser -- vice, Lord,
By the pow’r of grace di -- vine;
Let my soul look up with a stead -- fast hope,
And my will be lost in Thine.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

O, the pure de -- light of a sin -- gle hour
That be -- fore Thy throne I spend,
When I kneel in prayer, and with Thee my God,
I com -- mune as friend with friend.

}

wordsD = \lyricmode {
\set stanza = "4."

There are depths of love that I can -- not know
Till I cross the nar -- row sea;
There are heights of joy that I may not reach,
Till I rest in peace with Thee.

}

BassRefrain = \lyricmode {

\override LyricText.font-size = #-2
\repeat unfold 36 { \skip 4 }
near -- er, near -- er

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
    >>
    \new Lyrics \with { alignBelowContext = men } \lyricsto basses \BassRefrain
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
