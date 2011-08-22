\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = ##f
}

\header{
  title = "On Calvary’s Cross, Behold the One"
  subsubtitle = "(Hamburg. L. M.)"
  %meter = "L.M."
  %poet = ""
  composer = "Ad. by Lowell Mason"
  %copyright = ""
  tagline = ##f
}

patternA = { c2 c4 c4 | c2 c4( c4) | c2 c4( c4) | c2. r4 } % Line 1, 3 soprano / alto / bass, Line 2 soprano / bass
patternB = { c2 c4 c4 | c2 c4( c4) | c2 c2      | c2. r4 } % Line 2 alto, Line 1, 3 bass
patternC = { c2 c4 c4 | c2 c2      | c2 c2      | c1     } % Line 4 alto and bass
patternD = { c2 c4 c4 | c4( c4) c2 | c2 c4( c4) | c1     } % Line 4 tenor
patternE = { c2 c4 c4 | c2 c2      | c2 c4( c4) | c1     } % Line 4 soprano
patternF = { c2 c4 c4 | c2 c2      | c2 c2      | c2. r4 } % Line 1, 3 tenor
patternH = { c2 c4 c4 | c2 c2      | c2 c4( c4) | c2. r4 } % Line 2 tenor

global = {
  \include "common/overrides.ily"
  %\autoBeamOff
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \once \override Score.MetronomeMark #'transparent = ##t
  \tempo 4 = 120
  \key g \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { g g a | b a b | c b a   | b r }
  \changePitch \patternA { b b b | c b a | g fis g | a r }
  \changePitch \patternA { g g a | b a b | c b a   | b r }
  \changePitch \patternE { b b b | a g   | a b a   | g   }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d d fis | g a gis | a g fis | g r   }
  \changePitch \patternB { g g g   | g g fis | g d     | fis r }
  \changePitch \patternA { d d fis | g a gis | a g fis | g r   }
  \changePitch \patternC { g g g   | fis e   | g fis   | g     }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternF { b b d | d e   | e d   | d r }
  \changePitch \patternH { d d d | e d   | d c b | d r }
  \changePitch \patternF { b b d | d e   | e d   | d r }
  \changePitch \patternD { d d d | d c b | e d c | b   }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternB { g g d | g c b | a d,  | g r }
  \changePitch \patternA { g g g | g g c | b a g | d r }
  \changePitch \patternB { g g d | g c b | a d,  | g r }
  \changePitch \patternC { g g g | d e   | c d   | g,  }

}
}

wordsA = \lyricmode {
\set stanza = "1."

On Calv’ -- ry’s cross, be -- hold the One
Who is God’s Fel -- low and His Son,
Ac -- curs -- ed there up  -- on the tree,
He died to set the guilt -- y free.

}

wordsB = \lyricmode {
\set stanza = "2."

He “knew no sin,” yet He must there
God’s right -- eous, ho -- ly judg -- ment bear,
Must suf -- fer in our guilt -- y stead,
And num -- bered be a -- mongst the dead.

}

wordsC = \lyricmode {
\set stanza = "3."

He’s ris -- en now, the work is done,
And God has glo -- ri -- fied His Son;
Has set Him in the high -- est place,
The Source of rich, un -- bound -- ed grace.

}

wordsD = \lyricmode {
\set stanza = "4."

Then to the Lord for ref -- uge fly,
For why, poor sin -- ner, wilt thou die?
Why wilt thou still re -- fuse His call?
Who seeks to save, who died for all.

}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      %\context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
