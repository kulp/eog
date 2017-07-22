\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 7) (#t #f))
  systems-per-page = #(cond (is-eogsized 5) (#t #f))
}

\header{
  hymnnumber = "159"
  title = "God Be with You"
  tunename = ""
  meter = "P. M."
  poet = "J. E. Rankin"
  composer = "W. G. Tomer"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key des \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f4. f8 f f f f | aes4 ees f r4 |
  bes4. bes8 bes bes bes bes | bes2 aes4 r4 |
  aes4. aes8 aes aes aes aes | aes2 f4 r4 |
  f4. f8 bes aes des, ees | f4 ees des

  << s^\markup { \small \caps "Refrain" }
  { f8. ges16 | aes4( des f) ees8. des16 | bes4( des2) } >>
  c8. bes16 | aes4. bes8 aes[ f] des[ f] | ees2.
  f8. ges16 | aes4( des f) ees8. des16 | bes4( des2) \fermata
  des8. \fermata bes16 | aes8 f des ees f4 ees | des2. r4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  des4. des8 des des des des | des4 c des r |
  des4. ges8 ges ges ges ges | ges2 f4 r |
  ees4. ees8 ees ees ges ges | f2 des4 r |
  des4. des8 ges f des des | des4 c des

  des8. ees16 | f2( aes4) aes8. aes16 | ges4( bes2)
  aes8. ges16 | f4. ges8 f[ des] des[ f] | c2.
  des8. ees16 | f2( aes4) aes8. aes16 | ges4( bes2)
  ges8. ges16 | f8 des des des des4 c | des2. r4

}
}

notesTenor = {
\global
\relative a {

  aes4. aes8 aes aes aes aes | aes4 aes aes r |
  ges4. des'8 des des des des | des2 des4 r |
  c4. c8 c c ees ees | des2 aes4 r |
  aes4. aes8 des des aes bes | aes4 ges f

  r4 | r4 aes8 aes des4 des8. des16 | des4 des8 des des4
  des8. des16 | des4. des8 des[ aes] f[ aes] | aes4 aes8 aes8 aes4
  r4 | r4 aes8 aes des4 des8. des16 | des4 des8 des des4
  bes8. des16 | des8 aes aes bes aes4 ges | f2. r4

}
}

notesBass = {
\global
\relative f {

  des4. des8 des des des des | f4 aes des, r |
  ges4. ges8 ges ges ges ges | des2 des4 r |
  aes'4. aes8 aes aes aes aes | des,2 des4 r |
  des4. des8 des des f ges | aes4 aes, des

  r4 | r des8 des des4 f8. f16 | ges4 ges8 ges ges4
  ges8. ges16 | des4. des8 des4 des | aes4 aes8 aes aes4 r4 |
  r4 des8 des des4 f8. f16 | ges4 ges8 ges \tb ges4_\fermata
  ges8._\fermata \ta ges16 | des8 des f ges aes4 aes, | des2. r4

}
}

Refrain = \lyricmode {

Till we meet, __ till we meet, __  \bar "."
Till we meet at Je -- sus’ feet; \bar "."
Till we meet, __ till we meet, __ \bar "."
God be with you till we meet a -- gain. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

God be with you till we meet a -- gain; \bar "."
By His coun -- sels guide, up -- hold you, \bar "."
With His sheep se -- cure -- ly fold you; \bar "."
God be with you till we meet a -- gain. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

God be with you till we meet a -- gain;
Neath His wings pro -- tect -- ing hide you,
Dai -- ly man -- na still pro -- vide you;
God be with you till we meet a -- gain.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

God be with you till we meet a -- gain;
When life’s per -- ils thick con -- found you,
Put His arms un -- fail -- ing round you;
God be with you till we meet a -- gain.

}

wordsD = \lyricmode {
\set stanza = "4."

God be with you till we meet a -- gain;
Keep love’s ban -- ner float -- ing o’er you,
Smite death’s threat -- ’ning wave be -- fore you;
God be with you till we meet a -- gain.

}

underWords = \lyricmode {

{ \repeat unfold 34 { \skip 4 } }
Till we meet,
{ \repeat unfold 3 { \skip 4 } }
till we meet,
{ \repeat unfold 7 { \skip 4 } }
till we meet;
Till we meet,
{ \repeat unfold 3 { \skip 4 } }
till we meet,

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
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
    >>
    \context Lyrics = three \lyricsto tenors \underWords
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
