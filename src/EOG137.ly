\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG137.ily"
}

\header{
  %gospel
  hymnnumber = "137"
  title = "He Left the Brightness of His Home" % not found at hymnary.org
  tunename = "Troyte. Adpt"
  meter = "8. 6. 8. 4."
  poet = ""
  composer = "Arthur H. D. Troyte" % see https://hymnary.org/person/Troyte_AHD
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternAA = { c2 c4 c4 | c2. c4 | c2 c2 | c1 }
patternBA = { c2 c4 c4 | c2 c2 | c1 ~ | c1 }
patternCA = { c1 | c2 c2 | c1 ~ | c4 c4 c2 }

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

  \changePitch \patternAA { a a a | a a | a bes | c }
  \changePitch \patternBA { bes bes bes | a g | a | a }
  \changePitch \patternAA { a a a | a a | a g | f }
  \changePitch \patternCA { g | f e | f f r r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { f f f | f f | f e | f }
  \changePitch \patternBA { e e e | f e | f | f }
  \changePitch \patternAA { f f f | f f | e e | d }
  \changePitch \patternCA { d | c c | c | c r r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c c c | c c | c c | c }
  \changePitch \patternBA { c c c | c c | c | c }
  \changePitch \patternAA { c c c | c c | a a | a }
  \changePitch \patternCA { bes | a g | a | a r r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f f f | f f | f f | a }
  \changePitch \patternBA { g g g | f c | f | f }
  \changePitch \patternAA { f f f | f f | cis cis | d }
  \changePitch \patternCA { bes | c c | f | f r r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

He left the bright -- ness of His home \bar "."
For sin -- ners such as I; \bar "."
Re -- ject -- ed and a stran -- ger here, \bar "."
He came to die! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

On -- ly be -- got -- ten Son of God!
He left the courts on high
To tread the wear -- y paths of earth;
He came to die!

}

wordsC = \lyricmode {
\set stanza = "3."

And an -- gel voi -- ces at His birth
His prais -- es chant -- ed high;
Heaven shone up -- on His low -- ly bed;
He came to die!

}

wordsD = \markuplist {

\line { His life on earth was lowliness, }
\line { { \hspace #2 } To God and sinners nigh; }
\line { He had nowhere to lay His head; }
\line { { \hspace #2 } He came to die! }

}

wordsE = \markuplist {

\line { His was the voice that breathed o’er time, }
\line { { \hspace #2 } The comfort of the sky! }
\line { “Come unto Me,” for us He came; }
\line { { \hspace #2 } He came to die! }

}

wordsF = \markuplist {

\line { He loved the ones for whom He died — }
\line { { \hspace #2 } Not ours to question why; }
\line { But ours to know the love of Him }
\line { { \hspace #2 } Who came to die! }

}

wordsG = \markuplist {

\line { His is the loving voice we hear }
\line { { \hspace #2 } That leads us to the sky. }
\line { We bless Thee, Lord, who came to earth }
\line { { \hspace #2 } For us to die! }

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

\markup { \vcenter \column {
  \vspace #1
  \fill-line {
    \null
    \column {
    \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
    \line{ \bold 5 \column { \wordsE } }
    }
    \null
    \column {
    \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
    \line{ \bold 7 \column { \wordsG } }
    }
    \null
  }
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
