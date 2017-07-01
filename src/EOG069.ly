\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  systems-per-page = #(cond (is-eogsized 5) (#t #f))
}

\header{
  %gospel
  hymnnumber = "69"
  title = "Come Sing, My Soul, and Praise the Lord"
  tunename = "Redemption Ground"
  meter = "L. M. D."
  poet = "El Nathan"
  composer = "J. McGranahan"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 8=140 }
tb = { \tempo 8=70 }

patternAA = { c8 c8 c8 | c4. c8 c8 c8 | c4. }

patternBA = { c8 c8 c8 | c8 c8 c4 c8[ c8] | c4. }
patternBB = { c8 c8 c8 | c8 c8 c4 c4      | c4. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g g e | c' b b a | a }
  \changePitch \patternAA { a a f | c' a a g | g }
  \changePitch \patternAA { g g e | e' e d c | a }
  \changePitch \patternBA { c b a | g e' d c b | c }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAA { g a b | c c b gis | a } >>
  \changePitch \patternAA { a b c | d d c fis, | g }
  \changePitch \patternAA { g g e | e' e d c | a }
  \changePitch \patternBA { c b a | g e' d c b | c }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e e c | e g g f | f }
  \changePitch \patternAA { f f c | f f f e | e }
  \changePitch \patternAA { e e c | g' g g g | f }
  \changePitch \patternBA { f f f | e g f e d | e }

  \changePitch \patternAA { g a b | c e, e d | c }
  \changePitch \patternAA { a' b c | d g, fis d | d }
  \changePitch \patternAA { e e c | g' g g g | f }
  \changePitch \patternBA { f f f | e g f e d | e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c c g | g g c c | c }
  \changePitch \patternAA { c c a | a c c c | c }
  \changePitch \patternAA { c c g | c c b c | c }
  \changePitch \patternBB { a b c | c c a g | g }

  \changePitch \patternAA { g a b | c a gis b | a }
  \changePitch \patternAA { a b c | d b a c | b }
  \changePitch \patternAA { c c g | c c b c | c }
  \changePitch \patternBB { a b c | c c a g | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c c c | c e f f | f }
  \changePitch \patternAA { f f f | f f c c | c }
  \changePitch \patternAA { c c c | c c d e | f }
  \changePitch \patternBB { f f f | c c f g | c, }

  \changePitch \patternAA { g' a b | c a e e | a, }
  \changePitch \patternAA { a' b c | d d, d d | < g g, > }
  \changePitch \patternAA { c, c c | c c d e | f }
  \changePitch \patternBB { f f f | c c f g | c, }

}
}

Refrain = \lyricmode {

Re -- demp -- tion ground, the ground of peace! \bar "."
Re -- demp -- tion ground, oh, won -- drous grace! \bar "."
Here let our praise to God a -- bound, \bar "."
Who saves us on re -- demp -- tion ground! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Come sing, my soul, and praise the Lord, \bar "."
Who hath re -- deemed thee by His blood; \bar "."
De -- liv -- ered thee from chains that bound, \bar "." %\eogbreak % original formatting has break
And brought thee to re -- demp -- tion ground. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Once from my God I wan -- dered far,
And with His ho -- ly will made war;
But now my songs to God a -- bound;
I’m stand -- ing on re -- demp -- tion ground.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Oh joy -- ous hour when God to me
A vis -- ion gave of Cal -- va -- ry:
My bonds were loosed, my soul un -- bound;
I sang up -- on re -- demp -- tion ground.

}

wordsD = \markuplist {

\line { No works of merit now I plead, }
\line { { \hspace #2 } But Jesus take for all my need; }
\line { No righteousness in me is found, }
\line { { \hspace #2 } Except upon redemption ground. }

}

wordsE = \markuplist {

\line { Come, weary soul, and here find rest; }
\line { { \hspace #2 } Accept redemption, and be blest: }
\line { The Christ who died, by God is crowned }
\line { { \hspace #2 } And pardons on redemption ground. }

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

\eogpagebreak

\markup {
\vspace #2 % need space between title (evenHeaderMarkup) and verses
\fill-line {
  \null
  \column {
    \line{ \bold 4 \column { \wordsD } }
    \vspace #1
    \line{ \bold 5 \column { \wordsE } }
  }
  \null
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
