local tahoma = draw.CreateFont("Tahoma Bold", 15, 590 , 0x200)
local current_fps = 0


local function primary()
    draw.SetFont(tahoma)
    draw.Color( 255, 255, 0, 255 )
    draw.Text( 270, 5, "Hello MasterLooser :)")
    draw.Text( 270, 25, "Hello Vexxes :)" )
    draw.Text( 370, 25, "LocalPlayer -> I have no fucking idea")
end

-- the aimbot, aim method, dt and aa values will be used for the menu

local function secondary()
  local aimbot = gui.GetValue( "aim bot" )
  local aimbotMethod = gui.GetValue( "aim method" )
  local dt = gui.GetValue( "double tap" )
  local aa = gui.GetValue( "anti aim" )
  local time = clientstate.GetConnectTime()

  draw.SetFont(tahoma)
  draw.Color(255, 255, 255, 255)

  if globals.FrameCount() % 50 == 0 then
    current_fps = math.floor(1 / globals.FrameTime()) 
  end
  draw.Text(270, 55, "FrameRate  " .. current_fps .."" )
  draw.Text( 270, 70, "Latency " .. time .. "")
  -- checks if the aimbot is enabled then renders text
  if(aimbot == 1) then
    draw.Text( 400, 55, "AimBot: ON")
  else
    draw.Text( 400, 55, "AimBot: OFF")
  end
  draw.Text( 400, 70, "AimMethod " ..aimbotMethod.."")
end


callbacks.Register("Draw", primary)
callbacks.Register("Draw", "draw", secondary)