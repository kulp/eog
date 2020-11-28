\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG087.ily"
}

\header{
  %gospel
  hymnnumber = "87"
  title = "Hark! Hark! The Voice of Christ"
  tunename = "Pilgrims" % see https://hymnary.org/tune/pilgrims_smart
  meter = "11. 10. 11. 10. with Refrain"
  poet = "H. D’Arcy Champney"
  composer = "Henry T. Smart" % see https://hymnary.org/tune/pilgrims_smart
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=140 }
tb = { \tempo 2=70  }

patternAA = { c1 c2 c2 | c1. c2 | c2 c2 c2 c2 | c1 c1 }
patternAB = { c1 c2 c2 | c1  c1 | c2 c2 c2 c2 | c1 c1 }

patternBA = { c1 c2 c2 | c1. c2 | c2 c2 c2 c2 | c\breve }
patternBB = { c1 c2 c2 | c1  c1 | c2 c2 c2 c2 | c\breve }

patternCA = { c1 c2 c2 | c1 c1 | c1      c2 c2 | c\breve }
patternCB = { c1 c2 c2 | c1 c1 | c2( c2) c2 c2 | c\breve }

patternDA = { c1      c2 c2 | c2( c2) c2 c2 | c2 c2 c2 c2 | c\breve }
patternDB = { c2( c2) c2 c2 | c1      c2 c2 | c2 c2 c2 c2 | c\breve }
patternDC = { c1      c2 c2 | c1      c2 c2 | c2 c2 c2 c2 | c\breve }

patternEA = { c1 c2 c2 | c2 c2 c2 c2 | c1  c1 | c\breve }
patternEB = { c1 c2 c2 | c2 c2 c2 c2 | c1. c2 | c\breve }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key e \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { gis b a | gis fis | e fis gis a | gis fis }
  \changePitch \patternBA { b e dis | cis b | a fis gis a | fis }
  \changePitch \patternAA { gis b a | gis fis | e fis gis ais | cis b }
  \changePitch \patternEB { cis dis cis | b fis gis cis | b ais | b }

  \eogbreak
  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { fis gis a | b e, | cis' b a | gis } >>
  \changePitch \patternDA { e' dis cis | b gis e a | gis gis a fis | e }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { e fis fis | e dis | e dis e fis | e dis }
  \changePitch \patternBA { e e e | e e | dis fis e fis | dis }
  \changePitch \patternAB { e e fis | e dis | e dis e e | fis fis }
  \changePitch \patternEA { e fis fis | fis fis e gis | fis e | dis }

  \changePitch \patternCA { dis dis dis | e e | e dis dis | e }
  \changePitch \patternDA { e fis fis | gis b, cis fis | e e dis dis | e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b b b | b a | gis gis cis cis | b b }
  \changePitch \patternBA { b gis b | a b | b b b cis | b }
  \changePitch \patternAB { b b cis | b a | gis gis cis cis | fis, b }
  \changePitch \patternEB { b b ais | b b b e | dis cis | b }

  \changePitch \patternCB { b b b | b b | a gis fis fis | e }
  \changePitch \patternDB { a cis b a | gis a cis | b b fis a | gis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { e dis dis | e b | cis cis cis a | b b }
  \changePitch \patternBA { gis' e gis | a gis | fis dis e a, | b }
  \changePitch \patternAA { e | gis, a | b bis | cis cis cis cis | dis dis }
  \changePitch \patternEB { gis fis e | dis dis e cis | fis fis | b, }

  \changePitch \patternCA { a' %{ original has a-natural here ?! %} a a | gis gis, | a b b | cis  }
  \changePitch \patternDC { cis dis dis | e a fis | b b b, b | e }

}
}

Refrain = \lyricmode {

Mes -- sage of Je -- sus, mes -- sage of love, \bar "."
Tell -- ing of wel -- come to that bright home a -- bove. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Hark! hark! the voice of Christ, the sin -- ner’s Sav -- iour, \bar "."
In glo -- ry { \eogpagebreak } seat -- ed on His Fa -- ther’s throne, \bar "." % an ungainly way to keep only one system on the first page
Tell -- ing of love and ev -- er -- last -- ing fa -- vor \bar "."
For sin -- ners far from God, by sin un -- done. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

It is the voice of Him now crowned with glo -- ry,
Tell -- ing of life for “who -- so -- ev -- er will”;
How sweet the sound of that en -- tranc -- ing sto -- ry,
Which tells of love for guilt -- y sin -- ners still.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Blest words! They speak to us of God’s sal -- va -- tion,
Worked out by Christ a -- lone up -- on the cross,
Who by His blood re -- deems from ev -- ery na -- tion,
And saves His peo -- ple from e -- ter -- nal loss.

}

wordsD = \markuplist {

\line { Now, weary souls, who rest and peace are seeking, }
\line { { \hspace #2 } Who long for One to meet their deepest need, }
\line { Hear in the Word the voice of Jesus speaking, }
\line { { \hspace #2 } And trust in Him who makes them free indeed. }

}

wordsE = \markuplist {

\line { Soon Jesus’ voice of love may cease appealing, }
\line { { \hspace #2 } And in your face the door of mercy close. }
\line { Spurn not the voice of Him with heart so feeling, }
\line { { \hspace #2 } Who proved His love by dying for His foes. }

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

\markup { \fontsize #0.3 \fill-line { \vcenter \column {
  \vspace #1
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } }
} } }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
