\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  %gospel
  hymnnumber = "372"
  title = "How Wondrous a Saviour"
  tunename = "Take Time to Be Holy"
  meter = "6. 5. 6. 5. D."
  poet = "L. H. Farrell"
  composer = "Geo. C. Stebbins"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=140
  \key f \major
  \autoBeamOff
}

patternA = { c4. c8 c c | c4. c | c c8 c c | c4. c }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { a a g a | bes a | f g f e | f ~ f }
  \changePitch \patternA { a a g a | bes a | g g g g | g ~ g }
  \changePitch \patternA { bes bes a g | a c | bes bes a g | a ~ a }
  \changePitch \patternA { c c bes a | d bes | a g f e | f ~ f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { f f f f | f f | f c c c | c ~ c }
  \changePitch \patternA { f f f f | f f | e d e f | e ~ e }
  \changePitch \patternA { g g f e | f f | e e f e | f ~ f }
  \changePitch \patternA { f f e f | f f | f c c c | c ~ c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { c c bes c | d c | a bes a g | a ~ a }
  \changePitch \patternA { c c bes c | d c | c b c d | c ~ c }
  \changePitch \patternA { c c c c | c a | g g c c | c ~ c }
  \changePitch \patternA { a c c c | bes d | c bes a g | a ~ a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { f f f f | f f | c c c c | f ~ f }
  \changePitch \patternA { f f f f | f f | g g g g | c, ~ c }
  \changePitch \patternA { c c c c | f f | c c c c | f ~ f }
  \changePitch \patternA { f a g f | bes bes, | c c c c | f ~ f }

}
}

wordsA = \lyricmode {
\set stanza = "1."

How won -- drous a Sav -- iour is God’s bless -- ed Son! \bar "."
How great and e -- ter -- nal the work He has done! \bar "."
God’s glo -- ry main -- tained by His death on the tree, \bar "."
While mer -- cy flows free -- ly to you and to me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

How free is the par -- don His blood has pro -- cured!
How bless -- ed the wel -- come His name has en -- sured
To all who con -- fess Him their Sav -- iour and Lord,
Now bro’t in -- to fa -- vor, be -- liev -- ing His Word.

}

wordsC = \lyricmode {
\set stanza = "3."

On Cal -- va -- ry see Him, who died in our stead,
Ex -- haust -- ing God’s judg -- ment, when for us He bled;
God’s wrath He en -- dur -- ed on Cal -- va -- ry’s tree,
By weak -- ness and dy -- ing, the vic -- tor was He.

}

wordsD = \markuplist {

\line { Oh! why remain distant, when God calls thee near? }
\line { { \hspace #2 } In love that dismisses all bondage and fear. }
\line { Oh, why remain Christless, when thou may’st be blest? }
\line { { \hspace #2 } Oh, why remain weary, when Christ giveth rest? }

}

wordsE = \markuplist {

\line { The moments are fleeting; then haste, why delay? }
\line { { \hspace #2 } Secure God’s salvation, while still ’tis today; }
\line { Eternity’s ages thy soul has to face– }
\line { { \hspace #2 } In blackness of darkness, or riches of grace. }

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

\markup { \fill-line { \column {
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } }
  \vspace #1
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
