\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  system-count = #(cond (is-eogsized 2) (#t #f))
  % decrease system-to-system padding to fit onto page with previous score
  system-system-spacing.padding = 2
  system-system-spacing.basic-distance = 2
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
          % less lowering (to save vertical space)
          \lower #1 \fromproperty #'header:poet
          \smaller \bold \mysubtitle
          \lower #1 \fromproperty #'header:composer
        }
      }
    }
  }
}

\header{
  %gospel
  hymnnumber = "199"
  title = "When We Survey the Wondrous Cross"
  tunename = "Rockingham"
  meter = "L. M."
  poet = "Watts"
  composer = "Adpt. by Edward Miller"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=90
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees2 | g( aes) f | ees1 g2 | bes1 c2 | bes1
  bes2 | ees1 d2 | c1 bes2 | bes( aes) g | g( f)
  f2 | bes1 c2 | d1 bes2 | ees( g,) a | bes1
  ees,2 | aes1 g2 | f1 ees2 | ees4( f g2) f | ees1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees2 | ees1 d2 | ees1 ees2 | ees1 ees4( f) | g1
  g2 | ees1 g2 | aes1 ees2 | f1 ees2 | ees( d)
  d2 | f1 f2 | f1 d2 | ees1 ees2 | d1
  ees2 | ees( d) ees | c1 ees2 | bes2( ees) d | ees1

}
}

notesTenor = {
\global
\relative a {

  g2 | bes( c) bes | g1 bes2 | bes( ees) c4( d) | ees1
  ees2 | bes1 bes2 | c1 ees2 | bes1 bes2 | bes1
  bes2 | bes1 a2 | bes1 bes2 | bes1 f2 | f1
  bes2 | aes1 bes2 | c1 bes2 | g4( aes bes2.) aes4 | g1

}
}

notesBass = {
\global
\relative f {

  ees2 | ees( aes,) bes | ees1 ees2 g1 aes2 | ees1
  ees2 | g1 ees2 | aes1 g2 | d1 ees2 | bes1
  bes2 d1 f2 | bes1 aes2 | g( ees) f | bes,1
  g'2 | f1 ees2 | aes,1 g2 | bes1 bes2 | ees1

}
}

wordsA = \lyricmode {
\set stanza = "1."

When we sur -- vey the won -- drous cross \bar "."
On which the Lord of glo -- ry died, \bar "."
Our rich -- est gain we count but loss, \bar "."
And pour con -- tempt on all our pride. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

For -- bid it, Lord, that we should boast,
Save in the death of Christ, our God;
All the vain things that charm us most,
We’d sac -- ri -- fice them to His blood.

}

wordsC = \lyricmode {
\set stanza = "3."

There from His head, His hands, His feet,
Sor -- row and love flow’d min -- gled down;
Did e’er such love and sor -- row meet,
Or thorns com -- pose so rich a crown?

}

wordsD = \lyricmode {
\set stanza = "4."

Were the whole realm of na -- ture ours,
That were an off -- ’ring far too small;
Love that trans -- cends our high -- est pow’rs
De -- mands our soul, our life, our all.

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
    \context {
      \Lyrics
      % Compensate for wide lyrics by squashing things a bit
      \override LyricSpace.minimum-distance = #0.3
    }

  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak \markup { \fill-line { \raise #5 \line { Alternate tune: No. 11. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
