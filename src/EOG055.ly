\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "55"
  title = "Why ’Neath the Load of Your Sins Do Ye Toil?"
  tunename = ""
  meter = "P. M."
  %poet = ""
  %composer = ""
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4 c8 c8 c4 c8 c8 | c4 c8 c8           c4 c4 }
patternAB = { c4 c8 c8 c4 c8 c8 | c4 c8 c16[ c16]    c4 c4 }
patternAC = { c4 c8 c8 c4 c8 c8 | c4 c8 c8 c4 c4 \grace c4 }

patternBA = { c4 c8 c8 c4 c8 c8 | c2. c4 }
patternBB = { c4 c8 c8 c4 c8 c8 | c2  c2 }
patternBC = { c4 c8 c8 c4 c8 c8 | c2. c4 \grace c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { f f g a a bes | c d c a r }
  \changePitch \patternBA { c bes a g a g | f r }
  \changePitch \patternAA { f f g a a bes | c d( c) a r }
  \changePitch \patternBC { c bes a g a g | f c' }

  \changePitch \patternAA { c bes a g c, ~ c | bes' a g f r }
  \changePitch \patternAC { c' bes a g c, ~ c | bes' a g f f }
  \changePitch \patternAA { f f g a a bes | c d c a r }
  \changePitch \patternBB { c bes a g a g | f r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c c e f f e | f f f f r }
  \changePitch \patternBA { a g f e e e | f r }
  \changePitch \patternAA { c c e f f e | f f ~ f f r }
  \changePitch \patternBA { e g f e f e | f r }

  \changePitch \patternAA { e g f e c c | g' f e f r }
  \changePitch \patternAA { e g f e c c | g' f e f r }
  \changePitch \patternAB { c c e f f e | f f g e f r }
  \changePitch \patternBB { f g f e f e | c r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { a a c c c c | a bes a c r }
  \changePitch \patternBA { c c c c bes bes | a r }
  \changePitch \patternAA { a a c c c c | a bes( a) c r }
  \changePitch \patternBA { g c c c c bes | a r }

  \changePitch \patternAA { c c c c c, ~ c | c' c c c r }
  \changePitch \patternAA { c c c c c, ~ c | c' c bes a r }
  \changePitch \patternAA { a a c c c c | a bes bes a r }
  \changePitch \patternBB { a c c c c bes | a r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f f c f f g | f f f f r }
  \changePitch \patternBA { c c c c c c | f r }
  \changePitch \patternAA { f f c f f g | f f ~ f f r }
  \changePitch \patternBA { c e f c c c | f r }

  \changePitch \patternAA { c e f c c ~ c | e f bes a r }
  \changePitch \patternAA { c, e f c c ~ c | e c c f r }
  \changePitch \patternAA { f f c f f g | f bes, c f r }
  \changePitch \patternBB { c e f bes f c | f r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Why ’neath the load of your sins do ye toil? \bar "."
Christ giv -- eth rest, giv -- eth rest. \bar "."
Why be in sla -- ver -- y, why { \mon } Sa -- tan’s { \moff } spoil? \bar "."
You may be blest, may be blest:
Christ now in -- vites { \mon } you sweet { \moff } rest to re -- ceive, \bar "."
Heav -- y’s your bur -- { \mon } den, but { \moff } He can re -- lieve,
If but this mo -- ment in { \pageBreak } Him you be -- lieve, \bar "."
You shall have rest, shall have rest. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Why go ye on -- ward, so wear -- y and worn?
Christ giv -- eth rest, giv -- eth rest.
Why are ye hope -- less -- ly sad { \mon } and for -- { \moff } lorn?
You may be blest, may be blest.
Je -- sus the bur -- { \mon } den did { \moff } bear on the tree,
He was af -- flict -- ed for sin -- ners like thee;
If you there Christ as your Sub -- sti -- tute see,
You shall have rest, shall have rest.

}

wordsC = \lyricmode {
\set stanza = "3."

Why are ye trou -- bled when death comes in view?
Christ giv -- eth rest, giv -- eth rest.
Tho’ aft -- er death there comes judg -- ment, too
You may be blest, may be blest.
Christ bore God’s judg -- { \mon } ment, poor sin -- ners to save,
He gained the vic -- t’ry o’er death and the grave,
O, now be -- lieve Him, and life you shall have,
You shall have rest, shall have rest.

}

wordsD = \lyricmode {
\set stanza = "4."

Mon -- ey or price ye have no need to bring,
Christ giv -- eth rest, giv -- eth rest.
Why to your rage and your { \mon } pov -- er -- ty { \moff } cling?
Come and be blest, and be %{HIDE>%} \set includeGraceNotes = ##t %{<HIDE%} blest. \bar "."
A -- way with all fear, a -- way with all doubt,
Hear His own words, which none can re -- fute, \bar "."
—“Who -- e’er comes to Me, I’ll in no wise cast out;
I’ll give him rest, give him rest.” %{HIDE>%} \set includeGraceNotes = ##f %{<HIDE%}

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
