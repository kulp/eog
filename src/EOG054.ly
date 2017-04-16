\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "54"
  title = "We Know There’s a Bright and a Glorious Home"
  tunename = ""
  meter = "10. 7. 10. 7."
  %poet = ""
  %composer = ""
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8 ~ c8 | c4 c8( c8) c4 c8( c8) | c4 c4 c4 }
patternAB = { c8 ~ c8 | c4 c8( c8) c4 c8 ~ c8 | c4 c4 c4 }
patternAC = { c8 ~ c8 | c4 c8 ~ c8 c4 c8( c8) | c4 c4 c4 }
patternAD = { c8 ~ c8 | c4 c8 ~ c8 c4 c8 ~ c8 | c4 c4 c4 }

patternBA = { c8 ~ c8 | c4 c8 ~ c8 c4 c4 | c2. }
patternBB = { c8 ~ c8 | c4. c8 c4 c4 | c2. }
patternBC = { c4      | c4. c8 c4 c4 | c2. }

patternCA = { c8[ c8] | c4. c8 c8[ c8] c8[ c8] | c2( c4) }
patternCB = { c8[ c8] | c4. c8 c4      c8[ c8] | c2.     }
patternCC = { c8[ c8] | c4. c8 c8[ c8] c8[ c8] | c2.     }
patternCD = { c4      | c4. c8 c4      c4      | c2( c4) }

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
\relative c' {

  \changePitch \patternAA { c c | f f g a g f | bes c d }
  \changePitch \patternBA { d d | c a a a f | g }
  \changePitch \patternAA { c, c | f f g a g f | bes c d }
  \changePitch \patternBB { d d | c a g a | f }

  \changePitch \patternCA { f a | c d c a g f | f' d }
  \changePitch \patternBC { d | c a a f | g }
  \changePitch \patternAA { c, c | f f g a g f | bes c d }
  \changePitch \patternBB { d d | c a g a | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { c c | a a bes c c c | f f f }
  \changePitch \patternBA { f f | f f f f f | e }
  \changePitch \patternAB { c c | c c c c c c | f f f }
  \changePitch \patternBB { f f | f f e e | c }

  \changePitch \patternCB { f a | f f f e f | f }
  \changePitch \patternBC { f | f f f f | e }
  \changePitch \patternAB { bes bes | a a bes c c c | f f f }
  \changePitch \patternBB { f f | f f e e | c }

}
}

notesTenor = {
\global
\relative a, {

  \changePitch \patternAC { c c | f f f f e f | f a bes! }
  \changePitch \patternBA { bes bes | a c c b b | bes }
  \changePitch \patternAA { c, c | a' a bes c bes a | bes a bes }
  \changePitch \patternBB { bes bes | a c bes c | a }

  \changePitch \patternCC { a c | a bes a c bes a | bes }
  \changePitch \patternBC { bes | a c c b | c }
  \changePitch \patternAC { e, e | f f f f e f | f a bes }
  \changePitch \patternBB { aes aes | a! a bes c | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAC { c c | f, f f f g a | d c bes }
  \changePitch \patternBA { bes bes | c c c d d | c }
  \changePitch \patternAD { c c | f f f f f f | d c bes }
  \changePitch \patternBB { bes bes | c c c c | < f f, >}

  \changePitch \patternCD { f | f f f f | d bes }
  \changePitch \patternBC { f' | f f f d | c }
  \changePitch \patternAC { c c | f, f f f g a | d c bes }
  \changePitch \patternBB { b b | c c c c | < f f, > }

}
}

wordsA = \lyricmode {
\set stanza = "1."

We know \mon there’s a \moff bright \mon and a \moff glo -- rious home, \bar "."
A -- way \mon in the \moff heav -- ens high, \bar "." \break
Where all \mon the re -- \moff deemed \mon shall \moff with Je -- sus dwell: \bar "."
\mon But will \moff you be there, and I? \bar "." \break
Will you be there, and I? \bar "."
Will you be there, and I? \bar "."
Where all \mon the re -- \moff deemed \mon shall \moff with Je -- sus dwell: \bar "."
\mon But will \moff you be there, and I? \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

In robes of white, \mon o’er the \moff street of gold,
Be -- neath a cloud -- less sky,
They’ll walk \mon in the light of their Fa -- ther’s smile; \moff
\mon But will \moff you be there, and I?
Will you be there, and I?
Will you be there, and I?
They’ll walk \mon in the light of their Fa -- ther’s smile; \moff
\mon But will \moff you be there, and I?

}

wordsC = \lyricmode {
\set stanza = "3."

From ev -- ’ry king -- \mon dom of \moff earth they come
To join \mon the tri -- \moff um -- phal cry,
\mon Sing -- ing, \moff “Wor -- \mon thy the \moff Lamb that once was slain;”
\mon But will \moff you be there, and I?
Will you be there, and I?
Will you be there, and I?
\mon Sing -- ing, \moff “Wor -- \mon thy the \moff Lamb that once was slain;”
\mon But will \moff you be there, and I?

}

wordsD = \lyricmode {
\set stanza = "4."

\mon If you \moff take the lov -- ing Sav -- iour now,
\mon Who for \moff sin -- ners once did die,
\mon When He ga -- thers His own \moff in that bright home,
Then you’ll be there, and I.
Then you’ll be there, and I,
Then you’ll be there, and I,
\mon When He ga -- thers His own \moff in that bright home,
Then you’ll be there, and I.

}

wordsE = \lyricmode {
\set stanza = "5."

If we are shel -- tered by the cross,
And thro’ the blood bro’t nigh,
Our ut -- most gain we’ll count but loss,
Since you’ll be there, and I.
Since you’ll be there, and I,
Since you’ll be there, and I,
Our ut -- most gain we’ll count but loss,
Since you’ll be there, and I.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
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
      \clef bass
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
