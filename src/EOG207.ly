\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "207"
  title = "“But For a Moment”"
  tunename = ""
  meter = "10. 10. 11. 10. and Refrain"
  poet = "A. A. P."
  composer = "G. C. Stebbins"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 9/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4.
  \autoBeamOff
}

patternA = { c8 c c | c4. c4 c8 c c c | c4. c }
patternB = { c8 c c | c4. c4 c8 c c c | c4. ~ c }
patternC = { c8 c c | c4. c4 r8 c c c | c4. c4 c8 }
patternD = { c8 c c | c4. c4 c8 c c c | c4. c4 c8 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { b ais b d, g b b ais b | c fis, }
  \changePitch \patternB { a gis a | d, a' c c b ais | b b }
  \changePitch \patternA { b ais b | d, g b b a b | d c }
  \changePitch \patternB { c g a | b d, a' a g fis | g g }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternC { d' cis d | e d b ais b | c b r } >>
  \changePitch \patternD { b a e | g fis g a b c | e( d) r }
  \changePitch \patternC { d cis d | e d b ais b | c b r }
  \changePitch \patternA { a e c' | b \tb d\fermata \ta c c \tb b\fermata \ta a | g ~ g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d cis d | b b d d cis d | fis d }
  \changePitch \patternB { c b c | c c e e d cis | d d }
  \changePitch \patternA { d cis d | b b d g fis f | e e }
  \changePitch \patternB { e e ees | d b c c b a | b b }

  \changePitch \patternC { g' g g | g g d cis d | e d r }
  \changePitch \patternD { cis cis cis | d d d fis g a | ais( b) r }
  \changePitch \patternC { b ais b | c b g g g | g g r }
  \changePitch \patternA { e e g | g g g fis fis d | d ~ d }

}
}

notesTenorVerse = {
\global
\relative a {

  \magnifyMusic 0.63 {
  \override Score.SpacingSpanner.spacing-increment = #(* 1.2 0.63)
  r4. | r8 <g d>[ <g d>] <g d>4 r8 r4. | r8 <a d,>[ <a d,>] <c a>4.
  r4. | r8 <a fis>[ <a fis>] <a fis>4 r8 r4. | r8 <g d>[ <g d>] <g d>4.
  r4. | r8 <g d>[ <g d>] <g d>4 r8 r4. | r8 <c g>[ <c g>] <c g>4.
  r4. | r8 <b g>[ <b g>] g4 r8 r4. | r8 <g d>[ <g d>] <g d>4.
  }

}
}

notesTenorChorus = {
\global
\relative a {

  \repeat unfold 36 \skip 4
  \changePitch \patternC { b ais b | c b g g g | g g r }
  \changePitch \patternD { g g a | b a b c d d | cis( d) r }
  \changePitch \patternC { d e d | <g, \tweak font-size #-4 e'> <b \tweak font-size #-4 d> d cis d | e d r }
  \changePitch \patternA { c c c | d d e e d c | b ~ b }

}
}

notesBassVerse = {
\global
\relative f, {

  \magnifyMusic 0.63 {
  \override Score.SpacingSpanner.spacing-increment = #(* 1.2 0.63)
  r4. | g4. g4 r8 r4. | a4. d4.
  r4. | d4. d4 r8 r4. | g,4. g4.
  r4. | g4. g4 r8 r4. | c4. c4.
  r4. | d4. d4 r8 r4. | g,4. g4.
  }

}
}

notesBassChorus = {
\global
\relative f, {

  \repeat unfold 36 \skip 4
  \changePitch \patternC { g' g g | g g g g g | g g r }
  \changePitch \patternD { e e a, | d d d d d d | g ~ g r }
  \changePitch \patternC { g g g | g g g g g | g g r }
  \changePitch \patternA { c, c e | g b_\fermata a d, d\fermata d | < g g, > ~ < g g, > }

}
}

Refrain = \lyricmode {

“But for a mo -- ment!” on -- ly a mo -- ment! \bar "."
Light our af -- flic -- tion– ’twill soon pass a -- way. \bar "."
“But for a mo -- ment!” on -- ly a mo -- ment! \bar "."
Then comes the glo -- ry, for -- ev -- er and aye! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

“But for a mo -- ment”– this val -- ley of sor -- rows, \bar "."
Dark -- ened with shad -- ows and heav -- y with sighs; \bar "."
Bright dawns the mor -- row, the glo -- ri -- ous mor -- row! \bar "."
Faint not! the Lord shall call us to a -- rise! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“Far more ex -- ceed -- ing” the heav -- en -- ly glo -- ry–
Suf -- fer -- ings here with it can -- not com -- pare.
Glo -- ry e -- ter -- nal the guer -- don for an -- guish–
Ra -- di -- ant crowns, for the thorns, o -- ver there!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Tem -- por -- al things like a va -- por shall van -- ish;
High -- er than earth lies the land of our choice;
Up -- ward we press to the home there e -- ter -- nal;
Je -- sus, the Lord, we be -- hold and re -- joice!

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
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \context Voice = tenors { \voiceOne << \notesTenorVerse >> }
      \context Voice = basses { \voiceTwo << \notesBassVerse >> }
      \partcombine #'(2 . 9) \notesTenorChorus \notesBassChorus
      \context NullVoice = tenors { \voiceOne << \notesTenorChorus >> }
      \context NullVoice = basses { \voiceTwo << \notesBassChorus >> }
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
