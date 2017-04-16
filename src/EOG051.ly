\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-count = #(cond (is-eogsized 3) (#t #f))
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "51"
  title = "Eternity! Where? It Floats in the Air"
  tunename = "Eternity"
  meter = "4-11s."
  poet = ""
  composer = "Wm. M. Horsey"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=100 }
tb = { \tempo 4=50  }

patternAA = {    c4 | c2 c4 c4 | c2 c4 c4 | c2 c4 c4 | c2 c4 }
patternAB = { c4 c4 | c2 c4 c4 | c2 c4 c4 | c2 c4 c4 | c2 c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees     | c' bes c | aes r ees   | f g aes     | ees   } 
  \changePitch \patternAB { ees ees | f g aes  | aes g aes   | bes aes bes | c r   } 
  \changePitch \patternAA { ees,    | c' bes c | aes ees ees | f g aes     | ees r } 
  \changePitch \patternAA { ees     | f g aes  | aes g aes   | bes c bes   | aes r } 

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c   | ees des ees | c r c   | des ees f   | c     } 
  \changePitch \patternAB { c c | des des des | c des c | ees ees ees | ees r } 
  \changePitch \patternAA { c   | ees des ees | c c c   | des ees f   | c r   } 
  \changePitch \patternAA { c   | des des des | c des c | des ees des | c     } 

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { aes     | aes g g | aes r aes   | aes aes aes | aes   } 
  \changePitch \patternAB { aes aes | aes g f | aes bes aes | g aes g     | aes r } 
  \changePitch \patternAA { aes     | aes g g | aes aes aes | aes aes aes | aes r } 
  \changePitch \patternAA { aes     | aes g f | aes bes aes | g g g       | aes r } 

}
}

notesBass = {
\global
\relative f, {

\changePitch \patternAA { aes      | aes ees' ees  | aes, r aes    | des des des  | aes'   } 
\changePitch \patternAB { aes, aes | des des des   | aes ees' aes, | ees' c ees   | aes r  } 
\changePitch \patternAA { aes      | aes, ees' ees | aes, aes aes  | des des des  | aes' r } 
\changePitch \patternAA { aes,     | des des des   | aes ees' aes, | ees' ees ees | aes,   } 

}
}

wordsA = \lyricmode {
\set stanza = "1."

E -- ter -- ni -- ty! where? it floats in the air— \bar "."
A -- mid clam -- or or si -- lence, it ev -- er is there. \bar "."
E -- ter -- ni -- ty! where? O, E -- ter -- ni -- ty! where? \bar "."
The ques -- tion so sol -- emn— E -- ter -- ni -- ty! where? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

E -- ter -- ni -- ty! where? E -- ter -- ni -- ty! where?
With re -- deemed ones in glo -- ry, or fiends in de -- spair?
E -- ter -- ni -- ty! where? O, E -- ter -- ni -- ty! where?
With one or the oth -- er— E -- ter -- ni -- ty! where?

}

wordsC = \lyricmode {
\set stanza = "3."

E -- ter -- ni -- ty! where? Is aught worth a care?
Friend, O, shall we— O, can we e’en ven -- ture to dare,
In life that is pass -- ing as mist in the air,
Do aught till we set -- tle E -- ter -- ni -- ty— where?

}

wordsD = \lyricmode {
\set stanza = "4."

E -- ter -- ni -- ty! where? O, friend, have a care!
For soon God will no lon -- ger His judg -- ment for -- bear.
E -- ter -- ni -- ty! where? O, E -- ter -- ni -- ty! where?
This night may de -- cide your E -- ter -- ni -- ty— where?

}

wordsE = \lyricmode {
\set stanza = "5."

E -- ter -- ni -- ty! where? E -- ter -- ni -- ty! where?
Soon the Sav -- iour will come for His own in the air:
Then sleep not, nor take in the world an -- y share,
Till an -- swered this ques -- tion— E -- ter -- ni -- ty! where?

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
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
