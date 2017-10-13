
(define (domain pacman)

  (:requirements :typing :conditional-effects)
  
  (:types states) ;;
  
  (:predicates  (PacmanAt ?s - states) 		;; The Pacman states position true or false
                (FoodAt ?s - states)	;; The Food states position true or false
                (CapsuleAt ?s - states)	;; The Capsule states position true or false
                (GhostAt ?s - states)	;; The Ghost states position true or false
                (Adjacent ?s1 ?s2 - states)	;; The connection states true or false
                (Powered)		;; Been Powered
  )
  
  ;;Pacman go to next states s2 must confirm its current states is s1
  ;;if next states have food, eat it
  ;;if not eat Capsule, Pacman will scared Ghost
  ;;if Pacman eat Capsule, Pacman will eat GhostAt
  (:action move
        :parameters (?s1 ?s2 - states)
        
        :precondition (and (PacmanAt ?s1)
                           (Adjacent ?s1 ?s2)
                       )
                       
        :effect   (and (PacmanAt ?s2)
                       (not  (PacmanAt ?s1) )
                       (not  (FoodAt ?s2) )
                       (not  (CapsuleAt ?s2) )
                       (when (Powered) (not (GhostAt ?s2)))
                       
                   )
   )
  
  ;;if Powered, pacman can eat GhostAt
  (:action eat_ghost
           :parameters (?s1 ?s2 -states)
          
           :precondition ( and (PacmanAt ?s1)
                               (CapsuleAt ?s2)
                               (Adjacent ?s1 ?s2)
                         )
   
           :effect (and (PacmanAt ?s2)
                        (not (FoodAt ?s2))
                        (when (CapsuleAt ?s2) (Powered))
                        (when (Powered) (not (GhostAt ?s2)))
                   )
   
   )
  
  



)