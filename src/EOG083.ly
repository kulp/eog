\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 4) (#t #f))
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 349." } }
}

\header{
  %gospel
  hymnnumber = "83"
  title = "Everlasting Glory"
  tunename = "Maccabeus"
  meter = "11. 11. 11. 11."
  poet = "H. K. Burlingham"
  composer = "Handel"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=100 }
tb = { \tempo 4=50  }

patternAA = { c4. c8 c4. c8 | c2 c2 }

patternBA = { c8[ c8] c8[ c8] c4 c4 | c1 }
patternBB = { c4      c4      c4 c4 | c1 }

patternCA = { c8[ c8] c8[ c8] c4 c4 | c2 c2 }
patternCB = { c4      c4      c4 c4 | c2 c2 }

patternDA = { c4      c4 c4. c8 | c1 }
patternDB = { c8[ c8] c4 c4  c4 | c1 }
patternDC = { c4      c4 c4  c4 | c1 }
patternDD = { c4 c8[ c8] c4  c4 | c1 }
patternDE = { c4 c8[ c8] c4. c8 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key e \major
  \autoBeamOff
}

notesSopranoA = {
\global
\relative c'' {

  \changePitch \patternAA { b a gis a | b e, }
  \changePitch \patternBA { fis gis a b a gis | fis }
  \changePitch \patternCA { gis a b cis b b | e b }
  \changePitch \patternDA { a gis fis e | e }

  \bar "|."

}
}

notesSopranoB = {
\relative c'' {

  \changePitch \patternCA { gis fis gis a gis gis | fis e }
  \changePitch \patternBB { a gis fis e | dis }
  \changePitch \patternCA { e dis e fis e e | cis' ais }
  \changePitch \patternDE { b cis b ais b | b }

	\bar "."

}
}

notesAltoA = {
\global
\relative e' {

  \changePitch \patternAA { e fis e fis | gis e }
  \changePitch \patternBA { dis e fis gis fis e | dis }
  \changePitch \patternCB { e e e e | e e }
  \changePitch \patternDB { cis dis e e dis | e }

}
}

notesAltoB = {
\relative e' {

  \changePitch \patternCA { e dis e fis e e | dis cis }
  \changePitch \patternBB { fis e dis cis | bis }
  \changePitch \patternCA { cis bis cis dis cis cis | e e }
  \changePitch \patternDD { dis e dis cis e | dis }

}
}

notesTenorA = {
\global
\relative a {

  \changePitch \patternAA { gis a b a | gis b }
  \changePitch \patternBB { b b b b | b }
  \changePitch \patternCB { b b b b | b gis }
  \changePitch \patternDC { a b b a | gis }

}
}

notesTenorB = {
\relative a {

  \changePitch \patternCB { b b b b | a gis }
  \changePitch \patternBB { bis cis a gis | gis }
  \changePitch \patternCB { gis gis gis gis | ais cis }
  \changePitch \patternBB { b gis fis fis | fis }

}
}

notesBassA = {
\global
\relative f {

  \changePitch \patternAA { e fis gis fis | e gis }
  \changePitch \patternBB { b b, dis e | b }
  \changePitch \patternCA { e fis gis a gis gis | gis e }
  \changePitch \patternDD { fis gis a b b, | e }

}
}

notesBassB = {
\relative f {

  \changePitch \patternCB { e e e e | b cis }
  \changePitch \patternBB { dis e fis cis | gis' }
  \changePitch \patternCB { cis, cis cis cis | fis fis }
  \changePitch \patternBB { gis e fis fis, | b }

}
}

Refrain = \lyricmode {

%LYRICS Ev -- er -- last -- ing glo -- ry
%{HIDE>%} { \override LyricText.font-size = #-1 \override Lyrics.LyricText.font-shape = #'italic } \markup{{\super{★}}Ev} -- er -- last -- ing glo -- ry %{<HIDE%} \bar "."
Un -- to Je --  sus be! \bar "."
Sing a -- loud the sto -- ry \bar "."
Of His vic -- to -- ry! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Ev -- er -- last -- ing glo -- ry \bar "."
Un -- to Je --  sus be! \bar "."
Sing a -- loud the sto -- ry \bar "."
Of His vic -- to -- ry! \bar "|."
How He left the splen -- dor \bar "."
Of His home on high, \bar "."
Came in love so ten -- der, \bar "."
On the cross to \markup{ die.{\super{★}}} \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Yes! He came from heav -- en,
Suf -- fered in our stead;
Praise to Him be giv -- en,
“First -- born from the dead!”
Je -- sus, meek and low -- ly,
Came the lost to save;
He the Vic -- tim ho -- ly
Tri -- umphed o’er the \markup{ grave.{\super{★}}}

}

wordsC = \lyricmode {
\set stanza = "3."

We in death were ly -- ing,
Lost in hope -- less gloom;
Je -- sus by His dy -- ing
Van -- quished e’en the tomb!
Burst its i -- ron por -- tal,
Rolled a -- way the stone,
Rose in life im -- mor -- tal
To the Fa -- ther’s \markup{ throne.{\super{★}}%{workaround for weird bug in getlyrics.pl%}}

}

wordsD = \lyricmode {
\set stanza = "4."

Christ is Lord of glo -- ry,
Sing we now to -- day!
Tell a -- broad the sto -- ry,
Own His right -- ful sway!
Sing a -- loud, and nev -- er
Cease to spread His fame;
Tri -- umph, now and ev -- er,
In the Sav -- iour’s \markup{ name.{\super{★}}}

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \partcombine #'(2 . 9) { \notesSopranoA \notesSopranoB } { \notesAltoA \notesAltoB }
      \context NullVoice = sopranos { \voiceOne { \notesSopranoA \notesSopranoB } }
      \context NullVoice = altos { \voiceTwo { \notesAltoA \notesAltoB } }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) { \notesTenorA \notesTenorB } { \notesBassA \notesBassB }
      \context NullVoice = tenors { \voiceOne { \notesTenorA \notesTenorB } }
      \context NullVoice = basses { \voiceTwo { \notesBassA \notesBassB } }
    >>
	\new Lyrics \with { alignBelowContext = men } \lyricsto sopranos \Refrain
  >>
  \layout {
    \include "common/layout.ily"
  }
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne { \notesSopranoA \notesSopranoB \notesSopranoA } }
      \context Voice  = altos { \voiceTwo { \notesAltoA \notesAltoB \notesAltoA } }
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \context Voice  = tenors { \voiceOne { \notesTenorA \notesTenorB \notesTenorA } }
      \context Voice  = basses { \voiceTwo { \notesBassA \notesBassB \notesBassA } }
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
