\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "109"
  title = "Oh, the Love of God Is Boundless"
  tunename = "Tyrol"
  meter = "8. 7. 8. 7. D."
  poet = "R. D. Edwards"
  composer = "Tyrolese Melody"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8. c16 | c4 c4 c8. c16 | c4 c4 }
patternAB = { c8. c16 | c4 c4 c8. c16 | c2    }

patternBA = { c8. c16 | c4. c8 c8 c8  | c2    }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { c c | f f a f | g g }
  \changePitch \patternBA { bes d | c a bes g | f }
  \changePitch \patternAA { c c | f f a f | g g }
  \changePitch \patternBA { bes d | c a bes g | f }

  \changePitch \patternAA { a bes | c a c c | bes g }
  \changePitch \patternAB { bes bes | a f a a | g }
  \changePitch \patternAA { c, c | f f g g | a a }
  \changePitch \patternBA { bes d | c a bes g | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c c | c c f c | d c }
  \changePitch \patternBA { f f | f f f e | f }
  \changePitch \patternAA { c c | c c c b! | c c }
  \changePitch \patternBA { d d | f f f e | f }

  \changePitch \patternAA { f e | f f a a | g g }
  \changePitch \patternAB { g g | f c f d | e }
  \changePitch \patternAA { c c | c c e e | f ees }
  \changePitch \patternBA { d e! | f f f e | f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { a a | a a c a | bes bes }
  \changePitch \patternBA { bes bes | c d d bes | a }
  \changePitch \patternAA { bes bes | a a f f | f e }
  \changePitch \patternBA { f f | c' d d bes | a }

  \changePitch \patternAA { c c | c c c c | d c }
  \changePitch \patternAB { c c | c c a b! | c }
  \changePitch \patternAA { e, e | f f c' c | c c }
  \changePitch \patternBA { bes bes | c d d bes | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f f | f f f f | f e }
  \changePitch \patternBA { d bes | a d bes c | f }
  \changePitch \patternAA { e e | f f d d | c c }
  \changePitch \patternBA { bes bes | a d bes c | f }

  \changePitch \patternAA { f g | a f f f | f e }
  \changePitch \patternAB { e e | f a f f | c }
  \changePitch \patternAA { c c | a a c c | f f }
  \changePitch \patternBA { bes, bes | a d bes c | f }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Oh, the love of God is bound -- less, \bar "."
Per -- fect, cause -- less, full and free! \bar "." \eogbreak
Doubts have van -- ished, fears are ground -- less, \bar "."
Now I know that love to me. \bar "." \eogbreak
Love, the source of all my bless -- ing; \bar "."
Love, that set it -- self on me; \bar "." \eogbreak
Love, that gave the spot -- less Vic -- tim; \bar "."
Love told out at Cal -- va -- ry. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Oh, the cross of Christ is won -- drous!
There I learn God’s heart to me;
Midst the si -- lent, deep -- ening dark -- ness,
“God is light” I al -- so see.
Ho -- ly claims of jus -- tice find -- ing
Full ex -- press -- ion in that scene;
Light and love a -- like are tell -- ing
What yon woe and suf -- ferings mean.

}

wordsC = \lyricmode {
\set stanza = "3."

Oh, the sight in heaven is glo -- rious!
Man in right -- eous -- ness is there;
Once the Vic -- tim, now vic -- to -- rious,
Je -- sus lives in glo -- ry fair.
Him, who met the claims of glo -- ry,
And the need of ru -- ined man,
On the cross_– oh, won -- drous sto -- ry!
God has set at His right hand.

}

wordsD = \lyricmode {
\set stanza = "4."

Oh, what rest of soul in view -- ing
Je -- sus on the Fa -- ther’s throne!
Yea, what peace for -- ev -- er flow -- ing
From God’s rest in His own Son!
Gaz -- ing up -- ward in -- to heav -- en,
Read -- ing glo -- ry in His face,
Know -- ing that ’tis He, once giv -- en
On the cross to take my place.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
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
      \partcombine #'(2 . 9) \notesTenor \notesBass
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
