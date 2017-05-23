\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "214"
  title = "“Forever With the Lord!”"
  tunename = "Nearer Home"
  meter = "S. M. D." % TODO "with Refrain" ?
  poet = "J. Montgomery"
  composer = "I. B. Woodbury"
  tagline = ##f
}

ta = { \tempo 4=120 }
tb = { \tempo 4=60 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key a \major
  \partial 4
  \autoBeamOff
}

patternA = { c4 | c c c'4. c8 | c2. }
patternB = { c4 | c4. c8 c4 c | c2. }
patternC = { c4 | c4. c8 c4 c | c4. c8 c4 }

notesSoprano = {
\global
\relative c' {

  e4 | e e cis'4. b8 | a2.
  a4 | b4. b8 a4 b | cis2.
  cis4 | d4. d8 d4 b | cis4. cis8 cis4
  \changePitch \patternB { a | b b cis b | a }
  \changePitch \patternB { a | b b a b | cis }
  \changePitch \patternB { cis | cis cis b cis | d }
  d4 | cis e e cis | cis a a
  fis4 | e a cis4. b8 | a2

  << s^\markup { \small \caps "Refrain" }
  { a4. b8 | a2 e'4. d8 | \tb cis4\fermata \ta } >>
  e4 fis d | cis2 b | a2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { cis | cis cis e e | e }
  \changePitch \patternB { e | gis gis a gis | a }
  \changePitch \patternC { a | fis gis a e | e e fis }
  \changePitch \patternB { cis | fis fis e d | cis }
  \changePitch \patternB { e | e e e e | e }
  \changePitch \patternB { e | e e e e | fis }
  e4 | e a a a | e a fis
  d4 | cis dis e4. d8 | cis2

  a'4. gis8 | a2 e4. gis8 | a4
  a4 a a | a2 gis | a2.

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a | a a e' d | cis }
  \changePitch \patternB { cis | e d cis e | e }
  \changePitch \patternC { e | d d d d | cis cis a }
  \changePitch \patternB { a | a a a gis | a }
  \changePitch \patternB { a | gis gis fis gis | a }
  \changePitch \patternB { a | a a gis a | a }
  gis4 | a cis cis e | cis e d
  a4 | a a a4. gis8 | a2

  e'4. d8 | cis2 cis4. b8 | a4
  cis4 d fis | e2 d | cis2.

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { a | a a a' a | a }
  \changePitch \patternB { a | e e e e | a }
  \changePitch \patternC { a | d, e fis gis | a a fis }
  \changePitch \patternB { fis | d d e e | a, }
  \changePitch \patternB { cis | e e e e | a, }
  \changePitch \patternB { a | a a e' a | d, }
  e4 | a a a a | a cis, d
  fis4 | a fis e4. e8 | a,2

  e'4. e8 | a,2 a'4. a8 | a4_\fermata
  a4 d,4 d | e2 e | a,2.

}
}

Refrain = \lyricmode {

Near -- er home, near -- er home, \bar "."
A day’s march near -- er home. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

“For -- ev -- er with the Lord!” \bar "."
A -- men! so let it be! \bar "."
Life from the dead is in that word, \bar "."
’Tis im -- mor -- tal -- i -- ty! \bar "."
Here in the bod -- y pent, \bar "."
Ab -- sent from Him we roam: \bar "."
Yet night -- ly pitch our mov -- ing tent \bar "."
A day’s march near -- er home. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Our Fa -- ther’s home on high,
Home to our souls how dear!
E’en now, to faith’s trans -- pierc -- ing eye,
Thy gold -- en gates ap -- pear.
Our thirst -- y spir -- its faint
To reach the home we love,
The bright in -- her -- it -- ance of saints–
Je -- ru -- sa -- lem a -- bove.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

And though there in -- ter -- vene
Rough seas and storm -- y skies,
Tho’ by no mor -- tal vi -- sion seen,
Thy glo -- ry fills our eyes.
There shall all clouds de -- part,
The wil -- der -- ness shall cease,
And sweet -- ly shall each glad -- dened heart
En -- joy e -- ter -- nal peace.

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
