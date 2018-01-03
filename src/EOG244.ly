\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "244"
  title = "One Priest Alone Can Pardon Me"
  tunename = ""
  meter = "P. M."
  poet = "Adelaide A. Procter" % see https://hymnary.org/text/one_priest_alone_can_pardon_me
  composer = "H. Bennett" % not found at hymnary.org
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 4
  \autoBeamOff
}

% The overabundant tweaks are a hurried workaround for undesired behaviours from \partcombine
notesSoprano = {
\global
\relative c'' {

  c4^\markup{\italic{Andante–legato.}} | bes8[ a] g[ f] a[ g] f[ e] | f4 \grace { g16[ f] } e8[ d] c4
  f4 | g a bes d | <a \tweak font-size #-4 f>2( <g \tweak font-size #-4 e>4)
  \eogbreak
  c4 | bes8[ a] g[ f] a[ g] f[ e] | f4 \grace { g16[ f] } e8[ d] c4
  f4 | g a c8[ bes] a[ g] | f2.
  \eogbreak
  f'4 | e d c e8[ d] | <c \tweak font-size #-4 f,>4 <bes \tweak font-size #-4 e,> \tb <a \tweak font-size #-4 f>\fermata \ta
  g4 | a bes c e8[ d] | a4 a8.[ g16] f4

  \bar "|."

}
}

notesAlto = {
\global
\override NoteHead.font-size = #-4
\relative e' {

  s4 | s1 | s2.
  \tweak font-size #-4 c4 | \tweak font-size #-4 d4 <\tweak font-size #-4 f \tweak font-size #-4 c>4 <\tweak font-size #-4 g \tweak font-size #-4 d>2 | \tweak font-size #-4 r4 \tweak font-size #-4 c, \tweak font-size #-4 r % original has d2
  \tweak font-size #-4 c4 | \tweak font-size #-4 d8[ \tweak font-size #-4 c] \tweak font-size #-4 bes[ \tweak font-size #-4 a] \tweak font-size #-4 c[ \tweak font-size #-4 bes] \tweak font-size #-4 a[ \tweak font-size #-4 g] | \tweak font-size #-4 a4 \tweak font-size #-4 c8[ \tweak font-size #-4 bes] \tweak font-size #-4 a4
  \tweak font-size #-4 c4 | \tweak font-size #-4 d4 <\tweak font-size #-4 f \tweak font-size #-4 c>4 <\tweak font-size #-4 g \tweak font-size #-4 d> <\tweak font-size #-4 e \tweak font-size #-4 bes> | <\tweak font-size #-4 c \tweak font-size #-4 a>2. % original has d2
  <\tweak font-size #-4 a' \tweak font-size #-4 f>4 | <\tweak font-size #-4 a \tweak font-size #-4 e> <\tweak font-size #-4 bes \tweak font-size #-4 f> \tweak font-size #-4 f <\tweak font-size #-4 bes \tweak font-size #-4 f> | \tweak font-size #-4 c,2 ~ \tweak font-size #-4 c4
  <\tweak font-size #-4 e \tweak font-size #-4 c>4 | \tweak font-size #-4 c8[ \tweak font-size #-4 f] \tweak font-size #-4 e[ \tweak font-size #-4 d] <\tweak font-size #-4 f \tweak font-size #-4 c>4 <\tweak font-size #-4 bes \tweak font-size #-4 f>4 | \tweak font-size #-4 f <\tweak font-size #-4 e \tweak font-size #-4 bes>4 \tweak font-size #-4 a,

}
}

notesTenor = {
\global
\override NoteHead.font-size = #-4
\relative a {

  a4 | \tweak font-size #-4 d8[ \tweak font-size #-4 c] \tweak font-size #-4 bes[ \tweak font-size #-4 a] \tweak font-size #-4 c[ \tweak font-size #-4 bes] \tweak font-size #-4 a[ \tweak font-size #-4 g] | \tweak font-size #-4 a4 \tweak font-size #-4 c8[ \tweak font-size #-4 bes] a4
  a4 | bes4 a g bes, | c2.
  r4 | f2 c | f2 ~ f4
  a4 | bes a g c, | f2.
  d'4 | c bes a bes | a g f
  c4 | f g a bes | <\tweak font-size #-4 c \tweak font-size #-4 a> c, f

}
}

notesBass = {
\global
\override NoteHead.font-size = #-4
\relative f {

  f4 | \tweak font-size #-4 f2 \tweak font-size #-4 c | \tweak font-size #-4 f f4
  a,4 | bes a g bes, | c2.
  r4 | f2 c | f2 ~ f4
  a4 | bes a g c, | f2.
  d'4 | c bes a bes | a g f_\fermata
  c4 | f g a bes | <\tweak font-size #-4 f' \tweak font-size #-4 c> c, f

}
}

wordsA = \lyricmode {
\set stanza = "1."

One Priest a -- lone can par -- don me, \bar "."
Or bid me, “Go in peace,” \bar "."
Can breathe that word, “Ab -- sol -- vo te,” \bar "."
And make these heart -- throbs cease; \bar "."
My soul has heard His priest -- ly voice; \bar "."
It said, “I bore thy sins; re -- joice!” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He showed the spear -- mark in His side,
The nail -- print on His palm;
Said, “Look on Me, the Cru -- ci -- fied;
Why trem -- ble thus? Be calm!
All pow’r is Mine— I set thee free—
Be not a -- fraid— Ab -- sol -- vo te.”

}

wordsC = \lyricmode {
\set stanza = "3."

By Him my soul is pu -- ri -- fied,
Once lep -- rous and de -- filed;
Cleansed by the wa -- ter and the blood,
God sees me as a child:
No priest can heal or cleanse but He;
No oth -- er say, “Ab -- sol -- vo te.”

}

wordsD = \lyricmode {
\set stanza = "4."

He robed me in a priest -- ly dress,
That I might in -- cense bring
Of prayer, and praise, and right -- eous -- ness,
To heaven’s e -- ter -- nal King;
And when He gave this robe to me,
He smiled and said, “Ab -- sol -- vo te.”

}

wordsE = \markuplist {

\line { In heaven He stands before the throne, }
\line { { \hspace #2 } The great High Priest above, }
\line { “Melchisedec”—that One alone }
\line { { \hspace #2 } Can sin’s dark stain remove; }
\line { To Him I look on bended knee, }
\line { And hear that sweet “Absolvo te.” }

}

wordsF = \markuplist {

\line { “A little while” and He shall come }
\line { { \hspace #2 } Forth from the inner shrine, }
\line { To call His pardoned brethren home; }
\line { { \hspace #2 } Oh bliss supreme, divine! }
\line { When every blood-bought child shall see }
\line { The Priest who said, “Absolvo te.” }

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

\markup { \vcenter \column {
  \vspace #1
  \fill-line {
    \null
    \line{ \bold 5 \column { \wordsE } }
    \null
    \line{ \bold 6 \column { \wordsF } }
    \null
  }
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
