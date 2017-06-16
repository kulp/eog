\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
  systems-per-page = #(cond (is-eogsized 4) (#t #f))
  system-count = #(cond (is-eogsized 7) (#t #f))
}

\header{
  %gospel
  hymnnumber = "65"
  title = "Christ Is the Only Saviour"
  tunename = "The Lifeboat"
  meter = "P. M."
  poet = "H. d’A. Champney"
  composer = "P. P. Bliss"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4 c8. c16 c8 c8 c8 c8 | c4 c8. c16 c2 }
patternAB = { c4 c8. c16 c8 c8 c8 c8 | c4 c8  c8  c2 }
patternAC = { c4 c8. c16 c4 c8.  c16 | c4 c8. c16 c2 }
patternAD = { c4 c8. c16 c8 c8 c8 c8 | c8 c8 c8 c8 c2 }
patternAE = { c8 c8 c8. c16 c8 c8 c8 c8 | c4 c8. c16 c2 }

patternBA = { c8 c8 c8 c8 c8 c8 c8 c8 | c4 c8. c16 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \autoBeamOff
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAC { g g g g g g | g g g fis }
  \changePitch \patternAA { fis a g fis fis fis fis | fis fis fis g }
  \changePitch \patternAD { d g g g g g g | g g fis f e }
  \changePitch \patternBA { e e e e e e e e | fis d d d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAC { b g a b g a | b c b d }
  \changePitch \patternAA { a fis g a a a a | a d d d }
  \changePitch \patternAD { b d e d d d b | b b d d c }
  \changePitch \patternBA { c c c c c c c c | a c c b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAC { g g g g g g | g g g d }
  \changePitch \patternAA { d d d d d d d | d d d g }
  \changePitch \patternAD { g g g g g g g | g g g g c, }
  \changePitch \patternBA { c c c c c c c c | d d d g, }

}
}

Refrain = \lyricmode {

Christ is the Sav -- iour, He nev -- er will fail; \bar "."
All hope to save one -- self could noth -- ing a -- vail; \bar "."
Man is a to -- tal wreck, can nev -- er reach the shore. \bar "." \eogbreak
All who trust in Je -- sus Christ are saved ev -- er -- more. \bar "."

}

notesSopranoRefrain = {
\global
\relative c' {

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAC { d' b c d b c | d e d a  } >>
  \changePitch \patternAA { c a b c c c d | e d c b }
  \changePitch \patternAD { d, b' c b a b d | g, g a b c }
  \changePitch \patternBA { c b a gis a b c e | d fis, fis g }

  \bar "|."

}
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d b' c b a b d | g, b b a }
  \changePitch \patternAE { a a a gis a b c d | e d c b } % patternAA in the original, but nonsensical
  \changePitch \patternAB { d, b' c b a b d | g, a b c }
  \changePitch \patternBA { c b a gis a b c e | d fis, fis g }

  \bar "||"

}
}

notesRightHand = {
\global
\override Stem.direction = #UP
\relative e' {

r4 < b d g >4 < b d g >4 < b d g >4 | r4 < b d g >4 < a d fis >2
r4 < a d fis >4 < a d fis >4 < a d fis >4 | r4 < c d fis >4 < b d g >2
r4 < b d g >4 < b d g >4 < b d g >4 | r4 < b d f >4 < g c e >2
r4 < c e g >4 < c e g >4 < c e g >4 | r4 < a c d fis >4 < b d g >2

}
}

notesLeftHand = {
\global
\override Stem.direction = #UP
\clef bass
\relative f, {

< g g' >2. r4 | < g g' >4 r4 < d d' >2
< d d' >2. r4 | < d d' >4 r4 < g g' >2
< g g' >2. r4 | < g g' >4 r4 < c, c' >2
< c c' >2. r4 | < d d' >4 r4 < g g' >2

}
}

wordsA = \lyricmode {
\set stanza = "1."

Christ is the on -- ly Sav -- iour might -- y to save, \bar "."
He who suf -- fered once for sins, and sank neath the wave, \bar "."
Sing how the wrath of God on Calv’ry’s cross he bore; \bar "."
How by death He con -- quered death and lives ev -- er -- more. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Christ in that hour of dark -- ness, lost ones to save,
Brav’d Him -- self the o -- cean depths, and bat -- tled the wave;
Though all Je -- ho -- vah’s bil -- lows rolled o’er His head,
Son of Man and Son of God, He rose from the dead.

}

wordsC = \lyricmode {
\set stanza = "3."

O, what a might -- y Sav -- iour, Je -- sus who died!
Strong e -- nough to bear His own above the an -- gry tide; % a -- bove ?
Not e’en the feeb -- lest saint will Christ ev -- er fail,
Nev -- er will the gates of hell a -- gainst Him pre -- vail.

}

wordsD = \lyricmode {
\set stanza = "4."

O bles -- sed ris -- en Sav -- iour, liv -- ing to -- day!
Liv -- ing too, to guide Thine own thro’ all_the storm -- y way;
None have the power to pluck Thy saints from thine hand,
Thou wilt safely bring Thine own home to the Bet -- ter Land.

}

\score {
  \context ChoirStaff {
    <<
      \context Staff = upper <<
        \set Staff.autoBeaming = ##f
        \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
        \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
        \context Lyrics = one   \lyricsto sopranos \wordsA
        \context Lyrics = two   \lyricsto sopranos \wordsB
        \context Lyrics = three \lyricsto sopranos \wordsC
        \context Lyrics = four  \lyricsto sopranos \wordsD
      >>
      \context PianoStaff = men <<
        \set ChoirStaff.printPartCombineTexts = ##f
        \context Voice  = righthand { \voiceTwo << \notesRightHand >> }
        \context Voice  = lefthand { \voiceTwo << \notesLeftHand >> }
      >>
    >>
    \once \omit Staff.TimeSignature
    \once \omit PianoStaff.TimeSignature
    \pageBreak % forced in all variants to work around gapped system issue
    <<
      \context Staff = upper <<
        \once \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
        \set Staff.autoBeaming = ##f
        \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
        \set ChoirStaff.printPartCombineTexts = ##f
        \partcombine #'(2 . 9) \notesSopranoRefrain \notesAlto
        \context NullVoice = sopranosRefrain { \voiceOne << \notesSopranoRefrain >> }
        \context Lyrics = one   \lyricsto sopranosRefrain \Refrain
      >>
      \context Staff = men <<
        \once \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
        \set Staff.autoBeaming = ##f
        \clef bass
        \set ChoirStaff.printPartCombineTexts = ##f
        \override Staff.TimeSignature.stencil = ##f
        \partcombine #'(2 . 9) \notesTenor \notesBass
      >>
    >>
  }
  \layout {
    \include "common/layout.ily"
  }
}

\score {
  \new Score {
    \context ChoirStaff <<
      \new Staff = upper <<
        \new Voice  = sopranos { \voiceOne { << \notesSoprano >> << \notesSopranoRefrain >> } }
        \new Voice  = altos { \voiceTwo { \repeat unfold 32 { \skip 4 } << \notesAlto >> } }
      >>
      \new PianoStaff = men <<
        \new Voice  = righthand { \voiceTwo << \notesRightHand >> }
        \new Voice  = lefthand { \voiceTwo << \notesLeftHand >> }
        \new Voice  = tenors { \voiceOne { \repeat unfold 32 { \skip 4 } << \notesTenor >> } }
        \new Voice  = basses { \voiceTwo { \repeat unfold 32 { \skip 4 } << \notesBass >> } }
      >>
    >>
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
