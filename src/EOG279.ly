\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG279.ily"
}

\header{
  hymnnumber = "279"
  title = "I’m Waiting for Thee, Lord"
  tunename = "Waiting" % not found at hymnary.org
  meter = "12. 11. 12. 11."
  poet = "Hannah K. Burlingham" % see https://hymnary.org/text/im_waiting_for_thee_lord_thy_beauty_to_s
  composer = "Scotch" % not found at hymnary.org
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=110
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  b8[ c] | d2 d4. e8 | d2 g4
  a8[ b] | c4( b) a g | e( g) d \eogbreak \eogpagebreak
  c8[ b] | d2 d4. e8 | d2 g4 a | b2 a4. g8 | g2.
  b8[ c] | d2 d4. e8 | d2 b4
  d4 | c( b) a g | e( g) d
  c8[ b] | d2 d4. e8 | d2 g4 a | b2 a4. g8 | g2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e {

  g8[ a] | b2 b4. c8 | b2 b4
  d4 | e( d) c b | c2 b4
  a8[ g] | b2 b4. c8 b2 d4 e | d2 c4. b8 | b2.
  g'4 | g2 g4. g8 | g2 g4
  g4 | fis( g) e e | c( e) b
  a8[ g] | b2 b4. c8 b2 d4 e | d2 c4. b8 | b2.

}
}

notesTenor = {
\global
\relative a {

  g4 | g2 g4. g8 | g2 g4
  fis8[ g] | g2 fis4 g | g2 g4
  g4 | g2 g4. g8 | g2 g4 g | g2 fis4. g8 | g2.
  g8[ a] | b2 b4. c8 | b2 d4
  b4 | a( g) c c | c2 g4
  g4 | g2 g4. g8 | g2 g4 g | g2 fis4. g8 | g2.

}
}

notesBass = {
\global
\relative f, {

  g4 | g2 g4. c8 | g2 g4
  d'4 | c( g) d' e | c( e) g
  g,4 | g2 g4. c8 | g2 b4 c | d2 d4. g,8 | g2.
  g'8[ a] | g2 g4. g8 | g2 g4
  g,4 | a( b) c c | g'2 g,4
  g4 | g2 g4. c8 | g2 b4 c | d2 d4. g,8 | g2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

I’m wait -- ing for Thee, Lord, \bar "."
Thy beau -- ty to see, Lord, \bar "."
I’m wait -- ing for Thee_– for Thy com -- ing a -- gain. \bar "."
\mon Thou art \moff gone o -- ver there, Lord, \bar "."
A place to pre -- pare, Lord, \bar "."
Thy home I shall share, at Thy com -- ing a -- gain. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Mid dan -- ger and fear, Lord,
I’m oft wear -- y here, Lord,
The day must be near of Thy com -- ing a -- gain.
’Tis all sun -- shine there, Lord,
No sigh -- ing nor care, Lord,
But glo -- ry so fair, at Thy com -- ing a -- gain.

}

wordsC = \lyricmode {
\set stanza = "3."

While Thou art a -- way, Lord,
I stum -- ble and stray, Lord,
Oh, hast -- en the day of Thy com -- ing a -- gain.
This is not my rest, Lord,
A pil -- grim con -- fessed, Lord, % original has "confest"
I wait to be blest, at Thy com -- ing a -- gain.

}

wordsD = \lyricmode {
\set stanza = "4."

E’en now let my ways, Lord,
Be bright with Thy praise, Lord,
For brief are the days ere Thy com -- ing a -- gain.
I’m wait -- ing for Thee, Lord,
Thy beau -- ty to see, Lord,
No tri -- umph for me, like Thy com -- ing a -- gain.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
