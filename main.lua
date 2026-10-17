local UEHelpers = require("UEHelpers")

-- ===== State =====
local showFloors = true
local isUnlit = false

-- ===== Slomo =====
local slomoOn = false
local DEFAULT_SLOMO_SPEED = 2.0
local slomoSpeed = DEFAULT_SLOMO_SPEED
local SLOMO_FACTOR = 1.5                 -- Multiplier per key press; larger = faster adjustment
local SLOMO_MIN, SLOMO_MAX = 0.01, 100

local function GetCurrentLocalPlayerController()
    local GameInstance = UEHelpers.GetGameInstance()
    if GameInstance and GameInstance:IsValid() then
        local LocalPlayers = GameInstance.LocalPlayers
        if LocalPlayers and LocalPlayers[1] and LocalPlayers[1]:IsValid() then
            local livePC = LocalPlayers[1].PlayerController
            if livePC and livePC:IsValid() then
                return livePC
            end
        end
    end
    return nil
end

local function runConsole(cmd)
    local KismetSystemLibrary = StaticFindObject("/Script/Engine.Default__KismetSystemLibrary")
    local livePC = GetCurrentLocalPlayerController()
    if not (KismetSystemLibrary and KismetSystemLibrary:IsValid() and livePC) then
        print("Could not resolve current local player controller")
        return false
    end
    KismetSystemLibrary:ExecuteConsoleCommand(livePC, cmd, livePC)
    return true
end

local function applySlomo()
    local value = slomoOn and slomoSpeed or 1
    if runConsole(string.format("slomo %.3f", value)) then
        print(string.format("Slomo: %.3f (%s)", value, slomoOn and "custom speed" or "normal speed"))
    end
end

-- F2: Toggle between custom speed and normal speed (slomo 1)
RegisterKeyBind(Key.F2, function()
    ExecuteInGameThread(function()
        slomoOn = not slomoOn
        applySlomo()
    end)
end)

-- F3: Slow down
RegisterKeyBind(Key.F3, function()
    ExecuteInGameThread(function()
        slomoSpeed = math.max(SLOMO_MIN, math.floor(slomoSpeed / SLOMO_FACTOR * 1000 + 0.5) / 1000)
        slomoOn = true
        applySlomo()
    end)
end)

-- F4: Speed up
RegisterKeyBind(Key.F4, function()
    ExecuteInGameThread(function()
        slomoSpeed = math.min(SLOMO_MAX, math.floor(slomoSpeed * SLOMO_FACTOR * 1000 + 0.5) / 1000)
        slomoOn = true
        applySlomo()
    end)
end)

-- F5: Reset (game speed back to slomo 1, custom speed back to default)
RegisterKeyBind(Key.F5, function()
    ExecuteInGameThread(function()
        slomoOn = false
        slomoSpeed = DEFAULT_SLOMO_SPEED
        applySlomo()   -- Runs "slomo 1"
        print(string.format("Slomo reset, custom speed restored to %.3f", DEFAULT_SLOMO_SPEED))
    end)
end)

-- V: Toggle NoClip via the console widget
RegisterKeyBind(Key.V, function()
    ExecuteInGameThread(function()
        local console = FindFirstOf("UI_Console_C")
        if console and console:IsValid() then
            console:noclip()
            print("NoClip toggled via UI_Console_C")
        else
            print("UI_Console_C not found (open the console with ~ once)")
        end
    end)
end)

-- Z: Teleport (console command)
RegisterKeyBind(Key.Z, function()
    ExecuteInGameThread(function()
        if runConsole("Teleport") then
            print("Teleport executed")
        end
    end)
end)

-- F8: Reveal hidden components
RegisterKeyBind(Key.F8, function()
    ExecuteInGameThread(function()
        local components = FindAllOf("SceneComponent")
        if not components then return end
        for _, component in pairs(components) do
            local owner = component:GetOwner()
            if owner and owner:IsValid() then
                local name = owner:GetFullName()
                if not name:match("ReflectionCapture") and not name:match("WireCharacter") and not name:match("Audio") then
                    owner:SetActorHiddenInGame(false)
                    component:SetHiddenInGame(false, true)
                end
            end
        end
    end)
end)

-- F9: Toggle floor visibility
RegisterKeyBind(Key.F9, function()
    ExecuteInGameThread(function()
        showFloors = not showFloors
        local meshes = FindAllOf("StaticMeshComponent")
        if not meshes then return end
        for _, mesh in pairs(meshes) do
            local owner = mesh:GetOwner()
            if owner and owner:IsValid() then
                mesh:SetHiddenInGame(not showFloors, true)
            end
        end
        print("Floor visibility: " .. (showFloors and "ON" or "OFF"))
    end)
end)

-- DEL: Toggle Lit / Unlit view mode
RegisterKeyBind(Key.DEL, function()
    ExecuteInGameThread(function()
        if not isUnlit then
            -- Lit -> Unlit, bypass restriction via prevviewmode
            if runConsole("prevviewmode") then
                isUnlit = true
                print("View mode: Unlit")
            end
        else
            -- Unlit -> Lit, "viewmode Lit" is allowed directly
            if runConsole("viewmode Lit") then
                isUnlit = false
                print("View mode: Lit")
            end
        end
    end)
end)

-- PAGE_UP: Previous view mode
RegisterKeyBind(Key.PAGE_UP, function()
    ExecuteInGameThread(function()
        runConsole("prevviewmode")
    end)
end)

-- PAGE_DOWN: Next view mode
RegisterKeyBind(Key.PAGE_DOWN, function()
    ExecuteInGameThread(function()
        runConsole("nextviewmode")
    end)
end)