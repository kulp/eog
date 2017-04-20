\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "222"
  title = "I Heard the Voice of Jesus Say"
  tunename = "Varina"
  meter = "C. M. D."
  poet = "H. Bonar"
  composer = "Geo. F. Root"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \partial 4
  \autoBeamOff
}

patternA = { \ta c4 | c8. c16 c4 c | c8. c16 c4 }
patternD = { \ta c4 | c8. c16 c4 c | c8. c16 \tb c4\fermata }
patternB = { \ta c4 | c8. c16 c4 c | c2 }
patternC = { \ta c4 | c8. c16 c4 c | c4( c) }

notesSoprano = {
\global
\relative c'' {

  a4 | a8. a16 a4 d | fis,8. fis16 fis4
  a4 | d,8. d16 d4 e | fis2
  a4 | a8. a16 a4 d | fis,8. fis16 fis4
  a4 | d,8. d16 d4 e | fis2

  \break

  \changePitch \patternA { a | g fis e g | fis g a }
  \changePitch \patternC { d | e cis a g | g fis }
  \changePitch \patternD { e | fis g a fis | b cis d }
  \changePitch \patternB { b | a g fis e | d }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { fis | fis fis fis fis | d d d }
  \changePitch \patternB { d | d d b cis | d }
  \changePitch \patternA { fis | fis fis fis fis | d d d }
  \changePitch \patternB { d | d d b cis | d }

  \changePitch \patternA { fis | e d cis e | d e fis }
  \changePitch \patternC { fis | g e cis e | e d }
  \changePitch \patternA { cis | d d d d | d e d }
  \changePitch \patternB { g | fis e d cis | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a | d d d a | a a a }
  \changePitch \patternB { fis | fis fis fis a | a }
  \changePitch \patternA { a | d d d a | a a a }
  \changePitch \patternB { fis | fis fis fis a | a }

  \changePitch \patternA { a | a a a a | a a a }
  \changePitch \patternB { a | a a a a | a }
  a4 | a8. a16 a4 a8[ d] | d8. a16 a4
  d4 | d8. b16 a4 a8[ g] | fis2

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { d | d d d d | d d d }
  \changePitch \patternB { d | b b b a | d }
  \changePitch \patternA { d | d d d d | d d d }
  \changePitch \patternB { d | b b b a | d }

  \changePitch \patternA { d | a a a a | d d d }
  \changePitch \patternB { d | a a a a | d }
  \changePitch \patternA { a | d e fis d | g g fis }
  \changePitch \patternB { g | d g a a, | d }

}
}

wordsA = \lyricmode {
\set stanza = "1."

I heard the voice of Je -- sus say, \bar "."
“Come un -- to Me and rest; \bar "."
Lay down, thou wea -- ry one, lay down \bar "."
Thy head up -- on My breast.” \bar "."
I came to Je -- sus, as I was, \bar "."
Wea -- ry, and worn, and sad; \bar "."
I found in Him a rest -- ing -- place, \bar "."
And He has made me glad. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I heard the voice of Je -- sus say,
“Be -- hold, I free -- ly give
The liv -- ing wa -- ter– thirst -- y one,
Stoop down, and drink, and live.”
I came to Je -- sus, and I drank
Of that life -- giv -- ing stream;
My thirst was quenched, my soul re -- vived,
And now I live in Him.

}

wordsC = \lyricmode {
\set stanza = "3."

I heard the voice of Je -- sus say,
“I am this dark world’s light:
Look un -- to Me, thy morn shall rise,
And all thy day be bright.”
I looked to Je -- sus and I found
In Him my Star, my Sun;
And in that light of life I’ll walk
Till trav -- ’ling days be done.

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
