\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 155." } }
}

\header{
  %children
  hymnnumber = "308"
  title = "I Love to Hear the Story"
  tunename = ""
  meter = "7. 6. 7. 6. D."
  poet = "Emily H. Miller"
  composer = "G. F. Root"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=120
  \key f \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  c8 | f f f f | a8.[ g16] f8
  f8 | g g f e | f4. \eogbreak
  f8 | a a a a | c8.[ bes16] a8
  a8 | g c c b | c4. \eogbreak

  c8 | d c bes a | c8.[ bes16] g8
  g8 | a f e f | g4. \eogbreak
  c,8 | f f f f | a8.[ g16] f8
  f8 | g g f e | f4. \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c8 | c c c c | c4 c8
  c8 | d d c c | c4.
  f8 | f f f f | g4 f8
  f8 | e g f f | e4.

  f8 | f f f f | e4 e8
  e8 | f c c c | e4.
  c8 | c c c c | c4 c8
  c8 | d d c c | c4.

}
}

notesTenor = {
\global
\relative a {

  c8 | a a a a | c8.[ bes16] a8
  a8 | bes bes a g | a4.
  a8 | c c c c | c4 c8
  c8 | c e d g, | g4.

  a8 | bes a g f | g4 c8
  c8 | c c bes a | c4.
  c8 | a a a a | c8.[ bes16] a8
  a8 | bes bes a g | a4.

}
}

notesBass = {
\global
\relative f {

  c8 | f f f f | f4 f8
  f8 | bes, bes c c | f4.
  f8 | f f f f | e4 f8
  f8 | g g g g | c,4.

  f8 | f f f f | c4 c8
  c8 | f a g f | c4.
  c8 | f f f f | f4 f8
  f8 | bes, bes c c | f4.

}
}

wordsA = \lyricmode {
\set stanza = "1."

I love to hear the sto -- ry \bar "."
Which an -- gel voi -- ces tell, \bar "."
How once the King of Glo -- ry \bar "."
Came down on earth to dwell; \bar "."
I am both weak and sin -- ful, \bar "."
But this I sure -- ly know; \bar "."
The Lord came down to save me, \bar "."
Be -- cause He loved me so. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I’m glad my bless -- ed Sav -- iour
Was once a child like me,
To show how pure and ho -- ly
His lit -- tle ones might be;
And I should try to fol -- low
His foot -- steps here be -- low;
He nev -- er will for -- get me,
Be -- cause He loved me so.

}

wordsC = \lyricmode {
\set stanza = "3."

To sing His love and mer -- cy,
My sweet -- est songs I’ll raise,
And tho’ I can -- not see Him,
I know He bears my praise;
For He has kind -- ly prom -- ised
That I shall sure -- ly go
To sing with His re -- deemed ones,
Be -- cause He loved me so.

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
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
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
