\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG102.ily"
}

\header{
  %gospel
  hymnnumber = "102"
  title = "Life at Best Is Very Brief"
  tunename = "Meet Me There" % see https://hymnary.org/tune/on_the_happy_golden_shore_kirkpatrick
  meter = "P. M. with Refrain" % or 7. 7. 7. 3. with Refrain
  poet = "" % see https://hymnary.org/text/life_at_best_is_very_brief
  composer = "William J. Kirkpatrick" % see https://hymnary.org/tune/on_the_happy_golden_shore_kirkpatrick
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }
marksegno = { \mark \markup { \musicglyph #"scripts.segno" } }

patternAAds = { c8. c16 c8. c16 c4 }
patternAA = { \ta c8. c16 | \patternAAds }
patternABds = { \ta c8. c16 c8. c16 c16[ c8.] }
patternABdsF = { \ta c8. c16 c8. c16 c16[ \tb c8.] \ta }
patternAB = { \ta c8. c16 \patternABds }
patternABF = { \ta c8. c16 \patternABdsF }
patternACds = { c8. c16 c8. c16 c4 }
patternAC = { \ta c8. c16 | \patternACds }

patternBA = { \ta c8. c16 | c2. }

patternCA = { \ta c8. c16 | c8. c16 c8. c16 c16 c8. }

lyricsInvis = { \override LyricText.stencil = ##f \override LyricHyphen.stencil = ##f }
lyricsVis = { \revert LyricText.stencil \revert LyricHyphen.stencil }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees f | g g g g g }
  \changePitch \patternAA { ees g | bes bes bes bes bes }
  \changePitch \patternAB { bes bes | c c c c c ees }
  \changePitch \patternBA { bes g | f }

  \changePitch \patternAA { g aes | bes bes bes bes bes}
  \changePitch \patternABF { bes bes | c c c c c ees \fermata }
  \changePitch \patternAB { ees, f | g g g g g bes }
  \changePitch \patternBA { f g | ees }

  << s^\markup { \small \caps "Refrain" }
  { \stemUp bes'8. bes16 | bes2. \tuplet 3/2 { c8[ bes] g } | ees'2. } >>
  \changePitch \patternCA { d c | bes bes bes bes c bes }
  bes8. g16 | f2.
  \changePitch \patternAA { g aes | bes bes bes bes bes }
  bes8. bes16^\markup { \italic { Dal } \raise #1 \musicglyph #"scripts.segno" }

  \bar "|."

}
}

notesSopranoDS = {
\relative c'' {
  \changePitch \patternABdsF { c c c c c ees \fermata }
  \changePitch \patternAB { ees, f | g g g g g bes }
  \changePitch \patternBA { f g | ees }
}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { bes bes | ees ees ees ees ees }
  \changePitch \patternAA { bes ees | g g g g g }
  \changePitch \patternAA { ees ees | ees ees ees ees ees }
  \changePitch \patternBA { ees ees | d }

  \changePitch \patternAA { ees f | g g g g g }
  \changePitch \patternAA { ees ees | ees ees ees ees ees }
  \changePitch \patternAA { ees d | ees ees ees ees d }
  \changePitch \patternBA { d bes | bes }

  r4 | r4 g'8. g16 g4 r4 | r4 g8. g16 g4
  \changePitch \patternCA { bes aes | g g g g aes g }
  g8. ees16 | d2.
  \changePitch \patternAA { ees f | g g g g g }
  ees8. ees16

}
}

restsAlto = {

  \repeat unfold 32 \skip 4
  r4 | r4
  \skip 4 \skip 4
  r4 | r4

}

notesAltoDS = {
\relative e' {
  \changePitch \patternAAds { ees ees ees ees ees }
  \changePitch \patternAA { ees d | ees ees ees ees d }
  \changePitch \patternBA { d bes | bes }
}
}

notesAltoSecond = {
\autoBeamOff
\relative e' {
\override NoteHead.font-size = #-4 {
\repeat unfold 29 \skip 4
bes4 c8. c16 bes4
}
}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g aes | bes bes bes bes bes }
  \changePitch \patternAA { g bes | ees ees ees ees ees }
  \changePitch \patternAA { g, g | aes aes aes aes c }
  \changePitch \patternBA { ees bes | bes }

  \changePitch \patternAA { bes bes | ees ees ees ees bes }
  \changePitch \patternAA { g g | aes aes aes aes c }
  \changePitch \patternAA { bes bes | bes bes bes g f }
  \changePitch \patternBA { aes aes | g }

  r4 | r4 ees'8. ees16 ees4 r4 | r4 bes8. bes16 bes4
  \changePitch \patternCA { bes bes | ees ees ees ees ees ees }
  bes8. bes16 | bes4 bes8. bes16 bes4
  \changePitch \patternAA { bes bes | ees ees ees ees bes }
  g8. g16

}
}

notesTenorDS = {
\relative a {
  \changePitch \patternAAds { aes aes aes aes c }
  \changePitch \patternAA { bes bes | bes bes bes g f }
  \changePitch \patternBA { aes aes | g }
}
}

