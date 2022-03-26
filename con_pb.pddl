(define (problem NumPuz)
  (:domain NP)
  (:objects
     row1 row2 row3
     col1 col2 col3
     unu doi trei patru cinci sase)
  (:init
      (randul1 row1)
     (val_urm unu doi)
     (val_urm doi trei)
     (val_urm trei patru)              
     (val_urm patru cinci) 
     (val_urm cinci sase) 
     (val_urm row1 row2)          
     (val_urm col1 col2)
     (val_urm row2 row3)         
     (val_urm col2 col3) 
     (nr_sanse patru)
     
     (unknown (gol row2 col1))
     (unknown (gol row3 col3))
     (unknown (val trei row3 col3))
     (unknown (val patru row2 col1))
     (oneof (gol row2 col1) (gol row3 col3))
     (oneof (gol row3 col3) (val trei row3 col3))
     (oneof (gol row2 col1) (val patru row2 col1))
     
     (val trei row1 col1)   (val patru row1 col2) (val cinci row1 col3)
                            (val trei row2 col2)  (val patru row2 col3)
     (val cinci row3 col1)  (val trei row3 col2))
  (:goal
 (and      (val cinci row1 col1)  (val cinci row1 col2) (val cinci row1 col3)
     (val cinci row2 col1)  (val cinci row2 col2) (val cinci row2 col3)
     (val cinci row3 col1)  (val cinci row3 col2) (val cinci row3 col3))))

