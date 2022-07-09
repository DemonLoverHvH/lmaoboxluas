local function trigranddel()

    if globals.FrameCount() % 10 == 0 then
        local trigonoroff = gui.GetValue("trigger shoot")
        if (trigonoroff == 1) then
        local gettrigdel = gui.GetValue( "trigger shoot delay" )
        local trigdel = math.random(20, 400)
        gui.SetValue("trigger shoot delay", trigdel) 
        else
        end
    end
  end 
  callbacks.Register("Draw", "draw", trigranddel)