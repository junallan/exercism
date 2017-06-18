module FoodChain (song) where

swallowedObjects = ["fly","spider","bird","cat","dog","goat","cow","horse"]

iKnowAnOldLadyWhoSwallowedA :: String -> String
iKnowAnOldLadyWhoSwallowedA swallowedObject = "I know an old lady who swallowed a " ++ swallowedObject ++ ".\n"

iDontKnowWhySheSwallowedTheFlyPerhapsShellDie = "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"

sheSwallowedTheSpiderToCatchTheFly = "She swallowed the spider to catch the fly.\n"

sheSwallowedTheBirdToCatchTheSpiderThatWriggledAndJiggledAndTickledInsideHer = "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"

sheSwallowedTheCatToCatchTheBird = "She swallowed the cat to catch the bird.\n"

sheSwallowedTheDogToCatchTheCat = "She swallowed the dog to catch the cat.\n"

sheSwallowedTheGoatToCatchTheDog = "She swallowed the goat to catch the dog.\n"

song :: String
song =
    iKnowAnOldLadyWhoSwallowedA (swallowedObjects !! 0) ++
    iDontKnowWhySheSwallowedTheFlyPerhapsShellDie ++
    iKnowAnOldLadyWhoSwallowedA (swallowedObjects !! 1) ++
    "It wriggled and jiggled and tickled inside her.\n" ++
    sheSwallowedTheSpiderToCatchTheFly ++
    iDontKnowWhySheSwallowedTheFlyPerhapsShellDie ++
    iKnowAnOldLadyWhoSwallowedA (swallowedObjects !! 2) ++
    "How absurd to swallow a bird!\n" ++
    sheSwallowedTheBirdToCatchTheSpiderThatWriggledAndJiggledAndTickledInsideHer ++
    sheSwallowedTheSpiderToCatchTheFly ++
    iDontKnowWhySheSwallowedTheFlyPerhapsShellDie ++
    iKnowAnOldLadyWhoSwallowedA (swallowedObjects !! 3) ++
    "Imagine that, to swallow a cat!\n" ++
    sheSwallowedTheCatToCatchTheBird ++
    sheSwallowedTheBirdToCatchTheSpiderThatWriggledAndJiggledAndTickledInsideHer ++
    sheSwallowedTheSpiderToCatchTheFly ++
    iDontKnowWhySheSwallowedTheFlyPerhapsShellDie ++
    iKnowAnOldLadyWhoSwallowedA (swallowedObjects !! 4) ++
    "What a hog, to swallow a dog!\n" ++
    sheSwallowedTheDogToCatchTheCat ++
    sheSwallowedTheCatToCatchTheBird ++
    sheSwallowedTheBirdToCatchTheSpiderThatWriggledAndJiggledAndTickledInsideHer ++
    sheSwallowedTheSpiderToCatchTheFly ++
    iDontKnowWhySheSwallowedTheFlyPerhapsShellDie ++
    iKnowAnOldLadyWhoSwallowedA (swallowedObjects !! 5) ++
    "Just opened her throat and swallowed a goat!\n" ++
    sheSwallowedTheGoatToCatchTheDog ++
    sheSwallowedTheDogToCatchTheCat ++
    sheSwallowedTheCatToCatchTheBird ++
    sheSwallowedTheBirdToCatchTheSpiderThatWriggledAndJiggledAndTickledInsideHer ++
    sheSwallowedTheSpiderToCatchTheFly ++
    iDontKnowWhySheSwallowedTheFlyPerhapsShellDie ++
    iKnowAnOldLadyWhoSwallowedA (swallowedObjects !! 6) ++
    "I don't know how she swallowed a cow!\n\
    \She swallowed the cow to catch the goat.\n" ++
    sheSwallowedTheGoatToCatchTheDog ++
    sheSwallowedTheDogToCatchTheCat ++
    sheSwallowedTheCatToCatchTheBird ++
    sheSwallowedTheBirdToCatchTheSpiderThatWriggledAndJiggledAndTickledInsideHer ++
    sheSwallowedTheSpiderToCatchTheFly ++
    iDontKnowWhySheSwallowedTheFlyPerhapsShellDie ++
    iKnowAnOldLadyWhoSwallowedA (swallowedObjects !! 7) ++
    "She's dead, of course!\n"
