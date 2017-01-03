module SpaceAge (Planet(..), ageOn) where


data Planet = Earth | Mercury | Venus | Mars | Jupiter | Saturn | Uranus | Neptune


ageOn :: Planet -> Float -> Float
ageOn planet seconds = ageSomeone seconds (orbitalPeriod (planetFactor planet))

planetFactor :: Planet -> Float
planetFactor planet = case planet of
	                      Earth   -> 1
	                      Mercury -> 0.2408467
	                      Venus   ->  0.61519726
	                      Mars    -> 1.8808158
	                      Jupiter -> 11.862615
	                      Saturn  -> 29.447498
	                      Uranus  -> 84.016846
	                      Neptune -> 164.79132

orbitalPeriod :: Float -> Float
orbitalPeriod earthyrfactor = do let earthyrdys = 365.25 in 
	                              earthyrfactor * earthyrdys

ageSomeone :: Float -> Float -> Float
ageSomeone ageseconds dys = do let hoursinday = 24; minutesinhour = 60; secondsinminutes = 60 in
                                ageseconds /  (dys * hoursinday * minutesinhour * secondsinminutes)

