\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  \include "override/override-EOG152.ily"
}

\header{
  hymnnumber = "152"
  title = "Brightness of the Eternal Glory"
  tunename = "Hamilton" % not found at hymnary.org
  meter = "8. 7. 8. 7. 7." % original has 8. 7. 8. 7.
  poet = "Robert Robinson" % see https://hymnary.org/text/brightness_of_the_eternal_glory_shall_th
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes2. bes4 bes bes c bes | bes1 aes |
  aes2. g4 f g aes bes | g1 ~ g |
  ees'2. d4 c bes aes g | f1 c' |
  bes2. c4 bes bes c d | ees2.( d4 c1) |
  bes2. c4 bes bes aes d, | ees\breve

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g2. g4 g g aes g | g1 f |
  f2. ees4 d ees f g | ees1 ~ ees |
  g2. g4 g f e e | f1 f2( d) |
  ees2. ees4 ees ees ees f | ees2.( ees4  ees1) |
  g2. aes4 g g f bes, | bes\breve

}
}

notesTenor = {
\global
\relative a {

  bes2. bes4 bes bes ees ees | d1 d |
  bes2. bes4 bes bes bes bes | bes1 ~ bes |
  ees2. f4 ees des c c | c1 d |
  bes2. aes4 bes bes beses aes | g2( c4 bes aes1) |
  bes2. ees4 des des c aes | g\breve

}
}

notesBass = {
\global
\relative f {

  ees2. ees4 ees ees ees ees | bes'1 bes |
  bes2. bes4 bes bes bes, bes | ees1 ~ ees |
  c2. c4 c c c bes | aes1 aes' |
  g2. aes4 g g ges f | c2.( g'4 aes1) |
  ees2. ees4 ees e f bes, | ees\breve

}
}

wordsA = \lyricmode {
\set stanza = "1."

Bright -- ness of th’e -- ter -- nal glo -- ry, \bar "."
Shall Thy praise un -- ut -- tered lie? \bar "."
Who would hush the heaven -- sent sto -- ry \bar "."
%{HIDE>%}Of the Lamb who came to die, __ \bar "." %{<HIDE%}
Of the Lamb who came to die? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Came from God -- head’s full -- est glo -- ry
Down to Cal -- vary’s depth of woe, 
Now on high we bow be -- fore Thee;
%{HIDE>%}Streams of prais -- es cease -- less flow. __ %{<HIDE%}
Streams of prais -- es cease -- less flow.

}

wordsC = \lyricmode {
\set stanza = "3."

Sing His blest tri -- um -- phant ris -- ing;
Sing Him on the Fa -- ther’s throne;
Sing— till heaven and earth sur -- pris -- ing,
%{HIDE>%}Reigns the Na -- za -- rene a -- lone. __ %{<HIDE%}
Reigns the Na -- za -- rene a -- lone.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto altos \wordsA
      \context Lyrics = two   \lyricsto altos \wordsB
      \context Lyrics = three \lyricsto altos \wordsC
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

\noPageBreak \markup { \fill-line { \line { Alternate tune: No. 2 in Supplement. } } }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
