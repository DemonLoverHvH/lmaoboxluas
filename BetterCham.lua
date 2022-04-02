-- Thanks for the help Jesse <3
--enemy team
local em = [["VertexLitGeneric"
{
  $basetexture "vgui/white_additive"
  $bumpmap "vgui/white_additive"
  $selfillum "1"
  $selfIllumFresnel "1"
  $selfIllumFresnelMinMaxExp "[0 1 2]"
  $selfillumtint "[1 1 1]"
}
]]
--team mates
local tm = [["VertexLitGeneric" 
{
  $basetexture "vgui/white_additive"
  $bumpmap "vgui/white_additive"
  $color2 "[10 1 5]" 
  $selfillum "1"
  $selfIllumFresnel "1"
  $selfIllumFresnelMinMaxExp "[0 0.18 0.1]"
  $selfillumtint "[0.3 0.001 0.1]"
}
]]


--Play with color2 to get your favorite colors to look good
local ChamsOn = gui.GetValue("colored players")
local TmChamOn = gui.GetValue("enemy only")
local BasedMaterial = materials.Create( "BasedMaterial", em )
local TeamMaterial = materials.Create( "TeamMaterial", tm )
BasedMaterial:SetMaterialVarFlag( MATERIAL_VAR_IGNOREZ, false )
TeamMaterial:SetMaterialVarFlag( MATERIAL_VAR_IGNOREZ, false )

local function onDrawModel( drawModelContext )
 -- if ChamsOn == true then -- <- Seems to kida work
  local entity = drawModelContext:GetEntity()
  if not (entity and entity:IsValid() and entity:GetClass() == "CTFPlayer") then
      return
    end 
  end

  -- if TmChamOn == false then -- <- only retruns true tf
  local resolve_team = entity:GetTeamNumber()
      drawModelContext:ForcedMaterialOverride( TeamMaterial ) --thanks for these two lines jesse
    end
  end  

 --   local function on_paint() 
--  print(gui.GetValue("enemy only")) <- only returning true??????????

--end

---callbacks.Register("Draw", on_paint) <- Deubging stuff



callbacks.Register( "DrawModel", "hook123", onDrawModel)
-- if gui.GetValue('visual', "colored players") == true then 
-- if gui.GetValue('visual', "enemy only") == false then 
-- if ChamsOn == true then 
-- if TmChamOn == false then 