import XMonad
import XMonad.Actions.WindowGo
import XMonad.Util.EZConfig
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

myTerminal = "alacritty"

myBrowser = "firefox"

main = xmonad . ewmh . ewmhFullscreen . docks $ myConfig `additionalKeysP` myKeymaps

myConfig = def
  { modMask = mod4Mask,
    terminal = myTerminal,
    layoutHook = myLayout,
    startupHook = spawn "xsetroot -cursor_name left_ptr"
  }

myLayout = avoidStruts (tiled ||| full)
  where
    tiled = spacingWithEdge 8 $ smartBorders $ Tall 1 (3 / 100) (1 / 2)
    full = noBorders Full

myKeymaps =
  [ ("M-<Return>", spawn myTerminal),
    ("M-b", runOrRaise myBrowser (className =? myBrowser)),
    ("M-p", spawn "rofi -show drun")
  ]
