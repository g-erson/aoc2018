{-# LANGUAGE OverloadedStrings #-}
module Main where

import           System.Environment
import           Options.Applicative
import qualified Data.Text as T

data Opts = Opts { fileName :: String }

puzzle1 :: Opts -> IO ()
puzzle1 opts = do
  file <- readFile $ fileName opts
  putStrLn $ show $ (foldr (+) 0 $ toInt <$> getListOfText file :: Int)
    where
      toInt = read . T.unpack
      getListOfText x = T.splitOn (T.pack "\n") $ T.strip $ T.pack x

main :: IO ()
main = puzzle1 =<< execParser opts
  where
    parser = Opts <$> argument str (metavar "FileName")
    opts = info parser mempty
  
