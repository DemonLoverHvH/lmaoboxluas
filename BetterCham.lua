-- Thanks for the help Jesse <3
--enemy team
local em = [["VertexLitGeneric"
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
local BasedMaterial = materials.Create( "BasedMaterial", kv )
BasedMaterial:SetMaterialVarFlag( MATERIAL_VAR_IGNOREZ, false )

local function onDrawModel( drawModelContext )
    local entity = drawModelContext:GetEntity()
    if not (entity and entity:IsValid() and entity:GetClass() == "CTFPlayer") then
        return
    end   
    local resolve_team = entity:GetTeamNumber() or entity:GetPropEntity( "m_hOwner" ):GetTeamNumber()
        drawModelContext:ForcedMaterialOverride( BasedMaterial ) --thanks for these two lines jesse
end

callbacks.Register( "DrawModel", "hook123", onDrawModel )