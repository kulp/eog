\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  \include "override/override-EOG044.ily"
}

\header{
  %gospel
  hymnnumber = "44"
  title = "Just as I Am — Without One Plea"
  tunename = "Woodworth"
  meter = "L. M." % original has 8. 8. 8. 6.
  poet = "Charlotte Elliot" % see https://hymnary.org/text/just_as_i_am_without_one_plea
  composer = "William B. Bradbury" % see https://hymnary.org/tune/woodworth_bradbury
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8[ c8] | c2 c4 | c4.( c8) c4 | c4.( c8) c4 | c2       }
patternAB = { c8[ c8] | c2 c4 | c2       c4 | c2       c4 | c2       }
patternAC = { c4      | c2 c4 | c2       c4 | c2       c4 | c2       }
patternAD = { c8[ c8] | c2 c4 | c4.( c8) c4 | c2       c4 | c4.( c8) }
patternAE = { c8[ c8] | c2 c4 | c4.( c8) c4 | c2       c4 | c2       }
patternAF = { c8[ c8] | c2 c4 | c2       c4 | c2       c4 | c4.( c8) }
patternAG = { c4      | c2 c4 | c4.( c8) c4 | c2       c4 | c2       }
patternBA = { c4 | c4( c4) c4 | c2 c4 | c2 c4 | c2 }
patternBB = { c4 | c2      c4 | c2 c4 | c2 c4 | c2 }
patternCA = { c4 | c2 c4 | c4.( c8) c4 | c2. | c2. | c2. ~ | c2 }
patternCB = { c4 | c2 c4 | c2       c4 | c2. | c2. | c2. ~ | c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees f | g g | bes aes g | f g aes | g }
  \changePitch \patternBA { bes | bes f g | aes c | c bes | g }
  \changePitch \patternAD { ees f | g g | bes aes g | c c | ees d }
  \changePitch \patternCA { c | bes bes | bes aes g | f | bes | g | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees f | ees ees | g f ees | d ees f | ees }
  \changePitch \patternBB { g | f ees | f aes | aes g | ees }
  \changePitch \patternAE { ees f | ees ees | g f ees | aes aes | aes }
  \changePitch \patternCA { aes | g g | g f ees | d | d | ees | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { g aes | bes bes | bes bes | bes bes | bes }
  \changePitch \patternBB { ees | d bes | bes d | ees ees | bes }
  \changePitch \patternAF { g aes | bes bes | bes ees | ees ees | c d }
  \changePitch \patternCB { ees | ees ees | bes bes | bes | bes | bes | bes }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAC { ees | ees ees | ees ees | bes bes | ees }
  \changePitch \patternBB { ees | bes' bes | bes bes, | ees ees | ees }
  \changePitch \patternAG { ees | ees ees | ees f g | aes aes | aes }
  \changePitch \patternCB { aes | ees ees | ees ees | bes' bes, | ees | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Just as I am— with -- out one plea, \bar "."
But that Thy blood was shed for me, \bar "." \eogbreak
And that Thou bid’st me come to Thee: \bar "."
O Lamb of God, I come! I come! \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Just as I am— and wait -- ing not
To rid my soul of one dark blot,
To Thee, whose blood can cleanse each spot:
O Lamb of God, I come! I come!

}

wordsC = \lyricmode {
\set stanza = "3."

Just as I am— poor, wretch -- ed, blind,
Sight, rich -- es, heal -- ing of the mind,
Yea, all I need in Thee to find:
O Lamb of God, I come! I come!

}

wordsD = \lyricmode {
\set stanza = "4."

Just as I am— Thou wilt re -- ceive,
Wilt wel -- come, par -- don, cleanse, re -- lieve;
Be -- cause Thy prom -- ise I be -- lieve:
O Lamb of God, I come! I come!

}

wordsE = \lyricmode {
\set stanza = "5."

Just as I am— Thy love, I own,
Has bro -- ken ev -- ’ry bar -- rier down:
Now to be Thine, yea, Thine a -- lone,
O Lamb of God, I come! I come!

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
