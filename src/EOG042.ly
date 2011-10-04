\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "The Great Physician"
  subsubtitle = "(P. M.)"
  %meter = "P.M."
  poet = "Wm. Hunter"
  composer = "Arr. by J. H. Stockton"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }
tc = { \tempo 4=60 }

patternAA = { \ta c8 | c4 c8 c4 c8 | c4 c8 \tb c4 \ta }
patternAB = { \ta c8 | c4 c8 c4 c8 | c4.       c4     }
patternAC = { \ta c8 | c4 c8 c4 c8 | c4 c8     c4     }
patternAD = { \ta c8 | c4 c8 c4 c8 | c4.       c4.    }
patternAE = { \ta      c4 c8 c4 c8 | c4 c8     c4.    }

patternBA = { \ta c8[ c8] c8 c4 c8 | c4 c8 c4. }
patternBB = { \ta c4      c8 c4 c8 | c4 c8 c4. }

% \tc for ritardando
patternCA = { \tc c4 c8 c4 c8 | c4. c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 6/8
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { bes^\markup { \dynamic p } | bes g ees f | g aes bes \fermata }
  \changePitch \patternAB { bes | bes ees, g ees | f ees }
  \changePitch \patternAC { bes' | bes g ees f | g aes bes }
  \changePitch \patternAD { bes | bes ees, g ees | f ees }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBA { bes' c d ees bes | d c bes } >>
  \changePitch \patternBA { bes c d ees bes | d c bes }
  \changePitch \patternAE { bes g ees f | g aes bes }
  \changePitch \patternCA { bes^\markup { \italic rit. } ees, g ees | f ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { g | g ees bes d | ees f g }
  \changePitch \patternAB { g | g bes, ees bes | d ees }
  \changePitch \patternAC { g | g ees bes d | ees f g }
  \changePitch \patternAD { g | g bes, ees bes | d ees }

  \changePitch \patternBB { g | g g g | bes aes g }
  \changePitch \patternBB { g | g g g | bes aes g }
  \changePitch \patternAE { g ees bes d | ees f g }
  \changePitch \patternCA { g bes, ees bes | d ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes | bes bes g bes | bes bes bes }
  \changePitch \patternAB { bes | bes g bes g | aes g }
  \changePitch \patternAC { bes | bes bes g bes | bes bes bes }
  \changePitch \patternAD { bes | bes g bes g | aes g }

  \changePitch \patternBB { bes bes bes ees | ees ees ees }
  \changePitch \patternBB { bes bes bes ees | ees ees ees }
  \changePitch \patternAE { ees bes g bes | bes bes bes }
  \changePitch \patternCA { bes g bes g | aes g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees | ees ees ees bes | ees ees ees \fermata }
  \changePitch \patternAB { ees | ees ees ees ees | bes ees }
  \changePitch \patternAC { ees | ees ees ees bes | ees ees ees }
  \changePitch \patternAD { ees | ees ees ees ees | bes ees }

  \changePitch \patternBB { ees ees ees ees | aes aes ees }
  \changePitch \patternBB { ees ees ees ees | aes aes ees }
  \changePitch \patternAE { ees ees ees bes | ees ees ees }
  \changePitch \patternCA { ees ees ees ees | bes ees }

}
}

Refrain = \lyricmode {

“Sweet -- est note in ser -- aph song, \bar "."
Sweet -- est car -- ol ev -- er sung, \bar "." \break
Sweet -- est name on mor -- tal tongue, \bar "."
Je -- sus, Je -- sus, Je -- sus.” \bar "." \break

}

wordsA = \lyricmode {
\set stanza = "1."

The great Phy -- si -- cian now is near, \bar "."
The sym -- pa -- thiz -- ing Je -- sus; \bar "." \break
He speaks, the droop -- ing heart to cheer, \bar "."
O, hear the voice of Je -- sus. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Your man -- y sins are all for -- giv’n;
O, hear the voice of Je -- sus;
Go on your way in peace to heav’n,
And wear a crown with Je -- sus.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

All glo -- ry to the ris -- en Lamb!
I now be -- lieve in Je -- sus;
I love the bless -- ed Sav -- iour’s name,
I love the name of Je -- sus.

}

wordsD = \lyricmode {
\set stanza = "4."

His name dis -- pels my guilt and fear,
No oth -- er name but Je -- sus;
O, how my soul de -- lights to hear
The pre -- cious name of Je -- sus.

}

wordsE = \lyricmode {
\set stanza = "5."

The child -- ren, too, both great and small,
Who love the name of Je -- sus,
May now ac -- cept the gra -- cious call
To work and live for Je -- sus.

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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

%\markup { \fill-line { \column {
%  \line{ \bold 5 \column { \wordsE } } \vspace #0.4
%  \line{ \bold 6 \column { \wordsF } } \vspace #0.4
%  \line{ \bold 7 \column { \wordsG } } \vspace #0.4
%  \line{ \bold 8 \column { \wordsH } } \vspace #0.4
%} } }

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
