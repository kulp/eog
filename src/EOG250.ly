\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "250"
  title = "O Lord! We Would Delight in Thee"
  tunename = "Merton" % not found at hymnary.org
  meter = "C. M."
  poet = "John Ryland" % see https://hymnary.org/text/o_lord_i_would_delight_in_thee
  composer = "German"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key bes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f4 | bes( a) g | f2 bes4 | bes( a) bes | c2
  f,4 | d'( c) bes | g2 a4 | bes2. ~ | bes4 r4
  d4 | d( c) d | ees2 c4 | c( bes) c | d2
  bes4 | f( g) f | d'2 c4 | bes2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f4 | d( ees) ees | d2 f4 | f2 f4 | f2
  f4 | f( ees) f | ees2 ees4 | d2. ~ | d4 r4
  f4 | f2 f4 | a2 a4 | a( f) f | f2
  f4 | d( cis) d | f2 ees4 | d2

}
}

notesTenor = {
\global
\relative a {

  f4 | f( g) a | bes2 d4 | d( ees) d | c2
  f,4 | bes( a) bes | bes2 f4 | f2. ~ | f4 r4
  bes4 | bes( a) bes | c2 ees4 | ees( d) a | bes2
  bes4 | bes2 bes4 | bes2 a4 | f2

}
}

notesBass = {
\global
\relative f {

  f4 | bes, ~ bes bes | bes2 bes'4 | bes( c) bes | a2
  f4 | bes,( c) d | ees2 c4 | bes2. ~ | bes4 r4
  bes4 | f'2 f4 | f2 f4 | f2 f4 | bes,2
  d4 | f( e) f | f2 f,4 | bes2

}
}

wordsA = \lyricmode {
\set stanza = "1."

O Lord! we would de -- light in Thee, \bar "."
And on Thy care de -- pend; \bar "."
To Thee in ev -- ’ry troub -- le flee, \bar "."
Our safe, un -- fail -- ing Friend. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

When hu -- man cis -- terns all are dried,
Thy full -- ness is the same;
May we with this be sat -- is -- fied,
And glo -- ry in Thy name.

}

wordsC = \lyricmode {
\set stanza = "3."

Why should we thirst for aught be -- low,
While there’s a foun -- tain near;
A foun -- tain which doth ev -- er flow,
The faint -- ing heart to cheer?

}

wordsD = \lyricmode {
\set stanza = "4."

No good in crea -- tures can be found,
All, all is found in Thee;
We must have all things and a -- bound,
Through Thy suf -- fi -- cien -- cy.

}

wordsE = \lyricmode {
\set stanza = "5."

Thou that hast made our heaven se -- cure,
Wilt here all good pro -- vide;
While Christ is rich, can we be poor?
Christ, who for us has died!

}

wordsF = \lyricmode {
\set stanza = "6."

O Lord! we cast each care on Thee,
And tri -- umph and a -- dore;
Oh, that our great con -- cern may be
To love and praise Thee more.

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
      \context Lyrics = six   \lyricsto sopranos \wordsF
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
