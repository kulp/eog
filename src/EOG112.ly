\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "112"
  title = "Only a Sinner"
  tunename = "Only a Sinner" % see https://hymnary.org/tune/only_a_sinner_towner
  meter = "P. M."
  poet = "James M. Gray" % see https://hymnary.org/text/naught_have_i_gotten_but_what_i_received
  composer = "Daniel B. Towner" % see https://hymnary.org/tune/only_a_sinner_towner
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { \ta c4 c8. c16 c8 c4 c8 | c4 c8. c16 c2 }
patternAB = { \ta c4 c8. c16 c8 c4 c8 | c4 c8. c16 c8 c4 }

patternBA = { \ta c4 c8. c16 c8 c4. | c4 c8. c16 c4. }

patternCA = { \ta c8 | c4 c8. c16 c8 c4. | c4 c4 c2 }

patternDA = { \ta c4 c8. c16 c8 c4. | c4 c4 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g e f g c b | a c a g }
  \changePitch \patternAA { f d e f b a | g a f e }
  \changePitch \patternBA { g e f g c | d a a d }
  \changePitch \patternCA { c | b b a g c | d b c }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternDA { g g g a g | c, d e } >>
  \changePitch \patternDA { g c c d c | c d \tb e \fermata \ta }
  \changePitch \patternAB { e e d d c c | c c a a g }
  \changePitch \patternCA { g | a c a g c | d b c }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e c d e e g | f a f e }
  \changePitch \patternAA { d d d d f f | f f d c }
  \changePitch \patternBA { e c d e e | f f f fis }
  \changePitch \patternCA { fis | g f! f e g | a g g }

  \changePitch \patternDA { e e e f e | c b c }
  \changePitch \patternDA { e e e f e | e a gis }
  \changePitch \patternAB { g! g f f e e | a a f f e }
  \changePitch \patternCA { e | f a f e g | a g e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g g g g g c | c c c c }
  \changePitch \patternAA { b b c d d b | b b g g }
  \changePitch \patternBA { c g g c c | a d d a }
  \changePitch \patternCA { a | g d' b c e | f d e }

  \changePitch \patternDA { c c c c c | g g g }
  \changePitch \patternDA { g g g g g | a a b }
  \changePitch \patternAB { c c c g g g | f f c' c c }
  \changePitch \patternCA { c | c c c c e | f d c }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c c c c c e | f f f c }
  \changePitch \patternAA { g' g g g g g | g g g c, }
  \changePitch \patternBA { c c c c c | f f f d }
  \changePitch \patternCA { d | g g g c, c | f g c, }

  \changePitch \patternDA { c c c c c | e d c }
  \changePitch \patternDA { c c c c c | a' f e_\fermata }
  \changePitch \patternAB { c c c c c c | f f f c c }
  \changePitch \patternCA { c | f f f c c | f g c, }

}
}

Refrain = \lyricmode {

On -- ly a sin -- ner saved by grace! \bar "."
On -- ly a sin -- ner saved by grace! \bar "."
This is my sto -- ry, to God be the glo -- ry, \bar "."
I’m on -- ly a sin -- ner saved by grace! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Naught have I got -- ten but what I re -- ceived, \bar "."
Grace hath be -- stowed it since I have be -- lieved; \bar "."
Boast -- ing ex -- clud -- ed, pride I a -- base; \bar "."
% explicit break is desired in eogsized and letter
I’m on -- ly a sin -- ner \break \bar "." %LYRICS saved by grace!

}

wordsB = \lyricmode {
\set stanza = "2."

Once I was fool -- ish, and sin ruled my heart,
Caus -- ing my foot -- steps from God to de -- part;
Je -- sus hath found me, hap -- py my case;
I now am a sin -- ner saved by grace! \bar "."

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Tears un -- a -- vail -- ing, no mer -- it had I;
Mer -- cy had saved me, or else I must die;
Sin had a -- larmed me fear -- ing God’s face,
But now I’m a sin -- ner %LYRICS saved by grace!

}

wordsD = \lyricmode {
\set stanza = "4."

Suf -- fer a sin -- ner whose heart o -- ver -- flows,
Lov -- ing his Sav -- iour to tell what he knows;
Once more to tell it would I em -- brace_–
I’m on -- ly a sin -- ner %LYRICS saved by grace!

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
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
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
