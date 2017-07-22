\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  system-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "171"
  title = "On the Lamb Our Souls Are Resting"
  tunename = "Zurich"
  meter = "8. 7. 8. 7."
  poet = "Mrs. F. Bevan (from German)"
  composer = "German"
  tagline = ##f
}

ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key aes \major
  \partial 2.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees4( f) ees | aes2. c | c4( bes) aes bes2. | ees,
  ees4( f) ees | bes'2. des | des4( c) bes c2. ~ | c
  c4( bes) c | ees2. c | c4( bes) aes aes2. | f
  bes4( aes) f | ees2. ~ ees2 aes4 | \tb c2 \fermata bes4 \fermata \ta aes2. ~ | aes

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c4( des) c | c2. ees | ees2 ees4 ees2. | ees2.
  ees2 ees4 | ees2. ees | ees2 ees4 ees2. ~ | ees
  aes4( g) aes | aes2. ees2. | c4( des) ees f2. | des
  e4( f) des | ees2. ~ ees2 c4 | ees2 des4 c2. ~ | c

}
}

notesTenor = {
\global
\relative a {

  aes2 aes4 | aes2. aes | aes2 aes4 bes2. | bes
  g4 aes g | g2. bes2. | bes4( aes) g aes2. ~ | aes
  ees'2 ees4 | c2. aes | aes2 aes4 aes2. | aes
  aes2 aes4 | aes2. ~ aes2 aes4 | aes2 g4 aes2. ~ | aes

}
}

notesBass = {
\global
\relative f, {

  aes2 aes4 | aes2. aes' | aes2 aes4 g2. | g
  ees2 ees4 | ees2. ees | ees2 ees4 aes,2. ~ | aes
  aes'2 aes4 | aes2. aes | aes,4( bes) c des2. | des
  des2 des4 | c2. ~ c2 aes4 | ees'2_\fermata ees4_\fermata aes,2. ~ | aes

}
}

wordsA = \lyricmode {
\set stanza = "1."

On the Lamb our souls are rest -- ing, \bar "."
What His love no tongue can say; \bar "."
All our sins, so great, so man -- y, \bar "."
In His blood are washed a -- way. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Sweet -- est rest and peace have filled us,
Sweet -- er praise than tongue can tell;
God is sat -- is -- fied with Je -- sus,
We are sat -- is -- fied as well.

}

wordsC = \lyricmode {
\set stanza = "3."

Con -- science now no more con -- demns us,
For His own most pre -- cious blood
Once for all has washed and cleansed us,
Cleansed us in the eyes of God.

}

wordsD = \lyricmode {
\set stanza = "4."

Filled with this sweet peace for -- ev -- er,
On we go thro’ strife and care,
Till we find that peace a -- round us
In the Lamb’s high glo -- ry there.

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
    % Compensate for wide lyrics by squashing things a bit
    \override LyricSpace.minimum-distance = #0.3
  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak

\markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 258. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
