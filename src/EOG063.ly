\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  score-markup-spacing.padding = #4
  score-markup-spacing.basic-distance = #4
}

\header{
  %gospel
  hymnnumber = "63"
  title = "Broken Heart! The Fountain’s Open"
  tunename = ""
  meter = "8. 7. 8. 7. with Refrain"
  poet = "A. P. Cecil"
  composer = "Arr. from Stevenson"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=76 }
tb = { \tempo 4=38 }

patternAA = { c8[ c8] c8 c8[ c8] c8 | c8[ c8] c8 c8 c8 c8 }
patternAB = { c8[ c8] c8 c4      c8 | c8[ c8] c8 c8 c8 c8 }
patternAC = { c4      c8 c8[ c8] c8 | c4      c8 c8 c8 c8 }
patternAD = { c4      c8 c4      c8 | c4      c8 c8 c8 c8 }

patternBA = { c8[ c8] c8 c8[ c8] c8 | c8[ c8] c8 c4    c8 }
patternBB = { c8[ c8] c8 c8[ c8] c8 | c4      c8 c4    c8 }
patternBC = { c8[ c8] c8 c4      c8 | c8[ c8] c8 c4    c8 }
patternBD = { c4      c8 c4      c8 | c4      c8 c4    c8 }

patternCA = { c4 c8 c4 c8 | c4 c8 c4. }

patternDA = { c4. c4 c8 | c4. c4 c8 | c4 c8 c8[ c8] c8 | c4. ~ c4 c8 }
patternDB = { c4. c4 c8 | c4. c4 c8 | c4 c8 c4      c8 | c4. ~ c4 c8 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { c g g a g g | c g g a g r }
  \changePitch \patternBA { c e c a d c | b a b c r }
  \changePitch \patternAA { c g g a g g | c g g a g r }
  \changePitch \patternBA { c e c a d c | b a b c r }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { g g a a | g f e } >>
  \changePitch \patternCA { g g a a | g f e }
  \changePitch \patternDA { c'( e) c | a( d) c | b b b a b | c c r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAC { e e f e e | e e f e r }
  \changePitch \patternBC { e g g f f | d c d e r }
  \changePitch \patternAC { e e f e e | e e f e r }
  \changePitch \patternBC { e g g f f | d c d e r }

  \changePitch \patternCA { e e f f | e d c }
  \changePitch \patternCA { e e d d | e d c }
  \changePitch \patternDA { e( g) g | f ~ f f | d d d c d | e e r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { g c c c c | g c c c c r }
  \changePitch \patternBB { g c c c a a | g g g r }
  \changePitch \patternAB { g c c c c | g c c c c r }
  \changePitch \patternBB { g c c c a a | g g g r }

  \changePitch \patternCA { c c c c | b b g }
  \changePitch \patternCA { c c c c | b g g }
  \changePitch \patternDB { g( c) g | a ~ a a | g g g g | g g r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAD { c c c c | c c c c r }
  \changePitch \patternBD { c e f d | g g, c r }
  \changePitch \patternAD { c c c c | c c c c r }
  \changePitch \patternBD { c e f d | g g, c r }

  \changePitch \patternCA { c c f f | g g c, }
  \changePitch \patternCA { c c f, f | g g c }
  \changePitch \patternDB { c ~ c e | f( d) d | g g g, g | c c r }

}
}

Refrain = \lyricmode {

Christ has died up -- on the tree, \bar "."
Grace flows down from God to thee, \bar "." \eogbreak
Grace, free grace, flows down from God to thee. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Bro -- ken heart! the foun -- tain’s o -- pen, \bar "."
Christ hath died up -- on the tree; \bar "." \eogbreak
All the powers of hell are sha -- ken, \bar "."
Grace flows down from God to thee. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

God Him -- self, the Source, the Foun -- tain,
Christ the Way the wa -- ters flow,
By the Spir -- it down from heav -- en,
To the thirst -- y heart be -- low.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Now’s the time, the time ac -- cept -- ed,
Now to thee God’s light hath shone:
Christ God’s love hath man -- i -- fest -- ed,
He the fin -- ished work hath done.

}

wordsD = \markuplist {

\line { By one righteousness completed, }
\line { { \hspace #2 } Adam life received its doom; }
\line { Jesus Christ in glory seated, }
\line { { \hspace #2 } Everlasting life hath won. }

}

wordsE = \markuplist {

\line { Broken heart! the river’s flowing, }
\line { { \hspace #2 } Haste, delay not! yet there’s room, }
\line { Hear the Word of God beseeching, }
\line { { \hspace #2 } “Whosoever thirsts may come.” }

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

\noPageBreak

\markup { \fill-line { \vcenter \column {
  \vspace #1
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } }
  \vspace #1
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
