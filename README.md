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
Metal Garden\MetalGarden\Binaries\Win64
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

# SpeedRunTool


# View Collision
```
%LOCALAPPDATA%\MetalGarden\Saved\Config\Windows
```
```
[SystemSettings]
r.ForceDebugViewModes=1
```
```
r.ForceDebugViewModes
```

# View Player Stat
```
BP_PlayerCharacter_C
```
