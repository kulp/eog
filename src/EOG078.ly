\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "78"
  title = "Come, Ye That Fear the Lord"
  tunename = "Lorneville"
  meter = "P. M."
  poet = ""
  composer = "Old Melody"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=100 }
tb = { \tempo 4=50  }

patternAA = { c4( c8) | c4 c8 c8[ c8] c8 | c4( c8) }
patternAB = { c4.     | c4 c8 c8[ c8] c8 | c4.     }
patternAC = { c4( c8) | c4 c8 c8[ c8] c8 | c4.     }
patternAD = { c4.     | c4 c8 c4      c8 | c4.     }

patternBA = { c4 c8 c4. }

patternCA = { \patternBA }

patternDA = { c4( c8) | c4 c8 c8[ c8] c8 | c4. c4 }
patternDB = { c4( c8) | c4 c8 c4      c8 | c4. c4 }

patternEA = { c8 | c4 c8 c8[ c8] c8 | c4. }
patternEB = { c8 | c4 c8 c4      c8 | c4. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { f g | a a a g f | g f }
  \changePitch \patternBA { d e | f f a | c }
  \changePitch \patternAA { f, g a a a g f | g f }
  \changePitch \patternCA { d e f }

  \changePitch \patternDA { f g | a g a bes c | d r }
  \changePitch \patternEA { d | c a a g f | g }
  \changePitch \patternAA { f g | a a a g f | g f }
  \changePitch \patternCA { d e f }
  \changePitch \patternCA { f a | c }

  \changePitch \patternAA { f, g | a a a g f | g f }
  \changePitch \patternCA { d e | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { c | f f f c c | d }
  \changePitch \patternBA { d c | c c f | f }
  \changePitch \patternAB { c | f f f c c | d }
  \changePitch \patternCA { d c | c }

  \changePitch \patternDB { c e | f e f f | f r }
  \changePitch \patternEB { f | f c c c | e }
  \changePitch \patternAB { c | f f f c c | d }
  \changePitch \patternCA { d c c }
  \changePitch \patternCA { c f | f }

  \changePitch \patternAB { c | f f f d d | d }
  \changePitch \patternCA { d c | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAC { a bes | c c c bes a | bes }
  \changePitch \patternBA { bes g | a a c | a }
  \changePitch \patternAC { a bes | c c c bes a | bes }
  \changePitch \patternCA { bes g | a }

  \changePitch \patternDB { a bes | c c c c | bes r }
  \changePitch \patternEA { bes | a a c bes a | c }
  \changePitch \patternAC { a bes | c c c bes a | bes }
  \changePitch \patternCA { bes g | a}
  \changePitch \patternCA { a c | a }

  \changePitch \patternAC { a bes | c c c bes a | bes }
  \changePitch \patternCA { bes g | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAD { f | f f f f | bes, }
  \changePitch \patternBA { bes c | f, f' f | f }
  \changePitch \patternAD { f | f f f f | bes, }
  \changePitch \patternCA { bes c | f, }

  \changePitch \patternDA { f' c | f c f g a | bes r }
  \changePitch \patternEB { bes | f f f f | c }
  \changePitch \patternAD { f | f f f f | bes, }
  \changePitch \patternCA { bes c | f }
  \changePitch \patternCA { f f | f }

  \changePitch \patternAD { f | f f f f | bes, }
  \changePitch \patternCA { bes c | f, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Come, ye that fear the Lord, \bar "."
Un -- to Me, un -- to Me; \bar "."
Come, ye that fear the Lord, \bar "."
Un -- to Me! \bar "."
I’ve some -- thing good to say \bar "."
A -- bout the nar -- row way: \bar "."
For Christ the oth -- er day \bar "."
Saved my soul, saved my soul! \bar "."
%{HIDE>%} For Christ the oth -- er day \bar "." %{<HIDE%}
%{HIDE>%} Saved my soul! \bar "." %{<HIDE%}

}

wordsB = \lyricmode {
\set stanza = "2."

He gave me first to see
What I was, what I was;
He gave me first to see
What I was!
He gave me first to see
My guilt and mis -- er -- y,
And then He set me free!
Bless His name! Bless His name!
%{HIDE>%} And then He set me free! %{<HIDE%}
%{HIDE>%} Bless His name! %{<HIDE%}

}

wordsC = \lyricmode {
\set stanza = "3."

My old com -- pan -- ions said,
“He’s un -- done, he’s un -- done!”
My old com -- pan -- ions said,
“He’s un -- done!”
My old com -- pan -- ions said,
“He’s sure -- ly go -- ing mad!”
But Je -- sus makes me glad!
Bless His name! Bless His name!
%{HIDE>%} But Je -- sus makes me glad! %{<HIDE%}
%{HIDE>%} Bless His name! %{<HIDE%}

}

wordsD = \markuplist {

\line { Some said, “He’ll soon give o’er, }
\line { You shall see, you shall see!” }
\line { Some said, “He’ll soon give o’er, }
\line { { \hspace #2 } You shall see!” }
\line { But time has passed away }
\line { Since I began to pray, }
\line { And I feel His love today! }
\line { Bless His name! Bless His name! }

}

wordsE = \markuplist {

\line { So now I’m going home }
\line { To the Lord, to the Lord. }
\line { So now I’m going home }
\line { { \hspace #2 } To the Lord. }
\line { So now I’m going home. }
\line { Poor sinner, won’t you come? }
\line { Or meet an awful doom }
\line { From the Lord, from the Lord. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
