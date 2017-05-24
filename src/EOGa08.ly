\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  markup-system-spacing.padding = 0
  markup-system-spacing.basic-distance = 0
  scoreTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \override #'(baseline-skip . 3.5)
      \column {
        \fill-line {
          \huge \larger \larger \bold {
            \concat { "  " \fromproperty #'header:hymnnumber }
            \mytitle
            \null
          }
        }
        \fill-line {
          % no lowering (to save vertical space)
          "Alternate tune for No. 376"
          \smaller \bold \mysubtitle
          \fromproperty #'header:composer
        }
      }
    }
  }
}

\header{
  hymnnumber = "8"
  title = "Now Have I Seen Thee and Found Thee"
  tunename = ""
  meter = "P. M."
  poet = "Henry Suso"
  composer = "J. R., 1885"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=126 }
tb = { \tempo 4=63  }

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
\relative c'' {

  g4 | g fis8 g bes4 g8( ees) | g4.( f8) ees4. \bar "."
  ees16 ~ ees | f4 e8( f) aes4 ~ aes8 c8 | bes2. \bar "."
  bes4 | bes aes8 bes c4 ~ c8 g | bes4.( aes8) g4. \bar "."
  f16 ~ f | ees4 bes8( ees) g4. f8 | ees2. \bar "."

  g4 | ees'4 d8 c d4 b8( g) | d'2( c4) \bar "."
  c4 | bes4 aes8 g bes4( aes8) g | f2. \bar "."
  fis8 ~ fis | g4 fis8 g bes4 g8( ees) | g4.( f8) ees4 \bar "."
  e8 ~ e | f4 aes8 c bes4 d,8 ~ d | ees2. \bar "|."

}
}

notesAlto = {
\global
% TODO get NoteHead size to work with \partcombine for left hand
%\override NoteHead.font-size = #-4
\relative e' {

  g4 | ees2 <ees bes> | ees4.( d8) bes4.
  ees8 | d4 cis8[ d] f4. aes8 | g2.
  g4 | <g ees>2 <g e> | g4.( f8) c4. ~
  c8 | bes4 bes ees4. d8 | bes2.

  g'4 | <g ees>2 <g f> | <g f> ees4 ~
  ees4 | f4. ees8 ees4 d8 ees | d2.
  fis4 | ees2 ees | ees4.( d8) c4 ~
  c4 | c4. ees8 d4 bes4 | bes2.

}
}

notesTenor = {
\global
%\override NoteHead.font-size = #-4
\relative a {

  r4 | bes2 g | bes4.( aes8) g4.
  r8 | bes2 bes | bes2.
  bes4 | bes2 g4. c8 | c2 aes4. ~
  aes8 | g2 bes4. aes8 | g2.

  r4 | <c g>2 b4 d8[ b] | b2 <c g>4 ~
  <c g>4 | bes4. bes8 bes4 bes8 bes | bes2.
  r4 | bes2 bes | bes4. aes8 g4 ~
  g4 | f4. <aes f>8 bes4 aes | g2.
}
}

notesBass = {
\global
%\override NoteHead.font-size = #-4
\relative f {

  r4 | ees2 g, | bes ees4.
  r8 | bes2 d4. bes8 | ees2.
  ees4 | des2 c | f aes,4. ~
  aes8 | bes2 bes | ees2.

  r4 | c2 g' | g c,4 ~
  c4 | d4. ees8 g4 f8 ees | bes2.
  r4 | ees2 g4 ees8[ g] | bes,4. b8 c4
  bes4 | aes4( f8) f8 bes2 | ees2.
}
}

wordsA = \lyricmode {
\set stanza = "1."

_ Now have I seen { \mon } Thee and { \moff } found Thee, \bar "."
For Thou hast found Thy sheep, \bar "."
I fled, but Thy love would fol -- low, \bar "."
I strayed { \mon } but Thy { \moff } grace would keep, \bar "." % by contrast, EOG376 has "love" for "grace"
Thou’st grant -- ed my heart’s de -- sire, \bar "."
{ \mon } Most bless’d of the bless -- ed is he, { \moff } \bar "."
Who { \mon } find -- eth no rest and no { \moff } sweet -- ness, \bar "."
{ \mon } Till he { \moff } rest -- eth, O Lord, in Thee. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

To Thee, Lord, my heart un -- fold -- eth,
{ \mon } As the { \moff } rose { \mon } to the { \moff } gold -- en sun;
To Thee, Lord, mine arms are cling -- ing,
Th’_e -- ter -- nal joy’s be -- gun,
For -- ev -- er, thro’ end -- less { \mon } a -- ges, { \moff }
{ \mon } Thy cross and Thy sor -- rows shall be, { \moff }
The { \mon } glo -- ry, the song and the { \moff } sweet -- ness,
That makes heav -- en, heav -- { \mon } en to { \moff } me.

}

wordsC = \lyricmode {
\set stanza = "3."

Let one in his in -- { \mon } no -- cence { \moff } glo -- ry,
An -- o -- { \mon } ther in works he { \moff } has done–
Thy blood is my claim and ti -- tle,
Be -- sides { \mon } it, O { \moff } Lord I’ve none.
The Scorned, the De -- spised, { \mon } the Re -- ject -- ed, { \moff }
Thou’st come to this heart of mine,
{ \mon } In Thy { \moff } robes of e -- ter -- nal glo -- ry,
Thou wel -- com -- est me to Thine.

}

wordsD = \lyricmode {
\set stanza = "4."

The hart pant -- eth af -- { \mon } ter the { \moff } wa -- ters,
The dy -- { \mon } ing, for life that { \moff } de -- parts;
The Lord in His { \mon } glo -- ry { \moff } for sin -- ners,
{ \mon } For the { \moff } love { \mon } of re -- { \moff } bel -- lious hearts.
{ \mon } Call back all the days of the a -- ges, { \moff }
{ \mon } All rain -- drops come down from a -- bove; { \moff }
All { \mon } flow -- ers of sum -- mers de -- { \moff } part -- ed,
But think not to mea -- { \mon } sure His { \moff } love.

}

wordsE = \markuplist {

\line { Behold Him, O soul, where He told it, }
\line { { \hspace #2 } Pale, bleeding, and bearing thy sin; }
\line { He knocking, said, “Open, beloved, }
\line { { \hspace #2 } I pray thee to let Me come in! }

\line { Behold, I have borne all the judgment, }
\line { { \hspace #2 } Thy sins, O beloved, are gone; }
\line { Forgotten, forgotten forever, }
\line { { \hspace #2 } If sought for, God findeth not one. }

}

wordsF = \markuplist {

\line { “Behold, with what labor I won thee, }
\line { { \hspace #2 } Behold in My hands and My feet, }
\line { The tale of My measureless sorrow— }
\line { { \hspace #2 } Of love that made sorrow so sweet. }

\line { A flax-thread in oceans of fire }
\line { { \hspace #2 } How soon swallowed up would it be; }
\line { %{HIDE>%} \italic { %{<HIDE%} Yet sooner in oceans of mercy, %{HIDE>%} } %{<HIDE%} }
\line { { \hspace #2 } \caps { The sinner that cometh to Me.}” }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \context Voice = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice = altos { \voiceTwo << \notesAlto >> }
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

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
  \line{ \bold 6 \column { \wordsF } }
  \hspace #0.1
} }

%\noPageBreak \markup { \vspace #2 \fill-line { "Alternate tune for No. 376." } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond: