\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG242.ily"
}

\header{
  %gospel
  hymnnumber = "242"
  title = "My God, I Have Found"
  tunename = "Revive Us Again"
  meter = "P. M."
  poet = "J. Denham Smith" % see https://hymnary.org/text/my_god_i_have_found_the_thrice_blessed_g
  composer = "John J. Husband" % see https://hymnary.org/tune/revive_us_again_husband
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d4 | g g g | g2
  g8[ a] | b4 b b | b2
  g8[ b] | d4 d d | e d b | b a a | a2

  \eogbreak
  << s^\markup { \small \caps "Refrain" }
  { d8. d16 | e4 d b8. a16 | g4 g } >>
  d'8 d | e4 d b | a2
  d8. d16 | e4 d b8. a16 | g4 g
  b4 | c b a | g2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | d d d | d2
  d4 | d d d | d2
  d4 | g g g | g g d | g fis fis | fis2

  g8. g16 | g4 g g8. d16 | d4 d
  g8 g | g4 g g | fis2
  g8. g16 | g4 g g8. d16 | d4 d
  d4 | e d d | d2

}
}

notesTenor = {
\global
\relative a {

  b4 | b b b | b2
  d8[ c] | b4 g g | g2
  b4 | b b b | c b g | d' d d | d2

  b8. b16 | c4 b d8. c16 | b4 b
  b8 b | c4 b d | d2
  b8. b16 | c4 b d8. c16 | b4 b
  g4 | g g c4 | b2

}
}

notesBass = {
\global
\relative f {

  g4 | g d b | g2
  b'8[ a] | g4 d b | g2
  g'4 | g g g | g g g | d d d | d2

  g,8. g16 | c4 g' g8. g16 | g4 g
  g8 g | c,4 g' g | d2
  g,8. g16 | c4 g' g8. g16 | g4 g
  g4 | c, d d | g,2

}
}

Refrain = \lyricmode {

Hal -- le -- lu -- jah! Thine the glo -- ry! \bar "."
Hal -- le -- lu -- jah! A -- men! \bar "."
Hal -- le -- lu -- jah! Thine the glo -- ry! \bar "."
A -- men and a -- men! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

My God, I have found \bar "."
The thrice -- bless -- ed ground, \bar "."
Where life, and where joy, and true com -- fort a -- bound. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

’Tis found in the blood
Of Him who once stood
My Ref -- uge and Safe -- ty, my Sure -- ty with God.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

He bore on the tree
The sen -- tence for me,
And now both the Sure -- ty and debt -- or are free.

}

wordsD = \markuplist {

\line { Accepted I am }
\line { In the once-offered Lamb; }
\line { ’Twas God who Himself had devisèd the plan. }

}

wordsE = \markuplist {

\line { And though here below, }
\line { Mid sorrow and woe, }
\line { My place is in heaven with Jesus I know. }

}

wordsF = \markuplist {

\line { And this I shall find, }
\line { For such is His mind, }
\line { He’ll not be in glory and leave me behind. }

}

wordsG = \markuplist {

\line { For soon He will come }
\line { And take me safe home, }
\line { And make me to sit with Himself on His throne. }

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

\noPageBreak

\markup { \fill-line { \vcenter \column {
  \vspace #1
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
  \line{ \bold 7 \column { \wordsG } }
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
