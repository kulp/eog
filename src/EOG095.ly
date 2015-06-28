\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "I Have A Glorious Saviour"
  subsubtitle = "(Beneath the Cross of Jesus. 7. 6. 8. 6. 8. 6. 8. 6)"
  %meter = "7.6.8.6.8.6.8.6."
  poet = "Charlotte Gipps"
  composer = "Ira D. Sankey"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { c4 | c4. c8 c4 c4 | c2 c4 }
patternAB = { c4 | c4. c8 c4 c4 | c4. c8 c4 }
patternAC = { c8 c8 | c4 c4 c4 c4 | c4. c8 c4 }

patternBA = { c4 | c4. c8 c4 c4 | c2 ~ c4 }
patternBB = { c4 | c4 c4 c8[ c8] c8[ c8] | c2. }
patternBC = { c4 | c4 c4 c4      c8[ c8] | c2. }
patternBD = { c4 | c4 c4 c4      c4      | c2. }
patternBE = { c8 c8 | c4. c8 c4 c4 | c2. }

global = {
  \include "common/overrides.ily"
  %\override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { bes | bes bes a bes | ees bes }
  \changePitch \patternBA { g | bes bes aes f | g g }
  \changePitch \patternAB { bes | bes bes a bes | ees bes bes }
  \changePitch \patternBA { g | bes bes aes d, | ees ees }

  \changePitch \patternAB { g | f e f c' | bes g bes }
  \changePitch \patternBB { g | f bes bes a d c | bes }
  \changePitch \patternAC { bes( aes) | g g bes bes | ees ees c }
  \changePitch \patternBE { d( c) | bes bes aes d, | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { g | g g fis g | g g }
  \changePitch \patternBA { ees | g g f d | ees ees }
  \changePitch \patternAB { g | g g fis g | g g g }
  \changePitch \patternBA { ees | ees ees f bes, | bes bes }

  \changePitch \patternAB { ees | d cis d aes' | g ees g }
  \changePitch \patternBC { ees | d d ees f ees | d }
  \changePitch \patternAC { d( f) | ees ees f f | g g aes }
  \changePitch \patternBE { bes( aes) | ees ees f bes, | bes }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes | bes bes c bes | bes bes }
  \changePitch \patternBA { bes | bes bes bes bes | bes bes }
  \changePitch \patternAB { bes | bes bes c bes | bes bes bes }
  \changePitch \patternBA { bes | g g bes aes | g g }

  \changePitch \patternAB { bes | bes bes bes bes | bes bes bes }
  \changePitch \patternBD { bes | bes bes c a | bes }
  \changePitch \patternAC { bes ~ bes | bes bes bes bes | g g aes }
  \changePitch \patternBE { aes ~ aes | g g bes aes g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees | ees ees ees ees | ees ees }
  \changePitch \patternBA { ees | bes bes bes bes | ees ees }
  \changePitch \patternAB { ees | ees ees ees ees | ees ees ees }
  \changePitch \patternBA { ees | bes bes bes bes | ees ees }

  \changePitch \patternAB { ees | bes bes bes bes | ees ees ees }
  \changePitch \patternBD { ees | f f f f | bes, }
  \changePitch \patternAC { bes ~ bes | ees ees d d | c c aes }
  \changePitch \patternBE { aes ~ aes | bes bes bes bes | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

I have a glo -- rious Sav -- iour, \bar "."
Who died up -- on the tree; \bar "." \break
My sins He bare, and suf -- fered there \bar "."
The wrath of God for me! \bar "." \break
And my sal -- va -- tion now is sure \bar "."
Since Christ the work has done, \bar "." \break
For God de -- clares, in right -- eous -- ness, \bar "."
He owes it to His Son. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

’Twas God who sent this Sav -- iour,
This spot -- less Lamb, Who died;
And trust -- ing in His pre -- cious blood
I’m free -- ly just -- i -- fied.
Ah! not for me by deeds of law
Sal -- va -- tion could be won:
Of grace a -- lone, thro’ right -- eous -- ness,
God saves me by His Son.

}

wordsC = \lyricmode {
\set stanza = "3."

O, Je -- sus is my Sav -- iour;
“The Might -- y God!” His name;
To seek and save the lost and vile
As Son of Man He came.
In all His great a -- ton -- ing work
The will of God is done;
And God de -- lights in right -- eous -- ness
To bless me by His Son.

}

wordsD = \lyricmode {
\set stanza = "4."

He is the ris -- en Sav -- iour,
A -- live for -- ev -- er -- more;
He loves to ease the bur -- dened heart
Of each whose sins He bore.
Be -- lieve— and God’s sal -- va -- tion sure
Is free to ev -- ery -- one:
In man -- i -- fest -- ed right -- eous -- ness
He hon -- ors thus His Son.

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

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
