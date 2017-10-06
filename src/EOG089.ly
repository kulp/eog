\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG089.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 64." } }
}

\header{
  %gospel
  hymnnumber = "89"
  title = "Hark Ye! Those Who Choose the Pleasures"
  tunename = "Ukraina"
  meter = "8. 7. 8. 7. D."
  poet = ""
  composer = "Russian Hymn Tune"
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
  \override Staff.TimeSignature.style = #'numbered
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

Hark ye! those who choose the pleas -- ures, \bar "."
That this wretch -- ed world im -- parts, \bar "." \eogbreak
Dare you call this sat -- is -- fac -- tion \bar "."
From your deep -- est, in -- most heart? \bar "." \eogbreak
Is the whirl of world’s con -- fu -- sion \bar "."
So en -- gross -- ing to your mind, \bar "." \eogbreak
That for thoughts of deep -- er im -- port \bar "."
You can -- not a mo -- ment find? \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Thought -- less one, did e’er you pon -- der,
O’er your stand -- ing toward your God;
Have you ev -- er quest -- ioned deep -- ly,
What the goal of paths you trod?
Have you heard the won -- drous sto -- ry
Of the love of God dis -- played;
When He sent His well -- be -- lov -- ed,
Such the sac -- ri -- fice He made?

}

wordsC = \lyricmode {
\set stanza = "3."

God so loved this world of sin -- ners,
That He sent His on -- ly Son,
Say -- ing, “Who -- so -- e’er ac -- cepts Him,
Ev -- er -- last -- ing life hath won!”
All have sinned, He tells us plain -- ly,
All in judg -- ment thus con -- demned,
But God’s Christ hath suf -- fered for us,
Right -- eous judg -- ment thus He stemmed.

}

wordsD = \markuplist {

\line { Skeptic, when you read that story, }
\line { { \hspace #2 } When you see that wondrous plan, }
\line { Can you make it but tradition, }
\line { { \hspace #2 } And degrade your God as man? }
\line { Ah, there comes a time to all men, }
\line { { \hspace #2 } When a righteous, holy God, }
\line { Shall mete out a righteous judgment, }
\line { { \hspace #2 } Then shall you believe His Word. }

}

wordsE = \markuplist {

\line { He is waiting for acceptance, }
\line { { \hspace #2 } Lost one, will you pass Him by, }
\line { Will you rush along unheeding, }
\line { { \hspace #2 } While your ears ring with His cry? }
\line { Don’t delay, as Paul’s accuser, }
\line { { \hspace #2 } Till a more convenient day. }
\line { God with open arms will meet you, }
\line { { \hspace #2 } Loved one, come while yet you may. }

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

\noPageBreak

\markup { \vcenter \column { \vspace #1 \fill-line {
  \null
  \line{ \bold 4 \column { \wordsD } }
  \null
  \line{ \bold 5 \column { \wordsE } }
  \null
} \vspace #1 } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
