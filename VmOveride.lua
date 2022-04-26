--[[
    Misc Tools for Lmaobox
    Author: LNX (github.com/lnx00)
]]

local menuLoaded, MenuLib = pcall(require, "Menu")
assert(menuLoaded, "MenuLib not found, please install it!")
assert(MenuLib.Version >= 1.35, "MenuLib version is too old, please update it!")

local ltExtendFreeze = 0

-- Menu frontend
local menu = MenuLib.Create("Better Viewmodel", MenuFlags.AutoSize)
local Enable = menu:AddComponent(MenuLib.Checkbox("Enable", false))
local Viewmodelx = menu:AddComponent(MenuLib.Slider("Viewmodel X", -100, 100, 0))
local Viewmodely = menu:AddComponent(MenuLib.Slider("Viewmodel Y", -100, 100, 0))
local Viewmodelz = menu:AddComponent(MenuLib.Slider("Viewmodel Z", -100, 100, 0))
--local WpnSwayScale = menu:AddComponent(MenuLib.Slider("Weapon Sway", 0, 10, 0))

--remove cvar protection
client.RemoveConVarProtection( "tf_viewmodels_offset_override")
client.RemoveConVarProtection( "cl_wpn_sway_interp")
client.RemoveConVarProtection("cl_wpn_sway_scale") 

--menu backend
local function CreateMove(pCmd)
    if Enable:GetValue() == true then

        local x = Viewmodelx:GetValue()
        local y = Viewmodelz:GetValue()
        local z = Viewmodely:GetValue()


        client.SetConVar( "tf_viewmodels_offset_override", x .. " " .. y .. " " .. z )

        -- local sway = WpnSwayScale:GetValue() -- couldn't get it to work :/ if you do please make pull request
        client.SetConVar("cl_wpn_sway_scale", 7) -- change numbers to switch sway ammount i just like it like this
        client.SetConVar("cl_wpn_sway_interp", 5)

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