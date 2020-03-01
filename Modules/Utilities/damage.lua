--[[
    damage.lua
    Commits damage on the specified object if possible
    @author NodeSupport
--]]

local lastHit = tick()

return function(humanoid, part, cooldown)
    if not part.Parent:IsA("Tool") then
        return
    end
    local client = gg.client
    local character = client.Character
    if not character then
        return
    end
    local tip = character:FindFirstChild("Tip", true)
    if not tip or not tip.Parent:IsA("Tool") then
        return
    end
    local tool = tip.Parent
    if part == tip then
        local event = tool:FindFirstChild("swordEvent", true)
        if event and tick() - lastHit >= cooldown then
            event:FireServer("dmg", humanoid)
            lastHit = tick()
        elseif tool:FindFirstChild("SwordEvent") then -- Lake Tech
            event = tool:FindFirstChild("SwordEvent")
            event:FireServer(humanoid)
            lastHit = tick()
        end
    end
end