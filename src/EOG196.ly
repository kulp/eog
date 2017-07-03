\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 155." } }
}

\header{
  hymnnumber = "196"
  title = "The Lord of Life Is Risen"
  tunename = "Ostrava"
  meter = "7. 6. 7. 6. D."
  poet = "G. W. Frazer"
  composer = "Moravian Melody"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered % original has `c`
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key d \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  a'4 | d4. a8 g[ fis] e[ d] | a'4 a r4
  g4 | g8[ a] g[ e] d4 cis | d2. \eogbreak
  a'4 | d4. a8 g[ fis] e[ d] | a'4 a r4
  g4 | g8[ a] g[ e] d4 cis | d2. \eogbreak

  d4 | e d g fis | fis e r
  e4 | fis4. fis8 d'4 b8[ gis] | a2. \eogbreak

  a4 | d4. a8 g[ fis] e[ d] | a'4 a r4
  g4 | g8[ a] g[ e] d4 cis | d2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e {

  a'4 | fis4. fis8 d4 cis8[ d] | d4 cis r
  a4 | a8[ c] b4 a a | a2.
  a'4 | fis4. fis8 d4 cis8[ d] | d4 cis r
  a4 | a8[ c] b4 a a | a2.

  d4 | cis d cis d | d cis r
  cis4 | d4. e8 d4 d | cis2.
  a'4 | fis4. fis8 d4 cis8[ d] | d4 cis r
  a4 | a8[ c] b4 a a | a2.

}
}

notesTenor = {
\global
\relative a {

  a4 | a4. a8 b8[ a] g[ fis] | e4 e r
  e4 | d d8[ g] fis4 e8[ g] | fis2.
  a4 | a4. a8 b8[ a] g[ fis] | e4 e r
  e4 | d d8[ g] fis4 e8[ g] | fis2.

  a4 | a a a a | a a r
  a4 | a4. ais8 b4 gis8[ b] | a2.
  a4 | a4. a8 b8[ a] g[ fis] | e4 e r
  e4 | d d8[ g] fis4 e8[ g] | fis2.

}
}

notesBass = {
\global
\relative f, {

  a'4 | d,4. d8 d4 d | a4 a r
  cis4 | d g, a a | d2.
  a'4 | d,4. d8 d4 d | a4 a r
  cis4 | d g, a a | d2.

  fis4 | g fis e d | a a r
  a4 | d4. cis8 b4 e | a,2.
  a'4 | d,4. d8 d4 d | a4 a r
  cis4 | d g, a a | d2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

The Lord of life is ris -- en, \bar "."
Has left the dark -- some grave, \bar "."
And, death by Him a -- bol -- ished, \bar "."
He’s might -- y now to save; \bar "."
And we with Him are ris -- en, \bar "."
The fruit of all His toil, \bar "."
The first -- fruits of His har -- vest, \bar "."
His suf -- fering’s rich -- est spoil. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The Lord of life is seat -- ed
At God’s right hand on high,
God’s just and right -- eous an -- swer
To grace which stooped to die;
In Him we too are seat -- ed,
Oh bless -- ed, won -- drous grace!
Ac -- cept -- ed and be -- lov -- ed,
In Him, in son -- ship’s place.

}

wordsC = \lyricmode {
\set stanza = "3."

The Lord of life is com -- ing
To per -- fect all His grace;
To take His blood -- bought peo -- ple
To fill their heaven -- ly place;
Oh, with what joy as -- cend -- ing
We’ll meet Him in the air,
To dwell with Him in glo -- ry
And His blest im -- age bear.

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
