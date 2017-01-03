module Beer (song) where

lyrics :: Int -> String
lyrics 99 = "No more bottles of beer on the wall, no more bottles of beer.\n\
            \Go to the store and buy some more, 99 bottles of beer on the wall.\n"
lyrics 98 = "1 bottle of beer on the wall, 1 bottle of beer.\n\
            \Take it down and pass it around, no more bottles of beer on the wall.\n\
            \\n" 
lyrics 97 = "2 bottles of beer on the wall, 2 bottles of beer.\n\
           \Take one down and pass it around, 1 bottle of beer on the wall.\n\
           \\n" 
lyrics x = show (99 - x) ++ " bottles of beer on the wall, " ++ show (99 - x)  ++ " bottles of beer.\n\
           \Take one down and pass it around, " ++ show (99 - x - 1) ++ " bottles of beer on the wall.\n\
           \\n"

song :: String
song = concat (map lyrics [0..99])

