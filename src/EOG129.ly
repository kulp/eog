\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG129.ily"
}

\header{
  %gospel
  hymnnumber = "129"
  title = "’Tis a True and Faithful Saying" % see https://hymnary.org/text/tis_a_true_and_faithful_saying
  tunename = ""
  meter = "8. 7. 8. 7. with Refrain"
  poet = "Maud Fraser" % see https://hymnary.org/person/Fraser_M
  composer = "James McGranahan" % see https://hymnary.org/tune/tis_a_true_and_faithful_saying_mcgranaha
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8. c16 | c4 c4 c4 c4 | c2 c4 }
patternAB = { c8. c16 | c4 c4 c4 c4 | c2.   }
patternAC = { c8. c16 | c4 c4 c4 c4 | c4.( c8) c4 }
patternAD = { c8. c16 | c4 c4 c4. c8 | c2.   }

patternBA = { c4 | c4. c8 c4 c4 | c4 c2    }
patternBB = { c4 | c4. c8 c4 c4 | c2.      }
patternBC = { c4 | c4. c8 c4 c4 | c2( c4)  }
patternBD = { c4 | c4. c8 c4 c4 | c4 c4 c4 }

patternCA = { c4 | c4 c4 c4 c4 | c4 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { c c | c bes e, d' | c a }
  \changePitch \patternAB { a a | a g c, bes' | a }
  \changePitch \patternAA { c c | c bes e, d' | c c }
  \changePitch \patternAD { c d | e c d c | c } \eogbreak

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBA { c | f c e d | c a } >>
  \changePitch \patternBB { c | f f e d | c }
  \changePitch \patternCA { bes | a bes c f | e d }
  \changePitch \patternBB { d | c b d c | f, }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { a a | a g c, bes' | a f }
  \changePitch \patternAB { f f | e e c e | f }
  \changePitch \patternAC { f f | f e e e | f g a }
  \changePitch \patternAD { g g | g g f e | e }

  \changePitch \patternBA { c' | a a g e | f f }
  \changePitch \patternBC { c' | c a g g | g f }
  \changePitch \patternCA { e | f e f f | f f }
  \changePitch \patternBB { f | f f e e | f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c c | c c c g | a c }
  \changePitch \patternAB { c c | c bes e, d' | c }
  \changePitch \patternAA { c c | c c c c | c c }
  \changePitch \patternAD { c b | c c b c | c }

  \changePitch \patternBA { c | c c c bes | a c }
  \changePitch \patternBD { c | c c c f | e d c }
  \changePitch \patternCA { c | c c c c | c bes }
  \changePitch \patternBB { bes a aes g bes! | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f f | c e g e | f f }
  \changePitch \patternAB { f f | c c c c | f }
  \changePitch \patternAC { a a | a g c, bes' | a g f }
  \changePitch \patternAD { e d | c e g c, | c }

  \changePitch \patternBA { c' | f, f c c | f f }
  \changePitch \patternBD { c' a f g g | c bes a }
  \changePitch \patternCA { g | f g a a | bes bes }
  \changePitch \patternBB { bes, | c d c c | f }

}
}

Refrain = \lyricmode {

Oh glad and glo -- rious gos -- pel! \bar "."
With joy we now pro -- claim __ \bar "."
A full and free sal -- va -- tion \bar "."
Thro’ faith in Je -- sus’ name! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

’Tis a true and faith -- ful say -- ing, \bar "."
Je -- sus died for sin -- ful men; \bar "."
Tho’ we’ve told the sto -- ry oft -- en, \bar "."
We must tell it o’er a -- gain. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He has made a full a -- tone -- ment,
Now His sav -- ing work is done;
He has sat -- is -- fied the Fa -- ther,
Who ac -- cepts us in His Son.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Still up -- on His hands the nail -- prints
For e -- ter -- ni -- ty He’ll bear;
Our Re -- deem -- er, Lord and Sav -- iour,
In the glo -- ry sit -- teth there.

}

wordsD = \lyricmode {
\set stanza = "4."

But re -- mem -- ber, this same Je -- sus
In the clouds will come a -- gain;
And with Him His blood -- bought peo -- ple
Ev -- er -- more shall live and reign.

}

underWords = \lyricmode {

{ \repeat unfold 41 { \skip 4 } }
we now pro -- claim

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto altos    \wordsB % has Refrain, needs long extension line
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
    >>
    \context Lyrics = three \lyricsto tenors \underWords
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
