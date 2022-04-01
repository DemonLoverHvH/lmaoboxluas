local lato = draw.CreateFont("Lato", 17, 500)
local current_fps = 0

rgb = {r = 225, g = 225, b = 225}

function RGBRainbow(frequency)
  local curtime = globals.CurTime() 
  local r,g,b
  r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
  g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
  b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

  return r, g, b
end




local function watermark()
  draw.SetFont(lato)
  local r, g, b = RGBRainbow(1)
  draw.Color(r, g, b, 225)

  if globals.FrameCount() % 15 == 0 then
    current_fps = math.floor(1 / globals.FrameTime())
    server_tick = math.floor(1 / globals.TickInterval())
  end

  draw.Text(5, 5, "[ lmaobox | fps: " .. current_fps .. " | ticks: " .. server_tick .. " ]") --1420 if on right side
end

callbacks.Register("Draw", "draw", watermark)