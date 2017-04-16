\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 3) (#t #f))
  %page-count = ##f
}

\header{
  hymnnumber = "115"
  title = "“Himself He Could Not Save”"
  tunename = "Darwall"
  meter = "6. 6. 6. 6. 8. 8."
  poet = "A. Midlane"
  composer = "J. Darwall"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=120 }
tb = { \tempo 4=60 }

patternAA = { c4 | c4 c4 c4 c4 | c2. }

patternBA = { c4 | c4 c4 c4 c4      | c4 }
patternBB = { c4 | c4 c4 c4 c8[ c8] | c4 }

patternCA = { c4 c4 c4 | c2 c2      | c2. }
patternCB = { c4 c4 c4 | c2 c4( c4) | c2. }

patternDA = { c4 | c2 c2 | c2. c4 | c4 c4 c4 }

patternEA = { c4 | c4 c4 c4 c4 | c2 c2 | c2. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d | fis d a' fis | d' }
  \changePitch \patternAA { cis | b a g fis | e }
  \changePitch \patternBA { e | fis d b' a | gis }
  \changePitch \patternCA { e e' d | cis b | a }

  \changePitch \patternDA { a | b cis | d d, | e fis g }
  \changePitch \patternEA { a | b cis d e | d cis | d }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d | d d e d | d }
  \changePitch \patternAA { fis | d d e d | cis }
  \changePitch \patternBA { cis | d d fis fis | e }
  \changePitch \patternCB { e e fis | e e( d) | cis }

  \changePitch \patternDA { cis | d g | fis d | cis d d }
  \changePitch \patternEA { d | d g fis g | fis e | fis }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { fis | a a a a | b }
  \changePitch \patternAA { a | g a a a | a }
  \changePitch \patternBB { a | a fis d' d[ cis] | b }
  \changePitch \patternCA { gis a a | a gis | a } % original has g's here, not gis's

  \changePitch \patternDA { a | g g | a fis | a a b }
  \changePitch \patternEA { a | g e' d b | a a | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { d | d fis cis d | b }
  \changePitch \patternAA { fis' | g fis cis d | a }
  \changePitch \patternBA { a | d d b b | e }
  \changePitch \patternCA { d cis d | e e | a, }

  \changePitch \patternDA { fis' | g e | d d | a d g }
  \changePitch \patternEA { fis | g e b g | a a | d }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Him -- self He could not save; \bar "."
He on the cross must die, \bar "."
Or mer -- cy can -- not come \bar "."
To ru -- ined sin -- ners nigh: \bar "."
Yes, Christ the Son of God must bleed, \bar "."
That sin -- ners might from sin be freed. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Him -- self He could not save,
For just -- ice must be done;
And sin’s full weight must fall
Up -- on a sin -- less One;
For noth -- ing else could God ac -- cept
In pay -- ment for the fear -- ful debt.

}

wordsC = \lyricmode {
\set stanza = "3."

Him -- self He could not save,
For He the Sure -- ty stood
For all who now re -- ly Up -- on His pre -- cious blood.
He bore the pen -- al -- ty of guilt
When on the cross His blood was spilt.

}

wordsD = \lyricmode {
\set stanza = "4."

Him -- self He could not save,
Yet now, a Sav -- iour, He
Bids sin -- ners to Him come,
And live e -- ter -- nal -- ly.
Be -- liev -- ing in Him now we prove
His sav -- ing power, His change -- less love.

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

\noPageBreak \markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 40. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
