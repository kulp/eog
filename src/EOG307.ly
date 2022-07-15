\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG307.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 40." } }
}

\header{
  %children
  hymnnumber = "307"
  title = "How Many Children Say" % not found at hymnary.org
  tunename = "Lischer"
  meter = "6. 6. 6. 6. 8. 8. 8." % original has 6. 6. 6. 6. 8. 8.
  poet = ""
  composer = "Friedrich Schneider, arr. by Lowell Mason" % see https://hymnary.org/tune/lischer_schneider
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d4 | g4. a8 b4 c8[ e] | d2.
  g,8[ b] | d4 d c d8[ c] | b2. \eogbreak
  d,4 | g4. a8 b4 c8[ e] | d2.
  g,8[ b] | d4 d c d8[ c] | b2. \eogbreak

  g8[ b] | d4 d d e8[ d] | d[ c] c[ b] c4
  d4 | b b b8[ d] c[ b] | a[ g] fis[ g] a4
  g8[ a] | b2 ~ b8[ d] c[ e] | d2. g,8[ a] | b2 a | g2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | d4. d8 d[ g] g4 | g2.
  g4 | g g fis fis8[ a] | g2.
  d4 | d4. d8 d[ g] g4 | g2.
  g4 | g g fis fis8[ a] | g2.

  g4 | g g g g | fis fis fis
  fis4 | g g g8[ b] a[ g] | fis[ e] d[ e] fis4
  b,8[ d] | g2 ~ g8[ b] a[ c] | b2. g4 | g2 fis4( d) | d2.

}
}

notesTenor = {
\global
\relative a, {

  d4 | b'4. c8 d4 e8[ c] | b2.
  b8[ d] | b4 b a a8[ d] | d2.
  d,4 | b'4. c8 d4 e8[ c] | b2.
  b8[ d] | b4 b a a8[ d] | d2.

  b8[ d] | b4 b b c8[ b] | b[ a] a[ gis] a4
  a4 | g g g g | d' d d
  r4 | r1 | r8 b8 b b b4 d8[ e] | d2 c | b2.

}
}

notesBass = {
\global
\relative f {

  d4 | g4. g8 g4 g | g2.
  g4 | g g, d' d | g,2.
  d'4 | g4. g8 g4 g | g2.
  g4 | g g, d' d | g,2.

  g'4 | g g g g | d d d
  d4 | g g g g | d d d
  r4 | r1 | r8 g g g g4 b,8[ c] | d2 d | <g g,>2.

}
}

notesAlign = {
\global
\relative e' {

  c4 | c4. c8 c[ c] c[ c] | c2.
  c4 | c c c c8[ c] | c2.
  c4 | c4. c8 c[ c] c[ c] | c2.
  c4 | c c c c8[ c] | c2.

  c4 | c c c c8[ c] | c[ c] c[ c] c4
  c4 | c c c8[ c] c[ c] | c[ c] c[ c] c4
  c,8[ c] | c2 ~ c8[ c] c[ c] | c2. c4 | c2 c4( c) | c2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

How man -- y chil -- dren say, \bar "."
“I’d like to go to heaven,” \bar "."
Yet nev -- er think that they \bar "."
Must have their sins for -- giv’n, \bar "."
Be -- fore they can in glo -- ry be, \bar "."
%{HIDE>%} Or Je -- sus Christ in glo -- ry see, %{<HIDE%} \bar "."
Or Je -- sus Christ in glo -- ry see. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

None can to glo -- ry go,
Or dwell with God a -- bove,
But they who Je -- sus know,
And trust the Sav -- iour’s love;
The ho -- ly words of truth de -- clare
%{HIDE>%} No oth -- er way of en -- trance there, %{<HIDE%}
No oth -- er way of en -- trance there.

}

wordsC = \lyricmode {
\set stanza = "3."

But now this “liv -- ing way”
To all is o -- pen free;
And ru -- ined sin -- ners may
Go in and hap -- py be—
May have their sins thro’ Christ for -- giv’n,
%{HIDE>%} The on -- ly way to en -- ter heaven, %{<HIDE%}
The on -- ly way to en -- ter heaven.

}

underWords = \lyricmode {
\override LyricText.font-size = #-2
\override LyricHyphen.thickness = #0.7

\repeat unfold 40 \skip 4
Or Je -- sus Christ in glo -- ry see.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = aligned { \voiceOne << \notesAlign >> }
      \context Lyrics = one   \lyricsto aligned \wordsA
      \context Lyrics = two   \lyricsto aligned \wordsB
      \context Lyrics = three \lyricsto aligned \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context Lyrics = four \with { alignAboveContext = men } \lyricsto tenors \underWords
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
