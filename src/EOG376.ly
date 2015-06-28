\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "Now Have I Seen Thee and Found Thee"
  subsubtitle = "(P. M.)"
  %meter = "P.M."
  poet = "Henry Suso"
  composer = "Uncertain"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=126 }
tb = { \tempo 4=63  }

patternAA = { c4 | c4 c4 c4 c4 c4 c4 | c4 c2. ~ c4 }
patternAB = { c4 | c4 c4 c4 c4 c4 c4 | c2. ~ c2 }
patternAC = { c4 | c4 c4 c4 c4 c4 c4 | c4( c4 c4 c2) }
patternBA = { c8[ c8] | c4 c4 c4 c4 c4 c4 | c2. ~ c2 }
patternBB = { c4      | c4 c4 c4 c4 c4 c4 | c2. ~ c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees | c' bes aes aes( g) f | ees aes aes }
  \changePitch \patternBA { bes bes | c( bes) c ees( des) c | bes bes }
  \changePitch \patternAA { ees, | c' bes aes aes( g) f | ees aes aes }
  \changePitch \patternBB { bes | c bes c des( c) bes | aes aes }

  \changePitch \patternAB { aes | bes bes bes des( c) bes | c c }
  \changePitch \patternBB { c | c bes c ees( des) c | bes bes }
  \changePitch \patternAA { ees, | c' bes aes aes( g) f | ees aes aes }
  \changePitch \patternBB { bes | c bes c des( c) bes | aes aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees | ees ees ees f( ees) des | c ees ees }
  \changePitch \patternBA { g g | aes( g) aes aes( g) aes | g g }
  \changePitch \patternAA { ees | c des ees f( ees) des | c ees ees }
  \changePitch \patternBB { fes | ees ees aes g( ees) ees | ees ees }

  \changePitch \patternAB { aes | g g g bes( aes) g | aes aes }
  \changePitch \patternBB { aes | aes g aes aes( g) aes | g g }
  \changePitch \patternAA { ees | c des ees f( ees) des | c ees ees }
  \changePitch \patternBB { fes | ees ees aes g( ees) ees | ees ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { ees | aes g aes aes ~ aes aes | aes c c }
  \changePitch \patternBA { ees ees | ees ~ ees ees ees ~ ees c | ees ees }
  \changePitch \patternAA { ees, | aes g aes des ~ des aes | aes c c }
  \changePitch \patternBB { aes | aes des c bes( ees) des | c c }

  \changePitch \patternAB { c | ees ees ees ees ~ ees ees | ees ees }
  \changePitch \patternBB { ees | ees ees ees ees ~ ees ees | ees ees }
  \changePitch \patternAA { ees, aes g aes des ~ des aes | aes c c }
  \changePitch \patternBB { aes | aes des c bes( ees) des | c c }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees | aes, bes c des ~ des des | aes aes' aes }
  \changePitch \patternBA { ees ees | aes( g) aes c( bes) aes | ees ees }
  \changePitch \patternAA { ees | aes, bes c des ~ des des | aes aes' aes }
  \changePitch \patternBB { des, | ees ees ees ees ~ ees ees | aes, aes }

  \changePitch \patternAC { aes' | ees ees ees ees ~ ees ees | aes, c ees aes }
  \changePitch \patternBB { aes | aes g aes c( bes) aes | ees ees }
  \changePitch \patternAA { ees | aes, bes c des ~ des des | aes aes' aes }
  \changePitch \patternBB { des, | ees ees ees ees ~ ees ees | aes, aes }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Now have I seen Thee and found Thee, \bar "."
For Thou hast found Thy sheep, \bar "." \break
I fled, but Thy love would fol -- low, \bar "."
I strayed but Thy love would keep, \bar "." \break
Thou’st grant -- ed my heart’s de -- sire, \bar "."
Most bless’d of the { \mon } bless -- ed { \moff } is he, \bar "." \break
Who find -- eth no { \mon } rest and { \moff } no sweet -- ness, \bar "."
Till he rest -- eth, { \mon } O Lord, { \moff } in Thee. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

To Thee, Lord, my heart un -- fold -- eth,
{ \mon } As the rose to { \moff } the gold -- en sun;
To Thee, Lord, mine arms are cling -- ing,
The e -- ter -- nal joy’s be -- gun,
For -- ev -- er, thro’ end -- less { \mon } a -- ges, { \moff }
Thy cross and Thy { \mon } sor -- rows { \moff } shall be,
The glo -- ry, the { \mon } song and { \moff } the sweet -- ness,
That makes heav -- en, { \mon } heav -- en { \moff } to me.

}

wordsC = \lyricmode {
\set stanza = "3."

Let one in his { \mon } in -- no -- cence { \moff } glo -- ry,
An -- { \mon } o -- ther { \moff } in { \mon } works he { \moff } has done;
Thy blood is my claim and ti -- tle,
Be -- sides it, O Lord I’ve none.
The Scorned, the { \mon } De -- spised, the Re -- ject -- ed, { \moff }
Thou’st come to this heart of mine,
In Thy robes of { \mon } e -- ter -- nal { \moff } glo -- ry,
Thou wel -- com -- est me to Thine.

}

wordsD = \lyricmode {
\set stanza = "4."

The hart pant -- eth { \mon } af -- ter { \moff } the wa -- ters,
The { \mon } dy  -- ing, for life that { \moff } de -- parts;
The Lord in His { \mon } glo -- ry { \moff } for sin -- ners,
For the love of { \mon } re -- bel -- lious { \moff } hearts.
Call back all the { \mon } days of the a -- ges, { \moff }
All rain -- drops come { \mon } down from { \moff } a -- bove;
All flow -- ers { \mon } of sum -- mers de -- part -- { \moff } ed,
But think not to { \mon } mea -- sure { \moff } His love.

}

wordsE = \markuplist {

\line { Behold Him, O soul, where He told it, }
\line { Pale, bleeding, and bearing thy sin; }
\line { He knocking, said, “Open, beloved, }
\line { I pray thee to let Me come in! }

\line { Behold, I have borne all the judgment, }
\line { Thy sins, O beloved, are gone; }
\line { Forgotten, forgotten forever, }
\line { If sought for, God findeth not one. }

}

wordsF = \markuplist {

\line { “Behold, with what labor I won thee, }
\line { Behold in My hands and My feet, }
\line { The tale of My measureless sorrow— }
\line { Of love that made sorrow so sweet. }

\line { A flax-thread in oceans of fire }
\line { How soon swallowed up would it be; }
\line { { \italic { Yet sooner in oceans of mercy, } } }
%{
% workaround for getlyrics.pl
\line { Yet sooner in oceans of mercy, }
%}
\line { The sinner that cometh to Me.” }

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

\markup { \fill-line { \column {
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } } %\combine \null \vspace #0.4
} } }

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
