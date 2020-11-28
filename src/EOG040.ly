\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "40"
  title = "The Gospel of Thy Grace"
  tunename = ""
  meter = "6. 6. 6. 6. 8. 8. 8." % original has 6. 6. 6. 6. 8. 8.
  poet = "Arthur T. Pierson" % see https://hymnary.org/text/the_gospel_of_thy_grace
  composer = "James McGranahan" % see https://hymnary.org/tune/the_gospel_of_thy_grace_mcgranahan
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

lyricsInvis = { \override LyricText.stencil = ##f \override LyricHyphen.stencil = ##f }
lyricsVis = { \revert LyricText.stencil \revert LyricHyphen.stencil }

patternAA = { c4 | c4. c8 c4 c4 | c2( c4) }
patternAB = { c4 | c4. c8 c4 c4 | c2.     }
patternBA = { c4 | c4 c4 c4 c4 | c2.        }
patternBB = { c4 | c4 c4 c4 c4 | c4( c4 c4) }
patternCA = { c4 | c4. c8 c4 c4 | c4. c8 c4 }
patternCB = { c4 | c4. c8 c4 c4 | c4  c4 c4 }
patternDA = { c4      | c4.( c8 c4) c4 | c2.         c4 | c2 c2      | c2. }
patternDB = { c4      | c4.( c8 c4) c4 | c4.( c8 c4) c4 | c2 c4( c4) | c2. }
patternDC = { c4      | c2.         c4 | c4.( c8 c4) c4 | c2 c4( c4) | c2. }
patternDD = { c8[ c8] | c4.( c8 c4) c4 | c4.( c8 c4) c4 | c2 c2      | c2. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d | g a b c | d b }
  \changePitch \patternBA { g | b a g fis | g }
  \changePitch \patternBA { g | fis g a b | c }
  \changePitch \patternBA { b | a d d cis | d }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { d | e dis e cis | d cis d } >>
  \changePitch \patternCB { b | c b c a | b g a }
  \changePitch \patternDA { d, | g a b c | d c | b a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { d | d fis g a | g }
  \changePitch \patternBA { g | g fis g d | d }
  \changePitch \patternBA { d | d d fis g | a }
  \changePitch \patternBA { g | fis fis g g | fis }

  \changePitch \patternCA { g | g g g g | g g g }
  \changePitch \patternCB { g | a gis a fis | g g fis }
  \changePitch \patternDB { d | d fis g fis | g a b a | g fis d | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b | b c d c | b d }
  \changePitch \patternBA { d | d c b a | b }
  \changePitch \patternBA { b | a b c d | d }
  \changePitch \patternBA { d | d a a a | a }

  \changePitch \patternCA { b | c b c ais | b ais b }
  \changePitch \patternCB { d | d d d d | d d d }
  \changePitch \patternDC { d | d d | d c b e | d d c | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { g | g g g g | g  }
  \changePitch \patternBA { b, | d d d d | g, }
  \changePitch \patternBB { g | d' d d d | d e fis }
  \changePitch \patternBA { g | a a a, a | d }

  \changePitch \patternCA { g | c, c c e | g g g }
  \changePitch \patternCB { g | d d d d | g b, d }
  \changePitch \patternDD { d c | b d g a | b a g c, | d d | g, }

}
}

RefrainA = \lyricmode {

That who -- so -- ev -- er will be -- lieve \bar "."
Shall ev -- er -- last -- ing \break life re -- ceive— \bar "." % \break is appropriate in letter version as well as eogsized
Shall ev -- er -- last -- ing life re -- ceive!

}

RefrainB = \lyricmode {

For who -- so -- ev -- er will be -- lieve \bar "."
Shall ev -- er -- last -- ing %{HIDE>%} \lyricsInvis %{<HIDE%} life re -- ceive— \bar "."
Shall ev -- er -- last -- ing life re -- ceive! %{HIDE>%} \lyricsVis %{<HIDE%}

}

RefrainC = \lyricmode {

That who -- so -- ev -- er will be -- lieve \bar "."
Shall ev -- er -- last -- ing %{HIDE>%} \lyricsInvis %{<HIDE%} life re -- ceive— \bar "."
Shall ev -- er -- last -- ing life re -- ceive! %{HIDE>%} \lyricsVis %{<HIDE%}

}

RefrainD = \lyricmode {

For who -- so -- ev -- er will be -- lieve \bar "."
Shall ev -- er -- last -- ing %{HIDE>%} \lyricsInvis %{<HIDE%} life re -- ceive— \bar "."
Shall ev -- er -- last -- ing life re -- ceive! %{HIDE>%} \lyricsVis %{<HIDE%}

}

wordsA = \lyricmode {
\set stanza = "1."

The gos -- pel of Thy grace \bar "."
My stub -- born heart has won; \bar "." \eogbreak
For God so loved the world, \bar "."
He gave His on -- ly Son, \bar "." \eogbreak
\RefrainA

}

wordsB = \lyricmode {
\set stanza = "2."

The ser -- pent “lift -- ed up”
Could life and heal -- ing give;
So Je -- sus on the cross
Once died that we might live:
\RefrainB

}

wordsC = \lyricmode {
\set stanza = "3."

“The soul that sin -- neth dies”:
My aw -- ful doom I heard;
I was for -- ev -- er lost
But for Thy gra -- cious word
\RefrainC

}

wordsD = \lyricmode {
\set stanza = "4."

“Not to con -- demn the world”
The “Man of Sor -- rows” came;
But that the world might have
Sal -- va -- tion thro’ His name:
\RefrainD

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
