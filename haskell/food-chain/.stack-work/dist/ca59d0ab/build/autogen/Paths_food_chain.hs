{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_food_chain (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
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
version = Version [0,1,0,2] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Jun\\exercism\\haskell\\food-chain\\.stack-work\\install\\02136e14\\bin"
libdir     = "C:\\Users\\Jun\\exercism\\haskell\\food-chain\\.stack-work\\install\\02136e14\\lib\\x86_64-windows-ghc-8.0.2\\food-chain-0.1.0.2-JLcRfeNJ0Lw1xImoMvezOy"
dynlibdir  = "C:\\Users\\Jun\\exercism\\haskell\\food-chain\\.stack-work\\install\\02136e14\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\Jun\\exercism\\haskell\\food-chain\\.stack-work\\install\\02136e14\\share\\x86_64-windows-ghc-8.0.2\\food-chain-0.1.0.2"
libexecdir = "C:\\Users\\Jun\\exercism\\haskell\\food-chain\\.stack-work\\install\\02136e14\\libexec"
sysconfdir = "C:\\Users\\Jun\\exercism\\haskell\\food-chain\\.stack-work\\install\\02136e14\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "food_chain_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "food_chain_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "food_chain_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "food_chain_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "food_chain_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "food_chain_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
