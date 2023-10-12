-- IMPORTS --
import XMonad
import Data.Monoid
import System.Exit
import XMonad.Layout.Gaps
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Grid
import XMonad.Hooks.EwmhDesktops
import qualified Codec.Binary.UTF8.String as UTF8
import qualified XMonad.Hooks.DynamicLog
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- SOME VARIABLES --
myTerminal      = "alacritty"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myClickJustFocuses :: Bool
myClickJustFocuses = False
myBorderWidth   = 3
myModMask       = mod1Mask
myWorkspaces    = [" \xf0ac "," \xf1cb "," \xf0c3 "," \xf03e "," \xf03d "," \xf0379 "," \xf07c "," \xf1d8 "," \xe795 "]
myNormalBorderColor  = "#cdd6f4"
myFocusedBorderColor = "#e95678"

-- KEY BINDINGS --
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
    , ((modm .|. shiftMask, xK_h     ), spawn "alacritty -e htop")
    , ((modm .|. shiftMask, xK_t     ), spawn "emacsclient -c -a 'emacs'")
    , ((modm .|. shiftMask, xK_x     ), spawn "brave")
    , ((modm .|. shiftMask, xK_l     ), spawn "~/scripts-for-rofi/power.sh")
    , ((modm .|. shiftMask, xK_s     ), spawn "flameshot gui")
    , ((modm,               xK_p     ), spawn "rofi -show drun")
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")
    , ((modm,               xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm,               xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

-- MOUSE KEYBIDINGS --
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

-- LAYOUTS --
myLayout = avoidStruts (spacing 10 $ tiled ||| Full ||| Grid )
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 1/100

-- WINDOW RULES --
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "Tint2conf"      --> doFloat
    , className =? "Chromium"       --> doFloat
    , className =? "Brave-browser"  --> doFloat
    , className =? "thunderbird"    --> doFloat
    , className =? "conky"          --> doFloat
    , className =? "Polybar"        --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

-- HOOKS --
myEventHook = mempty
myLogHook = return ()
myStartupHook = do
    spawnOnce "nitrogen --set-zoom-fill ~/wallpapers-catppuccin/landscapes/forrest.png"
    spawnOnce "/usr/bin/emacs --daemon &"
    spawnOnce "picom -b --backend glx &"
    spawnOnce "xrandr --output DVI-D-0 --right-of HDMI-0"
    spawn "polybar mainbar-xmonad | polybar secondarybar-xmonad"

-- THE MAIN FUNCTION --
main = xmonad $ docks . ewmh $ defaults 

-- DEFAULTS
defaults = def {
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

        keys               = myKeys,
        mouseBindings      = myMouseBindings,

        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
