--[[
    Misc Tools for Lmaobox
    Author: LNX (github.com/lnx00)
]]

local menuLoaded, MenuLib = pcall(require, "Menu")
assert(menuLoaded, "MenuLib not found, please install it!")
assert(MenuLib.Version >= 1.35, "MenuLib version is too old, please update it!")

local ltExtendFreeze = 0

-- Menu
local menu = MenuLib.Create("Better Viewmodel", MenuFlags.AutoSize)
local Enable = menu:AddComponent(MenuLib.Checkbox("Enable", false))
local Viewmodelx = menu:AddComponent(MenuLib.Slider("Viewmodel X", -100, 100, 0))
local Viewmodely = menu:AddComponent(MenuLib.Slider("Viewmodel Y", -100, 100, 0))
local Viewmodelz = menu:AddComponent(MenuLib.Slider("Viewmodel Z", -100, 100, 0))



local function CreateMove(pCmd)
    if Enable:GetValue() == true then

        local x = Viewmodelx:GetValue()
        local y = Viewmodelz:GetValue()
        local z = Viewmodely:GetValue()
        client.RemoveConVarProtection( "tf_viewmodels_offset_override")
        client.SetConVar( "tf_viewmodels_offset_override", x .. " " .. y .. " " .. z )
 
    end
end

local function Unload()
    MenuLib.RemoveMenu(menu)

    client.Command('play "ui/buttonclickrelease"', true)
end

callbacks.Unregister("CreateMove", "MT_CreateMove") 
callbacks.Register("CreateMove", "MT_CreateMove", CreateMove)

callbacks.Unregister("Unload", "MT_Unload") 
callbacks.Register("Unload", "MT_Unload", Unload)

client.Command('play "ui/buttonclick"', true)