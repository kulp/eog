\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = 2
}

\header{
  title = "The Gospel Bells"
  subsubtitle = "(P. M.)"
  %meter = "P.M."
  poet = "S. W. Martin" % XXX just S.W.M. in the original
  composer = "S. W. Martin"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=110 }
tb = { \tempo 4=55  }

patternAA = { \ta c4    | c4 c4      c4 c4 | c4 c2 }
patternAB = { \ta c8 c8 | c4 c4      c4 c4 | c4 c2 }
patternBA = { \ta c8 c8 | c4 c4      c4 c4 | c2.   }
patternBB = { \ta c4    | c4 c4      c4 c4 | c2.   }
patternBC = { \ta c8 c8 | c4 c8[ c8] c4 c4 | c2.   }
patternCA = { \ta c8. c16 | c2. c8. c16 | c2. }
patternCB = { \ta c8. c16 | c2. c8. c16 | c2. \fermata }
patternCC = { \ta r4 | r4 c8. c16 c4 r4 | r4 c8. c16 c4 }
patternCD = { \ta r4 | r4 c8. c16 c4 r4 | r4 c8. c16 \tb c4 \fermata } % \tb here affects CC as well
patternCE = { \ta r4 | r4 c8. c16 c4 r4 | r4 c8. c16 \tb c4          }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { c    | f f f a     | d c }
  \changePitch \patternBA { c c  | d c f, g    | a   }
  \changePitch \patternAB { a c  | bes g a f   | g c }
  \changePitch \patternBA { c c  | e d c b     | c   }

  \changePitch \patternBB { c,   | f f f f     | f   }
  \changePitch \patternBA { f a  | g g g g     | g   }
  \changePitch \patternAB { a g  | f f f f     | f f }
  \changePitch \patternBA { f g  | a bes a g   | f   } \pageBreak

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { a f  | c' bes g    | c   } >>
  \changePitch \patternBA { c c  | d c f, g    | a   }
  \changePitch \patternCB { a f  | c' c a      | f'  }
  \changePitch \patternBC { f, g | a c bes a g | f   }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c   | c c c f     | f f   }
  \changePitch \patternBA { f f | f f f e     | f     }
  \changePitch \patternAB { f a | g e f c     | e e   }
  \changePitch \patternBA { e e | g a g f     | e     }

  \changePitch \patternBB { c   | c c d d     | c     }
  \changePitch \patternBA { f f | e e d d     | e     }
  \changePitch \patternAB { e e | d d ees ees | d d   }
  \changePitch \patternBA { d f | f g f e     | f     }

  \changePitch \patternCC {     | e f g       | f g a }
  \changePitch \patternBA { f f | f f f e     | f     }
  \changePitch \patternCD {     | e f g       | f g a }
  \changePitch \patternBA { f e | f g f e     | f     }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c | a a a c | bes a }
  \changePitch \patternBA { a a | bes a a c | c }
  \changePitch \patternAB { c c | c c c a | c g }
  \changePitch \patternBA { c c | c d e d | c }

  \changePitch \patternBB { c | a a bes bes | a }
  \changePitch \patternBA { c c | c c b b | c }
  \changePitch \patternAB { c bes | a a a a | bes bes }
  \changePitch \patternBA { bes d | c d c bes | a }

  \changePitch \patternCC { | g a bes | a bes c }
  \changePitch \patternBA { a a | bes a a c | c }
  \changePitch \patternCE { | g a bes | a bes c }
  \changePitch \patternBA { c c | c d c bes | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c | f f f f | f f }
  \changePitch \patternBA { f f | f f d c | f }
  \changePitch \patternAB { f f | c c f f | c c }
  \changePitch \patternBA { c c | c f g g, | c }

  \changePitch \patternBB { c | f f bes, bes | f' }
  \changePitch \patternBA { a f | c c g g | c }
  \changePitch \patternAB { c c | d d c c | bes bes }
  \changePitch \patternBA { bes bes | c bes c c | f }

  \changePitch \patternCC { | c c c | f f f }
  \changePitch \patternBA { f f | f f d c | f }
  \changePitch \patternCD { | c c c | f f f }
  \changePitch \patternBA { a, c | f bes, c c | f }

}
}

RefrainA = \lyricmode {

%\repeat unfold 57 { \skip 4 }
Gos -- pel bells, how they ring, \bar "."
O -- ver land, from sea to sea; \bar "." \break
Gos -- pel bells, free -- ly bring \bar "."
Bless -- ed news to you and me. \bar "." \break

}

RefrainB = \lyricmode {

\override LyricText #'font-size = #-2
\repeat unfold 57 { \skip 4 }
Gos -- pel bells,
how they ring,
\repeat unfold 7 { \skip 8 }
Gos -- pel bells
free -- ly bring

}

wordsA = \lyricmode {
\set stanza = "1."

The Gos -- pel bells are ring -- ing, \bar "."
O -- ver land, from sea to sea: \bar "." \break
Bless -- ed news of free sal -- va -- tion \bar "."
Do they of -- fer you and me. \bar "." \break
“For God so loved the world, \bar "."
That His on -- ly Son He gave, \bar "." \break
Who -- so -- e’er be -- liev -- eth in Him \bar "."
Ev -- er -- last -- ing life shall have.” \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

The Gos -- pel bells in -- vite us
To a feast pre -- pared for all;
Do not slight the in -- vi -- ta -- tion,
Nor re -- ject the gra -- cious call.
“I am the bread of life;
Eat of Me, thou hun -- gry soul,
Tho’ your sins be red as crim -- son,
They shall be as white as wool.”

\RefrainA

}

wordsC = \lyricmode {
\set stanza = "3."

The Gos -- pel bells give warn -- ing,
As they sound from day to day,
Of the fate which doth a -- wait them
Who for -- ev -- er will de -- lay.
“Es -- cape ye, for thy life; 
Tar -- ry not in all the plain,
Nor be -- hind thee look, O, nev -- er,
Lest thou be con -- sumed in pain.”

}

wordsD = \lyricmode {
\set stanza = "4."

The Gos -- pel bells are joy -- ful,
As they ech -- o far and wide,
Bear -- ing notes of per -- fect par -- don,
Thro’ a Sav -- iour cru -- ci -- fied.
“Good ti -- dings of great joy
To all peop -- ple do I bring,
Un -- to you is born a Sav -- iour,
Which is Christ the Lord” and King.

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
      %\context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
	\new Lyrics \with { alignAboveContext = men } \lyricsto tenors \RefrainB
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

%\markup { \fill-line { \column {
%  \line{ \bold 5 \column { \wordsE } } \vspace #0.4
%  \line{ \bold 6 \column { \wordsF } } \vspace #0.4
%  \line{ \bold 7 \column { \wordsG } } \vspace #0.4
%  \line{ \bold 8 \column { \wordsH } } \vspace #0.4
%} } }

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
