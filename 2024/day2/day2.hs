

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
decreasing (x:y:xs) = x >= y && decreasing xs

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