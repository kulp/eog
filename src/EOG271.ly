\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "271"
  title = "The Sands of Time Are Sinking"
  tunename = "Rutherford"
  meter = "7. 6. 7. 6. 7. 6. 7. 5."
  poet = "Anne Ross Cousin" % original has "Cousins" -- see https://hymnary.org/text/the_sands_of_time_are_sinking
  composer = "Chrétien Urhan"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key f \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a2 | a a g2. g4 | f1 f2
  f2 | bes2. bes4 a2 bes | g1.
  g2 | c2. c4 bes2 bes | a1 g2
  g2 | f2 f e4( f) g( e) | f1.
  f2 | f2. f4 f2 g | a1 a2
  f2 | f2. f4 f2 g | a1.
  a4( bes) | c2 c d2. c4 | c1 bes1 |
  a2 a g2. f4 | f1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 | f2 f e2. e4 | d1 d2
  f2 | f2. f4 f2 f | e1.
  e2 | f2. f4 e2 e | f1 d2
  d2 | c c c c | c1.
  c2 | d2. d4 f2 e | f1 f2
  c2 | d2. d4 f2 e | f1.
  f4( e) | f2 f f2. f4 | f1 e1 |
  f2 f e2. f4 | f1.

}
}

notesTenor = {
\global
\relative a {

  c2 | c2 c bes2. bes4 | a1 a2
  a2 | d2. d4 c2 d | c1.
  c2 | c2. c4 c2 c | c1 bes2
  bes2 | a2 a g4( a) bes( g) | a1.
  a2 | d2. d4 des2 des | c1 c2
  a2 | d2. d4 des2 des | c1.
  c2 | c c bes2. c4 | c1 c |
  c2 c bes2. a4 | a1.

}
}

notesBass = {
\global
\relative f {

  f2 | f f c2. c4 | d1 d2
  d2 | bes2. bes4 f'2 bes, | c1.
  bes'2 | a2. a4 g2 g | f1 bes,2
  bes2 | c2 c c c | f1.
  f2 | bes2. bes4 bes2 bes | f1 f2
  f2 | bes2. bes4 bes2 bes | f1.
  f4( g) | a2 a bes2. a4 | a1 g |
  f2 f c2. f,4 | f1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

The sands of time are sink -- ing, \bar "."
The dawn of heav -- en breaks, \bar "."
The sum -- mer morn I’ve sighed for— \bar "."
The fair, sweet morn a -- wakes. \bar "."
Dark, dark hath been the mid -- night, \bar "."
But day -- spring is at hand, \bar "."
And glo -- ry, glo -- ry dwell -- eth \bar "."
In Im -- man -- uel’s land. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Oh Christ, He is the foun -- tain,
The deep, sweet well of love;
The streams on earth I’ve tast -- ed,
More deep I’ll drink a -- bove.
There to an o -- cean full -- ness
His mer -- cy doth ex -- pand,
And glo -- ry, glo -- ry dwell -- eth
In Im -- man -- uel’s land.

}

wordsC = \lyricmode {
\set stanza = "3."

With mer -- cy and with judg -- ment
My web of time He wove,
And aye the dews of sor -- row
Were lus -- tered with His love.
I’ll bless the hand that guid -- ed,
I’ll bless the heart that planned,
When throned where glo -- ry dwell -- eth
In Im -- man -- uel’s land.

}

wordsD = \lyricmode {
\set stanza = "4."

Oh, I am my Be -- lov -- ed’s,
And my Be -- lov -- ed’s mine,
He brings a poor, vile sin -- ner
In -- to His “house of wine.”
I stand up -- on His mer -- it,
I know no saf -- er stand,
Not e’en where glo -- ry dwell -- eth
In Im -- man -- uel’s land.

}

wordsE = \lyricmode {
\set stanza = "5."

The bride eyes not her gar -- ment,
But her dear bride -- groom’s face;
I will not gaze on glo -- ry,
But on my King of grace.
Not on the crown He giv -- eth,
But on His pierc -- ed hand;
The Lamb is all the glo -- ry
Of Im -- man -- uel’s land.

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
