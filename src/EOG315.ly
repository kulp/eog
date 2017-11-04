\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG315.ily"
}

\header{
  %children
  hymnnumber = "315"
  title = "Jesus Loves the Little Ones" % not found at hymnary.org
  tunename = ""
  meter = "P. M."
  poet = ""
  composer = "A. & E. Gausby" % not found at hymnary.org
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a4 c c a | a4. g8 f2
  f4 bes bes4. bes8 | a2.
  a4 | a g g c | g( f) f
  f8[ e] | d4. e8 f4 g | a2.
  c4 | c4. c8 bes4 e, | f1

  \bar "|."

}
}

notesAltoA = {
\global
\override NoteHead.font-size = #-4
\relative e' {

  f4 a a f | e4. e8 c2
  d4 f f4. f8 | f2.
  e4 | e2 e2 | e4( c) c
  s4 | bes4. bes8 bes4 bes | cis2.
  a'4 | a4. a8 <g e>4 <c, bes> c1

}
}

notesAltoB = {
\global
\override NoteHead.font-size = #-4
\relative e' {

  c4 f f c | bes4. bes8 a2
  bes4 d d4. d8 | c2.
  bes4 | bes2 bes | bes4( a) a
  s4 | s4. s8 s4 s | a2.
  f'4 | f4. f8 c4 g | a1

}
}

notesTenor = {
\global
\override NoteHead.font-size = #-4
\relative a {

  f4 f f f | c c f2
  bes,4 bes bes bes | f'2.
  c4 | c2 c | c4( f) f
  f4 | bes, bes bes bes | a2.
  f'4 | c2 c | f1

}
}

notesBass = {
\global
\override NoteHead.font-size = #-4
\relative f, {

  f4 f f f | c c f2
  bes,4 bes bes bes | f'2.
  c4 | c2 c | c4( f) f
  f4 | bes, bes bes bes | a2.
  f'4 | c2 c | f1

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus loves the lit -- tle ones; \bar "."
Won -- drous was the love \bar "."
That brought Him down from glo -- ry, \bar "."
In His bright home a -- bove, \bar "."
To save poor lit -- tle ones. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus seeks the lit -- tle ones,
Wan -- d’ring far in sin;
They lit -- tle know the { \mon } pa -- tient { \moff } love
That seeks their souls to win,
And save lost lit -- tle ones.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus died for lit -- tle ones,
On that dread -- ful tree;
And then what bit -- ter { \mon } pain He { \moff } bore,
And un -- told ag -- o -- ny,
To save poor lit -- tle ones.

}

wordsD = \lyricmode {
\set stanza = "4."

Je -- sus lives for lit -- tle ones
In the heaven a -- bove,
And ne’er for -- gets the { \mon } pre -- cious { \moff } lambs,
Who’ve trust -- ed in His love,
And are His lit -- tle ones.

}

wordsE = \markuplist {

\line { Jesus thinks of little ones }
\line { { \hspace #2 } All the night and day, }
\line { And all the time they’re sleeping, }
\line { { \hspace #2 } And while they are at play, }
\line { { \hspace #4 } And guards His little ones. }

}

wordsF = \markuplist {

\line { Soon He’ll take His little ones }
\line { { \hspace #2 } To live in His home, }
\line { So safe with Him forever, }
\line { { \hspace #2 } And nevermore to roam; }
\line { { \hspace #4 } Ah! happy little ones! }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \context Voice = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice = altos { \voiceTwo << \notesAltoA \notesAltoB >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\markup { \vcenter \column {
  \vspace #1
  \fill-line {
    \null
    \line{ \bold 5 \column { \wordsE } }
    \null
    \line{ \bold 6 \column { \wordsF } }
    \null
  }
  \vspace #1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
