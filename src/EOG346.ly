\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG346.ily"
}

\header{
  %children
  hymnnumber = "346"
  title = "Jesus Who Lives Above the Sky"
  tunename = "Grateful Praise" % see https://hymnary.org/tune/grateful_praise_anonymous
  meter = "L. M."
  poet = "Ann Taylor Gilbert" % see https://hymnary.org/text/jesus_who_lived_above_the_sky
  composer = "" % see https://hymnary.org/tune/grateful_praise_anonymous
  tagline = ##f
}

ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered % original has `c`
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f8( g) | a4 a bes bes | d c c
  a4 | c bes bes g | bes a a
  f8( g) | a4 a bes bes | d c \tb f\fermata \ta
  f4 | e d c bes | a g f

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f8( e) | f4 f g g | bes a a
  f4 | a g g e | g f f
  f8( e) | f4 f g g | bes a a
  a4 | c bes a g | f e f

}
}

notesTenor = {
\global
\relative a {

  a8( c) | c4 c c c | bes c c
  c4 | c c c c | c c c
  a8( c) | c4 c c c | bes c c
  f4 | f f f d | c bes a

}
}

notesBass = {
\global
\relative f {

  f8( c) | f4 f c c | f f f
  f4 | c c e c | e f f
  f8( c) | f4 f c c | f f f_\fermata
  f4 | a, bes f' bes, | c c f

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus, who lives a -- bove the sky, \bar "."
Came down to be a man and die, \bar "."
And in the Bi -- ble we may read \bar "."
His love to those who were in need. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He went a -- bout— He was so kind—
To cure poor peo -- ple who were blind;
And man -- y who were sick and lame,
He pit -- ied them and did the same.

}

wordsC = \lyricmode {
\set stanza = "3."

And more than that, He told them too
The things that God would have them do;
And was so gen -- tle and so mild,
He would have list -- ened to a child.

}

wordsD = \markuplist {

\line { He knew how wicked man had been, }
\line { And knew that God must punish sin; }
\line { So out of pity Jesus said }
\line { He’d bear the punishment instead. }

}

wordsE = \markuplist {

\line { But such a cruel death He died! }
\line { He was hung up and crucified; }
\line { And those kind hands that did such good, }
\line { They nailed them to a cross of wood. }

}

wordsF = \markuplist {

\line { And so He died, and rose again; }
\line { He lives on high at God’s right hand; }
\line { Soon He’ll return for us from heaven — }
\line { For those whose sins have been forgiven. }

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

\markup { \fill-line { \vcenter \column {
  \vspace #1
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } }
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
