\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 6) (#t #f))
  page-count = #(cond (is-eogsized 2) (#t #f))
  scoreTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \override #'(baseline-skip . 3.5)
      \column {
        \fill-line {
          \huge \larger \larger \bold {
            \concat { "  " \fromproperty #'header:hymnnumber }
            \mytitle
            \null
          }
        }
        \override #'(baseline-skip . 1)
        \smaller \bold \fill-line {
          \wordwrap { \hspace #3 A home missionary visited a dying boy in a gipsy tent; bending over him, he said, “God so loved the world, that He gave His only Son, that whosoever believeth in Him should not perish, but have everlasting life.” The dying boy heard and whispered: “Nobody ever told me.”
        } }

        \vspace #0.5

        \fill-line {
          \lower #1 \fromproperty #'header:poet
          \smaller \bold \mysubtitle
          \lower #1 \fromproperty #'header:composer
        }
      }
    }
  }
}

\header{
  %children
  hymnnumber = "324"
  title = "Tell It Again!"
  tunename = ""
  meter = "10. 10. 10. 10. with Refrain"
  poet = "Mrs. M. B. C. Slade"
  composer = "B. M. McIntosh"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key a \major
  \autoBeamOff
}

patternA = { \ta c8 c c c c c | c c c c4 c8 | }
patternB = { \ta c8 c c c c c | c c c \tb c4 \ta c8 | }

patternC = { c8 c c c4 c8 | }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { cis cis cis cis b a | b a fis e r }
  \changePitch \patternA { e a a a gis a | b b cis b r }
  \changePitch \patternA { cis cis cis cis b a | b a fis e r }
  \changePitch \patternB { e a a a gis a | b cis b a\fermata r }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternC { d d d b r | cis cis cis a r } >>
  a8 a a a gis a | b cis dis \tb e4\fermata( d8\fermata) \ta
  \changePitch \patternA { cis cis cis cis b a | b a fis e r }
  \changePitch \patternB { e a a a gis a | b cis b a\fermata r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { e e e e d cis | d fis d cis r }
  \changePitch \patternA { cis e e e e e | gis gis a gis r }
  \changePitch \patternA { e e e e d cis | d fis d cis r }
  \changePitch \patternB { cis e e e e e | gis a gis a r }

  \changePitch \patternC { b b b gis r | a a a a r }
  fis8 fis fis fis fis fis | fis a a gis4.\fermata
  \changePitch \patternA { e e e e d cis | d fis d cis r }
  \changePitch \patternB { cis e e e e e | gis a gis a r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a a a a gis a | fis a a a r }
  \changePitch \patternA { a cis cis cis b cis | e e e e r }
  \changePitch \patternA { a, a a a gis a | fis a a a r }
  \changePitch \patternB { a cis cis cis b cis | e e d cis r }

  \changePitch \patternC { e e e e r | e e e cis r }
  cis8 cis cis cis b cis | dis e fis e4\fermata( b8\fermata)
  \changePitch \patternA { a a a a gis a | fis a a a r }
  \changePitch \patternB { a cis cis cis b cis | e e d cis r }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { a a a a a a | d d d a r }
  \changePitch \patternA { a a a a a a | e' e e e r }
  \changePitch \patternA { a, a a a a a | d d d a r }
  \changePitch \patternB { e' e e e e e | e e e a,_\fermata r }

  \changePitch \patternC { e' e e e r | a a a a r }
  fis8 fis fis fis fis fis | b, b b e4._\fermata
  \changePitch \patternA { a, a a a a a | d d d a r }
  \changePitch \patternB { e' e e e e e | e e e a,_\fermata r }

}
}

Refrain = \lyricmode {

Tell it a -- gain! tell it a -- gain! \bar "."
Sal -- va -- tion’s sto -- ry re -- peat o’er and o’er, \bar "."
Till none can say of the chil -- dren of men, \bar "."
No -- body ev -- er has told me be -- fore! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

In -- to the tent, where a gip -- sy boy lay– \bar "."
Dy -- ing a -- lone at the close of the day– \bar "."
News of sal -- va -- tion we car -- ried. Said he, \bar "."
“No -- bod -- y ev -- er has told it to me!” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“Did He so love me– a poor lit -- tle boy?
Send un -- to me the good ti -- dings of joy?
Need I not per -- ish? my hand will He hold?
No -- bod -- y ev -- er the sto -- ry has told!”

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Bend -- ing, we caught the last words of his breath,
Just as he en -- tered the val -- ley of death;
“God sent His Son! –who -- so -- ev -- er!” said he;
“Then I am sure that He sent Him for me!”

}

wordsD = \lyricmode {
\set stanza = "4."

Smil -- ing, he said, as his last sigh was spent,
“I am so glad that for me He was sent!”
Whis -- pered, while low sank the sun in the west:
“Lord, I be -- lieve! tell it now to the rest!”

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
