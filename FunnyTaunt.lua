local function Taunt()
   
    local  localp = entities.GetLocalPlayer()
    local isTaunting = localp:InCond( TFCond_Taunting )
    if (isTaunting == true) then

        gui.SetValue("Anti Aim", 1)
        gui.SetValue("Anti Aim - Pitch", ("off"))
        gui.SetValue("Anti Aim - Yaw (Real)", ("Spin Right"))
        gui.SetValue("Anti Aim - Yaw (Fake)", ("off"))
        gui.SetValue("Spin Speed", 10)
    else
        gui.SetValue("Anti Aim", 0)
    end

end  

  callbacks.Register("Draw", Taunt)