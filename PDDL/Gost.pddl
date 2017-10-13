
(define (domain ghost)

  (:requirements :typing :conditional-effects)
  
  (:types states) ;;store ghost states 
  
  (:predicates  (GhostAt ?s - states) 		;; The Capsule states position true or false
                (PacmanAt ?s - states)	;; The Pacman states position true or false
                (Adjacent ?s1 ?s2 - states)	;; The connection states true or false
                (Scared)		;; Whether Ghost is scared of Pacman
  )
  ;;Ghost move to next states s2 must make sure the current states is s1
  ;;Ghost not scared Pacman
  ;;if Pacman powered, Ghost must stay away from Pacman
  (:action move
        :parameters (?s1 ?s2 - states)
        
        :precondition (and (GhostAt ?s1)
                           (Adjacent ?s1 ?s2)
                       )
                       
        :effect   (and (GhostAt ?s2)
                       (not  (GhostAt ?s1) )
                       (when (and (not (Scared))) (not  (PacmanAt ?s2) ))
                       (when (Scared) (PacmanAt ?s2))
                   )
   )
)