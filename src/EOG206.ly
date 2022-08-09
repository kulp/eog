\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG206.ily"
}

\header{
  hymnnumber = "206"
  title = "’Tis Sweet to Think of Those at Rest"
  tunename = "Holy Cross" % see https://hymnary.org/tune/holy_cross_mendelssohn
  meter = "C. M."
  poet = "Samuel Prideaux Tregelles" % see https://hymnary.org/text/tis_sweet_to_think_of_those_at_rest
  composer = "James C. Wade" % see https://hymnary.org/tune/holy_cross_mendelssohn
  tagline = ##f
}

patternA = { c4 | c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key bes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f4 | d'2 c4 | bes2 f4 | a2 g4 | f2
  bes4 | c2 f,4 | c'2 cis4 | d2 \eogbreak
  f,4 | d'2 c4 | bes2 a4 | c2 bes4 | a2
  g4 | f2 bes4 | d2 c4 | bes2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d f ees d f f ees d }
  \changePitch \patternA { d ees ees ees ees d }
  d4 | f2 ees4 | d2 f4 | g4( c,) cis | cis2
  \changePitch \patternA { cis d d f ees d }

}
}

notesTenor = {
\global
\relative a {

  bes4 | bes( f) g8[ a] | bes2 bes4 | bes2 bes4 | bes2
  \changePitch \patternA { bes a c a a bes }
  bes4 | bes( f) g8[ a] | bes2 bes4 | g2 g4 | bes2
  bes4 | bes2 bes4 | bes( g) a | bes2

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { bes bes bes bes d ees g bes }
  \changePitch \patternA { g f a f f bes, }
  \changePitch \patternA { bes bes bes bes d ees ees e }
  \changePitch \patternA { e f g f f bes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

’Tis sweet to think of those at rest, \bar "."
Who sleep in Christ the Lord, \bar "."
Whose spir -- its now with Him are blest, \bar "."
Ac -- cord -- ing to His Word. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

They once were pil -- grims here with us;
In Je -- sus now they sleep;
And we for them, while rest -- ing thus,
As hope -- less can -- not weep.

}

wordsC = \lyricmode {
\set stanza = "3."

How bright the res -- ur -- rec -- tion morn
On all the saints will break!
The Lord Him -- self will then re -- turn,
His ran -- somed church to take.

}

wordsD = \lyricmode {
\set stanza = "4."

Our Lord Him -- self we then shall see,
Whose blood for us was shed;
With Him for -- ev -- er we shall be,
Made like our glo -- rious Head.

}

wordsE = \lyricmode {
\set stanza = "5."

We can -- not lin -- ger o’er the tomb;
The res -- ur -- rec -- tion day
To faith shines bright be -- yond its gloom,
Christ’s glo -- ry to dis -- play.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
