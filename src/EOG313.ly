\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  %children
  hymnnumber = "313"
  title = "“God Is in Heaven: Can He Hear?”"
  tunename = ""
  meter = "C. M."
  poet = ""
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 | fis4 a a2 a | g4 b b2
  b2 | a4 b c2 e | d1 \eogpagebreak
  b4( d) | d c c2 a4( c) | c b b2
  g4( b) | b a c2 fis,4( a) | g1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 | d4 fis fis2 fis | g4 g g2
  g2 | fis4 g g2 g | g1
  g4( b) | b a a2 fis4( a) | a g g2
  d4( g) | e e e2 d | d1

}
}

notesTenor = {
\global
\relative a {

  b2 | a4 c c2 c | b4 d d2
  d2 | d4 d c2 c | b1
  d2 | d4 d d2 d | d4 d d2
  b4( d) | c c a2 c | b1

}
}

notesBass = {
\global
\relative f {

  g2 | d4 d d2 d | g4 g g2
  g2 | d4 g e2 c | g'1
  g2 | d4 d d2 d | g4 g g2
  g2 | c,4 c c2 d | g1

}
}

wordsA = \lyricmode {
\set stanza = "1."

“God is in heav -- en: can He hear \bar "."
A lit -- tle child like me?” \bar "."
“Yes, lit -- tle child; thou needst not fear: \bar "."
He’ll lis -- ten e’en to thee.” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“God is in heav -- en: can He see
If I am do -- ing wrong?”
“Oh, yes, He can; He looks at thee
All day and all night long.”

}

wordsC = \lyricmode {
\set stanza = "3."

“God is in heav -- en: would He know
If I should tell a lie?”
“Yes; if thou saidst it soft and low,
He’d hear it in the sky.”

}

wordsD = \lyricmode {
\set stanza = "4."

“God is in heav -- en: does He care
Thence to send good to me?”
“Yes; in His Word He doth de -- clare
All good He giv -- eth thee.”

}

wordsE = \lyricmode {
\set stanza = "5."

“God is in heav -- en: would He save
A lit -- tle child like me?”
“Yes, lit -- tle child; for Je -- sus gave
His life for such as thee.”

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
