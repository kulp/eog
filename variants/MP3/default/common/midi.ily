% from http://old.nabble.com/Issue-1647-in-lilypond%3A-MIDI-skips-note-if-the-pitch-is-already-sounding-in-the-same-channel-td31563955.html
%%{% begin workaround 
% I find the workaround to be essential for proof-hearing piano pieces 
		 \context { 
			 \Score 
			 %% Begin: for versions >2.13.54 
			 % assign one MIDI channel to each Staff_performer 
			 midiChannelMapping = #'staff 
			 %% End: for versions >2.13.54 
		 } 
		 % create a different Staff_performer (sic) for each *Voice* 
		 % so that you get one MIDI channel per Voice 
		 \context { 
			 \Staff 
			 \remove "Staff_performer" 
		 } 
		 \context { 
			 \Voice 
			 \consists "Staff_performer" 
		 } 
%%}% end workaround 
	
