\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 2) (#t #f))
  system-system-spacing.padding = 11
}

\header{
  %gospel
  hymnnumber = "24"
  title = "Jesus Only Can Impart"
  tunename = "Weber"
  meter = "7. 7. 7. 7. "
  %poet = ""
  composer = "C. M. von Weber"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4      c4 | c4 c4           | c4 c8[ c8] | c2 }
patternAB = { c4      c4 | c4 c4           | c4 c4      | c2 }
patternAC = { c4      c4 | c8[ c8] c8[ c8] | c4 c4      | c2 }
patternAD = { c8[ c8] c4 | c4 c4           | c4 c4      | c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { a g | bes a     | d c a  | g }
  \changePitch \patternAB { a a | a a       | bes e, | f }
  \changePitch \patternAA { a g | bes a     | d c a  | g }
  \changePitch \patternAC { a c | c bes a g | f e    | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { f f | f f   | gis a f | e }
  \changePitch \patternAB { f f | e ees | d c     | c }
  \changePitch \patternAA { f f | f f   | gis a f | e }
  \changePitch \patternAB { f a | g d   | c c     | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { c bes   | d c   | b c     | bes }
  \changePitch \patternAB { a d     | cis c | bes bes | a   }
  \changePitch \patternAB { c bes   | d c   | b c     | bes }
  \changePitch \patternAD { a c ees | d bes | a bes   | a   }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { f f   | f f    | f f  | c }
  \changePitch \patternAB { f d   | a fis' | g c, | f }
  \changePitch \patternAB { f f   | f f    | f f  | c }
  \changePitch \patternAB { f fis | g bes, | c c  | f }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus on -- ly can im -- part \bar "."
Peace of con -- science, joy of heart; \bar "." \break
Je -- sus on -- ly can pro -- claim \bar "."
Par -- don thro’ His bless -- ed name. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus on -- ly can sup -- ply
Con -- stant pleas -- ure, last -- ing joy;
Je -- sus on -- ly can re -- move
Ev -- ’ry tho’t that makes us rove.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus on -- ly– sweet -- est plea,
When the soul its state can see;
When its mis -- ’ry it can feel,
Je -- sus on -- ly then can heal.

}

wordsD = \lyricmode {
\set stanza = "4."

Je -- sus on -- ly; ev -- ’ry claim
We can make is in that name;
Full sal -- va -- tion meets us there;
Else -- where, noth -- ing but de -- spair.

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
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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
