local rotate = {}

rotate.fix_direction = function(entity)
    local direction_data = prototypes.mod_data["extra-properties"].get("direction_limitations")
    if entity.valid and direction_data[entity.name] ~= nil then
        local max_its = 0
        -- We need to convert direction to a string because it was changed to a string key for mod data
        while not direction_data[entity.name][tostring(entity.direction)] do
            entity.rotate()
        end
    end
end

return rotate