\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG126.ily"
}

\header{
  %gospel
  hymnnumber = "126"
  title = "There’s a Voice That Is Calling"
  tunename = "Sweet Bye and Bye"
  meter = "P. M." % Little Flock has 9. 9. 9. 9. Anapaestic Irr.
  poet = "Anon."
  composer = "J. P. Webster"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8.  c16  | c4 c8 c8 c4 c8. c16 c2. }
patternAB = { c8.( c16) | c4 c8 c8 c4 c8  c8  c2. }

patternBA = { c8. c16 | c2. c8. c16 c2. }
patternBB = { c8 c8 | c4 c8 c8 c4 c8 c8 | c2. }

patternCA = { c4 | c4 c8. c16 c4 c8. c16 | c4 c8 c8 c4 }
patternCB = { c8 c8 | c4 c8 c8 c4 c8 c8 | c4 c8 c8 c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g a | b a g a g e | d }
  \changePitch \patternAA { g a | b b b d d b | a }
  \changePitch \patternAA { g a | b a g a g e | d }
  \changePitch \patternAB { g a | b a g a g fis | g }

  \eogbreak
  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBA { b c | d d b a } >>
  \changePitch \patternBB { a b | c c c c b a | b }
  \changePitch \patternBA { b c | d b a g }
  \changePitch \patternBB { fis e | d g b a g fis | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d | d d d e e c | b }
  \changePitch \patternAA { d d | d d d d d g | fis }
  \changePitch \patternAA { d d | d d d e e c | b }
  \changePitch \patternAB { d d | d d d e d d | d }

  \changePitch \patternBA { g a | b b g | fis }
  \changePitch \patternBB { fis g | a a a a g fis | g }
  \changePitch \patternBA { g a | b d, d | e }
  \changePitch \patternBB { d c | b d d d d d | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b c | d c b c c g | g }
  \changePitch \patternAA { b c | d d d b b d | d }
  \changePitch \patternAA { b c | d c b c c g | g }
  \changePitch \patternAB { b c | d c b c b a | b}

  \changePitch \patternCA { r | r d d d d d | d d d d }
  \changePitch \patternCB { d d | d d d d d d | d d d d }
  \changePitch \patternCA { r | r d d d d g, | g c c c }
  \changePitch \patternBB { g g | g b d c b a | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g g | g g g c, c e | g }
  \changePitch \patternAA { g g | g g g g g g | d }
  \changePitch \patternAA { g g | g g g c, c e | g }
  \changePitch \patternAB { g g | g g g c, d d | <g g,> }

  \changePitch \patternCA { r | r g g g g g | d d d d }
  \changePitch \patternCB { d d | d d d d d d | g g g g }
  \changePitch \patternCA { r | r g g g g b, | c c c c }
  \changePitch \patternBB { c c | d d d d d d | <g g,> }

}
}

Refrain = \lyricmode {

Sin -- ner, hear and o -- bey, \bar "."
’Tis the voice of the Spir -- it that cries; \bar "."
While He strives, yield to Him, \bar "."
Do not quench the con -- vic -- tions that rise. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

There’s a voice that is call -- ing to thee, \bar "."
And it pleads with its ten -- der -- est tone, \bar "."
While it bids thee from God’s wrath to flee, \bar "."
And whis -- pers, “To Je -- sus now come!” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

There’s a Sav -- iour now wait -- ing for thee,
With His heart and His arms o -- pen wide;
Will you come, and from judg -- ment be free
{ \mon } Thro’ the { \moff } Lamb who on Cal -- va -- ry died?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

There’s a foun -- tain that’s o -- pen for thee;
Go and wash, then be clean from thy sin:
Not a spot nor a stain shall there be
{ \mon } If but { \moff } once thou art cleans -- ed there -- in.

}

wordsD = \lyricmode {
\set stanza = "4."

There’s a man -- sion in heav -- en for thee,
With its pleas -- ures that none can con -- ceive;
And e -- ter -- nal -- ly hap -- py thou’lt be
{ \mon } If thou { \moff } wilt but on Je -- sus be -- lieve.

}

underWords = \lyricmode {

{ \repeat unfold 36 { \skip 4 } }
Sin -- ner, hear { \repeat unfold 3 { \skip 4 } } and o -- bey,
{ \repeat unfold 7 { \skip 4 } }
the Spir -- it that cries;
While He strives, { \repeat unfold 3 { \skip 4 } } yield to Him,

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
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
    >>
    \context Lyrics = three \lyricsto tenors \underWords
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
