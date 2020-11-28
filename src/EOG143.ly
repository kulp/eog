\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG143.ily"
}

\header{
  hymnnumber = "143"
  title = "The Lord’s My Shepherd"
  tunename = "Wiltshire"
  meter = "C. M."
  poet = "Francis Rous (Scottish Psalter, 1650)" % see https://hymnary.org/text/the_lords_my_shepherd_ill_not_want_rous
  composer = "George T. Smart" % see https://hymnary.org/tune/wiltshire_smart
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
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
For Thou art with me; and Thy rod
And staff they com -- fort still.

}

wordsD = \markuplist {

\line { My table Thou hast furnishèd }
\line { { \hspace #2 } In presence of my foes; }
\line { My head thou dost with oil anoint, }
\line { { \hspace #2 } And my cup overflows. }

}

wordsE = \markuplist {

\line { Goodness and mercy all my life }
\line { { \hspace #2 } Shall surely follow me; }
\line { And in God’s house forevermore }
\line { { \hspace #2 } My dwelling-place shall be. }

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

\markup { \column {
  \fontsize #0.3 \fill-line { \vcenter \column {
    \vspace #0.9 % not enough space for \vspace #1
    \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
    \line{ \bold 5 \column { \wordsE } }
    \vspace #1
  } }
  \fill-line { \line { Alternate tune: No. 252. } }
} }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
