# Metal-Garden-SpeedRunTool

## Keybinds

| Key | Action |
|---|---|
| `F1` | Unreal Enging Console |
| `F2` | Toggle Speed Modify Between Origin Speed |
| `F3` | Slow Speed Modiify |
| `F4` | Fast Speed Speed |
| `F5` | Reset Speed Modify Speed to Default |
| `V` | NoClip Same as ~ type noclip sometime will not work need Press ~ open and close console |
| `F8` | Show Object Visible |
| `F9` | Visible Floor / Hide Floor |
| `Z` | Teleport (same as Unreal Engine console `Teleport` command) |
| `DELETE` | Change ViewMode between Lit / Unlit |
| `PageUp` | Prev ViewMode Unreal Engine console command prevviewmode |
| `PageDown` | Next ViewMode Unreal Engine console command nextviewmode |

# Install UE4SS
- Unzip UE4SS to:
```
Root\MetalGarden\Binaries\Win64
```
You should now see:
```
Root\MetalGarden\Binaries\Win64\D3D12
Root\MetalGarden\Binaries\Win64\ue4ss
Root\MetalGarden\Binaries\Win64\dwmapi.dll
Root\MetalGarden\Binaries\Win64\MetalGarden-Win64-Shipping.exe
Root\MetalGarden\Binaries\Win64\tbb.dll
```

# ConsoleEnablerMod

Game console is Tilde ~

Use F1 Open UE Console

You can change to you want Key

```
local KeysToAdd = {
    -- UEHelpers.FindFName("Tilde"),
    UEHelpers.FindFName("F1")
}
```

# View More Collision
```
%LOCALAPPDATA%\MetalGarden\Saved\Config\Windows
```
```
Engine.ini
```
```
[SystemSettings]
r.ForceDebugViewModes=1
```
```
r.ForceDebugViewModes
```

- I recommend removing `ForceDebugViewModes` when running the speedrun, as I’m not entirely sure if it might have any side effects.

# View Player Stat
```
BP_PlayerCharacter_C
```

# Some Unreal Engine Console Command
```
playersonly    Toggles player prescence in the world
pause    Toggles pausing the game
toggledebugcamera    Toggles the debug camera view
teleport    Teleports the player at the debug camera's pointed at location
slomo x    Sets game speed to the desired speed e.g. 1.0, 0.5, 2.0
changesize x    Sets player size to the desired size
fov x    Sets the field of view to the desired angle, e.g. 0, 90
viewmode lit / viewmode shadercomplexity    Toggles shaders on/off
stat fps    Toggles displaying FPS on screen
stat unit    Toggles displaying frametimes on screen
showdebug    Toggles displaying coordinates on screen
summon    Spawns a specified object from its blueprint with an appended _C e.g. summon BP_DevilOliver_C summon BP_Executioner_C when in a valid combat zone/story progression.
shot showui / shot    Takes a PNG screenshot of the game with/without UI and saves it to C:\Users%userprofile%\AppData\Local\CodeVein\Saved\Screenshots\WindowsNoEditor
open work    Opens the debug map. If opened without a save loaded, loads the debug character with debug equipment and gifts. As of the later patches, this command is mostly useless since debug items were removed from the files.
exit    Closes the game
stat levels
```
