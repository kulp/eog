\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 8) (#t #f))
  systems-per-page = #(cond (is-eogsized 4) (#t #f))
}

\header{
  %children
  hymnnumber = "369"
  title = "Wide as the Ocean"
  tunename = ""
  meter = "P. M."
  poet = "C. Austin Miles"
  composer = "C. Austin Miles"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key des \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  aes8 | f f f f[ ees] des | aes' aes aes aes4
  aes8 | bes a bes des c bes | aes4. ~ aes4
  aes8 | bes bes bes des[ c] bes | aes aes aes des4
  bes8 | c4 des8 c4 bes8 | aes4. ~ aes4. |

  \eogbreak % mainly to avoid refrain vertical alignment cosmetic issues
  << s^\markup { \small \caps "Refrain" }
  { des4. des8 c bes | aes4. f4. } >>
  f8 f f f[ ges] aes | bes4. ~ bes4. |
  c4. c8 bes c | des4 des8 aes4( bes8) |
  c4 c8 c4 bes8 | aes4. ~ aes4. |
  des4. des8 c bes | aes4. f4.
  f8 f f f ges aes | bes4. ~ bes4. |
  bes8 bes bes des c bes | aes aes aes bes c des |
  ees4. aes,4. | des4. ~ des4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f8 | des des des des4 des8 | f8 f f f4
  f8 | ges8 ges ges bes aes ges | f4. ~ f4
  f8 | ges ges ges bes[ aes] ges | f f f f4
  fes8 | ees4 f8 ees4 des8 | c4.( ges'4.) |

  f4. bes8 aes ges | f4. des4. |
  des8 des des des[ c] des | des4. ~ des4. |
  ges4. ges8 ges ges | f4 f8 f4( fes8) |
  ees4 ees8 ees4 des8 | c8 c des ees[ f ees] |
  f4. bes8 aes ges | f4. des4. |
  des8 des des des c des | ges4. ~ ges4. |
  ges8 ges ges bes aes bes | f f f ges ges ges |
  g4. ges4. | f4. ~ f4

}
}

notesTenor = {
\global
\relative a {

  des8 | aes aes aes aes[ ges] f | des' des des des4
  des8 | des c des bes c des | des4. ~ des4
  des8 | des des des bes[ c] des | des des des aes4
  aes8 | aes4 aes8 g4 g8 | aes4. ~ aes4. |

  aes8 aes aes bes[ c] des | des des des aes4. |
  aes8 aes aes aes4 aes8 | ges4 ges8 ges4. |
  ees'8 ees ees ees[ des] ees | des4 aes8 aes4. |
  aes4 aes8 g4 g8 | aes8 ees f ges[ aes ges] |
  aes8 aes aes bes[ c] des | des des des aes4. |
  aes8 aes aes aes aes aes | ges4 ges8 des'4. |
  des8 des des bes c des | des des des des c bes |
  bes4. aes4. | aes4. ~ aes4

}
}

notesBass = {
\global
\relative f {

  des8 des des des des4 des8 | des8 des des des4
  des8 | ges ges ges ges ges ges | des4. ~ des4
  des8 | ges ges ges ges4 ges8 | des8 des des des4
  des8 | ees4 ees8 ees4 ees8 | aes,4. ~ aes4. |

  des8 des des ges4 ges8 | des8 des des des4. |
  des8 des des des[ ees] f | ges4 ges8 ges4. |
  aes8 aes aes aes4 aes8 | des,4 des8 des4. |
  ees4 ees8 ees4 ees8 | aes,4. ~ aes4. |
  des8 des des ges4 ges8 | des8 des des des4. |
  des8 des des des ees f | ges4 ges8 ges4. |
  ges8 ges ges ges ges ges | des des des ges ges ges |
  ees4. aes4. | des,4. ~ des4

}
}

Refrain = \lyricmode {

Wide, wide as the o -- cean, \bar "."
High as the { \mon } heav -- ens { \moff } a -- bove, \bar "."
Deep, deep as the deep -- est sea, \bar "."
Is my Sav -- iour’s love. \bar "."
I, tho’ so un -- wor -- thy, \bar "."
Still am a child of His care, \bar "."
For His Word teach -- es me \bar "."
That His love reach -- es me \bar "."
Ev -- ’ry -- where. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

I claim for my own a King on a throne, \bar "."
The Mak -- er of land and of sea; \bar "."
Whose throne is on high, who ev -- er is nigh, \bar "."
To love and care for me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I wan -- der a -- way, from Him I might stray,
But ev -- er the sound of His voice
Is call -- ing to me, wher -- e’er I may be,
To make my heart re -- joice.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

The by -- ways are fair, but oft -- en a snare
Is hid -- den where pleas -- ures a -- bound;
So close to His side I’ll ev -- er a -- bide,
For safe -- ty there is found.

}

underWords = \lyricmode {

\repeat unfold 34 \skip 4
Wide as the o -- cean, deep as the sea,

\repeat unfold 6 \skip 4
a -- bove;
Deep as the deep -- est

\repeat unfold 8 \skip 4
is His love;
I tho’ un -- wor -- thy,
Still am His child

\repeat unfold 7 \skip 4
His care,

}

extraA = \markuplist {

\line { He left His bright home, His glorious throne, }
\line { { \hspace #2 } To die upon Calvary’s tree; }
\line { His blood there was spilt, to cleanse me from guilt, }
\line { { \hspace #2 } He died — He lives for me. }

}

extraB = \markuplist {

\line { The path is marked out, till called by the shout, }
\line { { \hspace #2 } To meet with my Lord in the air. }
\line { The Spirit’s the power, to walk till that hour, }
\line { { \hspace #2 } The object of God’s care. }

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
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context Lyrics = three \with { alignAboveContext = men } \lyricsto tenors \underWords
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

headA = \markuplist {
\line { \bold \larger { The Saviour’s Path and Ours } }
}

headB = \markuplist {
\line { (This hymn may be sung to the same tune as }
\line { the preceding, using the same refrain.) }
}

\markup { \fill-line { \center-column {
  \line{ \column { \headA } } \combine \null \vspace #0.4
  \line{ \column { \headB } } \combine \null \vspace #1
  \column {
    \line{ \bold 1 \column { \extraA } } \combine \null \vspace #0.5
    \line{ \bold 2 \column { \extraB } } \combine \null \vspace #0.5
  }
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
