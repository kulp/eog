\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 5) (#t #f))
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "297"
  title = "Christ Could Not Be Hid"
  tunename = ""
  meter = "11s. with Refrain"
  poet = ""
  composer = "Wm. G. Fisher"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key a \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e4 | e a b | cis4. b8 a4 | b cis b | a2
  e4 | e a b | cis4. b8 a4 | b cis b | a2
  cis4 | e cis a | fis8[ a] a4 a | d d d | cis2
  e,4 | e a cis | cis4. b8 a4 | b4. a8 b4 | a2.

  \eogbreak
  << s^\markup { \small \caps "Refrain" }
  { b4 b b | b2 a4 | cis a fis | e2 } >>
  e4 | e a cis | cis4. b8 a4 | b4. a8 b4 | a2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  cis4 | cis e e | e4. d8 cis4 | d e d | cis2
  cis4 | cis e e | e4. d8 cis4 | d e d | cis2
  e4 | e e e | d8[ fis] fis4 fis | fis fis fis | e2
  cis4 | cis e e | e4. d8 cis4 | e4. e8 d4 | cis2.

  d4 d d | d2 cis4 | cis cis d | cis2
  cis4 | cis e e | e4. d8 cis4 | e4. e8 d4 | cis2.

}
}

notesTenor = {
\global
\relative a {

  a4 | a a gis | a4. a8 a4 | gis gis gis | a2
  a4 | a a gis | a4. a8 a4 | gis gis gis | a2
  a4 | cis a a | a a a | a a a | a2
  a4 | a a a | a4. gis8 a4 | gis4. fis8 gis4 | a2.

  gis4 gis gis | gis2 a4 | a a a | a2
  a4 | a a a | a4. gis8 a4 | gis4. fis8 gis4 | a2.

}
}

notesBass = {
\global
\relative f, {

  a4 | a cis e | a4. a8 a4 | e e e | a,2
  a4 | a cis e | a4. a8 a4 | e e e | a,2
  a'4 | a a cis, | d d d | d d d | a2
  a4 | a cis a | e'4. e8 e4 | e4. e8 e4 | a,2.

  e'4 e e | e2 fis4 | fis fis d | a2
  a4 | a cis a | e'4. e8 e4 | e4. e8 e4 | a,2.

}
}

Refrain = \lyricmode {

Could not be hid, no could not be hid; \bar "."
Then trust in that Sav -- iour who could not be hid. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Christ could not be hid, for the sin -- ner would haste, \bar "."
Be -- hind Him to weep at the Phar -- i -- see’s feast; \bar "."
To wipe with her hair, when she’d washed with her tears, \bar "."
His feet who had blessed her and si -- lenced her fears. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Christ could not be hid, for the blind and the lame
His love and His pow’r would to -- geth -- er pro -- claim;
The dumb would speak out, and the deaf would re -- call
The name of that Je -- sus who heal -- ed them all.

}

wordsC = \lyricmode {
\set stanza = "3."

Christ could not be hid, for a -- round Him would press
The chil -- dren of sor -- row, of pain, and dis -- tress;
And faith, by the hem of His gar -- ment would prove
What vir -- tue there is -- sued from Him who is love.

\Refrain

}

wordsD = \lyricmode {
\set stanza = "4."

Christ could not be hid, for the wid -- ow of Nain
Would point to her son, now re -- stored her a -- gain–
Would say, ’t_was His love, His com -- pas -- sion and grace,
Gave back that lost son to a moth -- er’s em -- brace.

}

wordsE = \lyricmode {
\set stanza = "5."

Christ could not be hid, for hark! hark to that shout–
“Ho -- san -- na, ho -- san -- na!” the chil -- dren cry out:
For us, O, how bless -- ed! tho’ some would for -- bid
To tell of the Sav -- iour who could not be hid.

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
