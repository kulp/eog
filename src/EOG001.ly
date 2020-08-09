\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "1"
  title = "“Come!” ’Tis Jesus Gently Calling"
  tunename = "Trust in Jesus" % original has "’Tis So Sweet to Trust in Jesus"
  meter = "8. 7. 8. 7. D."
  poet = "Annie S. Ormsby"
  composer = "William J. Kirkpatrick" % see https://hymnary.org/tune/trust_in_jesus_kirkpatrick
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative a' {
  c4 bes aes4. g8 f4 aes f ees     | aes4 c ees4. c8 bes4 aes bes2
  c4 bes aes4. g8 f4 aes f ees     | aes4 c f,4. bes8 aes4 g aes2
  c4 ees ees c bes aes c bes       | c ees ees4. c8 bes4 aes bes2
  % TODO actually make MIDI output soft
  % Used to use c4^\p here but that made only the soprano soft, and putting it
  % in every voice resulted in too many p's.
  c4^\markup { \dynamic p } bes aes ees des'4. f,8 f4 ees | aes c f,4. bes8 aes4 g aes2

\bar "|."
}
}

notesAlto = {
\global
\relative e' {

  ees4 des c4. ees8 des4 des des c | ees4 aes aes4. aes8 ees4 d ees2
  ees4 des c4. ees8 des4 des des c | c4 ees des4. f8 ees4 ees ees2
  aes4 aes aes aes g f aes g       | aes aes aes4. aes8 ees4 d ees2
  ees4 des c c f4. des8 des4 c     | c ees des4. f8 ees4 ees ees2

}
}

notesTenor = {
\global
\relative a {

  aes4 ees ees4. aes8 aes4 aes aes aes | c4 ees c4. ees8 ees4 bes g2
  aes4 ees ees4. aes8 aes4 aes aes aes | ees4 aes aes4. des8 c4 bes c2
  ees4 c c ees des c ees ees           | ees c c4. ees8 ees4 bes g2
  aes4 ees ees aes aes4. aes8 aes4 aes | ees aes aes4. des8 c4 bes c2

}
}

notesBass = {
\global
\relative a, {

  aes4 aes aes4. c8 des4 f aes aes  | aes4 aes aes4. aes8 g4 f ees2
  aes,4 aes aes4. c8 des4 f aes aes | aes,4 aes des4. des8 ees4 ees aes,2
  aes'4 aes aes aes ees f ees ees   | aes aes aes4. aes8 g4 f ees2
  aes,4 aes aes aes des4. des8 aes4 aes | aes aes des4. des8 ees4 ees aes2

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Come!” ’tis Je -- sus gen -- tly call -- ing, \bar "."
“Ye with care and toil op -- pressed, \bar "."
With your guilt how -- e’er ap -- pall -- ing— \bar "."
Come, and I will give you rest.” \bar "."
For your sin He “once has suf -- fered,” \bar "."
On the cross the work was done, \bar "."
And the word by God now ut -- tered \bar "."
To each wear -- y soul is “Come!” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“Come!” the Fa -- ther’s house stands o -- pen,
With its love and light and song;
And re -- turn -- ing to that Fa -- ther,
All to you may now be -- long.
From sin’s dis -- tant land of fam -- ine,
Toil -- ing neath the mid -- day sun,
To a Fa -- ther’s house of plen -- ty,
And a Fa -- ther’s wel -- come, “Come!”

}

wordsC = \lyricmode {
\set stanza = "3."

“Come!” for night is gath -- ’ring quick -- ly
O’er the world’s fast -- fleet -- ing day;
If you lin -- ger till the dark -- ness
You will sure -- ly miss your way.
And still wait -- ing— sad -- ly wait -- ing,
Till the day its course has run,
With His pa -- tience un -- a -- ba -- ting
Je -- sus lin -- gers for you— “Come!”

}

wordsD = \lyricmode {
\set stanza = "4."

“Come!” for an -- gel hosts are mus -- ing
O’er this sight so strange -- ly sad:
God “be -- seech -- ing”— man re -- fus -- ing
To be made for -- ev -- er glad!
From the world and its de -- lu -- sion
Now our voi -- ces rise as one;
While we shout God’s in -- vi -- ta -- tion,
Heav’n it -- self re -- ech -- oes “Come!”

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
