\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last = #(cond (is-eogsized #t) (#t #f))
  ragged-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  %children
  hymnnumber = "302"
  title = "The Bible Tells Us Jesus Came"
  tunename = "Clark"
  meter = "C. M."
  poet = "Clark"
  composer = "Arr. by R. B. Robertson"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=80
  \key bes \major
  \partial 8
  \autoBeamOff
}

wordsE = \markuplist {

\line { The Bible tells us He will come }
\line { To Take His saints away, }
\line { To dwell with Him in His blest home }
\line { Through everlasting day. }

}

wordsF = \markuplist {

\line { The Bible tells us He will reign }
\line { O’er all the earth ere long; }
\line { When heaven and earth shall wake the strain }
\line { Of an eternal song. }

}

wordsG = \markuplist {

\line { The Bible tells us \italic all may come, }
\line { And drink at mercy’s stream; }
\line { That Jesus soon will share this home }
\line { With all who trust in Him. }

}

extraVersesMarkup = \markup { \column {
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
  \line{ \bold 7 \column { \wordsG } }
} }

barlineMarkup = \markup { \whiteout
\with-dimensions #'(-1 . -1) #'(0 . 0)
\raise #5 \line { \hspace #5 \extraVersesMarkup } }

customBarLine = {
  \override Staff.BarLine.stencil =
  #(lambda (grob)
     (ly:stencil-combine-at-edge
      (ly:bar-line::print grob)
      X RIGHT
      (grob-interpret-markup grob barlineMarkup)
      0))
}

notesSoprano = {
\global
\relative c' {

  f8 | bes8. bes16 bes[ a] g[ a] | bes8 f d
  f8 | bes8. d16 c8 a | bes4.
  bes16[ c] | d8. d16 ees16[ d] c[ bes] | c8. d16 c8
  a16[ bes] | c8. c16 d16[ c] bes[ a] | bes4( f8)
  f8 | d'8. bes16 d16[ c] c[ a] | bes4.

  \override Score.BarLine.layer = 1
  \onlyEogMusic \customBarLine

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d8 | f8. f16 ees16[ f] ees[ f] | d8 d d
  d8 | d8. f16 f8 ees | d4.
  d16[ ees] | f8. f16 g[ f] ees[ d] | ees8. f16 ees8
  c16[ d] | ees8. ees16 f[ ees] d[ c] | d4.
  d8 | f8. d16 f[ ees] ees[ c] | d4.

}
}

notesTenor = {
\global
\relative a {

  f8 | d'8. d16 c8 ees | d8 bes bes
  f8 | f8. bes16 a8 c | bes4.
  bes8 | bes8. bes16 bes8 bes | a8. a16 a8
  f8 | a8. a16 f8 f | bes4.
  bes8 | bes8. bes16 bes[ f] f8 | f4.

}
}

notesBass = {
\global
\relative f, {

  bes8 | bes8. d16 f8 f | bes,8 bes bes
  bes8 | bes8. bes16 f'8 f | bes,4.
  bes8 | bes8. bes16 bes8 bes | f'8. f16 f8
  f8 | f8. f16 f8 f | bes,4.
  bes8 | bes8. d16 f8 f, | bes4.

}
}

wordsA = \lyricmode {
\set stanza = "1."

The Bi -- ble tells us Je -- sus came \bar "."
From glo -- ry bright and fair– \bar "." \eogpagebreak
God’s per -- fect, sin -- less, spot -- less Lamb– \bar "."
%{HIDE>%} His mer -- cy to de -- clare, \bar "." %{<HIDE%} \eogbreak
His mer -- cy to de -- clare. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The Bi -- ble tells us Je -- sus died
A sac -- ri -- fice for sin:
The gates of heav’n to o -- pen wide,
%{HIDE>%} That we may en -- ter in, %{<HIDE%} \eogbreak
That we may en -- ter in.

}

wordsC = \lyricmode {
\set stanza = "3."

The Bi -- ble tells us Je -- sus rose,
And left the si -- lent grave,
Tri -- um -- phant o -- ver all His foes,
%{HIDE>%} The might -- y One to save, %{<HIDE%} \eogbreak
The might -- y One to save.

}

wordsD = \lyricmode {
\set stanza = "4."

The Bi -- ble tells us Je -- sus lives
A -- gain up -- on the throne:
The bless -- ed proof the Fa -- ther gives
%{HIDE>%} That mer -- cy’s work is done, %{<HIDE%} \eogbreak
That mer -- cy’s work is done.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

nullMarkup = \markup { }
wrappedMarkup = \markup { \fill-line { \extraVersesMarkup } }
\markup { \onlyEogMarkup \nullMarkup \wrappedMarkup }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
