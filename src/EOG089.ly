\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "Hark Ye! Those Who Choose the Pleasures"
  subsubtitle = "(Ukraina. 8. 7. 8. 7. D.)"
  %meter = "8.7.8.7.D."
  %poet = ""
  composer = "Russian Hymn Tune"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8 c8 | c4 c4 c8[ c8] c8[ c8] | c8[ c8] c4 c4 }
patternAB = { c8 c8 | c4 c4 c4      c4      | c4      c4 c4 }

patternBA = { c8 c8 | c4 c4 c8[ c8] c8[ c8] | c2 c4 }
patternBB = { c8 c8 | c4 c4 c4      c4      | c2 c4 }

patternCA = { c8 c8 | c4 c2 c8 c8 | c4 c4 c4 }

patternDA = { c8 c8 | c4. c8 c8[ c8] c8[ c8] | c2 c4 }
patternDB = { c8 c8 | c4. c8 c4      c4      | c2 c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { d c | b b b c d e | d c a r }
  \changePitch \patternBA { d c | b b a g a b | g r }
  \changePitch \patternAA { d' c | b b b c d e | d c a r }
  \changePitch \patternBA { d c | b b a g a b | g r }

  \changePitch \patternCA { a b | c a b c | d b r }
  \changePitch \patternDA { d d | e d e d b g | a r }
  \changePitch \patternAA { d c | b b b c d e | d c a r }
  \changePitch \patternBA { d c | b b a g a b | g r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e'' {

  \changePitch \patternAA { b a | g g g a b c | b a fis r }
  \changePitch \patternBB { b a | g g fis fis | d r }
  \changePitch \patternAA { b' a | g g g a b c | b a fis r }
  \changePitch \patternBB { b a | g g fis fis | d r }

  \changePitch \patternCA { fis g | a fis g a | b g r }
  \changePitch \patternDA { b b | c b c b g d | fis r }
  \changePitch \patternAA { b a | g g g a b c | b a fis r }
  \changePitch \patternBB { b a | g g fis fis | d r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { d d | d d d d | d d r }
  \changePitch \patternBB { d d | d d d d | b r }
  \changePitch \patternAB { d d | d d d d | d d r }
  \changePitch \patternBB { d d | d d d d | b r }

  \changePitch \patternCA { d d | d d d d | d d r }
  \changePitch \patternDB { d d | c d d d | d r }
  \changePitch \patternAB { d d | d d d d | d d r }
  \changePitch \patternBB { d d | d d d d | b r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { g g | g g g g | d d r }
  \changePitch \patternBB { d d | g g d d | g r }
  \changePitch \patternAB { g g | g g g g | d d r }
  \changePitch \patternBB { d d | g g d d | g r }

  \changePitch \patternCA { d g | d d g g | g g r }
  \changePitch \patternDB { g g | c, g' d d | d r }
  \changePitch \patternAB { g g | g g g g | d d r }
  \changePitch \patternBB { d d | g g d d | g r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Hark ye! those who choose the plea -- sures, \bar "."
That this wretch -- ed world im -- parts, \bar "." \break
Dare you call this sat -- is -- fac -- tion \bar "."
From your deep -- est in -- most heart? \bar "." \break
Is the whirl of world’s con -- fus -- ion \bar "."
So en -- gross -- ing to your mind, \bar "." \break
That for thoughts of deep -- er im -- port \bar "."
You can not a mo -- ment find? \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Thought -- less one, did e’er you pon -- der,
O’er your stand -- ing toward your God;
Have you ev -- er quest -- ioned deep -- ly,
What the goal of paths you trod?
Have you heard the won -- drous sto -- ry
Of the love of God dis -- played;
When He sent His Well -- Be -- lov -- ed,
Such the sac -- ri -- fice He made?

}

wordsC = \lyricmode {
\set stanza = "3."

God so loved this world of sin -- ners,
That He sent His on -- ly Son,
Say -- ing, who -- so -- e’er ac -- cepts Him,
Ev -- er -- last -- ing life hath won!
All have sinned, He tells us plain -- ly,
All in judg -- ment thus con -- demned,
But God’s Christ hath suf -- fered for us,
Right -- eous judg -- ment thus He stemmed.

}

wordsD = \markuplist {

\line { Skeptic, when you read that story, }
\line { When you see that wondrous plan, }
\line { Can you make it but tradition, }
\line { And degrade your God as man? }
\line { Ah, there comes a time to all men, }
\line { When a righteous, holy God, }
\line { Shall mete out a righteous judgment, }
\line { Then shall you believe His Word. }

}

wordsE = \markuplist {

\line { He is waiting for acceptance }
\line { Lost one will you pass Him by, }
\line { Will you rush along unheeding, }
\line { While your ears ring with His cry? }
\line { Don’t delay, as Paul’s accuser, }
\line { Till a more convenient day, }
\line { God with open arms will meet you, }
\line { Loved one, come while yet you may. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak

\markup { \fill-line { %\column {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } } %\combine \null \vspace #0.4
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } } %\combine \null \vspace #0.4
  \hspace #0.1
} } %}

\noPageBreak

\markup {
	\line { Alternate tune: No. 64. }
}

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
