module Day1 where 

import Data.List(sort)
import System.IO(readFile)

run :: IO () 
run = do
    content <- readFile "puzzleInput.txt"
    let rows = lines content                      
        columns = map (words) rows                
        column1 = map (!! 0) columns              
        column2 = map (!! 1) columns              
    let column1Nums = map read column1 :: [Int]
        column2Nums = map read column2 :: [Int]
    print (prep column1Nums column2Nums)

prep :: [Int] -> [Int] -> Int
prep xs ys =  sum $ comp (sort xs) (sort ys) 

comp :: [Int] -> [Int] -> [Int]
comp _ []       = []
comp (x:xs) (y:ys) 
    | x >= y    = (x - y) : comp xs ys
    | otherwise = (y - x) : comp xs ys

