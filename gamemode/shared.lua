
DeriveGamemode("sandbox")

GM.Name = "gKarts"
GM.Author = "MagmaPlex Team - Tom.bat & NoSharp"
GM.Email = "N/A"
GM.Website = "http://magmanet.co/"

function GM:LoadDirectory(dir)
    local fil, fol = file.Find(dir .. "/*", "LUA")

    for k, v in ipairs(fil) do
        local dirs = dir .. "/" .. v

        if v:StartWith("cl_") then
            if SERVER then
                AddCSLuaFile(dirs)
            else
                include(dirs)
            end
        elseif v:StartWith("sh_") then
            AddCSLuaFile(dirs)
            include(dirs)
        else
            if SERVER then
                include(dirs)
            end
        end
    end

    for k, v in pairs(fol) do
        self:LoadDirectory(dir .. "/" .. v)
        print("[gKarts] Loaded folder: \"" .. dir .. "/" .. v .. "\"")
    end
end

print("[gKarts] Loading...")
print("[gKarts] gKarts is property of Magma Networks (Tom.bat and NoSharp)")

gKarts = {}
team.SetUp(1, "drivers", Color(255, 255, 255))

hook.Add("InitPostEntity", "gKarts.AdjustPhysicsSettings", function()
    local physData = physenv.GetPerformanceSettings()
    physData.MaxVelocity = 10000
    physData.MaxAngularVelocity = 10000

    physenv.SetPerformanceSettings(physData)
end)


if CLIENT then include(GM.FolderName .. "/gamemode/cl_constants.lua")
else AddCSLuaFile(GM.FolderName .. "/gamemode/cl_constants.lua") end

GM:LoadDirectory(GM.FolderName .. "/gamemode/modules")
