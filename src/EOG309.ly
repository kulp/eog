\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG309.ily"
}

\header{
  %children
  hymnnumber = "309"
  title = "I Think When I Read That Sweet Story"
  tunename = "Sweet Story"
  meter = "P. M."
  poet = "Jemima Thompson Luke" % see https://hymnary.org/text/i_think_when_i_read_that_sweet_story_luk
  composer = "Arr. by William B. Bradbury" % see https://hymnary.org/tune/sweet_story_bradbury
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees8.[ f16] | g4 g8 g g[ f] g aes | c4 bes8. bes16 bes4
  g8.[ f16] | f4 d8 ees f[ d'] c a | bes2 r4
  g8. aes16 | bes8[ ees] d c bes4 g8. aes16 | bes8[ ees] d c bes4
  bes8. bes16 | c4 bes8 g bes[ aes] g f | ees2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 | ees ees8 ees ees[ d] ees f | aes4 g8. g16 g4
  ees8.[ d16] | d4 bes8 c d8[ f] ees c | d2 r4
  ees8. f16 | g8[ c] bes aes g4 ees8. f16 | g8[ c] bes aes g4
  g8. g16 | aes4 g8 ees g[ f] ees d | ees2.

}
}

notesTenor = {
\global
\relative a {

  g8.[ aes16] | bes4 bes8 bes bes4 bes8 bes | ees4 ees8. ees16 bes4
  bes4 | bes f8 f bes4 a8 f | bes2 r4
  bes8. bes16 | ees4 ees8 ees ees4 bes8. bes16 | ees4 ees8 ees ees4
  ees8. ees16 | ees4 ees8 bes bes4 bes8 aes | g2.

}
}

notesBass = {
\global
\relative f {

  ees4 | ees ees8 ees ees4 ees8 ees | ees4 ees8. ees16 ees4
  ees8.[ bes16] | bes4 bes8 bes bes4 f'8 f | bes,2 r4
  ees8. ees16 | ees4 aes8 aes ees4 ees8. ees16 | ees4 aes8 aes ees4
  ees8. ees16 | ees4 ees8 ees bes4 bes8 bes | ees2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

I think when I read that sweet sto -- ry of old, \bar "."
When Je -- sus was here a -- mong men, \bar "."
How He called lit -- tle chil -- dren as lambs to His fold, \bar "."
I should like to have been with Him then. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I wish that His hands had been placed on my head,
\mon That His \moff arms had been thrown a -- round me,
And that I might have seen His kind look when He said,
“Let the lit -- tle ones come un -- to Me.”

}

wordsC = \lyricmode {
\set stanza = "3."

Yet still to His pres -- ence in prayer I may go,
I know I may trust in His love;
And if thus I will ear -- nest -- ly seek Him be -- low,
I shall see Him and hear Him a -- bove

}

wordsD = \lyricmode {
\set stanza = "4."

\mon In that \moff beau -- ti -- ful place He has gone to pre -- pare
For all who are washed and for -- giv’n;
And _ man -- y dear chil -- dren are gath -- er -- ing there,
“For of such is the king -- dom of heaven.”

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

\noPageBreak \markup { \fill-line { \line { Alternate tune: No. 25. } } }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
