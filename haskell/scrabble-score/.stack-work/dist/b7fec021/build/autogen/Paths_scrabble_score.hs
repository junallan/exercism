{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_scrabble_score (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Jun\\exercism\\haskell\\scrabble-score\\.stack-work\\install\\35bf466f\\bin"
libdir     = "C:\\Users\\Jun\\exercism\\haskell\\scrabble-score\\.stack-work\\install\\35bf466f\\lib\\x86_64-windows-ghc-8.0.1\\scrabble-score-0.0.0-HIvY5XzNISh8W2PQcTDAzu"
datadir    = "C:\\Users\\Jun\\exercism\\haskell\\scrabble-score\\.stack-work\\install\\35bf466f\\share\\x86_64-windows-ghc-8.0.1\\scrabble-score-0.0.0"
libexecdir = "C:\\Users\\Jun\\exercism\\haskell\\scrabble-score\\.stack-work\\install\\35bf466f\\libexec"
sysconfdir = "C:\\Users\\Jun\\exercism\\haskell\\scrabble-score\\.stack-work\\install\\35bf466f\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "scrabble_score_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "scrabble_score_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "scrabble_score_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "scrabble_score_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "scrabble_score_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
