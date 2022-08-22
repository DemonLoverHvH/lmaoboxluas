
-- My Version Of The Tracer Script VOID_ made
-- Orginal LUA https://github.com/VOID-Nightmare/lbox-tracers


function RGBRainbow(frequency)
    local curtime = globals.CurTime() 
    local r,g,b
    r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)
  
    return r, g, b
  end

local width, height = draw.GetScreenSize()
local function update()
    local r, g, b = RGBRainbow(1)
    local players = entities.FindByClass("CTFPlayer")
    local localPlayer = entities.GetLocalPlayer()
    local myteam = localPlayer:GetTeamNumber()
    
    if (myteam == 0) then
        return
    else
    for i, p in ipairs(players) do
        local team = p:GetTeamNumber()
        if p:IsAlive() and p ~= localPlayer and not p:IsDormant() and myteam ~= team then

            local screenPos = client.WorldToScreen( p:GetAbsOrigin() )
            if (myteam == 2) then
                draw.Color(0, 0, 225, 225) --Red, Green, Blue, Alpha replace 0, 0, 225 with r, g ,b to get rainbow colors
            else
                draw.Color(225, 0, 0, 225) --Red, Green, Blue, Alpha replace 225, 0, 0 with r, g ,b to get rainbow colors
            end

            if screenPos ~= nil then

                draw.Line(width/2,height, screenPos[1], screenPos[2]) -- do height/2, if you want in middle only using height is bottom
            end
            
        end
    end
  end  
end

callbacks.Register("Draw", "draw", update)