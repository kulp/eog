\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 5." } }
}

\header{
  %gospel
  hymnnumber = "71"
  title = "Come, Let Us All Unite to Sing"
  tunename = "Christ for Me"
  meter = "8. 3. 8. 3. 8. 8. 3."
  poet = "Howard Kingsbury"
  composer = "R. G. Halls"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { \ta c4 c8. c16 c4 c4      | c4 c4 c2 }
patternAB = { \ta c4 c8  c8  c4 c4      | c4 c4 c2 }
patternAC = { \ta c4 c8  c8  c4 c8[ c8] | c4 c4 c2 }

patternBA = { \ta c4 c4 c2 | c4 c4 c2 }
patternBB = { \ta c4 c4 c2 | c4 c4 \tb c2 \ta }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { d cis b a b | d, e fis }
  \changePitch \patternBA { a a b | cis cis d }
  \changePitch \patternAB { d cis b a b | d, e fis }
  \changePitch \patternBA { a a b | cis cis d }

  \changePitch \patternAA { a fis g a d | b d a }
  \changePitch \patternAC { a g fis e fis g | b a fis }
  \changePitch \patternAB { fis fis g a d | b d a }
  \changePitch \patternBA { a a b | cis cis d \fermata }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d d d d | d cis d }
  \changePitch \patternBA { fis_. fis_. g | g_. e_. fis }
  \changePitch \patternAB { d d d d d | d cis d }
  \changePitch \patternBA { fis_. fis_. g | g_. e_. fis }

  \changePitch \patternAA { fis d e fis fis | g g fis }
  \changePitch \patternAC { fis e d cis d e | g e d }
  \changePitch \patternAB { d d e fis fis | g g fis }
  \changePitch \patternBA { fis_. fis_. g | g_. e_. fis }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { fis a g fis g | a a a }
  \changePitch \patternBA { d^. d^. d | a^. a^. a }
  \changePitch \patternAB { fis a g fis g | a a a }
  \changePitch \patternBA { d^. d^. d | a^. a^. a }

  \changePitch \patternAA { d a a d d | d d d }
  \changePitch \patternAB { a a a a a | a a a }
  \changePitch \patternAB { a a a d d | d d d }
  \changePitch \patternBA { d^. d^. d | a^. a^. a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { d d d d g | fis e d }
  \changePitch \patternBA { d d g | a a, d }
  \changePitch \patternAB { d d d d g | fis e d }
  \changePitch \patternBA { d d g | a a, d }

  \changePitch \patternAA { d d d d d | g, b d }
  \changePitch \patternAB { a' a a a, a | a cis d }
  \changePitch \patternAB { d d d d d | g, b d }
  \changePitch \patternBA { d d g | a a, d }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Come, let us all u -- nite to sing, \bar "."
God is love, God is love. \bar "." \eogbreak
Let heaven and earth their prais -- es bring: \bar "."
God is love, God is love. \bar "." \eogbreak
Let ev -- ery soul from sin a -- wake, \bar "."
Each in his heart sweet mu -- sic make, \bar "."
And sing with us, for Je -- sus’ sake, \bar "."
God is love, God is love. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Oh, tell to earth’s re -- mot -- est bound,
God is love, God is love.
In Christ we have re -- demp -- tion found:
God is love, God is love.
His blood has washed our sins a -- way,
His Spir -- it turned our night to day,
And now we can re -- joice to say,
God is love, God is love.

}

wordsC = \lyricmode {
\set stanza = "3."

How hap -- py is our por -- tion here!
God is love, God is love.
His prom -- is -- es our spir -- its cheer:
God is love, God is love.
He is our Sun and Shield by day,
Our Help, our Hope, our Strength, and Stay;
He will be with us all the way.
God is love, God is love.

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
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
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
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
