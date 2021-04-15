
hook.Add("gKarts.KartCreated", "gKarts.MovementInput", function(kart, driver, isLocal)
    if not isLocal then return end

    hook.Add("Move", kart, function(_,  _, mv)
        kart:SetTargetThrottle(mv:GetForwardSpeed() / 10000)
        kart:SetTargetSteering(mv:GetSideSpeed() / 10000)

        kart:MovementThink()
    end)
end)

do
    local kart = debug.getregistry()["gKart"]
    local lerp = Lerp
    local frameTime = FrameTime

    AccessorFunc(kart, "nSpeed", "Speed", FORCE_NUMBER)
    AccessorFunc(kart, "nThrottle", "Throttle", FORCE_NUMBER)
    AccessorFunc(kart, "nSteering", "Steering", FORCE_NUMBER)

    AccessorFunc(kart, "nTargetThrottle", "TargetThrottle", FORCE_NUMBER)
    AccessorFunc(kart, "nTargetSteering", "TargetSteering", FORCE_NUMBER)

    function kart:MovementThink()
        local prog = frameTime() * 4
        self.nThrottle = lerp(prog, self.nThrottle, self.nTargetThrottle)
        self.nSteering = lerp(prog, self.nSteering, self.nTargetSteering)
    end
end

hook.Add("gKarts.KartCreated", "gKarts.MovementDefaults", function(kart)
    kart:SetSpeed(0)

    kart:SetThrottle(0)
    kart:SetSteering(0)

    kart:SetTargetThrottle(0)
    kart:SetTargetSteering(0)
end)