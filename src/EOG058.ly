\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = 3
  %page-count = ##f
}

\header{
  hymnnumber = "58"
  title = "Why Unbelieving"
  tunename = ""
  meter = "P. M."
  %poet = ""
  composer = "German"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { \ta c4 c4 c4      | c4. c8 c4 | c4 c4 c4 | c2. }
patternAB = {     c4 c4 c4      | c2     c4 | c4 c4 c4 | c2. }
patternAC = { \ta c4 c4 c8[ c8] | c4. c8 c4 | c4 c4 c4 | c2. }
patternAD = {     c4 c4 c8[ c8] | c4. c8 \tb c4 \ta }

patternBA = { \ta c4 c4 c4 | c4 c4 c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { bes ees g, | bes( aes) g | f ees f | g }
  \changePitch \patternAA { bes ees g, | bes( aes) g | aes g f | g }
  \changePitch \patternBA { f g aes | g aes bes }
  \changePitch \patternAD { c ees d c | bes aes g \fermata }
  \changePitch \patternAC { c ees d c | bes aes g | aes g f | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees g ees | f ~ f ees | d c d | ees }
  \changePitch \patternAB { ees g ees | f ees | f ees d | ees }
  \changePitch \patternBA { d ees f | ees f g }
  \changePitch \patternAC { aes c bes aes | g f ees }
  \changePitch \patternAC { aes c bes aes | g f ees | f ees d | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { g bes bes | bes bes | bes bes bes | bes }
  \changePitch \patternAB { g bes bes | bes bes | c bes bes | bes }
  \changePitch \patternBA { bes bes bes | bes bes bes }
  \changePitch \patternAA { ees ees ees | ees bes bes }
  \changePitch \patternAA { ees ees ees | ees bes bes | c bes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { ees ees ees | d ees | bes bes bes | ees }
  \changePitch \patternAB { ees ees ees | d ees | aes, bes bes | ees }
  \changePitch \patternBA { bes bes bes | ees ees ees }
  \changePitch \patternAA { ees aes aes | ees ees ees }
  \changePitch \patternAA { aes, aes' aes | bes bes ees, | aes, bes bes | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Why un -- be -- liev -- ing? { \bar "." } why wilt thou spurn \bar "."
Love that so gent -- ly { \bar "." } pleads thy re -- turn? \bar "."
Come, ere thy fleet -- ing day \bar "."
Fades in -- to night a -- way; \bar "."
Now mer -- cy’s call o -- bey; \bar "."
To Je -- sus come. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Why not, be -- liev -- ing, come to the Lord?
Trust in the Sav -- iour, doubt not His word,
Think ’twas for thee He died,
Think of Him cru -- ci -- fied;
Now to the Glo -- ri -- fied;
To Je -- sus come.

}

wordsC = \lyricmode {
\set stanza = "3."

Why un -- be -- liev -- ing? thou canst be blessed,
Je -- sus will par -- don,
He’ll give thee rest.
Why wilt thou lon -- ger wait?
Haste to the o -- pen gate,
Come ere it be too late,
To Je -- sus come.

}

wordsD = \lyricmode {
\set stanza = "4."

Why un -- be -- liev -- ing? tri -- fle no more;
Death may be near thee, e’en at thy door.
Come with a brok -- en heart,
Come help -- less as thou art,
Come choose the bet -- ter part,
To Je -- sus come.

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

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
