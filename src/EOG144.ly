\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG144.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 164." } }
}

\header{
  hymnnumber = "144"
  title = "“A Little While” – The Lord Shall Come"
  tunename = "Sweet Hour of Prayer"
  meter = "L. M. D."
  poet = "James G. Deck" % see https://hymnary.org/text/a_little_while_our_lord_shall_come
  composer = "William B. Bradbury" % see https://hymnary.org/tune/sweet_hour_of_prayer_sweet_hour_bradbury
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=60 }
tb = { \tempo 4=30 }

patternAA = { c8 c4 }
patternAB = { c8 | c4 c8 c8[ c8] c8 | c4 c8 c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d | fis g a a | b cis d }
  \changePitch \patternAB { b | a fis fis e d | e fis e }
  \changePitch \patternAA { d | fis g a a | b cis d } % same as line 1
  \changePitch \patternAA { b | a fis fis d | fis e d }

  \changePitch \patternAA { a' | d cis d b | a fis a }
  \changePitch \patternAA { a  | d cis d b | a fis e }
  \changePitch \patternAA { d | fis g a a | b cis d } % same as lines 1,3
  \changePitch \patternAA { b | a fis fis d | fis e d } % same as line 4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d | d e fis fis | g a b }
  \changePitch \patternAB { g | fis d d cis d | cis d cis }
  \changePitch \patternAA { d | d e fis fis | g a b }
  \changePitch \patternAA { g | fis d d d | d cis d }

  \changePitch \patternAA { fis | fis g a g | fis d fis }
  \changePitch \patternAA { fis | fis g a g | fis d cis }
  \changePitch \patternAA { d | d e fis fis | g a b }
  \changePitch \patternAA { g | fis d d d | d cis d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { fis | a a a d | d d d }
  \changePitch \patternAB { d | d a a g fis | a a a }
  \changePitch \patternAA { fis | a a a d | d d d }
  \changePitch \patternAA { d | d a a a | a g fis }

  \changePitch \patternAA { a | a a a d | d a a }
  \changePitch \patternAA { a | a a a d | d a a }
  \changePitch \patternAA { fis | a a a d | d d d }
  \changePitch \patternAA { d | d a a a | a g fis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { d | d d d d | g g g }
  \changePitch \patternAA { g | d d d d | a a a }
  \changePitch \patternAA { d | d d d d | g g g }
  \changePitch \patternAA { g | d d d fis | a a, d }

  \changePitch \patternAA { d | d e fis g | d d d }
  \changePitch \patternAA { d | d e fis g | d d a }
  \changePitch \patternAA { d | d d d d | g g g }
  \changePitch \patternAA { g | d d d fis | a a, d }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“A lit -- tle while”_– the Lord shall come, \bar "."
And we shall wan -- der here no more; \bar "."
He’ll take us to His Fa -- ther’s home, \bar "."
Where He for us is gone be -- fore_– \bar "."
To dwell with Him, to see His face, \bar "."
And sing the glo -- ries of His grace. \bar "."
%{HIDE>%} To dwell with Him to see His face, \bar "." %{<HIDE%}
%{HIDE>%} And sing the glo -- ries of His grace. \bar "." %{<HIDE%}

}

wordsB = \lyricmode {
\set stanza = "2."

“A lit -- tle while”_– He’ll come a -- gain;
Let us the pre -- cious hours re -- deem;
Our on -- ly grief to give Him pain,
Our joy to serve and fol -- low Him.
Watch -- ing and read -- y may we be,
As those that wait their Lord to see.
%{HIDE>%} Watch -- ing and read -- y may we be, %{<HIDE%}
%{HIDE>%} As those that wait their Lord to see. %{<HIDE%}

}

wordsC = \lyricmode {
\set stanza = "3."

“A lit -- tle while”_– ’twill soon be past:
Why should we shun the prom -- ised cross?
Oh, let us in His foot -- steps haste,
Count -- ing for Him all else but loss;
For how will re -- com -- pense His smile,
The suf -- ferings of this “lit -- tle while.”
%{HIDE>%} For how will re -- com -- pense His smile, %{<HIDE%}
%{HIDE>%} The suf -- ferings of this “lit -- tle while.” %{<HIDE%}

}

wordsD = \lyricmode {
\set stanza = "4."

“A lit -- tle while”_– come, Sav -- iour, come!
For Thee Thy bride has tar -- ried long;
Take Thy poor wait -- ing pil -- grims home,
To sing the new e -- ter -- nal song,
To see Thy glo -- ry, and to be
In ev -- ’ry -- thing con -- formed to Thee!
%{HIDE>%} To see Thy glo -- ry, and to be, %{<HIDE%}
%{HIDE>%} In ev -- ’ry -- thing con -- formed to Thee! %{<HIDE%}

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
