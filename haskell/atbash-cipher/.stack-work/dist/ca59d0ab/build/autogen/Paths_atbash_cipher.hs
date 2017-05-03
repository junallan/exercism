{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_atbash_cipher (
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
version = Version [0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Jun\\exercism\\haskell\\atbash-cipher\\.stack-work\\install\\02136e14\\bin"
libdir     = "C:\\Users\\Jun\\exercism\\haskell\\atbash-cipher\\.stack-work\\install\\02136e14\\lib\\x86_64-windows-ghc-8.0.2\\atbash-cipher-0.0.0-K1AnLZmYkbn9CADxZLO7M7"
dynlibdir  = "C:\\Users\\Jun\\exercism\\haskell\\atbash-cipher\\.stack-work\\install\\02136e14\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\Jun\\exercism\\haskell\\atbash-cipher\\.stack-work\\install\\02136e14\\share\\x86_64-windows-ghc-8.0.2\\atbash-cipher-0.0.0"
libexecdir = "C:\\Users\\Jun\\exercism\\haskell\\atbash-cipher\\.stack-work\\install\\02136e14\\libexec"
sysconfdir = "C:\\Users\\Jun\\exercism\\haskell\\atbash-cipher\\.stack-work\\install\\02136e14\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "atbash_cipher_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "atbash_cipher_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "atbash_cipher_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "atbash_cipher_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "atbash_cipher_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "atbash_cipher_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
