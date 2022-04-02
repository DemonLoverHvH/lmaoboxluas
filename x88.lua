-- Zade & Trophy
local tahoma = draw.CreateFont("Tahoma Bold", 15, 590 , 0x200)
local current_fps = 0


local function primary()
    draw.SetFont(tahoma)
    draw.Color( 255, 255, 0, 255 )
    draw.Text( 270, 5, "Hello TwoZade :)")
    draw.Text( 270, 25, "Hello Trophy :)" )
    draw.Text( 370, 25, "LocalPlayer -> I have no fucking idea")
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

  local ping = clientstate.GetLatencyOut()

  draw.SetFont(tahoma)
  draw.Color(255, 255, 255, 255)
  if globals.FrameCount() % 50 == 0 then
    current_fps = math.floor(1 / globals.FrameTime())
 --   clientstate.GetLatencyOut = math.floor( 1 / globals.FrameTime())
  end
  draw.Text(270, 55, "FrameRate  " .. current_fps .."" )

  if (triggerbot == 1) then
    draw.Text(270, 70 "Triggerbot: ON")
    else
    draw.Text(270, 70 "Triggerbot: OFF")       

  if (esp == 1) then
    draw.Text( 270, 85, "ESP: ON")
    else
    draw.Text(270, 85, "ESP: OFF")
  end

      if (aimbot == 1) then
      draw.Text(270, 100, "Aim Fov: ".. aimbotfov.."" )
     end

  -- checks if the aimbot is enabled then renders text  
  if(aimbot == 1) then
    draw.Text( 400, 55, "AimBot: ON")
  else
    draw.Text( 400, 55, "AimBot: OFF")
  end
  draw.Text( 400, 70, "Aim Method: " ..aimbotMethod.."")
    -- checks if the AA is enabled then renders text
    if(aa == 1) then
      draw.Text( 400, 85, "Anti Aim: ON")
    else
      draw.Text( 400, 85, "Anti Aim: OFF")
    end



end


callbacks.Register("Draw", primary)
callbacks.Register("Draw", "draw", secondary)

