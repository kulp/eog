\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  systems-per-page = ##f
}

\header{
  hymnnumber = "167"
  title = "I Know Not Why God’s Wondrous Grace"
  tunename = ""
  meter = "C. M. With Refrain"
  poet = "El Nathan"
  composer = "J. McGranahan"
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {
  
  ees4 | g4. g8 aes[ g] f[ ees] | c'4 bes bes
  g4 | bes4. bes8 c[ bes] aes[ g] | f2.
  aes4 | g4. g8 aes[ g] f[ ees] | c'4 bes bes
  g4 | bes4. bes8 c[ bes] aes[ f] | ees2.

  << s^\markup { \small \caps "Refrain" }
  { ees8 ees | ees'4 ees4. ees8 d c | c4 bes4. } >>
  bes8 c bes | bes4 aes4. aes8 bes aes | aes4 g2
  ees4 | ees'4 ees4. ees8 d c | c4 bes2
  bes8 bes | d4. c8 d4 bes | ees2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 | ees4. ees8 ees4 bes | ees ees ees
  ees | g4. g8 aes[ g] f[ ees] d2.
  f4 | ees4. ees8 ees4 bes | ees ees ees
  ees4 | d4. d8 d4 d | ees2.

  ees8 ees | c'4 c4. c8 bes aes | aes4 g4.
  g8 aes g | g4 f4. f8 g f | f4 ees2
  ees4 | c'4 c4. c8 bes aes | aes4 g2
  g8 g | f4. aes8 aes4 aes | g2.

}
}

notesTenor = {
\global
\relative a {

  g4 | bes4. bes8 c[ bes] aes[ g] | aes4 g g
  bes4 | ees4. ees8 ees4 bes4 | bes2.
  bes4 | bes4. bes8 c[ bes] aes[ g] | aes4 g g
  bes4 | bes4. f8 f4 f8[ aes] | g2.

  ees8 ees | ees'4 ees4. ees8 ees ees | ees4 ees4.
  ees8 ees ees | d4 d4. d8 d d | ees4 bes2
  ees,4 | ees'4 ees4. ees8 ees ees | ees4 ees2
  bes8 bes | bes4. bes8 bes4 bes | bes2.

}
}

notesBass = {
\global
\relative f {

  ees4 | ees4. ees8 ees4 ees | ees ees ees
  ees4 | ees4. ees8 ees4 d8[ ees] | bes2.
  bes4 | ees4. ees8 ees4 ees | ees ees ees
  ees4 | bes4. bes8 bes4 bes | ees2.

  ees8 ees | aes,4 aes'4. aes8 aes aes | ees4 ees4.
  ees8 ees ees | bes4 bes4. bes8 bes bes | ees4 ees2
  ees4 | aes,4 aes'4. aes8 aes aes | ees4 ees2
  ees8 ees | bes4. bes8 bes8[ c] d4 | ees2.

}
}

Refrain = \lyricmode {

But “I know whom I have be -- liev -- ed, \bar "."
And am per -- suad -- ed that He is a -- ble \bar "."
To keep that which I’ve com -- mit -- ted \bar "."
Un -- to Him a -- gainst that day.” \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

I know not why God’s won -- drous grace \bar "."
To me He hath made known, \bar "."
Nor why un -- worth -- y as I am \bar "."
He claimed me for His own— \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I know not how this sav -- ing faith
To me He did im -- part,
Or how be -- liev -- ing in His word
Wrought peace with -- in my heart—

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

I know not how the Spi -- rit moves–
Con -- vinc -- ing men of sin–
Re -- veal -- ing Je -- sus through the word–
Cre -- a -- ting faith in Him—

}

wordsD = \lyricmode {
\set stanza = "4."

I know not what of good or ill
May be re -- serv’d for me,
Of wea -- ry ways or gold -- en days
Be -- fore His face I see—

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

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
