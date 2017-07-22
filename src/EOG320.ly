\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 6) (#t #f))
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  %children
  hymnnumber = "320"
  title = "Only an Act of Kindness"
  tunename = "Only a Beam of Sunshine"
  meter = "P. M."
  poet = "Mrs. C. Kingsbury"
  composer = "Jno. R. Sweney"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \autoBeamOff
}

patternA = { c8. c16 c8 c4 c8 | c4. c4 }
patternB = { c8 \patternA c8 }
patternC = { c8 | c c c c4 c8 | c4. c4 c8 }
patternD = { c8 c c c4 c8 | c4. c4 c8 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { b a g g d | e d }
  \changePitch \patternB { d | g g g a b | a ~ a } \eogbreak
  \changePitch \patternB { c | b a g g d | e g }
  \changePitch \patternB { a | b c b b a | g ~ g r }
  {
  \override Stem.direction = #UP
  \changePitch \patternA { fis g a a c | b g }
  \changePitch \patternB { g | fis g a d c | b ~ b } \eogbreak
  }
  \changePitch \patternC { b | b c b b a | g e }
  \changePitch \patternC { e | d g fis b a | g ~ g r }

  \eogpagebreak
  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternD { d' d d d c | b b r } >>
  \changePitch \patternD { b b b b a | g ~ g r }
  \changePitch \patternD { g fis e e ees | d g }
  \changePitch \patternC { a | b b c b a | g ~ g r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d d d d d | c b }
  \changePitch \patternB { b | d d d d d | d ~ d }
  \changePitch \patternB { d | d d d d d | c e }
  \changePitch \patternB { ees | d e d d c | b ~ b r }
  R1*3/4 | r4. r4
  r8 | R1*3/4 | r4. r4
  \changePitch \patternC { d | d e d dis dis | e c }
  \changePitch \patternC { c | b d d d c | b ~ b r }

  \changePitch \patternD { g' g g g g | g g r }
  \changePitch \patternD { dis dis dis dis fis | e ~ e r }
  \changePitch \patternD { e d c c c | b d }
  \changePitch \patternC { ees | d d e d c | b ~ b r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g c b b g | g g }
  \changePitch \patternB { g | g g g fis g | fis ~ fis }
  \changePitch \patternB { a | g c b b g | g c }
  \changePitch \patternB { g | g g g g fis | g ~ g r }
  \changePitch \patternA { a b c c e | d b }
  \changePitch \patternB { b | a b c fis e | d ~ d }
  \changePitch \patternC { g, | g g g fis b | g g }
  \changePitch \patternC { g | g b a g fis | g ~ g r }

  \changePitch \patternD { b b b b e | d d r }
  \changePitch \patternD { b fis fis fis b | b ~ b r }
  \changePitch \patternD { c g g g g | g g }
  \changePitch \patternC { g | g g g g fis | g ~ g r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g g g g b, | c g }
  \changePitch \patternB { g | b b b d g | d ~ d }
  \changePitch \patternB { fis | g g g g b, | c c }
  \changePitch \patternB { c | d d d d d | g, ~ g r }
  R1*3/4 | r4. r4
  r8 | R1*3/4 | r4. r4
  \changePitch \patternC { g' | g g g b, b | c c }
  \changePitch \patternC { c | d d d d d | g, ~ g r }

  \changePitch \patternD { g' g g g g | g g r }
  \changePitch \patternD { b, b b b b | e ~ e r }
  \changePitch \patternD { c c c c c | g b }
  \changePitch \patternC { c | d d d d d | g, ~ g r }

}
}

rests = {
\global

  \repeat unfold 24 \skip 4
  R1*3/4 | r4. r4
  r8 | R1*3/4 | r4. r4

}

Refrain = \lyricmode {

On -- ly a word for Je -- sus, \bar "."
On -- ly a whis -- pered prayer, \bar "."
Seek -- ing His help and bless -- ing, \bar "."
Is heard by our Lord up there. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

On -- ly an act of kind -- ness \bar "."
That you, lit -- tle child, may show, \bar "."
While seek -- ing to please the Sav -- iour, \bar "."
And more like Him -- self to grow. \bar "."
On -- ly a fee -- ble ef -- fort \bar "."
To light -- en the heav -- y load \bar "."
Of some wear -- y, way -- worn trav -- ’ler, \bar "."
While wend -- ing his toil -- some road. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

On -- ly a glimpse of sun -- shine
That you, lit -- tle child, may shed,
To bright -- en a path of sor -- row
Where oth -- ers may fear to tread.
On -- ly some self -- de -- ni -- al,
At -- tend -- ed, per -- haps, with pain,
But all that is loss at pres -- ent
Will some -- day be rich -- est gain.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

On -- ly a word for Je -- sus
That you, lit -- tle child, may speak;
A word that will reach some sin -- ner
Whom Je -- sus once came to seek.
On -- ly a lit -- tle pa -- tience
When some -- bod -- y does you wrong,
For Je -- sus will judge of -- fen -- ses,
Dear child, it will not be long.

}

wordsD = \lyricmode {
\set stanza = "4."

On -- ly a lit -- tle ser -- vice
While seek -- ing to live for God
Mid dark -- ness, and sin, and sor -- row,
Where Je -- sus, Him -- self, once trod.
On -- ly a lit -- tle wait -- ing,
Dear child, let your light shine bright,
For Je -- sus will come and take you
To glo -- ry, and love, and light.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice = altoRests { \voiceTwo << \rests >> }
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
      \context Voice = bassRests { \voiceTwo << \rests >> }
    >>
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
