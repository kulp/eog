\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  %gospel
  hymnnumber = "4"
  title = "Behold the Saviour At the Door"
  tunename = "St. Catherine"
  meter = "6-8s."
  poet = "Joseph Grigg"
  composer = "J. G. Walton"
  %copyright = ""
  tagline = ##f
}

patternA = { c4 c4 c4 | c4( c4) c4 | c4( c4) c4 | c2. \break } % Soprano 1
patternB = { c4 c4 c4 | c2      c4 | c4( c4) c4 | c2. \break } % Soprano 2
patternC = { c4 c4 c4 | c2      c4 | c2      c4 | c2. \break } % Alto 1 & Tenor / Bass 2
patternD = { c4 c4 c4 | c2      c4 | c2      c4 | c2. \break } % Alto 2
patternE = { c4 c4 c4 | c4( c4) c4 | c2      c4 | c2. \break } % Tenor / Bass 1

patternR = { c4 c4 c4 | c2      c4 | c2      c4 | c2. \break } % Soprano / Alto / Bass Refrain
patternS = { c4 c4 c4 | c2      c4 | c4( c4) c4 | c2. \break } % Tenor Refrain

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered \time 3/4
  \once \override Score.MetronomeMark.transparent = ##t
  \tempo 4 = 96
  \key aes \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { c bes aes   | aes g aes | bes f g   | aes }
  \changePitch \patternB { aes g f     | ees aes   | aes g aes | bes }
  \changePitch \patternA { c bes aes   | aes g aes | bes f g   | aes }
  \changePitch \patternB { aes g f     | ees c'    | bes c bes | aes }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternR { des des des | c c       | bes bes   | c   } >>
  \changePitch \patternR { c bes aes   | f aes     | bes bes   | aes }
  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternC { ees ees ees | ees ees | f ees | ees }
  \changePitch \patternD { f ees des   | c ees   | d d   | ees }
  \changePitch \patternC { ees ees ees | ees ees | f ees | ees }
  \changePitch \patternD { f ees des   | c ees   | d des | c   }

  \changePitch \patternR { f f f       | ees aes | g g   | aes }
  \changePitch \patternR { ees ees ees | f f     | g ees | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternE { aes des c   | c des c | des bes     | c   }
  \changePitch \patternC { aes aes aes | aes aes | bes aes     | g   }
  \changePitch \patternE { aes des c   | c des c | des bes     | c   }
  \changePitch \patternC { aes aes aes | aes aes | aes g       | aes }

  \changePitch \patternR { aes aes aes | aes ees | ees' ees    | ees }
  \changePitch \patternS { ees des c   | des c   | ees bes des | c   }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternE { aes aes aes | aes bes aes | des, ees | aes, }
  \changePitch \patternC { des des des | aes c       | bes bes  | ees  }
  \changePitch \patternE { aes aes aes | aes bes aes | des, ees | aes, }
  \changePitch \patternC { des des f   | aes f       | bes, ees | aes, }

  \changePitch \patternR { des des des | aes aes     | ees' ees | aes  }
  \changePitch \patternR { aes aes aes | des, f      | ees ees  | aes, }

}
}

Refrain = \lyricmode {

  O -- pen the door, He’ll en -- ter in, \bar "."
  And sup with you, and you with Him. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

  Be -- hold the Sav -- iour at the door! \bar "."
  He gen -- tly knocks– has knocked be -- fore; \bar "."
  Has wait -- ed long– is wait -- ing still; \bar "."
  You use no oth -- er friend so ill. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

  Oh love -- ly at -- ti -- tude! He stands
  With o -- pen heart and out -- stretched hands;
  Oh match -- less kind -- ness! and He shows
  His match -- less kind -- ness to His foes.
  \Refrain
}

wordsC = \lyricmode {
\set stanza = "3."

  Ad -- mit Him, ere His an -- ger burn,
  Lest He de -- part and ne’er re -- turn;
  Ad -- mit Him, or the hour’s at hand
  When at His door de -- nied you’ll stand.

}

wordsD = \lyricmode {
\set stanza = "4."

  Ad -- mit Him, for the hu -- man breast
  Ne’er en -- ter -- tained so kind a guest;
  No mor -- tal tongue their joys can tell,
  With whom He con -- de -- scends to dwell.

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
