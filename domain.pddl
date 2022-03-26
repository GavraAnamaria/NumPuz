
(define (domain NumPuz_game)

  (:predicates
   (randul1 ?r)
   (val ?v ?r ?c)
   (gol ?r ?c)
   (vecin ?r ?c ?rv ?cv)
   (val_urm ?val1 ?val2)
   (nr_sanse ?nr)
  )

  (:action verificare_vecin
    :parameters ( ?val ?row1 ?row2 ?col)
    :precondition (and (val ?val ?row1 ?col)
                       (val ?val ?row2 ?col)
                     (or (val_urm ?row1 ?row2)
                      (val_urm ?row2 ?row1)))
    :effect (and (vecin  ?row1 ?col ?row2 ?col)
                 (vecin ?row2 ?col ?row1 ?col)
    ))
    
    
  (:action verificare_vecin2
    :parameters ( ?val ?row ?col1 ?col2)
    :precondition (and (val ?val ?row ?col1)
                       (val ?val ?row ?col2)
                     (or (val_urm ?col1 ?col2)
                      (val_urm ?col2 ?col1)))
    :effect (and (vecin  ?row ?col1 ?row ?col2)
                 (vecin ?row ?col2 ?row ?col1)
    )
    )
        
    
    
  (:action combinare
    :parameters ( ?val ?row1 ?col1 ?row2 ?col2 ?row3 ?col3 ?sansa ?sansa_urm ?val_urm )
    :precondition (and (val ?val ?row1 ?col1)
                       (vecin ?row1 ?col1 ?row2 ?col2)
                       (vecin ?row2 ?col2 ?row3 ?col3)
                       (or(val_urm ?row1 ?row3) 
                           (val_urm ?col1 ?col3)  
                           (and (val_urm ?row1 ?row2)  
                                (val_urm ?row2 ?row3))
                           (and (val_urm ?col1 ?col2)
                                (val_urm ?col2 ?col3)))
                       (nr_sanse ?sansa)
                       (val_urm ?sansa ?sansa_urm)
                       (val_urm ?val ?val_urm))
                    
    :effect (and(not (nr_sanse ?sansa))
                    (not  (val ?val ?row2 ?col2))
                    (not  (val ?val ?row1 ?col1))
                    (not  (val ?val ?row3 ?col3))
                 (gol ?row1 ?col1)
                 (gol ?row3 ?col3)
                (nr_sanse ?sansa_urm)
                (val ?val_urm ?row2 ?col2)) 
   )
   
   
       
  (:action incrementare
    :parameters ( ?val ?row ?col ?sansa ?sansa_anter ?val_urm )
    :precondition (and (val ?val ?row ?col)
                       (nr_sanse ?sansa)
                       (val_urm ?sansa_anter ?sansa)
                       (val_urm ?val ?val_urm))
                    
    :effect (and(not (nr_sanse ?sansa))
                (not (val ?val ?row ?col))
                (nr_sanse ?sansa_anter)
                (val ?val_urm ?row ?col)
                      
    ) 	
   )  
   
          
  (:action deplasare_jos
    :parameters ( ?val ?rand ?col ?rand_anter )
    :precondition (and (val ?val ?rand_anter ?col)
                       (val_urm ?rand_anter ?rand)
                       (gol ?rand ?col))
                    
    :effect (and(not (gol ?rand ?col))
                (not (val ?val ?rand_anter ?col))
                (gol ?rand_anter ?col)
                (val ?val ?rand ?col)               
    ) 	
   )  
   
             
  (:action umplere
    :parameters (?val ?rand ?col)
    :precondition (and (randul1 ?rand)
                       (gol ?rand ?col))
                    
    :effect (and(not (gol ?rand ?col))
                (val ?val ?rand ?col)               
    ) 	
   ) 
   
   
)
