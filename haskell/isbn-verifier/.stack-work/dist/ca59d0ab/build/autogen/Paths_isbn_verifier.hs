{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_isbn_verifier (
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
version = Version [1,1,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Jun\\exercism\\haskell\\isbn-verifier\\.stack-work\\install\\34070b1b\\bin"
libdir     = "C:\\Users\\Jun\\exercism\\haskell\\isbn-verifier\\.stack-work\\install\\34070b1b\\lib\\x86_64-windows-ghc-8.0.2\\isbn-verifier-1.1.0.1-HLFyrrzNZ6Y1Wx6hrRAOVi"
dynlibdir  = "C:\\Users\\Jun\\exercism\\haskell\\isbn-verifier\\.stack-work\\install\\34070b1b\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\Jun\\exercism\\haskell\\isbn-verifier\\.stack-work\\install\\34070b1b\\share\\x86_64-windows-ghc-8.0.2\\isbn-verifier-1.1.0.1"
libexecdir = "C:\\Users\\Jun\\exercism\\haskell\\isbn-verifier\\.stack-work\\install\\34070b1b\\libexec"
sysconfdir = "C:\\Users\\Jun\\exercism\\haskell\\isbn-verifier\\.stack-work\\install\\34070b1b\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "isbn_verifier_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "isbn_verifier_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "isbn_verifier_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "isbn_verifier_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "isbn_verifier_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "isbn_verifier_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
