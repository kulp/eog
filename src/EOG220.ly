\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "220"
  title = "I Am Not Told to Labor"
  tunename = "Webb"
  meter = "7. 6. 7. 6. D."
  poet = "A. Midlane"
  composer = "George J. Webb"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key bes \major
  \partial 4
  \autoBeamOff
}

patternA = { c4 | c4. c8 c4 c | c2 c4 }
patternB = { c4 | c c c c | c2 c4 }
patternC = { c4 | c4 c c, c | c2( c4) }
patternD = { c4 | c4 c c, c | c2. }
patternE = { c8[ c] | c4 c c, c | c2. }

notesSoprano = {
\global
\relative c' {

  f4 | bes4. bes8 d4 bes | bes2 g4
  bes4 | f bes c d | c2 r4
  f,4 | bes4. bes8 d4 bes | bes2 g4
  bes4 | f bes d c | bes2 r4

  f4 | c'4. c8 bes4 c | d2 d4
  d4 | ees4 d g, c | bes2( a4)
  f4 | bes4. bes8 d4 bes | bes2 g4
  bes4 | f bes d c | bes2 r4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d | d d f f | g ees }
  \changePitch \patternB { g | f f f f | f r }
  \changePitch \patternA { f | d d f f | g ees }
  \changePitch \patternB { g | f d f ees | d r }

  \changePitch \patternA { f | f f f f | f f }
  \changePitch \patternD { f | ees f g g | f }
  \changePitch \patternA { f | d d f f | g ees }
  \changePitch \patternB { g | f d f ees | d r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes | bes bes bes bes | bes bes }
  \changePitch \patternB { bes | bes bes a bes | a r }
  \changePitch \patternA { a | bes bes bes bes | bes bes }
  \changePitch \patternB { bes | bes bes bes a | bes r }

  \changePitch \patternA { f | a a g a | bes bes }
  \changePitch \patternC { bes | bes bes bes ees | d c }
  \changePitch \patternA { a | bes bes bes bes | bes bes }
  \changePitch \patternB { bes | bes bes bes a | bes r }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { bes | bes bes bes d | ees ees }
  \changePitch \patternB { ees | d d c bes | f' r }
  \changePitch \patternA { f | bes, bes bes d | ees ees }
  \changePitch \patternB { ees | d bes f' f | bes, r }

  \changePitch \patternA { f' | f f f f | bes bes }
  \changePitch \patternE { bes a | g f ees c | f }
  \changePitch \patternA { f | bes, bes bes d | ees ees }
  \changePitch \patternB { ees | d bes f' f | bes, r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

I am not told to la -- bor, \bar "."
To put a -- way my sin; \bar "."
So fool -- ish, weak, and help -- less, \bar "."
I nev -- er could be -- gin; \bar "."
But, bless -- ed truth, I know it, \bar "."
Tho’ ru -- ined by the fall, \bar "."
Christ has my soul re -- deem -- èd– \bar "."
Yes, Christ has done it all! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I have not now to seek Him,
In love He sought for me,
When far from Him I wan -- dered
In sin and mis -- er -- y;
He oped my ears, and gave me,
To lis -- ten to His call;
He sought me and He found me–
Yes, Christ has done it all!

}

wordsC = \lyricmode {
\set stanza = "3."

And now I can -- not please Him
In aught I say or do,
Un -- less He dai -- ly help me
His glo -- ry to pur -- sue;
Still help -- less, and still fee -- ble,
On His strong arm I fall,
My strength in press -- ing on -- ward–
Yes, Christ has done it all!

}

wordsD = \lyricmode {
\set stanza = "4."

And when in heav’n -- ly glo -- ry
My ran -- somed soul shall be,
From sin and all pol -- lu -- tion,
For ev -- er, ev -- er free,
I’ll cast my crown be -- fore Him,
And loud His grace ex -- tol–
“Thou hast Thy -- self re -- deemed me;
Yes, Thou hast done it all!”

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
