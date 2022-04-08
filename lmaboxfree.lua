local tf = draw.CreateFont("tf2 build", 30, 590, FONTFLAG_OUTLINE )
local tf2 = draw.CreateFont("tf2 build", 20, 590, FONTFLAG_OUTLINE)

function dawatermark()
    local me = entities.GetLocalPlayer()
    local myteam = me:GetTeamNumber()
    
    draw.SetFont(tf)

    draw.Color(225, 0, 0, 225)
    if (myteam == 2) then
    draw.Text(680, 200, "LMAOBOX HACK")
    draw.SetFont(tf2)
    draw.Text(680, 230, " WWW.LMAOBOX.NET")
    end
  
    
    draw.Color(0, 0, 225, 225)
    if (myteam == 3) then
        draw.SetFont(tf)
        draw.Text(680, 200, "LMAOBOX HACK")
        draw.SetFont(tf2)
        draw.Text(680, 230, " WWW.LMAOBOX.NET")
    end
end
callbacks.Register("Draw","draw", dawatermark)