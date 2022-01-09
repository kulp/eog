\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG365.ily"
}

\header{
  %children
  hymnnumber = "365"
  title = "We Are Glad We Ever Heard the Blessed News" % not found at hymnary.org
  tunename = "Marching On"
  meter = "P. M. with Refrain" % something like 11. 11. 11. 7. with Refrain (6. 6. 6. 7.)
  poet = ""
  composer = "William B. Bradbury" % see https://hymnary.org/tune/we_are_marching_on_with_shield_bradbury
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key a \major
  \partial 4
  \autoBeamOff
}

patternA = { c8. c16 | c4 c c c | c8. c16 c8. c16 c4 }
patternB = { c8. c16 | c4 c c c | c2. }

patternC = { c8. c16 | c2. }
patternD = { r4 c8. c16 c2 }

notesSopranoFirst = {
\relative c'' {

  \changePitch \patternA { a b | cis e, a cis | cis b b ais b }
  \changePitch \patternA { b cis | d e, b' d | d cis cis b cis }
  \changePitch \patternA { a b | cis e, a cis | cis b b ais b }
  \changePitch \patternB { a fis | e a gis b | a^\markup{\italic Fine} }

}
}

notesSoprano = {
\global
\relative c'' {

  \notesSopranoFirst

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternC { cis d | e } >>
  \changePitch \patternC { cis d | e }
  \changePitch \patternC { d cis | d }
  \changePitch \patternC { cis b | cis }
  \changePitch \patternC { cis d | e }
  \changePitch \patternC { cis d | e }
  \changePitch \patternB { e cis | b e e dis | e }

  \bar "|."

}
}

notesAltoFirst = {
\relative e' {

  \changePitch \patternA { cis d | e cis cis e | d d d cis d }
  \changePitch \patternA { d e | e e e b' | b a a gis a }
  \changePitch \patternA { cis, d | e e e e | fis fis fis fis fis }
  \changePitch \patternB { fis d | cis e d d | cis }

}
}

notesAlto = {
\global
\relative e' {

  \notesAltoFirst

  \changePitch \patternC { a b | cis }
  \changePitch \patternC { a b | cis }
  \changePitch \patternC { b a | b }
  \changePitch \patternC { a gis | a }
  \changePitch \patternC { a b | cis }
  \changePitch \patternC { a b | cis }
  \changePitch \patternB { cis a | b b a a | } gis4 a b^\markup{\italic{D. C.}}

}
}

notesTenorFirst = {
\relative a {

  \changePitch \patternA { a a | a a a a | gis gis gis gis gis }
  \changePitch \patternA { gis gis | b gis gis gis | e e e e e }
  \changePitch \patternA { a a | a cis cis a | d d d d d }
  \changePitch \patternB { d a | a cis b gis | a }

}
}

notesTenor = {
\global
\relative a {

  \notesTenorFirst

  r4 |
  \changePitch \patternD { a a a | }
  \changePitch \patternD { a a a | }
  \changePitch \patternD { e' e e | }
  \changePitch \patternD { a, a a | }
  \changePitch \patternD { a a a | }
  \changePitch \patternD { a a } a4
  \changePitch \patternB { a a | e' e fis b, | } b4 cis d

}
}

notesBassFirst = {
\relative f {

  \changePitch \patternA { a a | a a a a | e e e e e }
  \changePitch \patternA { e e | e e e e | a, a a a a }
  \changePitch \patternA { a' a | a a a a | d, d d d d }
  \changePitch \patternB { d a' | e e e e | a, }

}
}

notesBass = {
\global
\relative f {

  \notesBassFirst

  r4 |
  \changePitch \patternD { a a a | }
  \changePitch \patternD { a a a | }
  \changePitch \patternD { e e e | }
  \changePitch \patternD { a a a | }
  \changePitch \patternD { a a a | }
  \changePitch \patternD { a a } a4
  \changePitch \patternB { a a | gis gis b b | e, }

}
}

Refrain = \lyricmode {

Bless -- ed news! joy -- ful news! % \bar is not appropriate
Bless -- ed news! joy -- ful news! % \bar is not appropriate
Bless -- ed news! joy -- ful news! \bar "."
Sound the joy -- ful ti -- dings forth! \bar "."
( - Repeat stanza - )

}

underWords = \lyricmode {

\repeat unfold 40 \skip 4
Bless -- ed news joy -- ful news
Bless -- ed news joy -- ful news
Bless -- ed news joy -- ful news

}

wordsA = \lyricmode {
\set stanza = "1."

We are glad we ev -- er heard the bless -- ed news, \bar "."
How that Je -- sus died to pay our might -- y dues, \bar "."
And that God has said He nev -- er will re -- fuse \bar "."
Those who trust in Je -- sus’ blood. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Oh! what love of God to send Him from on high,
Oh! what love of Je -- sus thus to bleed and die,
Oh! what love we owe for par -- don brought so nigh,
Through _ faith in Je -- sus’ blood!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

But if we the full -- ness of that love would know,
And to that bright home of peace and joy would go,
We must know our sins for -- given while here be -- low,
Through _ faith in Je -- sus’ blood.

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
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context Lyrics = three \with { alignAboveContext = men } \lyricsto tenors \underWords
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
}

\include "score-EOG365.ily"

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
