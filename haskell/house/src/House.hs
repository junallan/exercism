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

thatAteTheMaltThatLayInTheHouseJackBuilt :: String
thatAteTheMaltThatLayInTheHouseJackBuilt = thatAteTheMalt ++ "\n" ++ thatLayInTheHouseJackBuilt

thatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt :: String
thatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt = thatKilledTheRat ++ "\n" ++ thatAteTheMaltThatLayInTheHouseJackBuilt

thatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt :: String
thatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt = thatWorriedTheCat ++ "\n" ++ thatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt 

thatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt :: String
thatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt  = thatTossedTheDog ++ "\n" ++ thatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt

thatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt :: String
thatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt = 
  thatMilkedTheCowWithTheCrumpledHorn ++ "\n" ++ thatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt

thatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt :: String
thatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt =
  thatKissedTheMaidenAllForlorn ++ "\n" ++ thatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt

thatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt :: String
thatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt =
  thatMarriedTheManAllTatteredAndTorn ++ "\n" ++ thatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt

thatWokeThePriestAllShavenAndShornThatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt :: String
thatWokeThePriestAllShavenAndShornThatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt =
  thatWokeThePriestAllShavenAndShorn ++ "\n" ++ thatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt

thatKeptTheRoosterThatCrowedInTheMornThatWokeThePriestAllShavenAndShornThatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt :: String
thatKeptTheRoosterThatCrowedInTheMornThatWokeThePriestAllShavenAndShornThatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt =
  thatKeptTheRoosterThatCrowedInTheMorn ++ "\n" ++ thatWokeThePriestAllShavenAndShornThatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt

thisIsThe :: String -> String
thisIsThe endSentence = "This is the " ++ endSentence
 
rhyme :: String
rhyme = thisIsThe "house that Jack built." ++ "\n\n" ++
        thisIsThe "malt" ++ "\n" ++ thatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "rat" ++ "\n" ++ thatAteTheMaltThatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "cat" ++ "\n" ++ thatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "dog" ++ "\n" ++ thatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "cow with the crumpled horn" ++ "\n" ++ thatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "maiden all forlorn" ++ "\n" ++ thatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "man all tattered and torn" ++ "\n" ++ thatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "priest all shaven and shorn" ++ "\n" ++ thatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "rooster that crowed in the morn" ++ "\n" ++ thatWokeThePriestAllShavenAndShornThatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "farmer sowing his corn" ++ "\n" ++ thatKeptTheRoosterThatCrowedInTheMornThatWokeThePriestAllShavenAndShornThatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt ++ "\n\n" ++
        thisIsThe "horse and the hound and the horn" ++ "\n" ++ "that belonged to the farmer sowing his corn\n" ++ thatKeptTheRoosterThatCrowedInTheMornThatWokeThePriestAllShavenAndShornThatMarriedTheManAllTatteredAndTornThatKissedTheMaidenAllForlornThatMilkedTheCowWithTheCrumpledHornThatTossedTheDogThatWorriedTheCatThatKilledTheRatThatAteTheMaltThatLayInTheHouseJackBuilt ++ "\n"