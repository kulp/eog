\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "230"
  title = "I’ve Found a Friend"
  tunename = ""
  meter = "8. 7. 8. 7. D. Iambic"
  poet = "J. G. Small"
  composer = "Geo. C. Stebbins"
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
  \key a \major
  \partial 4
  \autoBeamOff
}

patternA = { \ta c4 | c8. c'16 c4 c | c8. c16 c4 }
patternB = { \ta c4 | c4. c8 c8. c16 | c4 c }
patternC = { \ta c4 | c8. c'16 c4 c8[ c] | c8. c16 c4 }
patternD = { \ta c4 | c4. c8 c8. c16 | c4 \tb c\fermata }

notesSoprano = {
\global
\relative c' {

  e4 | e8. cis'16 cis4 d | cis8. b16 b4
  a4 | gis4. fis8 e8. fis16 | e4 a
  \changePitch \patternC { e | e cis' cis b cis | d fis, fis }
  \changePitch \patternD { a | e fis a gis | gis a\fermata }

  \changePitch \patternA { e | d' cis b e, | cis' b a }
  \changePitch \patternB { gis | fis gis a cis | cis b }
  \changePitch \patternC { e, | e cis' cis b cis | d fis, fis }
  \changePitch \patternD { a | e fis a gis | gis a\fermata }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { cis | cis e e fis | e d d }
  \changePitch \patternB { d | d d d d | cis cis }
  \changePitch \patternC { cis | cis e e d e | fis d d }
  \changePitch \patternB { d | cis cis d d | d cis }

  \changePitch \patternA { e | e e e e | e d cis }
  \changePitch \patternB { e | d d dis dis | e e }
  \changePitch \patternC { d | cis e e d e | fis d d }
  \changePitch \patternB { d | cis cis d d | d cis }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a | a a a a | a gis gis }
  \changePitch \patternB { fis | b a gis gis | a e }
  \changePitch \patternA { a | a a a a | a a a }
  \changePitch \patternB { fis | a a b b | b a }

  \changePitch \patternA { e | b' a gis e | a a a }
  \changePitch \patternB { a | a gis fis a | a gis }
  \changePitch \patternA { gis | a a a a | a a a }
  \changePitch \patternB { fis | a a b b | b a }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { a | a a a a | e' e e }
  \changePitch \patternB { e | e e e e | a, a }
  \changePitch \patternA { a | a a a a | d d d }
  \changePitch \patternD { d | e e e e | e a,_\fermata }

  \changePitch \patternA { e' | e e e e | a, a a }
  \changePitch \patternB { cis | d d b b | e e }
  \changePitch \patternA { e | a, a a a | d d d }
  \changePitch \patternD { d | e e e e | e a,_\fermata }

}
}

wordsA = \lyricmode {
\set stanza = "1."

I’ve found a Friend; oh, such a Friend! \bar "."
He loved me ere I knew Him; \bar "."
He drew me with the cords of love, \bar "."
And thus He bound me to Him. \bar "."
And ’round my heart still close -- ly twine \bar "."
Those ties which naught can sev -- er, \bar "."
For I am His, and He is mine, \bar "."
For -- ev -- er and for -- ev -- er! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I’ve found a Friend; oh, such a Friend!
He bled, He died to save me;
And not a -- lone the gift of lie,
But His own self He gave me.
Naught that I have my own I call,
I hold it for the Giv -- er:
My heart, my strength, my life, my all,
Are His, and His for -- ev -- er!

}

wordsC = \lyricmode {
\set stanza = "3."

I’ve found a Friend; oh, such a Friend!
All pow’r to Him is giv -- en
To guard me on my on -- ward course,
And bring me safe to heav -- en.
Th’e -- ter -- nal glo -- ries gleam a -- far,
To nerve my faint en -- deav -- or:
So now to watch, to work, to war,
And then to rest for -- ev -- er!

}

wordsD = \lyricmode {
\set stanza = "4."

I’ve found a Friend; oh, such a Friend!
So kind, and true, and ten -- der,
So wise a Coun -- sel -- lor and Guide,
So might -- y a De -- fen -- der!
From Him, who loves me now so well,
What pow’r my soul can sev -- er?
Shall life or death, or earth or hell?
No; I am His for -- ev -- er!

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
