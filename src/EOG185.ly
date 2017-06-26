\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
}

\header{
  hymnnumber = "185"
  title = "On His Father’s Throne Is Seated"
  tunename = ""
  meter = "8. 7. 8. 7. 4. 7."
  poet = "H. K. Burlingham"
  composer = "T. Olivers"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=100 }
tb = { \tempo 2=50 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  aes1 c2( ees) | aes,( g) f( ees) | f2.( g4 aes2) g4( f) | ees2.( des4) c1 |
  ees1. ees2 | aes1. bes2 | c2( ees) des( c) | c1( bes) |
  aes1 c2( ees) | aes,( g) f( ees) | f2.( g4 aes2) g4( f) | ees2.( des4) c1 |
  ees1. ees2 | aes1. bes2 | c( ees) des( c) | c1( bes) |
  bes2.( c4 bes2) c | des1 c | aes2.( bes4 aes2) des2 | c2( bes) aes1 |
  c2.( des4 c2) ees | des( c) bes1 |
  aes1 aes2( bes4 c) | ees,1 des' | c bes | aes\breve
  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees1 ees | ees des2( c) | des2.( ees4 f2) ees4( des) | c2.( bes4) aes1 |
  bes1. bes2 | ees1. ees2 | ees1 ees | ees\breve |
  ees1 aes2( ees) | f( c) des( aes) | des2.( ees4 f2) des2 | bes1 c |
  bes1. ees2 | ees2.( f4 ees2) g | aes1 g2( aes) | aes1( g) |
  ees1. ees2 | ees1 ees | ees1. aes2 | aes( g) aes1 |
  aes2.( g4 aes2) bes2 | aes1 g |
  ees1 f | ees aes | aes g | ees\breve

}
}

notesTenor = {
\global
\relative a {

  c1 aes2( bes) | c1 des2( aes) | aes1. aes2 | aes1 ees |
  g1. g2 | aes1( ees2) g2 | aes2 c bes aes | aes1( g) |
  c1 ees2( bes) | c( g) aes1 | aes1( des2) aes2 | bes1 aes |
  g1. bes2 | aes1. ees'2 | ees1 ees | ees\breve |
  g,2.( aes4 g2) aes | bes1 aes | aes1( ees'2) des | ees( des) c1 |
  ees1. ees2 | f2( ees) ees1 |
  c1 c2( bes4 aes) | aes1 f' | ees1. des2 | c\breve

}
}

notesBass = {
\global
\relative f, {

  aes1 aes'2( g) | aes1 aes, | des1. f2 | aes1 aes, |
  ees'1 des | c1. ees2 | aes1 g2 aes | ees\breve
  aes,1 aes'2( g) | f( ees) des( c) | des1. f2 | g1 aes1 |
  ees2.( f4 ees2) des | c2.( des4 c2) ees2 | aes( c) bes( aes) | ees\breve |
  ees1. aes2 | g1 aes | c,1. f2 | c1 aes' |
  aes2.( bes4 aes2) g | f( aes) ees1 |
  aes1 f | c des | ees ees | aes,\breve

}
}

wordsA = \lyricmode {
\set stanza = "1."

On His Fa -- ther’s throne is seat -- ed \bar "."
Christ the Lord, the liv -- ing One! \bar "."
All His toil on earth comp -- let -- ed, \bar "."
All His work for sin -- ners done. \bar "."
In the glo -- ry, in the glo -- ry \bar "."
%{HIDE>%} In the glo -- ry \bar "." %{<HIDE%}
See Him– God’s e -- ter -- nal Son! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Ev -- ’ry knee shall bow be -- fore Him,
Ev -- ’ry tongue con -- fess His name,
Ran -- somed myr -- iads shall a -- dore Him,
Who en -- dured the sin -- ner’s shame!
From the glo -- ry, from the glo -- ry
%{HIDE>%} From the glo -- ry %{<HIDE%}
God doth now His worth pro -- claim.

}

wordsC = \lyricmode {
\set stanza = "3."

Man the cross to Him a -- ward -- ed;
Man the Sav -- iour cru -- ci -- fied!
Thus man’s judg -- ment stands re -- cord -- ed,
Thus was jus -- tice sat -- is -- fied!
By the glo -- ry, by the glo -- ry
%{HIDE>%} By the glo -- ry %{<HIDE%}
Christ was claimed, on earth who died.

}

wordsD = \lyricmode {
\set stanza = "4."

Son of Man, His in -- car -- na -- tion
O -- pened first the tale of grace;
Son of Man, in new cre -- a -- tion
Lead -- er of a chos -- en race!
Well may glo -- ry, well may glo -- ry
%{HIDE>%} Well may glo -- ry %{<HIDE%}
Crown Him in the or -- dered place!

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
