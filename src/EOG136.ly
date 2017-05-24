\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
  system-count = #(cond (is-eogsized 7) (#t #f))
}

\header{
  hymnnumber = "136"
  title = "When The Harvest Is Past"
  tunename = ""
  meter = "12. 8. 12. 8. with Refrain"
  poet = "S. F. Smith"
  composer = "H. H. McGranahan"
  tagline = ##f
}

patternA = { e8. f16 | g4 e g | c2 c8. c16 | b4 a f | a2 }
patternB = { a4 | g e g | f d f | e2. ~ | e4 c }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=110
  \key c \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e8. f16 | g4 e g | c2 c8. c16 | b4 a f | a2 \eogbreak
  a4 | g e g | f d f | e2. ~ | e4 r \eogbreak
  e8. f16 | g4 e g | c2 c8. c16 | b4 a f | a2 \eogbreak
  a4 | g e c' | b a b | c2. ~ | c4 r \eogbreak

  << s^\markup { \small \caps "Refrain" }
  { b8. c16 | d2. ~ | d4 c d | e2. ~ | e2 } >>
  b8. c16 | d2. ~ | d4 c d | e2. ~ | e2
  e,8. f16 | g4 e g | c2 c8. c16 | b4 a f | a2
  a4 | g e c' | b a b | c2. ~ | c2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { c d | e c e | e e e | g f d | f }
  \changePitch \patternB { f | e c e | d b d | c | c r }
  \changePitch \patternA { c d | e c e | e e e | g f d | f }
  \changePitch \patternB { f | e c e | f f f | e | e r }

  d8.  e16 | f2. ~ | f4 e f | g g gis | a2
  d,8. e16 | f2. ~ | f4 e f | g g gis | a2
  \changePitch \patternA { c, d | e c e | e e e | g f d | f }
  f4 | e c e | f f f | e2. ~ | e2

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g g | c c c | g c c | c c a | c }
  \changePitch \patternB { c | c c c | b b b | c | c r }
  \changePitch \patternA { g g | c c c | g c c | c c a | c }
  \changePitch \patternB { c | c c c | d d d | c | c r }

  r4 | r2 b8. b16 | b4 c b | c e d | c2
  r4 | r2 b8. b16 | b4 c b | c e d | c2
  \changePitch \patternA { g g | c c c | g c c | c c a | c }
  c4 | c c c | d d g, | g2. ~ | g2

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { c c | c c c | c c c | f f f | f }
  \changePitch \patternB { f | g g g | g g g | c, | c r }
  \changePitch \patternA { c c | c c c | c c c | f f f | f }
  \changePitch \patternB { f | g g g | g g g | c, | c r }

  r4 | r2 g'8. g16 | g4 a g | c c b | a2
  r4 | r2 g8. g16 | g4 a g | c, c b | a2
  \changePitch \patternA { c c | c c c | c c c | f f f | f }
  f4 | g g g | g g g | c,2. ~ | c2

}
}

Refrain = \lyricmode {

When the har -- vest is past, \bar "."
And the sum -- mer is o’er, \bar "."
When the beams cease to break of the blest Lord’s day morn, \bar "."
And Je -- sus in -- vites you no more. % "you" in refrain vs. "thee" in verses

}

wordsA = \lyricmode {
\set stanza = "1."

When the har -- vest is past and the sum -- mer is gone, \bar "."
And God’s gra -- cious plead -- ings are o’er, \bar "."
When the beams cease to break of the blest Lord’s day morn, \bar "."
And Je -- sus in -- vites thee no more— \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

When the rich gales of mer -- cy no long -- er shall blow,
The gos -- pel no mes -- sage de -- clare,
How canst thou, sin -- ner, bear the deep wail -- ing of woe,
How suf -- fer the night of de -- spair?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

When the ho -- ly have gone to the re -- gion of peace,
To dwell in the man -- sions a -- bove,
When their har -- mo -- ny wakes in the full -- ness of bliss,
Their song to the Sav -- iour of love—

}

wordsD = \lyricmode {
\set stanza = "4."

O dear sin -- ner, that liv -- est at ease and se -- cure,
Who fear -- est no trou -- ble to come,
Can thy spir -- it the wail -- ings of sor -- row en -- dure,
Or bear the im -- pen -- i -- tent’s doom?

}

underWords = \lyricmode {

{ \repeat unfold 40 { \skip 4 } }
When the har -- vest, the har -- vest is past,
And the sum -- mer, the sum -- mer is o’er,

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
    \context Lyrics = three \lyricsto tenors \underWords
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
