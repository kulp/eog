\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "There Is Life In a Look"
  subsubtitle = "(P. M.)"
  %meter = "P.M."
  poet = "A. M. Hull"
  composer = "E. G. Taylor"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=27 }

patternAA = { \ta c8( c8) | c4 c8 ~ c8 c4 c8. c16 | c8[ c8] c8 c8 c4 }
patternAB = { \ta c8 ~ c8 | c4 c8 ~ c8 c4 c8. c16 | c4      c8 c8 c4 }
patternAC = { \ta c8[ c8] | c4 c8   c8 c4 c8. c16 | c8[ c8] c8 c8 c4 }
patternAD = { \ta c4      | c4 c8   c8 c4 c8. c16 | c4      c8 c8 c4 }
patternAE = { \ta c8  c8  | c4 c8   c8 c4 c8. c16 | c8[ c8] c8 c8 c4 }
patternAF = { \ta c8  c8  | c4 c8   c8 c4 c8. c16 | c4      c8 c8 c4 }

patternBA = { \ta c8( c8) | c4 c8. c16 c8[ c8] c8 c8 | c2. }
patternBB = { \ta c8 ~ c8 | c4 c8. c16 c8[ c8] c8 c8 | c2. }

patternCA = { \ta c8( c8) | c4 c8 c8 c4 c8. c16 | c2. c4 }
patternCB = { \ta c8 ~ c8 | c4 c8 c8 c4 c8. c16 | c2. c4 }
patternCC = { \ta c8   c8 | c4 c8 c8 c4 c8. c16 | c2 c4 }

patternDA = { \ta c4 c4 c4 c4 | c4 c4 \tb c4 \fermata \ta }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g a | b b b b c b | b a g a b }
  \changePitch \patternBA { b c | d d d d b g b | a }
  \changePitch \patternAC { g a | b^! b b b c b | b a g a b }
  \changePitch \patternCA { b c | d b g a b a | g r }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternDA { a^! r b^! r | cis^! cis^! d } >>
  \changePitch \patternAE { g, a | b b b b c b | b a g a b }
  \changePitch \patternCC { b c | d b g a b a | g r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { b c | d d d d e d | d c b c d }
  \changePitch \patternBA { g a | b b b b g d g | fis }
  \changePitch \patternAC { b, c | d d d d e d | d c b c d }
  \changePitch \patternCA { g a | b g d c d c | b r }

  \changePitch \patternDA { fis' r g r | g g fis }
  \changePitch \patternAE { b, c | d d d d e d | d c b c d }
  \changePitch \patternCC { g a | b g d fis d c | b r }

}
}

% There is only one voice in the bass clef in this song, so we chose to call it
% Bass (maybe Baritone would be more appropriate ?)

notesBass = {
\global
\relative f {

\tieUp

  \changePitch \patternAB { g g | g g g g g g | d d d g }
  \changePitch \patternBB { g g | g g g g d b g | d' }
  \changePitch \patternAD { g | g g g g g g | d d d g }
  \changePitch \patternCB { g g | g g b, d d d | g r }

  \changePitch \patternDA { d^! r g^! r | e^! e^! d }
  \changePitch \patternAF { g g | g g g g g g | d d d | g }
  \changePitch \patternCC { g g | g g b, d d d | g r }

}
}

Refrain = \lyricmode {

Look! look! look and live! \bar "."
There is life in a look at the Cru -- ci -- fied One, \bar "."
There is life at this mo -- ment for thee. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

\mon There is \moff life \mon in a \moff look at the Cru -- ci -- fied One, \bar "."
\mon There is \moff life at this mo -- ment for thee; \bar "."
Then look, sin -- ner, look un -- to Him and be saved, \bar "."
\mon Un -- to \moff Him who was nailed to the tree. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

\mon It is \moff not thy tears of re -- pent -- ance nor prayers,
\mon But the \moff blood that a -- tones for the soul:
On Him then be -- lieve, and a par -- don re -- ceive,
\mon For His \moff blood now can make thee quite whole.

}

wordsC = \lyricmode {
\set stanza = "3."

\mon We are \moff healed \mon by His \moff stripes; wouldst thou add to the word?
And He is our right -- eous -- ness made;
The best robe of heav -- en He bids thee put on:
O, couldst thou be bet -- ter ar -- rayed?

\Refrain

}

wordsD = \lyricmode {
\set stanza = "4."

Then doubt \mon not thy \moff wel -- come, since God has de -- clared
\mon There re -- \moff main -- eth no more to be done,
That once in the end of the world He ap -- peared,
\mon And com -- \moff plet -- ed the work He be -- gun.

}

wordsE = \lyricmode {
\set stanza = "5."

But take \mon with re -- \moff joi -- cing from Je -- sus at once,
The life ev -- er -- last -- ing He gives;
And know with as -- sur -- ance thou nev -- er canst die,
Since Je -- sus, thy right -- eous -- ness, lives.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \clef bass
      %\context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
