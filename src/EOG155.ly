\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "155"
  title = "By Thee, O God, Invited"
  tunename = "Hankey"
  meter = "7. 6. 7. 6. D."
  poet = "Mary Bowley"
  composer = "W. G. Fischer"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key aes \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees2 | aes2. ees4 ees2 aes | c2.( bes4) aes2
  aes2 | aes2. f4 bes( aes) f2 | ees1.
  ees2 | bes'2. a4 bes2 c | bes aes1
  aes4( c) | ees2. c4 c( bes) aes2 | bes1.
  bes2 | bes2. c4 des2 des | des c1
  c2 | c2. bes4 aes2 bes4( aes) | g1.
  g2 | f2. g4 aes2 f | f ees1
  aes2 | bes2. aes4 c2 bes | aes1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c2 | c2. c4 c2 ees | ees2.( des4) c2
  ees2 | f2. f4 f2 des2 | c1.
  ees2 | g2. fis4 g2 g | ees ees1
  ees2 | aes ees d d | ees1.
  ees2 | ees2. ees4 g2 ees | ees ees1
  ees2 | f2. g4 aes2 g4( f) | e1.
  e!2 | f2. ees!4 f2 des | des c1
  ees2 | g2. aes4 g2 g | ees1.

}
}

notesTenor = {
\global
\relative a {

  aes2 | aes2. aes4 aes2 aes | aes1 aes2
  aes2 | aes2. aes4 aes2 aes | aes1.
  c2 | des2. c4 des2 ees | des c1
  c2 | c2. aes4 aes2 aes | g1.
  g2 | g2. aes4 bes2 bes | bes aes1
  aes2 | aes2. bes4 c2 c | c1.
  bes2 | aes2. aes4 aes2 aes | aes2 aes1
  aes2 | des2. c4 ees2 des | c1.

}
}

notesBass = {
\global
\relative f,{

  aes2 | aes2. aes4 aes2 c4(ees) | aes1 aes,2
  c2 | des2. des4 des2 f | aes1.
  aes2 | ees2. ees4 ees2 ees | aes2 aes1
  aes2 | aes2. aes4 f2 f | ees1.
  ees2 | ees2. ees4 ees2 g,2 | aes2 aes1
  aes'2 | f2. f4 f2 f | c1.
  c2 | des2. des4 des2 f2 | aes2 aes,1
  c2 | ees2. ees4 ees2 ees | aes1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

By Thee, O God, in -- vit -- ed, \bar "."
We look un -- to the Son, \bar "." \break
In whom Thy soul de -- light -- ed, \bar "."
Who all thy will hath done, \bar "." \break
And by the one chief trea -- sure \bar "."
Thy bos -- om free -- ly gave, \bar "." \break
Thine one pure love we meas -- ure, \bar "."
Thy will -- ing mind to save. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

O God of mer -- cy, Fa -- ther!
The one un -- chang -- ing claim,
The bright -- est hopes we gath -- er
From Christ's most pre -- cious name;
What al -- ways sounds so sweet -- ly
In Thine un -- wear -- ied ear,
Has freed our souls com -- plete -- ly
From all our sin -- ful fear.

}

wordsC = \lyricmode {
\set stanza = "3."

The trem -- bling sin -- ner fear -- eth
That God can ne’er for -- get;
But one full pay -- ment clear -- eth
His mem -- ’ry of all debt.
When nought be -- side could ease us,
Or set our souls at large,
Thy ho -- ly work, Lord Je -- sus,
Se -- cured a full dis -- charge.

}

wordsD = \lyricmode {
\set stanza = "4."

No wrath God’s heart re -- tain -- eth
To us -- ward who be -- lieve;
No dread in ours re -- main -- eth
As we His love re -- ceive;
Re -- turn -- ing sons He kiss -- es,
And with His robe in -- vests;
His per -- fect love dis -- miss -- es
All ter -- ror from our breasts.

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
