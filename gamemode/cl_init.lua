
include("shared.lua")

local localPly = LocalPlayer()
if not IsValid(localPly) then return end

if not IsValid(TestKart) then
    TestKart = gKarts.CreateKart(localPly)
    TestKart:SetPos(localPly:GetEyeTrace().HitPos + Vector(0, 0, 4))
    --gKarts.AttachCamera(TestKart)

    --timer.Simple(0, function()
    --    TestKart:SetDriverModel("models/odessa.mdll")
    --end)
else
    TestKart:SafeRemove()
end

--local ragdoll = ClientsideRagdoll( "models/gman_high.mdl" )
--ragdoll:SetPos(localPly:GetPos())
--ragdoll:SetNoDraw( false )
--ragdoll:DrawShadow( true )
--
--local pos = localPly:GetPos()
--for i=0, ragdoll:GetPhysicsObjectCount() - 1 do
--	local phys = ragdoll:GetPhysicsObjectNum(i)
--	phys:SetPos(pos, true)
--end

--if IsValid(testThingy) then testThingy:Remove() end
--testThingy = ents.CreateClientside("phys_spring")
--print(testThingy)
