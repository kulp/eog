\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG352.ily"
}

\header{
  %children
  hymnnumber = "352"
  title = "Oh, Won’t You Come to Jesus While You’re Young" % not found at hymnary.org
  markuptitle = \markup \center-column { "Oh, Won’t You Come to Jesus" "While You’re Young" \vspace #0.4 } % original has different line breaking
  tunename = ""
  meter = "P. M."
  poet = ""
  composer = "Alfred A. Graley" % see https://hymnary.org/tune/o_wont_you_be_a_christian_graley
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key aes \major
  \partial 8
  \autoBeamOff
}

patternA = { c8 | c8. c16 c8 c | c c c c | c2 ~ | c4 c8 }
patternB = { c8 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { ees | c' bes des c | c bes aes g | aes | aes r } \eogpagebreak
  \changePitch \patternA { ees | f g aes bes | c des ees c | bes | bes r } \eogbreak
  \changePitch \patternA { bes | c bes c des | ees c }
  \changePitch \patternB { c bes | aes aes g g | f f } \eogbreak
  \changePitch \patternB { aes f | ees aes aes c | c bes aes g | } aes2 ~ | aes4 r8 % original has extra bar lines that imply some notes might be 4 instead of 8

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { c | ees des f ees | ees des c bes | c | c r }
  \changePitch \patternA { c | des ees f g | aes bes c aes | g | g r }
  \changePitch \patternA { g | aes g aes bes | c aes }
  \changePitch \patternB { aes g | f f e e | f f }
  \changePitch \patternB { f des | ees ees c ees | ees des c bes | } c2 ~ | c4 r8

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { aes | aes aes aes aes | ees ees ees ees | aes, | aes r }
  \changePitch \patternA { aes | des des des des | c bes aes c | ees ~ ees r }
  \changePitch \patternA { ees | aes aes aes aes | aes aes }
  \changePitch \patternB { aes ees | f f c c | des des }
  \changePitch \patternB { des des | c c aes aes | ees' ees ees ees | } aes,2 ~ | aes4 r8

}
}

wordsA = \lyricmode {
\set stanza = "1."

Oh, won’t you come to Je -- sus while you’re young? \bar "."
Oh, won’t you come to Je -- sus while you’re young? \bar "."
Don’t think it will be bet -- ter \bar "."
To de -- lay it un -- til la -- ter, \bar "."
But re -- mem -- ber your Cre -- at -- or while you’re young. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Re -- mem -- ber, death may find you, while you’re young;
Re -- mem -- ber, death may find you, while you’re young;
For friends are oft -- en weep -- ing
And the stars their watch are keep -- ing
O’er the grass -- y graves where sleep -- ing lie the young.

}

wordsC = \lyricmode {
\set stanza = "3."

Oh, walk the path to glo -- ry while you’re young;
Oh, walk the path to glo -- ry while you’re young,
And Je -- sus will be -- friend you,
And from dan -- ger will de -- fend you,
And a peace di -- vine will send you while you’re young.

}

wordsD = \lyricmode {
\set stanza = "4."

Then won’t you come to Je -- sus while you’re young?
Then won’t you come to Je -- sus while you’re young?
Why from the fu -- ture bor -- row,
When ere comes an -- oth -- er mor -- row,
You may weep in end -- less sor -- row, while you’re young.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
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
      \context Voice = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