notesTenorSecond = {
\autoBeamOff
\relative a {
\override NoteHead.font-size = #-4 {
\repeat unfold 29 \skip 4
g4 aes8. aes16 g4
}
}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees ees | ees ees ees ees ees }
  \changePitch \patternAA { ees ees | ees ees ees ees ees }
  \changePitch \patternAA { ees ees | aes aes aes aes aes }
  \changePitch \patternBA { g ees | bes }

  \changePitch \patternAA { ees ees | ees ees ees ees ees }
  \changePitch \patternAC { ees ees | aes aes aes aes aes_\fermata }
  \changePitch \patternAA { g f | ees ees ees ees bes }
  \changePitch \patternBA { bes bes | ees }

  r4 | r4 ees8. ees16 ees4 r4 | r4 ees8. ees16 ees4
  \changePitch \patternCA { ees ees | ees ees ees ees ees ees }
  ees8. ees16 | bes4 bes'8. bes16 bes8[ aes8]
  \changePitch \patternAA { g f | ees ees ees ees ees }
  ees8. ees16

}
}

notesBassDS = {
\relative f {
  \changePitch \patternACds { aes aes aes aes aes }
  \changePitch \patternAA { g f | ees ees ees ees bes }
  \changePitch \patternBA { bes bes | ees }
}
}

notesBassSecond = {
\autoBeamOff
\relative f, {
\override NoteHead.font-size = #-4 {
\repeat unfold 9 \skip 4
aes8. aes16 aes8. aes16
\repeat unfold 10 \skip 4
aes8. aes16 aes8. aes16
}
}
}

Refrain = \lyricmode {

%{HIDE>%} Be in time! be in time! \bar "." %{<HIDE%}
%LYRICS Be in time ... be in time ... \bar "."
While the voice of Je -- sus calls you, \bar "."
Be in time! \bar "."
If in sin you lon -- ger wait, \bar "."
You may %LYRICS find no open gate, % \bar "."
%LYRICS And your cry be just too late,
%LYRICS Be in time!

}

underWords = \lyricmode {

{ \repeat unfold 48 { \skip 4 } }
Be in time! Be in time!
{ \repeat unfold 11 { \skip 4 } }
Be in time!

}

segnoWords = \lyricmode {

{ \repeat unfold 32 { \skip 4 } }
\override LyricText #'font-shape = #'italic
D.S. find no o -- pen gate,
And your cry be just too late,
Be in time!

}

wordsA = \lyricmode {
\set stanza = "1."

Life at best is ver -- y brief, \bar "."
Like the fall -- ing of a leaf, \bar "."
Like the bind -- ing of a sheaf: \bar "."
Be in time! \bar "."
Fleet -- ing days are tell -- ing fast \bar "."
That the %{HIDE>%} \marksegno %{<HIDE%} die will soon be cast, \bar "."
And the fa -- tal line be past, \bar "."
Be in time! \bar "." \break % for both eogsized and letter, work around issues with vertical location of chorus lyrics

}

wordsB = \lyricmode {
\set stanza = "2."

Fair -- est flow -- ers soon de -- cay,
Youth and beau -- ty pass a -- way;
Oh, you have not long to stay:
Be in time!
While God’s Spir -- it bids you come,
Sin -- ner, do not lon -- ger roam,
Lest you seal your hope -- less doom,
Be in time!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Time is glid -- ing swift -- ly by,
Death and judg -- ment both draw nigh,
To the arms of Je -- sus fly:
Be in time!
Oh! I pray you count the cost,
Ere the fa -- tal line be crossed,
And your Christ -- less soul be lost,
Be in time!

}

wordsD = \lyricmode {
\set stanza = "4."

Sin -- ner, heed the warn -- ing voice,
Make the Lord your hap -- py choice,
Then all heav -- en will re -- joice:
Be in time!
Come from dark -- ness in -- to light,
From the way that seem -- eth right;
Come and start for heaven to -- night,
Be in time!

}

music = \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice = altosRests { \voiceTwo << \restsAlto >> }
      \context Voice = altosSecond { \voiceFour << \notesAltoSecond >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \new Lyrics \with { alignAboveContext = men } \lyricsto sopranos \segnoWords
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context Voice = tenorsSecond { \voiceOne << \notesTenorSecond >> }
      \context Voice = bassesSecond { \voiceTwo << \notesBassSecond >> }
    >>
    \new Lyrics \with { alignAboveContext = men } \lyricsto tenors \underWords
  >>

musicDS = \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne { \notesSoprano \notesSopranoDS } }
      \context Voice  = altos { \voiceTwo { \notesAlto \notesAltoDS } }
      \context Voice  = altosSecond { \voiceFour << \notesAltoSecond >> }
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \context Voice  = tenors { \voiceOne { \notesTenor \notesTenorDS } }
      \context Voice  = tenorsSecond { \voiceThree << \notesTenorSecond >> }
      \context Voice  = basses { \voiceTwo { \notesBass \notesBassDS } }
      \context Voice  = bassesSecond { \voiceFour << \notesBassSecond >> }
    >>
  >>

\score {
  \music
  \layout {
    \include "common/layout.ily"
  }
}

\include "score-EOG102.ily"

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
