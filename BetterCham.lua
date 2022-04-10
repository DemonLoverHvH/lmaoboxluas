-- Thanks for the help Jesse <3
--enemy team
local em = [["VertexLitGeneric"
{
  $basetexture "vgui/white_additive"
  $bumpmap "vgui/white_additive"
  $envmap "cubemaps/cubemap_sheen001"
  $phong "1"

  $selfillum "1"
  $selfillumfresnel "1"
  $selfillumfresnelminmaxexp "[-0.25 1 1]"
}
]]
--team mates
local tm = [["VertexLitGeneric" 
{
  $basetexture "vgui/white_additive"
  $bumpmap "vgui/white_additive"
  $envmap "cubemaps/cubemap_sheen001"
  $phong "1"
  $selfillum "1"
  $selfillumfresnel "1"
  $selfillumfresnelminmaxexp "[-0.25 1 1]"
}
]]


--Play with color2 to get your favorite colors to look good
local BasedMaterial = materials.Create( "BasedMaterial", em )
local TeamMaterial = materials.Create( "TeamMaterial", tm )
BasedMaterial:SetMaterialVarFlag( MATERIAL_VAR_IGNOREZ, false )
TeamMaterial:SetMaterialVarFlag( MATERIAL_VAR_IGNOREZ, false )


local function onDrawModel( drawModelContext )
  local entity = drawModelContext:GetEntity()
  if not (entity and entity:IsValid() and entity:GetClass() == "CTFPlayer") then
      return
  end   
  local resolve_team = entity:GetTeamNumber()
      drawModelContext:ForcedMaterialOverride ( TeamMaterial ) --thanks for these two lines jesse
end

callbacks.Register( "DrawModel", "hook123", onDrawModel )


--   local function on_paint() 
--  print(gui.GetValue("enemy only")) <- only returning true??????????
--end

---callbacks.Register("Draw", on_paint) <- Deubging stuff

-- if gui.GetValue('visual', "colored players") == true then 
-- if gui.GetValue('visual', "enemy only") == false then 
-- if ChamsOn == true then 
-- if TmChamOn == false then 