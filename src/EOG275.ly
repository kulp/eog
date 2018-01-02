\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "275"
  title = "We Are by Christ Redeemed"
  tunename = "Priory" % see https://hymnary.org/tune/priory_botley_tune_book
  meter = "6. 6. 8. 4. D."
  poet = "Mary Bowley" % see https://hymnary.org/text/we_are_by_christ_redeemed
  composer = "" % see https://hymnary.org/tune/priory_botley_tune_book
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=90
  \key aes \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees2 | aes ees c'2. bes4 | aes1.
  aes2 | bes bes g2. g4 | aes1. \eogbreak
  c2 | bes bes ees des | c des c
  bes2 | aes1 g | f1. \eogbreak
  ees2 | ees ees aes2. g4 | f1.
  f2 | des'2. c4 bes2 aes | aes1( g2) \eogbreak
  ees2 | ees' des c bes | aes ees f
  des'2^\markup{\italic rall.} | c1 bes | aes1. \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c2 | c c ees2. des4 | c1.
  ees2 | f f des2. des4 | c1.
  ees2 | ees ees g g | ees ees ees
  g2 | f1 e | f1.
  c2 | c c ees2. ees4 | des1.
  des2 | f2. ees4 f2 f | ees1.
  ees2 | ees ees ees des | c ees des
  f2 | ees1 des | c1.

}
}

notesTenor = {
\global
\relative a {

  aes2 | aes aes aes2. g4 | aes1.
  aes2 | aes des bes2. bes4 | aes1.
  aes2 | g g bes bes | aes g aes
  des2 | c1 bes | aes1.
  aes2 | aes aes aes2. aes4 | aes1.
  aes2 | bes2. a4 bes2 b | c1( bes2)
  g2 | aes g aes g | aes aes aes
  aes2 | aes1 g | aes1.

}
}

notesBass = {
\global
\relative f, {

  aes2 | aes aes ees'2. ees4 | aes,1.
  c2 | des des ees2. ees4 | aes,1.
  aes'2 | ees ees ees ees | ees ees aes,
  bes2 | c1 c | f1.
  aes,2 | aes aes c2. c4 | des1.
  des2 | bes2. c4 des2 d | ees1.
  des2 | c bes aes ees' | f c des
  bes2 | ees1 ees | aes,1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

We are by Christ re -- deemed; \bar "."
The cost— His pre -- cious blood; \bar "."
Be noth -- ing by our souls es -- teemed \bar "."
Like this great good. \bar "."
Were the vast world our own \bar "."
With all its va -- ried store, \bar "."
And Thou, Lord Je -- sus, wert un -- known, \bar "."
We still were poor. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Our earth -- en ves -- sels break;
The world it -- self grows old;
But Christ our pre -- cious dust will take
And fresh -- ly mold.
He’ll give these bod -- ies vile
A fash -- ion like His own;
He’ll bid the whole cre -- a -- tion smile,
And hush its groan.

}

wordsC = \lyricmode {
\set stanza = "3."

Thus far by grace pre -- served,
Each mo -- ment speeds us on;
The crown and king -- dom are re -- served
Where Christ is gone.
When cloud -- less morn -- ing shines,
We shall His glo -- ry share;
In pleas -- ant pla -- ces are the lines;
The home how fair!

}

wordsD = \lyricmode {
\set stanza = "4."

To Him our weak -- ness clings
Thro’ trib -- u -- la -- tion sore,
And seeks the cov -- ert of His wings
Till all be o’er.
And when we’ve run the race,
And fought the faith -- ful fight,
We then shall see Him face to face,
With saints in light.

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
