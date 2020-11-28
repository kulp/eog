\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  \include "override/override-EOG161.ily"
}

\header{
  hymnnumber = "161"
  title = "God Moves in a Mysterious Way"
  tunename = "St. Anne" % see https://hymnary.org/tune/st_anne_croft
  meter = "C. M."
  poet = "William Cowper" % see https://hymnary.org/text/god_moves_in_a_mysterious_way
  composer = "William Croft" % see https://hymnary.org/tune/st_anne_croft
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key c \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 | e a g c | c b c
  g | c g a fis | g1.

  b2 | c a d b | c a b
  g | a c d b | c1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c2 | c c c e | d d e
  e | e e e d | d1.

  d2 | e c f d | e2. d4 b2
  c2 | f e d d | e1.

}
}

notesTenor = {
\global
\relative a {

  e2 | g a c c | a g g
  c | c b a a | b1.

  g2 | g a a g | g a gis
  g | f g a g | g1.

}
}

notesBass = {
\global
\relative f {

  c2 | c f e a | f g c,
  c | a e' c d | g,1.

  g'2 | c, f d g | c, f e
  e | d c f g | c,1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

God moves in a mys -- ter -- ious way, \bar "."
His won -- ders to per -- form; \bar "."
He plants His foot -- steps in the sea, \bar "."
And rides up -- on the storm. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Deep in un -- fath -- om -- a -- ble mines
Of nev -- er -- fail -- ing skill,
He treas -- ures up His bright de -- signs
And works His sov -- ’reign will.

}

wordsC = \lyricmode {
\set stanza = "3."

Ye fear -- ful saints, fresh cour -- age take;
The clouds ye so much dread
Are big with mer -- cy, and shall break
In bless -- ings on your head.

}

wordsD = \lyricmode {
\set stanza = "4."

Judge not the Lord by fee -- ble sense,
But trust Him for His grace;
Be -- hind a frown -- ing pro -- vi -- dence
He hides a smil -- ing face.

}

wordsE = \markuplist {

\line { His purposes will ripen fast, }
\line { { \hspace #2 } Unfolding every hour; }
\line { The bud may have a bitter taste, }
\line { { \hspace #2 } But sweet will be the flower. }

}

wordsF = \markuplist {

\line { Blind unbelief is sure to err, }
\line { { \hspace #2 } And scan His work in vain; }
\line { God is His own interpreter, }
\line { { \hspace #2 } And He will make it plain. }

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

\markup { \fontsize #0.3 \vcenter \column {
  \vspace #1
  \fill-line {
    \null
    \line{ \bold 5 \column { \wordsE } }
    \null
    \line{ \bold 6 \column { \wordsF } }
    \null
  }
} }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
