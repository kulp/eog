\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "93"
  title = "Ho! Ye That Thirst, Approach the Spring"
  tunename = "Torino" % not found at hymnary.org
  meter = "C. M. with Refrain"
  poet = "W. Cameron" % uncertain as per hymnary.org
  composer = "Italian Hymn Tune" % not found at hymnary.org
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8 | c4 c8 c8 c8 c8 | c4 c8 c4 }
patternAB = { c8 | c4 c8 c4    c8 | c4 c8 c4 }

patternBA = { c8 | c4 c8 c8 c8 c8 | c4.   c4 }
patternBB = { c8 | c4 c8 c4    c8 | c4.   c4 }
patternBC = { \patternAA }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { c | a' a a( bes) c | c bes bes }
  \changePitch \patternBA { c | a a a( bes) c | g ~ g }
  \changePitch \patternAA { c, | a' a a( bes) c | c bes bes }
  \changePitch \patternBB { d | c f, a g | f ~ f }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBA { a | g g g( a) bes | a( c) } >>
  \changePitch \patternBA { a | bes bes bes( c) d | c ~ c }
  \changePitch \patternBC { c | d c bes a g | c( bes) a }
  \changePitch \patternBB { a | c f, a g | f ~ f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c | f f f ~ f f | f e e }
  \changePitch \patternBA { e | f f f ~ f f | f( e) }
  \changePitch \patternAA { c | f g f ~ f f | ees d d }
  \changePitch \patternBB { e | g f f e | c ~ c }

  \changePitch \patternBA { f | e e e( f) g | f ~ f }
  \changePitch \patternBA { f | e e g( f) e | f ~ f }
  \changePitch \patternBC { f | f f f f f | e ~ e f }
  \changePitch \patternBB { f | g f f e | c ~ c }

}
}

notesTenor = {
\global
\relative a, {

  \changePitch \patternAA { c | c' c c ~ c c | c c c }
  \changePitch \patternBA { c | c c c( bes) a | d( c) }
  \changePitch \patternAB { c, | c' cis d a | a bes bes }
  \changePitch \patternBB { bes | bes a c bes | a ~ a }

  \changePitch \patternBA { c | c g c ~ c c | c ~ c }
  \changePitch \patternBA { c | c c c ~ c c | c ~ c }
  \changePitch \patternBC { a | bes a bes c d | c ~ c c }
  \changePitch \patternBB { d | c a c bes | a ~ a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c | f f f( g) a | g g g }
  \changePitch \patternBA { c, | f f f( d) c | bes( c) }
  \changePitch \patternAB { c | f e d c | f g g }
  \changePitch \patternBB { c, | e f c c | f ~ f }

  \changePitch \patternBA { f | c c c ~ c c | f( a) }
  \changePitch \patternBA { f | g g g( a) bes | a ~ a }
  \changePitch \patternBC { f | bes, c d c b | c ~ c f }
  \changePitch \patternBB { d | e f c c | f ~ f }

}
}

Refrain = \lyricmode {

With -- out a price may go, \bar "."
With -- out a price may go; \bar "." \eogbreak
Free to that o -- pen foun -- tain all \bar "."
With -- out a price may go. \bar "." \eogbreak

}

wordsA = \lyricmode {
\set stanza = "1."

Ho! ye that thirst, ap -- proach the spring \bar "."
Where liv -- ing wa -- ters flow; \bar "." \eogbreak
Free to that o -- pen foun -- tain all \bar "."
With -- out a price may go. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

How long to streams of false de -- light
Will ye in crowds re -- pair?
How long your strength and sub -- stance waste
On tri -- fles light as air?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

My stores af -- ford those rich sup -- plies
That health and pleas -- ure give;
In -- cline your ear and come to Me,
The soul that hears shall live.

}

wordsD = \lyricmode {
\set stanza = "4."

Seek ye the Lord while yet His ear
Is o -- pen to your call;
While of -- fered mer -- cy still is near,
Be -- fore His foot -- stool fall.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
