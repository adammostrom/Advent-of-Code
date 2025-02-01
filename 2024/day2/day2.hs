module Day2 where 


import System.IO(readFile)

-- level = 75 77 80 78 80 83 84 87

{-

    The levels are either all increasing or all decreasing 
    AND
    Any two adjacent levels differ by at least one and at most three.

    > 7 6 4 2 1: Safe because the levels are all decreasing by 1 or 2.
    > 1 2 7 8 9: Unsafe because 2 7 is an increase of 5.

    How many reports are safe?
-}

-- Safe
testA :: [Int]
testA = [7, 6, 4 ,2 ,1]

-- Unsafe
testB :: [Int]
testB = [1, 2, 7, 8, 9]


decreasing :: [Int] -> Bool
decreasing [] = True
decreasing [x] = True
decreasing (x:y:xs)
    | x >= y && decreasing (y:xs) = True
    | otherwise                   = False


increasing :: [Int] -> Bool
increasing [] = True
increasing [x] = True
increasing (x:y:xs)
    | x <= y && increasing (y:xs) = True
    | otherwise                   = False


-- True if difference between two numbers are at least 1 and at most 3
diff :: Int -> Int -> Bool
diff x y =
    if x > y then diff' x y else diff' y x 
    where
        diff' x y  
            | x - y <= 3 && x - y > 0 = True
            | otherwise               = False


level :: [Int] -> Bool 
level [x] = True
level (x:y:xs) 
    | increasing (x:y:xs) && diff x y && level (y:xs) = True 
    | decreasing (x:y:xs) && diff x y && level (y:xs) = True
    | otherwise                                       = False


readNumbersFile :: FilePath -> IO [[Int]]
readNumbersFile filePath = do
    contents <- readFile filePath
    let numberLists = map (map read . words) (lines contents)
    return numberLists

main :: IO ()
main = do
    numbers <- readNumbersFile "input.txt"
    print $ length $ filter id (map level numbers)