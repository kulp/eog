\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "201"
  title = "Trust and Obey"
  tunename = ""
  meter = "6. 6. 9. D. with Refrain"
  poet = "J. H. Sammis"
  composer = "D. B. Towner"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key f \major
  \partial 4
  \autoBeamOff
}

patternA = { c8 c | c4 c c | c2 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { f g | a a g | f }
  \changePitch \patternA { f a | c c bes | a }
  a8 a8 | bes4 d bes | a c a | g2
  \changePitch \patternA { f g | a a g | f }
  \changePitch \patternA { f a | c c bes | a }
  a8 a8 | bes4 d bes | a f g | f2.

  << s^\markup { \small \caps "Refrain" }
  { c'4 g c | a2 } >>
  \changePitch \patternA { a a | d a c | bes }
  bes8 bes | bes4 a g | a c
  \changePitch \patternA { f,8 g | a4 f g | f2 }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { c c | f f e | f }
  \changePitch \patternA { f f | e e e | f }
  f8 f | f4 f f | f f f | e2
  \changePitch \patternA { c c | f f e | f }
  \changePitch \patternA { f f | e e e | f }
  f8 f | f4 f f | f c c | c2.

  e4 e e | f2
  \changePitch \patternA { f8 f | fis4 fis fis | g }
  g8 g | g4 f e | f f
  \changePitch \patternA { f f | f c c | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a bes | c c bes | a }
  \changePitch \patternA { a c | c g c | c }
  c8 c d4 bes d | c a c | c2
  \changePitch \patternA { a bes | c c bes | a }
  \changePitch \patternA { a c | c g c | c }
  c8 c | d4 bes d | c a bes | a2.

  g4 c c | c2
  \changePitch \patternA { c c | a d d | d }
  c8 c | c4 c c | c a
  \changePitch \patternA { c d | c a bes | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { f f | f f c | f }
  \changePitch \patternA { f f | c c c | f }
  f8 f | bes,4 bes bes | f' f f | c2
  \changePitch \patternA { f f | f f c | f }
  \changePitch \patternA { f f | c c c | f }
  f8 f | bes,4 bes bes | c c c | << f2. f, >>

  c'4 c c | f2
  \changePitch \patternA { f ees | d d d | g }
  e8 d | c4 c c | f4 f
  a,8 bes | c4 c c | << f2 f, >>

}
}

Refrain = \lyricmode {

Trust and o -- bey,
For there’s no oth -- er way
To be hap -- py in Je -- sus
But to trust and o -- bey.

}

wordsA = \lyricmode {
\set stanza = "1."

When we walk with the Lord
In the light of His word,
What a glo -- ry he sheds on our way!
While we do His sweet will,
How our hearts He can fill
With His love as we trust and o -- bey.

}

wordsB = \lyricmode {
\set stanza = "2."

Not a shad -- ow can rise,
Not a cloud in the skies,
But His smile quick -- ly drives it a -- way;
Not a doubt nor a fear,
Not a sigh nor a tear
Can a -- bide, while we trust and o -- bey.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

But we nev -- er can prove
The de -- lights of His love
When in paths of self -- pleas -- ing we stray;
For the fa -- vor He shows,
And the joy He be -- stows
Are for those who will trust and o -- bey.

}

wordsD = \lyricmode {
\set stanza = "4."

Then in fel -- low -- ship sweet
Let us sit at His feet,
Or _ walk by His side in the way;
What He says may we do,
Where He sends may we go–
Nev -- er fear, on -- ly trust and o -- bey.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
