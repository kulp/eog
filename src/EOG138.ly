\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
  system-count = #(cond (is-eogsized 6) (#t #f))
  systems-per-page = #(cond (is-eogsized 5) (#t #f))
}

\header{
  %gospel
  hymnnumber = "138"
  title = "“Whosoever Will”"
  tunename = ""
  meter = "P. M."
  poet = "P. P. Bliss"
  composer = "P. P. Bliss"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8. c16 c8 c8 c4 c4 | c8 ~ c8  c8. c16 c2 }
patternAB = { c8. c16 c8 c8 c4 c4 | c8.  c16 c8  c8  c2 }
patternAC = { c8. c16 c8 c8 c4 c4 | c8.  c16 c8. c16 c2 }

patternBA = { c8. c16 c8 c8 \tb c4 \ta c4 | c2. c4 }

patternCA = { c8. c16 c8 c8 c2 }

patternDA = { c8. c16 c8 c8 c8 c8 c8 c8 | c4 c4 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { a b a fis d d' | b b d b a }
  \changePitch \patternAB { a b a fis d fis | e d e fis e }
  \changePitch \patternAC { a b a fis d d' | b b d b a }
  \changePitch \patternBA { a b cis d e \fermata cis | d r }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { cis cis cis d e | d cis d b a } >>
  \changePitch \patternDA { fis fis fis a b a b d | e d cis }
  \changePitch \patternAB { d cis d b a fis | g fis g a b }
  \changePitch \patternBA { a b cis d e \fermata cis | d r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { fis g fis d d fis | g g g g fis }
  \changePitch \patternAB { fis g fis d d d | cis b cis d cis }
  \changePitch \patternAC { fis g fis d d fis | g g g g fis }
  \changePitch \patternBA { cis d e fis g e | fis r }

  \changePitch \patternCA { e e e fis g | fis fis fis g fis }
  \changePitch \patternDA { d d d fis g g g g | gis gis a }
  \changePitch \patternAB { fis fis fis g fis d | d d g g g }
  \changePitch \patternBA { cis, d e fis g e | fis r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { d d d a a a | g g b d d }
  \changePitch \patternAB { d d d a a a | a a a a a }
  \changePitch \patternAC { d d d a a a | g g b d d }
  \changePitch \patternBA { a a a a a a | a r }

  \changePitch \patternCA { a a a a a | a a a d d }
  \changePitch \patternDA { a a a d d d d b | b b a }
  \changePitch \patternAB { a a a b d a | b b b cis d }
  \changePitch \patternBA { a a a a a a | a r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { d d d d fis d | g g g g d }
  \changePitch \patternAB { d d d d fis d | a a a a a }
  \changePitch \patternAC { d d d d fis d | g g g g d }
  \changePitch \patternBA { a' a a a a_\fermata a | d, r }

  \changePitch \patternCA { a' a a a a | d, d d d d }
  \changePitch \patternDA { d d d d g g g g | e e a }
  \changePitch \patternAB { d, d d d d d | g g g g g }
  \changePitch \patternBA { a a a a a_\fermata a | d, r }

}
}

Refrain = \lyricmode {

“Who -- so -- ev -- er will,” “who -- so -- ev -- er will,” \bar "."
Send the pro -- cla -- ma -- tion o -- ver vale and hill. \bar "."
’Tis a lov -- ing Fa -- ther calls the wan -- d’rer home: \bar "."
“Who -- so -- ev -- er will may come.” \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

“Who -- so -- ev -- er hear -- eth,” shout, shout the sound! \bar "."
Send the bless -- ed ti -- dings all the world a -- round; \bar "."
Spread the joy -- ful news wher -- ev -- er man is found, \bar "."
“Who -- so -- ev -- er will may come.” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Who -- so -- ev -- er com -- eth must not de -- lay;
Now the door is o -- pen, en -- ter while you may;
Je -- sus is the true, the on -- ly liv -- ing Way:
“Who -- so -- ev -- er will may come.”

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

“Who -- so -- ev -- er will,” the promise is se -- cure;
“Who -- so -- ev -- er will,” for -- ev -- er shall en -- dure;
“Who -- so -- ev -- er will,” ’tis life for -- ev -- er -- more;
“Who -- so -- ev -- er will may come.”

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
