{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_sublist (
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
version = Version [1,0,0,3] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Jun\\exercism\\haskell\\sublist\\.stack-work\\install\\ed14a2f4\\bin"
libdir     = "C:\\Users\\Jun\\exercism\\haskell\\sublist\\.stack-work\\install\\ed14a2f4\\lib\\x86_64-windows-ghc-8.0.2\\sublist-1.0.0.3-4OediPgpc8z5IM4rmtjmmV"
dynlibdir  = "C:\\Users\\Jun\\exercism\\haskell\\sublist\\.stack-work\\install\\ed14a2f4\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\Jun\\exercism\\haskell\\sublist\\.stack-work\\install\\ed14a2f4\\share\\x86_64-windows-ghc-8.0.2\\sublist-1.0.0.3"
libexecdir = "C:\\Users\\Jun\\exercism\\haskell\\sublist\\.stack-work\\install\\ed14a2f4\\libexec"
sysconfdir = "C:\\Users\\Jun\\exercism\\haskell\\sublist\\.stack-work\\install\\ed14a2f4\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "sublist_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "sublist_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "sublist_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "sublist_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "sublist_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "sublist_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)