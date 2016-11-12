\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = 3
  %page-count = ##f
}

\header{
  hymnnumber = "45"
  title = "The Wanderer No More Will Roam"
  tunename = "Silent Night"
  meter = "8. 8. 8. 6."
  %poet = ""
  %composer = ""
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=100 }
tb = { \tempo 4=50  }

patternAA = { c4 c4 c4 | c2 ~ c4 | c4( c4) c4 | c2. }
patternAB = { c4 c4 c4 | c2 ~ c4 | c4 ~ c4 c4 | c2. }
patternBA = { c4 c4 c8[ c8] | c2 c4 | c2 c8[ c8] | c2. }
patternBB = { c4 c4 c4      | c2 c4 | c2 c4      | c2. }
patternBC = { c4 c4 c8[ c8] | c2 c4 | c2 c4      | c2. }
patternCA = { c4 c4 c4 | c4.( c8) c4 | c4.( c8) c4 | c2. }
patternCB = { c4 c4 c4 | c2       c4 | c2       c4 | c2. }
patternDA = { c4 c4 c4 | c4( c4) c4      | c2.( | c2.) }
patternDB = { c4 c4 c4 | c2      c4      | c2. ~ | c2. }
patternDC = { c4 c4 c4 | c4( c4) c4      | c2. ~ | c2. }
patternDD = { c4 c4 c4 | c2      c8[ c8] | c2.( | c2.) }
patternEA = { c4 c4 c4 | c4( c4) c4 | c2. }
patternEB = { c4 c4 c4 | c2      c4 | c2. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g a g | e e | g a g | e }
  \changePitch \patternBA { d' d d b | b b | c c g | g }
  \changePitch \patternCA { a gis a | c b a | g a g | e }

  \changePitch \patternDA { d' d d | f d b | c | e }
  \changePitch \patternEA { c | g e | g f d | c }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e f e | c c | e f e | c }
  \changePitch \patternBB { f f f | f f | e e | e }
  \changePitch \patternCA { f f f | a g f | e f e | c }

  \changePitch \patternDB { g' g g | g g | g | g }
  \changePitch \patternEA { e e c | e d b | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { c c c | g g | c c c | g }
  \changePitch \patternBC { b b b d | d d | c c | c }
  \changePitch \patternCB { c b c | c c | c c | g }

  \changePitch \patternDC { b b b | d b d | c | c }
  \changePitch \patternEB { g g g | g f | e }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { c c c | c c | c c c | c }
  \changePitch \patternBB { g' g g | g g | c, c | c }
  \changePitch \patternCB { f f f | f f | c c | c }

  \changePitch \patternDD { g' g g | g g f | e | c }
  \changePitch \patternEB { c c c | g g | c }

}
}

wordsA = \lyricmode {
\set stanza = "1."

The wan -- der -- er { \mon } no more { \moff } will roam, \bar "."
The lost one to the fold hath come, \bar "."
The prod -- i -- gal is wel -- comed home, \bar "." \break
O Lamb of God, to Thee, \bar "."
O Lamb of God, to Thee! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Tho’ clothed in rags, { \mon } by sin { \moff } de -- filed,
The Fa -- ther did em -- brace His child;
And I am par -- doned, rec -- on -- ciled,
O Lamb of God, in Thee,
O Lamb of God, in Thee!

}

wordsC = \lyricmode {
\set stanza = "3."

It is the { \mon } Fa -- ther’s { \moff } joy to bless,
His love has found for me a dress,
A robe of spot -- less, right -- eous -- ness,
O Lamb of God, in Thee,
O Lamb of God, in Thee!

}

wordsD = \lyricmode {
\set stanza = "4."

And now my { \mon } fam -- ished { \moff } soul is fed,
A feast of love for me is spread,
I feed up -- on the chil -- dren’s bread,
O Lamb of God, in Thee,
O Lamb of God, in Thee!

}

wordsE = \lyricmode {
\set stanza = "5."

Yea, in the { \mon } ful -- ness { \moff } of His grace,
God put me in the chil -- dren’s place,
Where I may gaze up -- on His face,
O Lamb of God, in Thee,
O Lamb of God, in Thee!

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
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
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

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
