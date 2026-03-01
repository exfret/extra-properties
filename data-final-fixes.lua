for entity_class, _ in pairs(defines.prototypes.entity) do
    if data.raw[entity_class] ~= nil then
        for _, entity in pairs(data.raw[entity_class]) do
            if entity.allowed_directions ~= nil then
                data.raw["mod-data"]["extra-properties"].data.direction_limitations[entity.name] = {}
                if #entity.allowed_directions == 0 then
                    error("Entities must have at least one allowed direction.")
                end
                for _, dir in pairs(entity.allowed_directions) do
                    if not defines.direction[dir] then
                        local is_valid_direction = false
                        for _, dir2 in pairs(defines.direction) do
                            if dir == dir2 then
                                is_valid_direction = true
                                break
                            end
                        end
                        if not is_valid_direction then
                            error("Entity directions must be valid defines.direction keys")
                        end
                    end
                    data.raw["mod-data"]["extra-properties"].data.direction_limitations[entity.name][dir] = true
                end
            end
        end
    end
end