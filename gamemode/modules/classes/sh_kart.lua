
local _R = debug.getregistry()

local kart = _R["gKart"] or {}
kart.__index = kart

AccessorFunc(kart, "pDriver", "Driver")

do
    local boneIdCache = {}

    function kart:GetCachedBoneId(name)
        local boneId = boneIdCache[name]
        if boneId then return boneId end

        boneId = self:LookupBone(wheelSettings.bone) or -1
        boneIdCache[name] = boneId

        return boneId
    end
end

function kart:SafeRemove()
    hook.Run("gKarts.KartRemoved", self)
    SafeRemoveEntity(self)
end

_R["gKart"] = kart


gKarts.Karts = gKarts.Karts or setmetatable({}, {
    __mode = "k"
})

function _R.Player:GetKart()
    return gKarts.Karts[self]
end

function gKarts.CreateKart(ply)
    if IsValid(gKarts.Karts[ply]) then return gKarts.Karts[ply] end

    local ent = ents.CreateClientProp("models/freeman/vehicles/electric_go-kart.mdl")

    for key, value in pairs(kart) do
        ent[key] = value
    end

    ent:SetDriver(ply)

    local isLocalKart = ply == LocalPlayer()
    hook.Run("gKarts.KartCreated", ent, ply, isLocalKart)

    gKarts.Karts[ply] = ent

    if isLocalKart then
        gKarts.LocalKart = ent
    end

    return ent
end
