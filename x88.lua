-- Zade & Trophy
local tahoma = draw.CreateFont("Tahoma Bold", 15, 590 , 0x200)
local current_fps = 0


local function primary()
    draw.SetFont(tahoma)
    draw.Color( 255, 255, 0, 255 )
    draw.Text( 270, 5, "Hello TwoZade :)")
    draw.Text( 270, 25, "Hello Trophy :)" )
    draw.Text(370, 25, "  FrameRate  " .. current_fps .."" )
=======
    draw.Text(370, 25, "FrameRate  " .. current_fps .."" )
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
  local fakepingvalue = gui.GetValue( "fake latency value" )
  local fakeping = gui.GetValue( "fake latency value" )
  local triggerbot = gui.GetValue( "trigger shoot" )
  local backtrack = gui.GetValue( "backtrack" )
  local bhop = gui.GetValue("bunny hop")
  local antiobs = gui.GetValue("anti-obs")
  local nohands = gui.GetValue("no hands")
  local noscope = gui.GetValue("no scope")
  local customfov = gui.GetValue("enable custom fov")
  local fovvalue = gui.GetValue("custom fov value") 
  local thirdperson = gui.GetValue("thirdperson")
=======
  local bhop = gui.GetValue("bunny hop")
  local antiobs = gui.GetValue("anti-obs")
  local nohands = gui.GetValue("no hands")
  local noscope = gui.GetValue("no scope")
  local customfov = gui.GetValue("enable custom fov")
  local customfovvalue = gui.GetValue("custom fov value")  

  local ping = clientstate.GetLatencyOut()

  draw.SetFont(tahoma)
  draw.Color(255, 255, 255, 255)
  if globals.FrameCount() % 50 == 0 then
    current_fps = math.floor(1 / globals.FrameTime())
 --   clientstate.GetLatencyOut = math.floor( 1 / globals.FrameTime())
  end

=======

  if (triggerbot == 0) then
      draw.Text(270, 100, "Triggerbot: OFF")
=======
  draw.Text(270, 55, "FrameRate  " .. current_fps .."" )
  
  if (triggerbot == 1) then
      draw.Text(270, 100, "Triggerbot: ON")
    else
      draw.Text(270, 100, "Triggerbot: OFF")
    end       
-- checks if ESP is enabled then renders text
=======
      draw.Text(270, 100, "Triggerbot: ON")
    end       
-- checks if ESP is enabled then renders text
  if (esp == 1) then
    draw.Text( 270, 85, "ESP: ON")
    else
    draw.Text(270, 85, "ESP: OFF")
  end
-- checks if the aimbot is enabled then renders the aim fov
      if (aimbot == 1) then
      draw.Text(270, 70, "AimFov: ".. aimbotfov.."" )
      end
  -- checks if BunnyHop is enabled then renders text
  if (bhop == 0) then
    draw.Text(400, 85, "Bunnyhop: OFF")
    else
      draw.Text(400, 85, "Bunnyhop: ON")
    end     
  -- checks if the aimbot is enabled then renders text  
  if(aimbot == 1) then
    draw.Text( 270, 55, "AimBot: ON")
  else
    draw.Text( 270, 55, "AimBot: OFF")
  end
  draw.Text( 400, 55, "AimMethod: " ..aimbotMethod.."")

    -- checks if anti-aim is enabled then renders text
    if(aa == 1) then
      draw.Text( 270, 130, "AA: WARNING: ON")
=======
      draw.Text( 400, 70, "AA: WARNING: ON")
    else
      draw.Text( 270, 130, "AA: OFF")
=======
      draw.Text( 400, 70, "AA: OFF")
    end

  if (antiobs == 0) then
    draw.Text(400, 100, "Anti-OBS: OFF")
  else
    draw.Text(400, 100, "Anti-OBS: ON")
  end
  
  if (noscope == 0) then
    draw.Text(400, 115, "NoScope: OFF")
  else
    draw.Text(400, 115, "NoScope: ON")
  end   

  if (nohands == 0) then
    draw.Text(400, 130, "NoHands: OFF")
  else
    draw.Text(400, 130, "NoHands: ON")
  end   

  if (customfov == 1) then
    draw.Text(400, 145, "FOVChanger: ON")
  else
    draw.Text(400, 145, "FOVChanger: OFF")
  end  

  if(customfov == 1) then
    draw.Text( 400, 160, "ViewFOV: " .. fovvalue .."")
  end

  if(fakeping == 1) then
    draw.Text( 400, 175, "Fake Ping: ON")
  else
    draw.Text( 400, 175, "Fake Ping: OFF")
  end


  if(fakeping == 1) then
  draw.Text( 400, 190, "Fake Ping ammount: ".. fakepingvalue.."")
  end
 
  if (autofire == 1) then
    draw.Text(270, 115, "AutoFire: ON")
  else
    draw.Text(270, 115, "AutoFire: OFF")
  end   

  if (thirdperson == 1) then 
    draw.Text(400, 70, "Thirdp: ON")
  else
    draw.Text(400, 70, "Thirdp: OFF")
  end   
=======
  if (nohands == 0) then
    draw.Text(400, 130, "NoHands: OFF")
  else
    draw.Text(400, 130, "NoHands: ON")
  end   
 
  if (autofire == 0) then
    draw.Text(270, 115, "AutoFire: OFF")
  else
    draw.Text(270, 115, "AutoFire: ON")
  end   


end


callbacks.Register("Draw", primary)
callbacks.Register("Draw", "draw", secondary)
=======

