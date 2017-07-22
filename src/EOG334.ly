\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 5) (#t #f))
}

\header{
  %children
  hymnnumber = "334"
  title = "Glad T-I-D-I-N-G-S"
  tunename = "At the Cross" % original has this as the poet
  meter = "C. M. with Refrain"
  poet = ""
  composer = "R. E. Hudson"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key e \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e4 | gis4. fis8 e4 gis | b4. a8 gis4
  b4 | cis b a gis | fis2.
  e4 | gis4. fis8 e4 gis | b4. cis8 b4
  e,4 | fis a gis fis | e2. \eogbreak

  << s^\markup { \small \caps "Refrain" }
  { e8 fis | gis4 gis8. gis16 gis4 a8 gis | gis fis fis8. e16 fis4 } >>
  fis8 gis | a a a8. a16 a4 b8. a16 | gis2.
  gis8 gis | a4 a cis, a'8 a | gis4 gis8[ fis] e4
  gis4 | fis fis8 e dis a' gis8. fis16 | e2 r4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e4 | e4. e8 e4 e | gis4. fis8 e4
  e4 | e e dis e | dis2.
  e4 | e4. e8 e4 e | gis4. a8 gis4
  e4 | cis fis e dis | e2.

  e8 fis | e4 e8. e16 e4 e8 e | e dis dis8. e16 dis4
  dis8 e | fis8 fis fis8. fis16 fis4 gis8. fis16 | e2.
  e8 e | e4 e cis4 e8 e | e4 e e
  e4 | cis cis8 cis b fis' e8. dis16 | e2 r4

}
}

notesTenor = {
\global
\relative a {

  gis4 | b4. a8 gis4 b | e4. b8 b4
  e4 | e e b b | b2.
  gis4 | b4. a8 gis4 b | e4. e8 e4
  gis,4 | a cis b a | gis2.

  gis8 a | b4 b8. b16 b4 cis8 b | b4 b8. gis16 b4
  b8 b | fis' e dis8. cis16 b4 e8. b16 | b4 e8. e16 b4
  b8 b | cis4 cis a cis8 cis | b4 b8[ a] gis4
  b4 | a a8 a fis b b8. a16 | gis2 r4

}
}

notesBass = {
\global
\relative f {

  e4 | e4. e8 e4 e | e4. e8 e4
  gis4 | a gis fis e | b2.
  e4 | e4. e8 e4 e | e4. e8 e4
  e4 | a, a b b | e2.

  e8 e | e4 e8. e16 e4 e8 e | b4 b8. b16 b4
  b8 b | b8 b b8. b16 b4 b8. b16 | e4 e8. e16 e4
  e8 e | a,[ b] cis[ b] a[ b] cis dis | e4 e e
  e4 | a, a8 a b b b8. b16 | e2 r4

}
}

Refrain = \lyricmode {

And He calls, and He calls all the G -- I -- R -- L -- S, \bar "."
And He wants all the B -- O -- Y -- S too, \bar "."
To _ T -- R -- U -- S -- _ T in Him, \bar "." % original has melismata here, but why ? for piano ?
And have all their sins now washed a -- way. \bar "."

}

wordsA = \lyricmode {

Glad T -- I -- D -- I -- N -- G -- S, \bar "." % original does not have bar here
I B -- R -- I -- N -- G, \bar "."
That J -- E -- S -- U -- S has come \bar "." % original does not have bar here
To S -- A -- V -- E me. \bar "."

\Refrain

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
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
