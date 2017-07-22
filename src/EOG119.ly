\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "119"
  title = "The Blood Upon the Door"
  tunename = "Otter Lake"
  meter = "8. 7. 8. 7. D."
  poet = ""
  composer = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4. c8 c8 c8 c8 c8 | c4 c2. }
patternAB = { c4. c8 c8 c8 c8 c8 | c2. c4 }
patternAC = { c4. c8 c8 c8 c8. c16 | c2. c4 }
patternAD = { c4. c8 c8 c8 c8 c8 | \ta c2. \tb c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { a a bes a g f | d f }
  \changePitch \patternAB { c' d c a g f | g r }
  \changePitch \patternAA { a a bes a g f | d f }
  \changePitch \patternAB { g g c bes a g | f r }

  \changePitch \patternAA { g fis g a bes d | c a }
  \changePitch \patternAC { f' f c d c a | g r }
  \changePitch \patternAA { a a bes a g f | d f }
  \changePitch \patternAD { g g c bes a g | f \fermata r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { f f f f c c | bes d }
  \changePitch \patternAB { f f f f e d | e r }
  \changePitch \patternAA { f f f f c c | bes f' }
  \changePitch \patternAB { e e e e e e | f r }

  \changePitch \patternAA { e dis e f g e | f f }
  \changePitch \patternAC { a a a bes a f | e r }
  \changePitch \patternAA { f f f f c c | bes f' }
  \changePitch \patternAD { e e e e e e | f r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c c d c bes a | f bes }
  \changePitch \patternAB { a bes a c c b! | c r }
  \changePitch \patternAA { c c d c bes a | f d' }
  \changePitch \patternAB { c c c c c bes | a r }

  \changePitch \patternAA { c c c c c bes | a c }
  \changePitch \patternAC { c c f f f c | c r }
  \changePitch \patternAA { c c d c bes a | f d' }
  \changePitch \patternAD { c c c c c bes | a r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f f f f f f | bes, bes }
  \changePitch \patternAB { f' f f f e d | c r }
  \changePitch \patternAA { f f f f f f | bes, bes }
  \changePitch \patternAB { c c c c c c | f r }

  \changePitch \patternAA { c c c c c c | f f }
  \changePitch \patternAC { f f f f f f | c r }
  \changePitch \patternAA { f f f f f f | bes, bes }
  \changePitch \patternAD { c c c c c c | f_\fermata r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

When God’s judg -- ment fell on E -- gypt, \bar "."
There was weep -- ing ev -- ’ry -- where; \bar "."
For the an -- gel smote the first -- born \bar "."
Of the peo -- ple dwell -- ing there. \bar "."
But some hous -- es God passed o -- ver, \bar "."
As His word had said be -- fore, \bar "."
And death en -- tered not the dwell -- ings \bar "."
Where the blood was on the door. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Tears and pray’rs can nev -- er save us,
All our works are but in vain,
Lives pos -- sessed of pur -- est mer -- its
Can -- not cleanse sin’s aw -- ful stain;
On -- ly by the blood of Je -- sus,
Who for us the judg -- ment bore,
We can calm -- ly face the fu -- ture,
When His blood is on the door.

}

wordsC = \lyricmode {
\set stanza = "3."

Come, now, trust in Christ the Sav -- iour,
Him who died up -- on the tree; % blue book changes "Him" to "He" erroneously
His a -- ton -- ing blood most pre -- cious
There was shed for you and me.
Shel -- tered by the blood of Je -- sus,
We are saved for -- ev -- er -- more,
Saved from hell and saved for heav -- en
By the blood up -- on the door.

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
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
