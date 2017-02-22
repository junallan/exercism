{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_simple_linked_list (
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

bindir     = "C:\\Users\\Jun\\exercism\\haskell\\simple-linked-list\\.stack-work\\install\\93264ba9\\bin"
libdir     = "C:\\Users\\Jun\\exercism\\haskell\\simple-linked-list\\.stack-work\\install\\93264ba9\\lib\\x86_64-windows-ghc-8.0.1\\simple-linked-list-0.0.0-36T8kADGebJAGoar8h4whl"
datadir    = "C:\\Users\\Jun\\exercism\\haskell\\simple-linked-list\\.stack-work\\install\\93264ba9\\share\\x86_64-windows-ghc-8.0.1\\simple-linked-list-0.0.0"
libexecdir = "C:\\Users\\Jun\\exercism\\haskell\\simple-linked-list\\.stack-work\\install\\93264ba9\\libexec"
sysconfdir = "C:\\Users\\Jun\\exercism\\haskell\\simple-linked-list\\.stack-work\\install\\93264ba9\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "simple_linked_list_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "simple_linked_list_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "simple_linked_list_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "simple_linked_list_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "simple_linked_list_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
