\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "107"
  title = "Oh, Do Not Let the Word Depart"
  tunename = ""
  meter = "L. M. with Refrain"
  poet = "Mrs. E. Reed"
  composer = "Ira D. Sankey"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternA = { c4 c4 c4 | c2. c4 c4. c8 | c2. }
patternB = { c4 c4 c4 | c4 c4 c2 c2 | c2. }
patternC = { c4 c4. c8 | c2. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 2.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { bes g aes | bes g g f | ees }
  \changePitch \patternB { ees aes g | aes c bes g | f }
  \changePitch \patternA { f f f | bes aes g f | g }
  \changePitch \patternA { g aes c | bes g g f | ees }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternC { bes' g aes | bes bes c bes ees } >>
  \changePitch \patternA { ees ees ees | d c g a! | bes }
  \changePitch \patternC { bes g aes | bes bes aes bes | ees }
  \changePitch \patternA { ees ees c | bes g g f | \tb ees \fermata \ta } % XXX this tempo change is not respected

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { ees ees ees | ees ees ees d | ees }
  \changePitch \patternB { ees ees ees | ees ees ees ees | d }
  \changePitch \patternA { d d d | d f ees d | ees }
  \changePitch \patternA { ees ees ees | ees ees ees d | ees }

  \changePitch \patternC { g ees f | g ees ees ees | g }
  \changePitch \patternA { g g g | f f ees f | d }
  \changePitch \patternC { ees ees ees | ees ees ees ees | g }
  \changePitch \patternA { ees aes aes | g ees ees d | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g ees f | g bes bes aes | g }
  \changePitch \patternB { g c bes | aes aes g bes | bes }
  \changePitch \patternA { bes bes bes | f bes bes bes | bes }
  \changePitch \patternA { bes aes aes | g bes bes aes | g }

  \changePitch \patternC { ees ees ees | ees g aes g | bes }
  \changePitch \patternA { bes bes bes | bes a! c f, | f }
  \changePitch \patternC { g ees f | g g aes g | bes }
  \changePitch \patternA { bes c ees | ees bes bes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { ees ees ees | ees ees bes bes | ees }
  \changePitch \patternB { ees ees ees | c aes ees' ees | bes }
  \changePitch \patternA { bes bes bes | bes bes bes bes | ees }
  \changePitch \patternA { des c aes | bes bes bes bes | ees }

  \changePitch \patternC { ees ees ees | ees ees ees ees | ees }
  \changePitch \patternA { ees ees ees | f f f f | bes, }
  \changePitch \patternC { ees ees ees | ees ees ees ees | ees }
  \changePitch \patternA { g aes aes | bes bes bes, bes | \tb ees_\fermata \ta }

}
}

Refrain = \lyricmode {

Why not to -- night? Why not to -- night? \bar "."
Thou wouldst be saved: Why not to -- night? \bar "."
Why not to -- night? Why not to -- night? \bar "."
Thou wouldst be saved: Why not to -- night? \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Oh, do not let the word de -- part, \bar "."
And close thine eye a -- gainst the light! \bar "."
Poor sin -- ner, har -- den not thine heart; \bar "."
Thou wouldst be saved: Why not to -- night? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

To -- mor -- row’s sun may nev -- er rise
To bless thy long -- de -- lud -- ed sight;
This is the time, oh, then, be wise;
Thou wouldst be saved: Why not to -- night?

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Our God in pit -- y lin -- gers still,
And wilt thou thus His love re -- quite?
Re -- nounce at length thy stub -- born will;
Thou wouldst be saved: Why not to -- night?

}

wordsD = \lyricmode {
\set stanza = "4."

The world has noth -- ing new to give,
It has no true, no pure de -- light.
Look now to Je -- sus Christ and live!
Thou wouldst be saved: Why not to -- night?

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
