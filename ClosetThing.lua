local CheatersPriority = 7;
local function outcaller(event)
    local players = entities.FindByClass("CTFPlayer")
    if globals.FrameCount() % 10 == 0 then
        for i, player in pairs(players) do
            if player ~= entities.GetLocalPlayer() then
                local steamid = client.GetPlayerInfo(player:GetIndex()).SteamID;
                local name = player:GetName();
                local priority = playerlist.GetPriority(steamid);
                if priority == CheatersPriority then
                    print("Okay lets see")
                    client.Command("disconnect", 1)
                end  
            end
        end
    end
end
callbacks.Register("FireGameEvent", "playerLogger", outcaller)


-- Super pasted from Derser just threw this together quickly
-- https://lmaobox.net/forum/v/discussion/22411/player-sorter#latest