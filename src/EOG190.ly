\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 191." } }
}

\header{
  hymnnumber = "190"
  title = "Saviour! Lead Us By Thy Power"
  tunename = "Nettleton"
  meter = "8. 7. 8. 7. D."
  poet = "Wm. Williams"
  composer = "A. Nettleton"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=70
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 f | ees2 ees g4 bes | f2 f
  g4 bes | c2 bes g4 f | ees1
  g4 f | ees2 ees g4 bes | f2 f
  g4 bes | c2 bes g4 f | ees1
  bes'4 c8[ d] | ees2 d c4 bes | c4.( bes8) g2
  bes4 c8[ d] | ees2 d c4 b | c1
  g4 f | ees2 ees g4 bes | f2 f
  g4 bes | c2 bes g4 f | ees1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 d | ees2 ees ees4 ees | d2 d
  ees4 ees | ees2 ees ees4 d | ees1
  ees4 d | ees2 ees ees4 ees | d2 d
  ees4 ees | ees2 ees ees4 d | ees1
  ees4 ees | ees2 ees ees4 ees | ees2 ees
  g4 aes | g2 f ees4 d | ees1
  ees4 d | ees2 ees ees4 ees | d2 d
  ees4 ees | ees2 ees ees4 d | ees1

}
}

notesTenor = {
\global
\relative a {

  bes4 aes | g2 g bes4 ees | bes2 bes
  bes4 bes | aes2 g bes4 aes | g1
  bes4 aes | g2 g bes4 ees | bes2 bes
  bes4 bes | aes2 g bes4 aes | g1
  g4 aes | g2 bes aes4 g | aes4.( g8) bes2
  bes4 ees | bes2 aes g4 g | g2.( c4)
  bes4 aes | g2 g bes4 ees | bes2 bes
  bes4 bes | aes2 g bes4 aes | g1

}
}

notesBass = {
\global
\relative f {

  ees4 bes | ees2 ees ees4 g | bes2 bes,
  ees4 g | aes2 ees bes'4 bes, | ees1
  ees4 bes | ees2 ees ees4 g | bes2 bes,
  ees4 g | aes2 ees bes'4 bes, | ees1
  ees4 ees | ees2 ees ees4 ees | ees2 ees
  ees4 ees | ees2 f g4 g, | c1
  ees4 bes | ees2 ees ees4 g | bes2 bes,
  ees4 g | aes2 ees bes'4 bes, | ees1

}
}

wordsA = \lyricmode {
\set stanza = "1."

Sav -- iour! lead us by Thy pow -- er \bar "."
Safe in -- to the prom -- ised rest; \bar "."
Choose the path, the way what -- ev -- er \bar "."
Seems to Thee, O Lord, the best: \bar "."
Be our Guide in ev -- ery per -- il, \bar "."
Watch and keep us night and day, \bar "."
Else our fool -- ish hearts will wan -- der \bar "."
From the strait and nar -- row way. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Since in Thee is our re -- demp -- tion,
And sal -- va -- tion full and free,
Noth -- ing need our souls dis -- heart -- en
But for -- get -- ful -- ness of Thee:
Naught can stay our stead -- y pro -- gress,
More than con -- querors we shall be,
If our eye, what -- e’er the dan -- ger,
Looks to Thee, and none but Thee.

}

wordsC = \lyricmode {
\set stanza = "3."

In Thy pre -- sence we are hap -- py;
In Thy pre -- sence we’re se -- cure;
In Thy pre -- sence all af -- flic -- tions
We can eas -- i -- ly en -- dure;
In Thy pre -- sence we can con -- quer,
We can suf -- fer, we can die;
Wan -- dering from Thee we are fee -- ble;
Let Thy love, Lord, keep us nigh.

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
