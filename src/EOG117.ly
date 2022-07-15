\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "117"
  title = "Sinner, Thine’s a Lost Condition" % not found at hymnary.org
  tunename = "" % original has "Brooklyn", but see https://hymnary.org/tune/jesus_i_my_cross_have_taken_bliss
  meter = "8. 7. 8. 7. D."
  poet = "" % not found at hymnary.org
  composer = "Philip P. Bliss" % see https://hymnary.org/tune/jesus_i_my_cross_have_taken_bliss
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternAA = { c4 c4 | c2.      c4 c4 c4                       | c2 c2 }
patternAB = { c4 c4 | c2.      c4 c4 c4                       | c1    }

patternBA = { c4 c4 | c4.( c8) c2 c4 c4                       | c4.( c8) c2 }
patternBB = { c4 c4 | c4.( c8) c2 c4 c4                       | c1          }
patternBC = { c4 c4 | c2       c2 c4 c4                       | c2       c2 }
patternBD = { c4 c4 | c2       c2 c4 c4                       | c1          }
patternBE = { c4 c4 | c2       c2 c4 \tuplet 3/2 { c8[ c8 c8] } | c1        } % original has quarters in triplet instead of eighths

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d d | g fis e g | d g }
  \changePitch \patternAB { b b | a g b a | g } \eogbreak
  \changePitch \patternAA { d d | g fis e g | d g }
  \changePitch \patternAB { b b | a g b a | g } \eogbreak

  \changePitch \patternBA { d' d | d c b e d | d c b }
  \changePitch \patternBB { c c | c b a d c | b } \eogbreak
  \changePitch \patternAA { d, d | g fis e g | d g }
  \changePitch \patternAB { b b | a g b a | g } \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { b b | b d c c | b b }
  \changePitch \patternAB { d d | c b d c | b }
  \changePitch \patternAA { b b | b d c c | b b }
  \changePitch \patternAB { d d | c b d c | b }

  \changePitch \patternBA { b' b | b a g c b | b a g }
  \changePitch \patternBB { a a | a g fis b a | g }
  \changePitch \patternAA { b, b | b d c c | b b }
  \changePitch \patternAB { d d | c b d c | b }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g g | g g g e | g g }
  \changePitch \patternAB { g g | fis g g fis | g }
  \changePitch \patternAA { g g | g g g e | g g }
  \changePitch \patternAB { g g | fis g g fis | g }

  \changePitch \patternBC { d' d | d d d d | d d }
  \changePitch \patternBD { d d | d d d d | d }
  \changePitch \patternAA { g, g | g g g e | g g }
  \changePitch \patternAB { g g | fis g g fis | g }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { g g | g b c c | g g }
  \changePitch \patternAB { g' g | d d d d | g, }
  \changePitch \patternAA { g g | g b c c | g g }
  \changePitch \patternAB { g' g | d d d d | g, }

  \changePitch \patternBC { g' g | g g g g | g g }
  \changePitch \patternBE { fis fis | fis d d d e fis | g }
  \changePitch \patternAA { g, g | g b c c | g g }
  \changePitch \patternAB { g' g | d d d d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Sin -- ner, thine’s a lost con -- di -- tion, \bar "."
Guilt -- y too be -- fore thy God; \bar "."
In thy fol -- ly thou hast wan -- dered, \bar "." % original has "has" for "hast"
Broad the road thy feet have trod. \bar "."
Death and af -- ter death the judg -- ment \bar "."
Will o’er -- take thee like a flood— \bar "."
Je -- sus on -- ly can a -- vail thee, \bar "."
Je -- sus and His pre -- cious blood. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Let the sto -- ry of His good -- ness
Win its way in thy poor heart;
From the glo -- ry He de -- scend -- ed,
Here with man to take His part.
Gra -- cious, sin -- less, on -- ward go -- ing,
To the cross with all its shame;
To the judg -- ment and for -- sak -- ing,
Due to God’s most ho -- ly name.

}

wordsC = \lyricmode {
\set stanza = "3."

Come at once, thy way for -- sak -- ing,
Own thy sins with all their shame,
Claim God’s par -- don, full, e -- ter -- nal,
Now be -- liev -- ing in His name.
Then with joy thy Lord con -- fess -- ing,
Press thou on, the glo -- ry’s thine,
Wait His com -- ing, live un -- to Him,
Let your light thus bright -- ly shine. % original has "your" but why does the number change (from "thy") ?

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
