-- Zade & Trophy
local tahoma = draw.CreateFont("Tahoma Bold", 15, 590 , 0x200)
local current_fps = 0


function RGBRainbow(frequency)
  local curtime = globals.CurTime() 
  local r,g,b
  r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
  g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
  b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

  return r, g, b
end

local function primary()
    draw.SetFont(tahoma)
    draw.Color( 255, 255, 0, 255 )
    draw.Text( 270, 5, "Hello TwoZade :)")
    draw.Text( 270, 25, "Hello Trophy :)" )
    draw.Text(370, 25, "  FrameRate  " .. current_fps .."" )
end

-- the aimbot, aim method, dt and aa values will be used for the menu

local function secondary()
  local aimbot = gui.GetValue( "aim bot" )
  local aimbotMethod = gui.GetValue( "aim method" )
  local aimbotfov = gui.GetValue( "aim fov" )
  local dt = gui.GetValue( "double tap (beta)" )
  local aa = gui.GetValue( "anti aim" )
  local chams = gui.GetValue( "colored players" )
  local esp = gui.GetValue("players")
  local fakepingvalue = gui.GetValue( "fake latency value (ms)" )
  local fakeping = gui.GetValue( "fake latency" )
  local triggerbot = gui.GetValue( "trigger shoot" )
  local bhop = gui.GetValue("bunny hop")
  local antiobs = gui.GetValue("anti-obs")
  local nohands = gui.GetValue("no hands")
  local noscope = gui.GetValue("no scope")
  local customfov = gui.GetValue("enable custom fov")
  local fovvalue = gui.GetValue("custom fov value") 
  local thirdperson = gui.GetValue("thirdperson")
  local triggerdel = gui.GetValue("trigger shoot delay (ms)")
  local r, g, b = RGBRainbow(1)

  local ping = clientstate.GetLatencyOut()

  draw.SetFont(tahoma)
  draw.Color(255, 255, 255, 255)
  if globals.FrameCount() % 50 == 0 then
    current_fps = math.floor(1 / globals.FrameTime())
 --   clientstate.GetLatencyOut = math.floor( 1 / globals.FrameTime())
  end

  draw.Text (270, 100, "Triggerbot: " .. (triggerbot == 1 and "ON" or "OFF"))
     
-- checks if ESP is enabled then renders text
    draw.Text( 270, 85, "ESP: " .. (esp == 1 and "ON" or "OFF"))
-- checks if the aimbot is enabled then renders the aim fov
      if (aimbot == 1) then
      draw.Text(270, 70, "AimFov: ".. aimbotfov.."" )
      end
  -- checks if BunnyHop is enabled then renders text
  draw.Text(400, 85, "Bunnyhop: " .. (bhop == 1 and "ON" or "OFF"))
  -- checks if the aimbot is enabled then renders text  
  draw.Text( 270, 55, "AimBot: ".. (aimbot == 1 and "ON" or "OFF"))
  draw.Text( 400, 55, "AimMethod: " ..aimbotMethod.."")

    -- checks if anti-aim is enabled then renders text
    if(aa == 1) then
      draw.Color(r, g, b, 255)
      draw.Text( 270, 130, "AA: WARNING: ON")
    else
      draw.Text( 270, 130, "AA: OFF")
    end

  draw.Color(255, 255, 255, 255)
  draw.Text(400, 100, "Anti-OBS: ".. (antiobs == 1 and "ON" or "OFF"))
  
  draw.Text(400, 115, "NoScope: ".. (noscope == 1 and "ON" or "OFF")) 

  draw.Text(400, 130, "NoHands: ".. (nohands == 1 and "ON" or "OFF"))

  draw.Text(400, 145, "FOVChanger: ".. (customfov == 1 and "ON" or "OFF"))

  if(customfov == 1) then
    draw.Text( 400, 160, "ViewFOV: " .. fovvalue .."")
  end

  draw.Text( 400, 175, "Fake Ping: ".. (fakeping == 1 and "ON" or "OFF"))

  if(fakeping == 1) then
    draw.Text( 400, 190, "Fake Ping ammount: ".. fakepingvalue .."")
  end  

  draw.Text(270, 115, "Trigger Del: "..triggerdel)


  draw.Text(400, 70, "Thirdp: ".. (thirdperson == 1 and "ON" or "OFF"))
end



callbacks.Register("Draw", primary)
callbacks.Register("Draw", "draw", secondary)