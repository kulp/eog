\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
  system-count = 2
}

\header{
  hymnnumber = "143"
  title = "The Lord’s My Shepherd"
  tunename = "Wiltshire"
  meter = "C. M."
  poet = "Scottish Psalter, 1650"
  composer = "Sir George Smart"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key bes \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f2 | f1 bes2 | bes( a) bes | ees( d) c | c( d)
  f,2 | f1 f2 | f( d') bes | bes( a)
  c2 | bes1 a2 | bes1 c2 | d( ees) d | d( c)
  d4( bes) | g1 c2 | a2.( g4) a2 | bes1
  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 | d1 f2 | f( ees) d | g( f) f | ees( d)
  d2 | c( d) ees | d1 f4( g) | f1
  ees2 | d( f) ees | d f1 | f1 f2 | bes( a)
  f2 | f( ees) g | f2.( g4) f4( ees) | d1

}
}

notesTenor = {
\global
\relative a {

  bes2 | bes1 d2 | d( c) bes | bes1 a2 | a( bes)
  f2 | f1 f2 | bes( f) bes | d( c)
  a2 | bes1 c2 | bes1 a2 | bes2( c) d4( ees) | f1
  bes,2 | bes( c4 d) ees2 | c2.( bes4) c2 | bes1

}
}

notesBass = {
\global
\relative f, {

  bes2 | bes1 bes2 | f'1 g2 | ees( f) f | bes,1
  bes2 | a( bes) c | bes1 d4( ees) | f1
  f2 | bes( d,) f | bes,( d) f | bes( a) bes | f1
  d2 | ees1 c2 | f1 f2 | bes,1

}
}

wordsA = \lyricmode {
\set stanza = "1."

The Lord’s my Shep -- herd, I’ll not want: \bar "."
He makes me down to lie \bar "."
In pas -- tures green: He lead -- eth me \bar "."
The qui -- et wa -- ters by. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

My soul He doth re -- store a -- gain;
And me to walk doth make
With -- in the paths of right -- eous -- ness,
E’en for His own name’s sake.

}

wordsC = \lyricmode {
\set stanza = "3."

Yea, tho’ I walk in death’s dark vale,
Yet I will fear no ill;
For thou art with me, and Thy rod
And staff they com -- fort still.

}

wordsD = \markuplist {

\line { My table Thou hast furnished }
\line { In presence of my foes; }
\line { My head thou dost with oil anoint, }
\line { And my cup over-flows. }

}

wordsE = \markuplist {

\line { Goodness and mercy all my life }
\line { Shall surely follow me; }
\line { And in God’s house forevermore }
\line { My dwelling-place shall be. }

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

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } }
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
} }

\noPageBreak

\markup { \vspace #1.4 \fill-line { \line { Alternate tune: No. 252. } } }

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
