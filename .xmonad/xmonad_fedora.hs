-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers

main = do
     xmonad  $ gnomeConfig
               {
                 modMask = mod4Mask,
                 startupHook = setWMName "LG3D",
                 manageHook = composeAll [
                   manageHook gnomeConfig,
                   title =? "foo" --> doShift "2",
                   isFullscreen --> doFullFloat
                 ]
               }
               `additionalKeysP`
               [
                ("M-r", spawn "dmenu_run")
               ]
 
--main = do
--     session <- getEnv "DESKTOP_SESSION"
--     xmonad  $ maybe desktopConfig desktop session

--desktop "gnome" = gnomeConfig
--desktop "kde" = kde4Config
--desktop "xfce" = xfceConfig
--desktop "xmonad-gnome" = gnomeConfig
--desktop _ = desktopConfig
