\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 4) (#t #f))
  system-count = #(cond (is-eogsized 6) (#t #f))
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  %gospel
  hymnnumber = "134"
  title = "What Will You Do With Jesus?"
  tunename = ""
  meter = "P. M."
  poet = "Nathaniel Norton"
  composer = "Geo. C. Stebbins"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g16[ aes] | bes8 a bes ees4 c8 | bes4. g4
  g8 | bes4 aes8 aes[ g] f | g4. ~ g4
  g16[ aes] | bes8[ a] bes ees4 c8 | bes4. g4
  g8 | bes4 aes8 aes( g) f | ees4. ~ ees4
  g8 | g4 f8 f( g) aes | c4. bes4
  bes8 | bes( a) bes d4 c8 | bes4. ~ bes4
  aes8 | g g g bes4 ees,8 | c'4( d8) \tb ees4 \ta
  c8 | bes aes g g4 f8 | ees4. ~ ees4 r8 |

  << s^\markup { \small \caps "Refrain" }
  { g8 g g bes4 c8 | bes4. ~ bes4 r8 } >>
  g8 g g bes4 g8 | f4. ~ f4 r8 |
  g g g bes4 ees,8 | c'4( d8) \tb ees4 \ta
  c8 | bes aes g g4 f8 | ees4. ~ ees4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees8 | ees ees ees g4 aes8 | g4. ees4
  ees8 | g4 f8 f[ ees] d | ees4. ~ ees4
  ees8 | ees4 ees8 g4 aes8 | g4. ees4
  ees8 | ees4 ees8 d ~ d d | ees4. ~ ees4
  ees8 | ees4 d8 d( ees) f | aes4. g4
  g8 | f ~ f f f4 ees8 | d4. ~ d4
  d8 | ees ees ees ees4 ees8 | ees4. ees4
  ees8 | ees ees ees ees4 d8 | ees4. ~ ees4 r8 |

  ees8 ees ees g4 aes8 | g4. ~ g4 r8 |
  ees8 ees ees g4 ees8 | d4. ~ d4 r8 |
  ees ees ees ees4 ees8 | ees4. ees4
  ees8 | ees ees ees ees4 d8 | ees4. ~ ees4

}
}

notesTenor = {
\global
\relative a {

  ees16[ f] | g8 fis g bes4 ees8 | ees4. bes4
  bes8 | bes4 bes8 bes4 bes8 | bes4. ~ bes4
  ees,16[ f] | g8[ fis] g bes4 ees8 | ees4. bes4
  bes8 | g4 c8 c( bes) aes | g4. ~ g4
  bes8 | bes4 bes8 bes ~ bes d | ees4. ees4
  c8 | d( c) d bes4 a8 | bes4. ~ bes4
  bes8 | bes bes bes g4 g8 | aes4( bes8) c4
  aes8 | g c bes bes4 aes8 | g4. ~ g4 r8 |

  bes8 bes bes g4 g8 | ees'4. ~ ees4 r8 |
  bes8 bes bes ees4 bes8 | bes4. ~ bes4 r8 |
  bes bes bes g4 g8 | aes4( bes8) c4
  aes8 | g c bes bes4 aes8 | g4. ~ g4

}
}

notesBass = {
\global
\relative f {

  ees16[ f] | ees8 ees ees ees4 ees8 | ees4. ees4
  ees8 | bes4 bes8 bes4 bes8 | ees4. ~ ees4
  ees16[ f] | ees4 ees8 ees4 ees8 | ees4. ees4
  ees8 | bes4 bes8 bes ~ bes bes | ees4. ~ ees4
  ees8 | bes4 bes8 bes ~ bes bes | ees4. ees4
  ees8 | f ~ f f f4 f8 | bes,4. ~ bes4
  bes8 | ees ees ees ees4 ees8 | aes,4. aes4
  aes8 | bes bes bes bes4 bes8 | ees4. ~ ees4 r8 |

  ees8 ees ees ees4 ees8 | ees4. ~ ees4 r8 |
  ees8 ees ees ees4 ees8 | bes4. ~ bes4 r8 |
  ees ees ees ees4 ees8 | aes,4. aes4
  aes8 | bes bes bes bes4 bes8 | ees4. ~ ees4

}
}

Refrain = \lyricmode {

What shall the an -- swer be? \bar "."
What shall the an -- swer be? \bar "." \break
What will you do with Je -- sus? \bar "."
Oh, what shall the an -- swer be? \bar "." \break

}

wordsA = \lyricmode {
\set stanza = "1."

Oh, what will you do with Je -- sus? \bar "."
The call comes low and sweet; \bar "." \break
And ten -- der -- ly He bids you \bar "."
Your bur -- dens { \mon } lay at { \moff } His feet; \bar "." \break
O soul, so sad and wear -- y, \bar "."
That sweet voice speaks to thee: \bar "." \break
Then what will you do with Je -- sus? \bar "."
Oh, what shall the an -- swer be? \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Oh, what will you do with Je -- sus?
The call comes low and clear;
The sol -- emn words are sound -- ing
In ev -- ’ry list -- ’ning ear;
Im -- mor -- tal { \mon } life’s in { \moff } the ques -- tion,
And { \mon } joy thro’ { \moff } e -- ter -- ni -- ty:
Then what will you do with Je -- sus?
Oh, what shall the an -- swer be?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Oh, think of the King of Glo -- ry–
From heav’n to earth come down;
His life so pure and ho -- ly;
His death, His cross, His crown;
Of His Di -- vine com -- pas -- sion,
His sac -- ri -- fice for thee:
Then what will you do with Je -- sus?
Oh, what shall the an -- swer be?

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
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
