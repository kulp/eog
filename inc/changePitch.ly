%% version 23/05/2011
#(define (defined-music? music)
   (not (eq? 'Music (ly:music-property music 'name))))

#(define (name-of music)
 (ly:music-property music 'name))

#(define (no-notes? music)
"Return false if there is at least one note in `music, true otherwise."
(let ((found? #f))
  (let loop ((evt music))
    (let ((e (ly:music-property evt 'element))
          (es (ly:music-property evt 'elements)))
      (if (ly:music? e) (loop e))
      (while (and (pair? es)(not found?))
        (if (eq? 'NoteEvent (name-of (car es)))
          (set! found? #t)
          (begin
            (loop (car es))
            (set! es (cdr es)))))
        evt))  
  (not found?)))

#(define-macro (add! lst elt)
"Add element `elt to the list `lst."
`(set! ,lst (append ,lst (list ,elt))))

#(define (first-event-is-note music)
"Explore the first containers for the very first event and return true only if
this event is a note."
(let ((res #f))
  (let loop ((evt music))
    (let ((e (ly:music-property evt 'element))
          (es (ly:music-property evt 'elements)))
      (if (ly:music? e)(loop e))
      (if (pair? es)
        (cond ((eq? 'EventChord (name-of evt)) 
                    (set! res (eq? 'NoteEvent (name-of (car es)))))
              (else (loop (car es)))))
     res))))

#(define (clean-seq-elts elements)
"Try to make a big list with no containers,with only chords"              
(fold
  (lambda (x prev-list)
     (append prev-list
        (let loop ((evt x))
          (let ((name (ly:music-property evt 'name)))
            (cond
              ((eq? name 'SequentialMusic)
                   (clean-seq-elts (ly:music-property evt 'elements)))
              ((eq? name 'RelativeOctaveMusic)
                   (ly:music-set-property! evt 'element 
                     (make-sequential-music (loop
                         (ly:music-property evt 'element))))
                   (list evt)) 
              (else (list evt)))))))
  '()            
  elements)) 

#(define (simplify-chord chord-elts)
"In the ChordEvent elements list, keeps only notes, their pitch and duration."
(map (lambda (note)    ; will delete for example the 'force-accidental property
        (let ((copy-note (ly:music-deep-copy note)))
            (make-music 'NoteEvent  
                'duration (ly:music-property copy-note 'duration)
                'pitch (ly:music-property copy-note 'pitch))))
     (filter (lambda (evt) (eq? (name-of evt) 'NoteEvent)); delete articulations
             chord-elts)))
        
#(define (join-chords-elts pattern-es replacement-es)
"Create a ChordEvent elements property list with :
    - rhythm from `pattern-es
    - pitches from `replacement-es
    - scripts, articulations etc ... from both. "
 (let ((dur (ly:music-property (car pattern-es) 'duration)))
   (append     ; note that the code below, works also if the new-note is a rest.
     (map (lambda (x)  ; copy the original rhythm in all replacement-es.
               (if (ly:duration? (ly:music-property x 'duration))
                      (ly:music-set-property! x 'duration dur))
               x)
           replacement-es)
     (filter (lambda (x) ; copy articulations, scripts etc from pattern-es
                (not (ly:duration? (ly:music-property x 'duration))))
              pattern-es))))

#(define (make-notes-list music)
"Make a list which element is either an 'elements list of an EventChord,
 either a music added with \\insert. "
(let ((res '()))     ; the list to fill
  (define (fill-notes-list evt)
    (let ((tags (ly:music-property evt 'tags)))
      (if (memq 'cPInsertInPattern tags)        ; a music added by \insert
        (begin
          (ly:music-set-property! evt 'tags
                 (delq 'cPInsertInPattern tags)); remove 'cPInsertInPattern tag
          (add! res evt))
        (let ((elt (ly:music-property evt 'element))
              (elts (ly:music-property evt 'elements)))
          (if (ly:music? elt) (fill-notes-list elt))
          (if (pair? elts)
            (cond
              ((eq? 'EventChord (name-of evt))
                    (if (memq (name-of (car elts))
                              (list 'NoteEvent 'RestEvent 'SkipEvent))
                       (add! res elts)))
              (else (for-each fill-notes-list elts))))))))
  (fill-notes-list music)
  res))

%%%%%%%%%%%% 2 macros used inside \changePitch 
#(define-macro (add-insert-music! music-list)
"Check if (car notes-list) is a music and add it to the list"
`(while (and (pair? notes-list)                ; if (car notes-list) comes from
             (ly:music? (car notes-list)))     ; an \insert music :
  (begin (add! ,music-list (car notes-list))
         (set! skip-notnote-event? #t) ; will skip all datas before the next note
         (set! notes-list (cdr notes-list))))) 
         
  % big macro used inside the inner function change-one-pattern of \changePitch       
#(define-macro (change-pat-es)
"Change the 'elements property of pat (pat-es) in the change-one-pattern
function."
`(let ((res '()))                                    ; the new list to build
  (for-each                                          ; for-each elt x of pat-es
    (lambda (x)
      (let* ((chord-es (and (eq? 'EventChord (name-of x))
                            (ly:music-property x 'elements)))
             (chord-with-notes?(and (pair? chord-es)
                                    (eq? 'NoteEvent (name-of (car chord-es))))))                  
        (if chord-with-notes?              ; x is a "note"
          (if (pair? notes-list)
            (begin        ; in notes-list, an element can be either a music or :
              (if (pair? (car notes-list)) ;<- an EventChord 'elements list
                (case (name-of (caar notes-list))
                  ((or NoteEvent RestEvent) ; join-chords-elts allows rests!
                    (ly:music-set-property! x 'elements  ; copy pitch into x
                       (join-chords-elts chord-es (if same-pitch-section?
                            (simplify-chord (car notes-list))
                            (car notes-list))))
                    (let ((tags (ly:music-property x 'tags)))
                      (cond               ; are we in a \samePitch section ?
                        ((memq 'cPSamePitch tags) ;yes, first,remove the tag
                            (ly:music-set-property! x 'tags
                                                (delq 'cPSamePitch tags))
                            (set! same-pitch-section? #t));then set the flag
                        ((memq 'cPSamePitchEnd tags);last note of \samePitch
                            (ly:music-set-property! x 'tags
                                              (delq 'cPSamePitchEnd tags))
                            (set! same-pitch-section? #f); unset the flag                  
                            (set! notes-list (cdr notes-list)))   ; next new
                        (else (set! notes-list (cdr notes-list))))) ; note
                    (add! res x)            ; add the modified note to res
                    (set! skip-notnote-event? #f)); \insert and \skip will 
                       ; delete all datas between 2 notes, so stop this here
                  ((SkipEvent) ; the new chord was a \skip : nothing will be
                    (set! skip-notnote-event? #t)    ; added until a note is
                    (set! notes-list (cdr notes-list))))); found in pattern
              (add-insert-music! res)) ; (car notes-list) is not a pair so it is
                        ;a music added with \insert. Add it to res.
              ;*** end of begin section (= note-list was not empty).
            (begin ;<- if notes-list is empty
              (add! res (make-music 'Music)); add an undefined music that we
              (set! must-filter #t)))       ; will have to filter.
          ;;; now : if x is NOT a "note" so a rest, an override, a container ...
          (let ((temp (if chord-es x (change-one-pattern x))))       
            (if (not (and (or chord-es (no-notes? temp))
                          (or skip-notnote-event? (null? notes-list))))                      
              (add! res temp))))))
    pat-es) ; end for-each
  res))     % return the new list to be assigned to pat 'elements   

                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         
                                   
changePitch = #(define-music-function (parser location pattern newnotes)
                                                          (ly:music? ly:music?)
"Change each notes in `pattern by the notes (or rests) given in `newnotes.
If count of events doesn't match, pattern is duplicated repeatedly or truncate."
;(if (eq? 'EventChord (name-of pattern)); pattern must be a "container" of chords
;        (set! pattern (make-sequential-music (list pattern))))
(if (no-notes? pattern)               ; avoid endless loops ...
  pattern
  (let ((notes-list (make-notes-list newnotes)) ; see (make-notes-list)
        (seq-list '())                          ; list of transformed patterns
        (skip-notnote-event? #f) ; set for a \skip or \insert in newnotes
        (same-pitch-section? #f); set when we enter a \samePitch section in pat
        (must-filter #f))  ; set when a music is undefined (generic name 'Music)
     (define (change-one-pattern pat) ;;; an inner function ;;;;;;;;;;;;;;;;;
        (if (eq? 'EventChord (name-of pat))
                (set! pat (make-sequential-music (list pat))))
        ;(display (name-of pat))(display "************\n")         
        (let ((pat-e (ly:music-property pat 'element))
              (pat-es (ly:music-property pat 'elements)))
          (if (ly:music? pat-e) (ly:music-set-property! pat 'element 
                                    (change-one-pattern pat-e)))
          (if (pair? pat-es)(ly:music-set-property! pat 'elements
                                    (change-pat-es))); see the big macro above
                                   
          pat))             ; return the maybe-modified pat
      ;;; end of change-one-pattern and following of the main function
   (add-insert-music! seq-list)     ; if notes-list begins with an \insert music
   (while (pair? notes-list)(begin
      (if (and (pair? (car notes-list)) ; is (car notes-list) the 'elements list 
               (eq? 'SkipEvent (name-of (caar notes-list))); of a \skip chord ?
               (not (first-event-is-note pattern)))
         (begin (set! skip-notnote-event? #t); skip all datas before the very
                (set! notes-list (cdr notes-list)); first note of the pattern
                (add-insert-music! seq-list))); is there then an \insert music ?                
            ;; now, change each notes of pattern with a new pitch ;;
      (let ((new-pat (change-one-pattern (ly:music-deep-copy pattern))))
         (if must-filter (set! new-pat (music-filter defined-music? new-pat)))
         (if (not (no-notes? new-pat))(add! seq-list new-pat)) ; the transformed 
                                         ; pattern is added to the list seq-list  
         (if (and (pair? notes-list)                  ; if we have in notes-list 
                  (pair? (car notes-list))            ; a \skip and after it 
                  (eq? 'SkipEvent (name-of (caar notes-list))); an \insert,
                  (pair? (cdr notes-list))              ; then the \insert music
                  (ly:music? (cadr notes-list)))(begin  ; will be placed between
            (set! notes-list (cdr notes-list))  ; the end of the current pattern 
            (add-insert-music! seq-list)))      ; and before the next pattern. 
         (set! skip-notnote-event? #f))))       ; ready now for the next loop...
         
   (let ((relativize (lambda(m)
            (let* ((clean-newnotes (car (clean-seq-elts (list newnotes))))
                   (name (name-of clean-newnotes)))
                (if (memq name (list 'RelativeOctaveMusic 'UnrelativableMusic))
                   (make-music name 'element m)
                   m)))))
     (case (length seq-list)
        ((0) (make-music 'Music 'void #t))
        ((1) (relativize (car seq-list)))
        (else (relativize 
                (make-sequential-music 
                    (clean-seq-elts seq-list)))))))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% enhancement functions, working with \changePitch pattern newnotes
samePitch = #(define-music-function (parser location music) (ly:music?)
"Inside the `pattern parameter of the \\changePitch function, you can group
some notes by calling this function. All grouped notes will have the same pitch,
according to the current note of the `newnotes parameter of \\changePitch."
(let((last-chord-with-note #f))
  (music-map
    (lambda (x)
      (let* ((elts (ly:music-property x 'elements))
             (chord-with-notes? (and (eq? 'EventChord (name-of x))
                                     (pair? elts)
                                     (eq? 'NoteEvent (name-of (car elts))))))
      (if chord-with-notes? (begin
        (if last-chord-with-note ;; so, not the first note
          (ly:music-set-property! x 'to-relative-callback
             (lambda (prob prev-pitch)     
               (let* ((chord-es-prob (ly:prob-property prob 'elements))
                      (note-prob (car chord-es-prob))
                      (pitch-note-prob (ly:prob-property note-prob 'pitch)))    
                 (ly:prob-set-property! note-prob 'pitch (ly:make-pitch
                          -1    ; will let unchanged the octave in relative mode
                          (ly:pitch-notename pitch-note-prob)
                          (ly:pitch-alteration pitch-note-prob)))            
                 (ly:music-sequence::event-chord-relative-callback
                                                            prob prev-pitch)))))
        (set! last-chord-with-note x)                   ; save the eventChord x
        (ly:music-set-property! x 'tags (cons
          'cPSamePitch                              ; add tag 'cPSamePitch to x
          (ly:music-property x 'tags)))))
       x))
    music)
  (if last-chord-with-note                          ; the last saved eventChord
     (ly:music-set-property! last-chord-with-note 'tags (cons
           'cPSamePitchEnd   ; add 'cPSamePitchEnd tag, delete 'cPSamePitch tag
           (delq 'cPSamePitch (ly:music-property last-chord-with-note 'tags)))))
  music         
))


absolute = #(define-music-function (parser location music) (ly:music?)
"Make `music unrelativable. To use inside a \\samePitch function in relative
mode."
(make-music 'UnrelativableMusic 'element music))

insert = #(define-music-function (parser location music) (ly:music?)
"Using this function inside the `newnotes parameter of the \\changePitch
function, allow you to insert and remplace by `music, all music between one note
and his following, in the `pattern parameter of \\changePitch, ."
#{ \tag #'cPInsertInPattern $music #})

%%%%%%%
nCopy = #(define-music-function (parser location n music)(integer? ly:music?)
(if (< n 2)
  music
 (make-sequential-music (map
    (lambda (x)(ly:music-deep-copy music))
    (make-list n)))))

%% same effect as { \repeat unfold n s } but \nSkip works inside the `newnotes 
%% parameter of \changePitch.
nSkip = #(define-music-function (parser location n)(integer?)
"Return \\skip \\skip \\skip ... n times."
#{
  \nCopy #$n s 
#})
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% shortcuts

patI ={ c8.  c16}      % default values for patI and patII, if the user do not         
patII ={ c4.  c8}      % define them, before using \cPI and \cPII

cPI = #(define-music-function (parser location newnotes) (ly:music?)
#{
	\changePitch \patI $newnotes
#})

cPII = #(define-music-function (parser location newnotes) (ly:music?)
#{
	\changePitch \patII $newnotes
#})

#(define cP changePitch)
