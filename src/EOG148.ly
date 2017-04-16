\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
  system-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "148"
  title = "Lord, While Our Souls In Faith Repose"
  tunename = "Irish"
  meter = "C. M."
  poet = "Mary Bowley"
  composer = "“Hymns and Sacred Poems,” Dublin"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=90 }
tb = { \tempo 2=45 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f2 | f1 c2 | f(g) a | bes( a) g | a1
  c2 | a( bes) c | f,( g) e | f1
  c'2 | f( c) d | c( bes) a | d4( c bes2) a | a( g)
  c | f4( e d2) c | bes( a) g | f1
  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 | c1 c2 | a( d) c | bes4( g' f2) e | f1
  g2 | a( f) f | f( d) c | c1
  f2 | a( f) f | f( g) f | f( e) f | f( e)
  e | f1 f2 | f1 e2 | f1

}
}

notesTenor = {
\global
\relative a {

  a2 | a1 g2 | f1 f2 | d'2( c) c | c1
  c2 | c( bes) a | a( bes) g | a1
  a2 | c1 bes2 | c1 c2 | bes1 c2 | c1
  c2 | c( bes) a | bes( c) bes | a1

}
}

notesBass = {
\global
\relative f {

  f2 | f1 e2 | d4( c bes2) a | g( c) c | f1
  e2 | f( d) a | d( bes) c | f,1
  f'2 | f( a) bes | a( e) f | bes4( a g2) f2 | c1
  c4( bes) | a2( bes) c | d( c) c | f1

}
}

wordsA = \lyricmode {
\set stanza = "1."

Lord, while our souls in faith re -- pose \bar "."
Up -- on Thy pre -- cious blood, \bar "." \break
Peace like an ev -- en riv -- er flows, \bar "."
And mer -- cy like a flood. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

But bound -- less joy shall fill our hearts
When gaz -- ing on Thy face;
We ful -- ly see what faith im -- parts,
And glo -- ry crowns Thy grace.

}

wordsC = \lyricmode {
\set stanza = "3."

Un -- seen we love Thee; dear Thy name;
But when our eyes be -- hold,
With joy -- ful won -- der we’ll ex -- claim,
“The half had not been told!”

}

wordsD = \lyricmode {
\set stanza = "4."

For Thou ex -- ceed -- est all the fame
Our ears have ev -- er heard;
How hap -- py we who know Thy name,
And trust Thy faith -- ful word!

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
