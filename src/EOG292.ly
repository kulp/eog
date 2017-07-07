\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "292"
  title = "What Will It Be to Dwell Above?"
  tunename = "Stella"
  meter = "6-8s."
  poet = "Swain"
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=100
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes2 | bes( g) bes | bes1 ees2 | ees( d) c | bes1
  bes2 | bes( aes) g | f( g) aes | g( bes) g | f1
  bes2 | bes( g) bes | bes1 ees2 | ees( d) c | bes1
  bes2 | bes( aes) g | f( g) aes | g1 f2 | ees1
  f2 | f2.( g4) aes2 | g1 bes2 | bes2( g) c | bes1
  c2 | ees1 c2 | bes2.( aes4) g2 | aes1 f2 | ees1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g2 | g( ees) g | g1 g2 | ees1 ees2 | ees1
  g2 | g( f) ees | d( ees) f | g2( ees) ees | d1
  g2 | g( ees) g | g1 g2 | ees1 ees2 | ees1
  g2 | g( f) ees | f2( e) f | ees!1 d2 | ees1
  d2 | d2.( ees4) f2 | ees1 g2 | g2( ees) aes4( g) | f1
  aes2 | aes1 aes2 | g2.( f4) ees2 | c2( f) d | ees1

}
}

notesTenor = {
\global
\relative a' {

  ees2 | ees2( bes) ees | ees1 bes2 | c( bes) aes | g1
  g2 | g( aes) bes | bes1 bes2 | bes1 bes2 | bes1
  ees2 | ees2( bes) ees | ees1 bes2 | c( bes) aes | g1
  g2 | g( aes) bes | c( bes) aes | bes1 aes2 | g1
  bes2 | bes1 bes2 | bes1 ees2 | ees1 ees2 | d1
  ees2 | c1 ees2 | ees2.( bes4) bes2 | aes( c) bes4( aes) | g1

}
}

notesBass = {
\global
\relative f {

  ees2 | ees1 ees2 ees1 ees2 | ees1 ees2 | ees1
  ees2 | ees( f) g | aes( g) f | ees( g) ees | bes1
  bes'2 | ees,1 ees2 | ees1 ees2 | ees1 ees2 | ees1
  ees2 | ees( f) g | aes( g) f | bes,1 bes2 | ees1
  bes2 | bes1 bes2 | ees1 ees2 | ees( g) aes2 | bes1
  aes2 | aes1 aes2 | ees1 ees2 | f1 bes,2 | ees1

}
}

wordsA = \lyricmode {
\set stanza = "1."

What will it be to dwell a -- bove, \bar "."
And with the Lord of glo -- ry reign, \bar "."
Since the blest know -- ledge of His love \bar "."
So bright -- ens all this drear -- y plain? \bar "."
No heart can think, no tongue can tell, \bar "."
What joy ’twill be with Christ to dwell. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

When left this scene of faith and strife,
The flesh and sense de -- ceive no more,
When we shall see the Prince of life,
And all His works of grace ex -- plore:
What heights and depths of love di -- vine
Will there through end -- less a -- ges shine!

}

wordsC = \lyricmode {
\set stanza = "3."

And God has fixed the hap -- py day
When the last tear shall dim our eyes,
When He will wipe these tears a -- way,
And fill our hearts with glad sur -- prise;
To hear His voice, and see His face,
And know the full -- ness of His grace.

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
