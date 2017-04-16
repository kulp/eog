\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  systems-per-page = #(cond (is-eogsized 5) (#t #f))
}

\header{
  hymnnumber = "49"
  title = "Verily, Verily"
  tunename = ""
  meter = "P. M."
  poet = "James McGranahan"
  composer = "James McGranahan"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4 c8   c8 c8 c8 c8 c8 | c4 c4 c2 }
% None of the lines actually use the tie ; why is it there ?
%patternAB = { c4 c8 ~ c8 c8 c8 c8 c8 | c4 c4 c2 }
patternAB = { \patternAA }
patternBA = { c4 c8 c8 c4 c4 | c1 }
patternCA = { c8. c16 c4 c8. c16 c4 | c8 c8 c8 c8 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g g a g fis e d | g a b }
  \changePitch \patternAA { a a b a g fis g | a b c }
  \changePitch \patternAB { b d d c b a g | fis e c' }
  \changePitch \patternBA { e d c b a | g }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { b c d b c d | e d c b c } >>
  \changePitch \patternCA { a b c a b c | d c b a b }
  \changePitch \patternAA { b d d c b a g | fis e c' }
  \changePitch \patternBA { e d c b a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d d d d c b | d d d }
  \changePitch \patternAA { d d d d d d d | d d d }
  \changePitch \patternAB { d g g g d c b | c c e}
  \changePitch \patternBA { g g e d d | d }

  \changePitch \patternCA { g a b g a b | c b a g a }
  \changePitch \patternCA { fis g a fis g a | g fis g d d }
  \changePitch \patternAA { d g g fis g d d | c c e }
  \changePitch \patternBA { g g e d d | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b b c b a g g | g fis g }
  \changePitch \patternAA { fis fis g c b a g | fis g fis }
  \changePitch \patternAB { g b b a g fis g | g g g }
  \changePitch \patternBA { g a a d c | b }

  \changePitch \patternCA { g g g g g g | fis g fis g fis }
  \changePitch \patternCA { d' d d d d d | b a g fis g }
  \changePitch \patternAA { g b b a g fis g | g g g }
  \changePitch \patternBA { g g g g c | b }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { g g g g g g g | b d g }
  \changePitch \patternAA { d d d d d d d | a g d' }
  \changePitch \patternAB { g g g g g d e | c c c }
  \changePitch \patternBA { c c c d d | g, }

  \changePitch \patternCA { g' g g g g g | d d d d d }
  \changePitch \patternCA { d d d d d d | d d d d g, }
  \changePitch \patternAA { g g g g g g b | c c c }
  \changePitch \patternBA { c b c d d | g, }

}
}

Refrain = \lyricmode {

“Ver -- i -- ly, ver -- i -- ly, I say un -- to you, \bar "."
Ver -- i -- ly, ver -- i -- ly,” mes -- sage ev -- er new; \bar "."
“He that be -- liev -- eth on the Son,” ’tis true, \bar "."
{ \italicsOn } “Hath { \italicsOff } ev -- er -- last -- ing life.” \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

O what a Sav -- iour that He died for me!
From con -- dem -- na -- tion He hath made me free;
“He \mon that be -- \moff liev -- eth on the Son,” saith He,
{ \italicsOn } “Hath { \italicsOff } ev -- er -- last -- ing life.”

}

wordsB = \lyricmode {
\set stanza = "2."

All my in -- iq -- ui -- ties on Him were laid,
All my in -- debt -- ed -- ness by Him was paid;
All \mon who be -- \moff lieve on Him, the Lord hath said,
{ \italicsOn } “Hath { \italicsOff } ev -- er -- last -- ing life.”

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Tho’ poor and need -- y, I can trust my Lord,
Tho’ weak and sin -- ful, I be -- lieve His word;
O \mon bless -- ed \moff mes -- sage! ev -- ’ry child of God,
{ \italicsOn } “Hath { \italicsOff } ev -- er -- last -- ing life.”


}

wordsD = \lyricmode {
\set stanza = "4."

Tho’ all un -- wor -- thy, yet I will not doubt,
For him that com -- eth, He will not cast out,
“He \mon that be -- \moff liev -- eth,” O! the good news shout,
% XXX the opening quote isn't quite close enough to the \caps Hath
%LYRICS “Hath ev -- er -- last -- ing life.”
%{HIDE>%} \markup{ “\caps Hath } ev -- er -- last -- ing life.” %{<HIDE%}

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
