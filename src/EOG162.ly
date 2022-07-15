\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  % decrease system-to-system padding to fit onto page with previous score
  \include "override/override-EOG162.ily"
}

\header{
  hymnnumber = "162"
  title = "O Lord! ’Tis Joy to Look Above"
  tunename = "Communion" % see https://hymnary.org/tune/communion_jenks
  meter = "C. M."
  poet = "James G. Deck" % see https://hymnary.org/text/o_lord_tis_joy_to_look_above
  composer = "Stephen Jenks" % see https://hymnary.org/tune/communion_jenks
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key aes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees4 | aes2 c8[ bes] | aes2 c4 | bes4( aes) f | ees2
  ees4 | aes2 c8[ bes] | aes4.( bes8) c4 | ees2
  ees,4 | aes2 c8[ bes] | aes2 c4 | bes( aes) f | ees2 % original has impossible whole note at end of line here
  ees'4 | ees( c) aes8[ bes] | c2 bes4 | aes2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c4 | ees2 ees8[ des] | c4( des) ees | f2 des4 | c2
  bes4 | ees( f) ees8[ des] | c4.( ees8) ees4 | g2
  ees4 | ees2 ges4 | ges4( f) ees | e( f) d | ees2
  g4 | aes( ges) f | ees( aes) g | aes2

}
}

notesTenor = {
\global
\relative a {

  ees4 | ees( aes) g | aes2 aes4 | aes2 aes4 | aes2
  g4 | aes2 g4 | aes4.( g8) aes4 | bes2
  g4 | aes( c) ees | ees( des) c | c2 bes8[ aes] | g2
  bes4 | aes4( ees') des | aes( c) des | c2

}
}

notesBass = {
\global
\relative f, {

  aes4 | c2 ees4 | f2 c4 | des2 des4 | aes2
  ees'8[ des] | c4( des) ees | f4.( ees8) aes4 | ees2
  ees8[ des] | c2 aes4 | des2 aes'4 | g( f) bes, | ees2
  des!4 | c2 des4 | ees2 ees4 | aes,2

}
}

wordsA = \lyricmode {
\set stanza = "1."

O Lord! ’tis joy to look a -- bove, \bar "."
And see Thee on the throne, \bar "." \eogbreak
To search the heights and depths of love \bar "."
Which Thou to us hast shown, \bar "." % blue book puts full stop, but next stanza is not a complete sentence

}

wordsB = \lyricmode {
\set stanza = "2."

To look be -- yond the long dark night,
And hail the com -- ing day,
When Thou to all Thy saints in light,
Thy glo -- ries wilt dis -- play.

}

wordsC = \lyricmode {
\set stanza = "3."

And, oh! ’tis joy the path to trace,
By Thee so meek -- ly trod;
Learn -- ing of Thee to walk in grace,
And fel -- low -- ship with God.

}

wordsD = \lyricmode {
\set stanza = "4."

Joy to con -- fess Thy bless -- ed name,
The vir -- tues of Thy blood,
And to the wear -- ied heart pro -- claim,
Be -- hold the Lamb of God!

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
