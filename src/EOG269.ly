\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG269.ily"
}

\header{
  hymnnumber = "269"
  title = "This World Is a Wilderness Wide!"
  tunename = "Faithfulness"
  meter = "8. 8. 8. 8. D."
  poet = "J. N. Darby"
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=110
  \key bes \major
  \partial 2
  \autoBeamOff
}

patternA = { c4 c | c2 c c | c c c | c1 }
patternB = { c4 c | c2 c c | c c c | c1. | a1 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { f ~ f | f d bes' | a f ees' | d }
  \changePitch \patternA { c c | bes bes bes | a g a | bes }
  \changePitch \patternA { f f | f d bes' | a f ees' | d }
  \changePitch \patternA { c c | bes bes bes | a g a | bes }
  \changePitch \patternA { bes ~ bes | c d c | c bes a | bes }
  \changePitch \patternB { f f | g a bes | d c bes | bes( | a) }
  \changePitch \patternA { f f | f d bes' | a f ees' | d }
  \changePitch \patternA { c c | bes bes bes | a g a | bes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d ~ d | d bes d | ees ees f | f }
  \changePitch \patternA { g g | f g f | ees ees ees | d }
  \changePitch \patternA { d d | d bes d | ees ees f | f }
  \changePitch \patternA { g g | f g f | ees ees ees | d }
  \changePitch \patternA { d ~ d | ees ees ees | ees d ees | d }
  \changePitch \patternB { f f | ees ees d | f f f | f ~ | f }
  \changePitch \patternA { ees ees | d bes d | ees ees f | f }
  \changePitch \patternA { g g | f g f | ees ees ees | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes ~ bes | bes bes bes | c a a | bes }
  \changePitch \patternA { ees ees | d ees d | c bes c | bes }
  \changePitch \patternA { bes bes | bes bes bes | c a a | bes }
  \changePitch \patternA { ees ees | d ees d | c bes c | bes }
  \changePitch \patternA { bes ~ bes | a a a | a bes c | bes }
  \changePitch \patternB { bes bes | bes f f | bes ees d | d( | c) }
  \changePitch \patternA { c c | bes bes bes | c a a | bes }
  \changePitch \patternA { ees ees | d ees d | c bes c | bes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { bes ~ bes | bes bes bes | f' f f | bes }
  \changePitch \patternA { ees, ees | f f f | f f f | bes, }
  \changePitch \patternA { bes bes | bes bes bes | f' f f | bes }
  \changePitch \patternA { ees, ees | f f f | f f f | bes, }
  \changePitch \patternA { bes ~ bes | f' f f | f f f | bes, }
  \changePitch \patternB { d d | ees c bes | bes' a bes | f ~ | f }
  \changePitch \patternA { a a | bes bes, bes | f' f f | bes }
  \changePitch \patternA { ees, ees | f f f | f f f | bes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

This world is a wil -- der -- ness wide! \bar "."
We have noth -- ing to seek or to choose; \bar "."
We’ve no thought in the waste to a -- bide; \bar "."
We have naught to re -- gret, nor to lose. \bar "."
The Lord is Him -- self gone be -- fore; \bar "."
He has marked out the path that we tread; \bar "."
It’s as sure as the love we a -- dore, \bar "."
We have noth -- ing to fear, nor to dread. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

There is but that one in the waste,
Which His foot -- steps have marked as His own,
And we fol -- low in dil -- i -- gent haste
To the seats where He’s put on His crown.
{ \mon } For the { \moff } path where our Sav -- iour is gone
Has led up to His Fa -- ther and God,
To the place where He’s now on the throne,
And His strength shall be ours on the road.

}

wordsC = \lyricmode {
\set stanza = "3."

{ \mon } And with { \moff } Him shall our rest be on high,
When in ho -- li -- ness bright we sit down,
In the joy of His love ev -- er nigh,
In the peace that His pres -- ence shall crown.
{ \mon } ’Tis the { \moff } treas -- ure we’ve found in His love
That has made us now pil -- grims be -- low,
And ’tis there, when we reach Him a -- bove,
As we’re known, all His full -- ness we’ll know.

}

wordsD = \lyricmode {
\set stanza = "4."

And, Sav -- iour, ’tis Thee from on high
We a -- wait till the time Thou shalt come,
To take those Thou hast led by Thine eye
To Thy -- self in Thy heav -- en -- ly home.
Till then ’tis the path Thou hast trod,
Our de -- light and our com -- fort shall be;
We’re con -- tent with Thy staff and Thy rod,
Till with Thee all Thy glo -- ry we see.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
