module House (rhyme) where

thatLayInTheHouseJackBuilt :: String
thatLayInTheHouseJackBuilt = "that lay in the house that Jack built."

thatAteTheMalt :: String
thatAteTheMalt = "that ate the malt"

thatKilledTheRat :: String
thatKilledTheRat = "that killed the rat"

thatWorriedTheCat :: String
thatWorriedTheCat = "that worried the cat"

thatTossedTheDog :: String
thatTossedTheDog = "that tossed the dog"

thatMilkedTheCowWithTheCrumpledHorn :: String
thatMilkedTheCowWithTheCrumpledHorn = "that milked the cow with the crumpled horn"

thatKissedTheMaidenAllForlorn :: String
thatKissedTheMaidenAllForlorn = "that kissed the maiden all forlorn"

thatMarriedTheManAllTatteredAndTorn :: String
thatMarriedTheManAllTatteredAndTorn = "that married the man all tattered and torn"

thatWokeThePriestAllShavenAndShorn :: String
thatWokeThePriestAllShavenAndShorn = "that woke the priest all shaven and shorn"

thatKeptTheRoosterThatCrowedInTheMorn :: String
thatKeptTheRoosterThatCrowedInTheMorn = "that kept the rooster that crowed in the morn"

thisIsThe :: String -> String
thisIsThe endSentence = "This is the " ++ endSentence
 
rhyme :: String
rhyme = thisIsThe "house that Jack built." ++ "\n\n" ++
        thisIsThe "malt" ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "rat" ++ "\n" ++ thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "cat" ++ "\n" ++ thatKilledTheRat ++ "\n" ++ thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "dog" ++ "\n" ++ thatWorriedTheCat ++ "\n" ++ thatKilledTheRat ++ "\n" ++ thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "cow with the crumpled horn" ++ "\n" ++ thatTossedTheDog ++ "\n" ++ thatWorriedTheCat ++ "\n" ++ thatKilledTheRat ++ "\n" ++ thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "maiden all forlorn" ++ "\n" ++ thatMilkedTheCowWithTheCrumpledHorn ++ "\n" ++ thatTossedTheDog ++ "\n" ++ thatWorriedTheCat ++ "\n" ++ thatKilledTheRat ++ "\n" ++ thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "man all tattered and torn" ++ "\n" ++ thatKissedTheMaidenAllForlorn ++ "\n" ++  thatMilkedTheCowWithTheCrumpledHorn ++ "\n" ++ thatTossedTheDog ++ "\n" ++ thatWorriedTheCat ++ "\n" ++ thatKilledTheRat ++ "\n" ++ thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "priest all shaven and shorn" ++ "\n" ++ thatMarriedTheManAllTatteredAndTorn ++ "\n" ++ thatKissedTheMaidenAllForlorn ++ "\n" ++  thatMilkedTheCowWithTheCrumpledHorn ++ "\n" ++ thatTossedTheDog ++ "\n" ++ thatWorriedTheCat ++ "\n" ++ thatKilledTheRat ++ "\n" ++ thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "rooster that crowed in the morn" ++ "\n" ++ thatWokeThePriestAllShavenAndShorn ++ "\n" ++ thatMarriedTheManAllTatteredAndTorn ++ "\n" ++ thatKissedTheMaidenAllForlorn ++ "\n" ++  thatMilkedTheCowWithTheCrumpledHorn ++ "\n" ++ thatTossedTheDog ++ "\n" ++ thatWorriedTheCat ++ "\n" ++ thatKilledTheRat ++ "\n" ++ thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "farmer sowing his corn" ++ "\n" ++ thatKeptTheRoosterThatCrowedInTheMorn ++ "\n" ++ thatWokeThePriestAllShavenAndShorn ++ "\n" ++ thatMarriedTheManAllTatteredAndTorn ++ "\n" ++ thatKissedTheMaidenAllForlorn ++ "\n" ++  thatMilkedTheCowWithTheCrumpledHorn ++ "\n" ++ thatTossedTheDog ++ "\n" ++ thatWorriedTheCat ++ "\n" ++ thatKilledTheRat ++ "\n" ++ thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "horse and the hound and the horn" ++ "\n" ++ "that belonged to the farmer sowing his corn\n" ++ thatKeptTheRoosterThatCrowedInTheMorn ++ "\n" ++ thatWokeThePriestAllShavenAndShorn ++ "\n" ++ thatMarriedTheManAllTatteredAndTorn ++ "\n" ++ thatKissedTheMaidenAllForlorn ++ "\n" ++  thatMilkedTheCowWithTheCrumpledHorn ++ "\n" ++ thatTossedTheDog ++ "\n" ++ thatWorriedTheCat ++ "\n" ++ thatKilledTheRat ++ "\n" ++ thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n"