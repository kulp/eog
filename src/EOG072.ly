\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "Come to the Saviour, Come to the Saviour"
  subsubtitle = "(P. M.)"
  %meter = "P.M."
  poet = "Anon."
  composer = "Old Scottish Melody"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=76 }
tb = { \tempo 4=38 }

global = {
  \include "common/overrides.ily"
  %\override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key e \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

	e8.[ fis16] gis8 a8 b4 gis4 | e'4 e8 e8 dis8.[ cis16] b8
	b8 | e4 e8 e8 dis8[ b8] cis8 cis8 | b2 r4
	b4 | cis8 b8 cis8 e8 gis,4
	fis8 e8 fis8 e8 fis8 gis8 a8[ gis8]
	a8. b16 | cis8[ b8] gis8 b8 b8[ a8] fis8 dis8 | e2. r4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

	e8.[ fis16] e8 e8 e4 e4 | gis4 gis8 fis8 fis8.[( e16)] dis8
	fis8 | gis4 gis8 gis8 fis4 fis8 e8 | dis2 r4
	e4 | e8 e8 e8 e8 e4
	dis8 e8 | dis8 e8 dis8 e8 e4
	e8. e16 | fis4 e8 e8 dis4 dis8 b8 | b2. r4

}
}

notesTenor = {
\global
\relative a {

	gis8.[ a16] b8 a8 gis4 b4 | cis4 gis8 ais8 b4 b8
	b8 | b4 b8 b8 b4 ais8 ais8 | b2 r4
	gis4 | a8 b8 cis8 a8 b4
	a8 gis b8 b8 b8 b8 a8[ b8]
	cis8. e16 | b4 b8 gis8 fis4 a8 a8 | gis2. r4

}
}

notesBass = {
\global
\relative f {

	e4 e8 e8 e4 e4 | e4 cis8 cis8 b4 b8
	dis8 | cis4 e8 cis8 fis4 fis8 fis8 | b,2 r4
	e4 | a,8 gis8 a8 cis8 e4
	b8 cis8 | b8 gis'8 fis8 e8 cis8[ e8]
	a8. gis16 | dis4 e8 e8 b4 b8 b8 | e2. r4

}
}

wordsA = \lyricmode {
\set stanza = "1."

Come to the Sav -- iour, come to the Sav -- iour, \bar "."
Ye {\break} sin -- strick -- en child -- ren of men; \bar "."
He left His throne a -- bove, \bar "."
To re -- {\break} veal His won -- drous love, \bar "."
And to o -- pen a foun -- tain for sin. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Why dost thou lin -- ger? why dost thou lin -- ger?
O, when wilt thou come to the Lord?
Thy time is fly -- ing fast,
And thy day will soon be past,
O, a -- rouse thee, and come to be saved.

}

wordsC = \lyricmode {
\set stanza = "3."

Par -- don is of -- fered, par -- don is of -- fered;
A par -- don full, pre -- sent, and free,
The might -- y debt was paid,
When on Cal -- v’ry Je -- sus died,
To a -- tone for a reb -- el like thee.

}

wordsD = \markuplist {

\line { Come to the fountain, come to the fountain, }
\line { The fountain which cleanses the soul; }
\line { ’Tis cleansing far and near, }
\line { And its streams are flowing here, }
\line { Oh, believe it, and thou art made whole! }

}

wordsE = \markuplist {

\line { I do believe it! I do believe it; }
\line { I am saved through the blood of the Lamb; }
\line { My happy soul is free, }
\line { For the Lord has pardoned me, }
\line { Hallelujah to Jesus’ name! }

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

\markup { \fill-line { \column {
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } } %\combine \null \vspace #0.4
} } }

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
