import Data.List
import Data.Map
import System.Environment
import System.IO

-- Sort the list, then group equal elements together, then get counts for them.
grouped_elements elements = Data.List.map (\l@(x:xs) -> (x,length l)) . group . sort $ elements
majority_element_sorted elements = fmap (\(a,b) -> a) $ find (\(a,b) -> b > fromIntegral (div (length elements) 2)) $ grouped_elements $ elements

-- NOTE:
-- find (\(a,b) -> b > ((fromIntegral (length x)) / 2)) (toList m)
-- raises an error!
counts elements = Data.Map.fromListWith (\count1 count2 -> count1 + count2) [ (element, 1) | element <- elements ]
majority_element_naive elements = fmap (\(a,b) -> a) $ find (\(a,b) -> b > fromIntegral (div (length elements) 2)) (toList $ counts elements)

-- Invocation:
-- majority_element <algorithm type> <filename>
main = do
    (algorithm:filename:xs) <- getArgs
    contents <- readFile filename
    let parsedInput = read ("[" ++ (head $ lines $ contents) ++ "]") :: [Int]
    case algorithm of "naive" -> print $ majority_element_naive $ parsedInput
                      "sorting" -> print $ majority_element_sorted $ parsedInput
                      other -> print "Please specify a valid algorithm (one of: naive, sorting)."
