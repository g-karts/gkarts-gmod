local _P = FindMetaTable("Player")

function _P:GetScore()
    return self:GetNWInt("score")
end

function _P:GetRank()
    return self:GetNWInt("rank")
end
