\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 8
}

\header{
  hymnnumber = "217"
  title = "Oh Bright and Blessed Scenes"
  tunename = "Solyma"
  meter = "S. M."
  poet = "J. N. Darby"
  composer = "Geo. Tredcroft"
  tagline = ##f
}

ta = { \tempo 4=110 }
tb = { \tempo 4=55 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g4 | aes2 g4 | g2 f4 | \tb ees2\fermata \ta
  bes'4 | aes2 g4 | c2 f,4 | f2 \eogbreak
  c'4 | bes2 bes4 | ees2 d4 | d2 c4 | \tb bes2\fermata \ta
  g4 | aes2 g4 | g2 f4 | ees2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 | ees2 ees4 | d2 d4 | ees2
  f4 | ees2 ees4 | ees2 ees4 | d2
  d4 | ees2 aes4 | g2 bes4 | bes2 aes4 | g2
  ees4 | ees2 ees4 | d2 d4 | ees2

}
}

notesTenor = {
\global
\relative a {

  bes4 | c2 bes4 | aes2 aes4 | g2
  f4 | aes2 bes4 | c2 c4 | bes2
  bes4 | bes2 d4 | ees2 ees4 | ees2 ees4 | ees2
  bes4 | c2 bes4 | aes2 aes4 | g2

}
}

notesBass = {
\global
\relative f {

  ees4 | ees2 ees4 | bes2 bes4 | ees2_\fermata
  d4 | c2 bes4 | aes2 a4 | bes2
  aes'4 | g2 f4 | ees2 g4 | aes2 aes,4 | ees'2_\fermata
  ees4 | ees2 ees4 | bes2 bes4 | ees2

}
}

wordsA = \lyricmode {
\set stanza = "1."

Oh bright and bless -- ed scenes, \bar "."
Where sin can nev -- er come, \bar "."
Whose sight our long -- ing spir -- it weans \bar "."
From earth where yet we roam! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

And can we call our home
Our Fa -- ther’s house on high,
The rest of God our rest to come,
Our place of lib -- er -- ty?

}

wordsC = \lyricmode {
\set stanza = "3."

Yes! In that light un -- stained,
Our stain -- less souls shall live,
Our hearts’ deep long -- ings more than gained,
When God His rest shall give.

}

wordsD = \lyricmode {
\set stanza = "4."

His pres -- ence there, my soul,
Its rest, its joy un -- told,
Shall find when end -- less a -- ges roll,
And time shall ne’er grow old.

}

wordsE = \markuplist {

\line { Our God the center is, }
\line { { \hspace #2 } His presence fills that land, }
\line { And countless myriads owned as His, }
\line { { \hspace #2 } Round Him adoring stand. }

}

wordsF = \markuplist {

\line { Our God whom we have known, }
\line { { \hspace #2 } Well-known in Jesus’ love, }
\line { Rests in the blessing of His own, }
\line { { \hspace #2 } Before Himself above. }

}

wordsG = \markuplist {

\line { Glory supreme is there, }
\line { { \hspace #2 } Glory that shines through all, }
\line { More precious still that love to share }
\line { { \hspace #2 } As those that love did call. }

}

wordsH = \markuplist {

\line { Like Jesus in that place }
\line { { \hspace #2 } Of light and love supreme; }
\line { Once Man of Sorrows full of grace, } % blue book has small `s` in `sorrows`
\line { { \hspace #2 } Heaven’s blest and endless theme. }

}

wordsI = \markuplist {

\line { Like Him! Oh grace supreme! }
\line { { \hspace #2 } Like Him before Thy face, }
\line { Like Him to know that glory beam }
\line { { \hspace #2 } Unhindered face to face! }

}

wordsJ = \markuplist {

\line { Oh love supreme and bright, }
\line { { \hspace #2 } Good to the feeblest heart, }
\line { That gives us now, as heavenly light, }
\line { { \hspace #2 } What soon shall be our part. }

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

\noPageBreak

\markup { \fill-line {
  \hspace #0.1
  \column {
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
  \line{ \bold 7 \column { \wordsG } }
  }
  \hspace #0.1
  \column {
  \line{ \bold 8 \column { \wordsH } } \combine \null \vspace #0.4
  \line{ \bold 9 \column { \wordsI } } \combine \null \vspace #0.4
  \line{ \bold 10 \column { \wordsJ } }
  }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
